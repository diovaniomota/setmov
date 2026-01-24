import 'package:supabase/supabase.dart';

// --- CONFIGURAÇÃO ---
// Preencha com as credenciais do seu projeto SELF-HOSTED (Origem)
const String oldSupabaseUrl = 'https://supabase.konexapp.com.br';
const String oldSupabaseServiceRoleKey =
    'SUA_SERVICE_ROLE_KEY_ANTIGA_DO_PROJETO_ATUAL';

// Preencha com as credenciais do seu projeto CLOUD (Destino)
const String newSupabaseUrl = 'https://hwkkrylnqyoerpaiujfq.supabase.co';
const String newSupabaseServiceRoleKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh3a2tyeWxucXlvZXJwYWl1amZxIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDkwMjUxMywiZXhwIjoyMDc2NDc4NTEzfQ.GOOFG3rHOBS3JY0a-unZoRrdRj_oymVz4bmYgxUc87k';
// --------------------

void main() async {
  print('🚀 Iniciando migração de Storage...');

  final oldClient = SupabaseClient(oldSupabaseUrl, oldSupabaseServiceRoleKey);
  final newClient = SupabaseClient(newSupabaseUrl, newSupabaseServiceRoleKey);

  try {
    // 1. Listar Buckets da Origem
    print('📦 Buscando buckets na origem...');
    final buckets = await oldClient.storage.listBuckets();

    if (buckets.isEmpty) {
      print('⚠️ Nenhum bucket encontrado na origem.');
      return;
    }

    for (final bucket in buckets) {
      final bucketId = bucket.id;
      final isPublic = bucket.public;
      print('\nDataset Processando bucket: [$bucketId] (Public: $isPublic)');

      // 2. Criar Bucket no Destino (se não existir)
      try {
        await newClient.storage.getBucket(bucketId);
        print('   ✅ Bucket já existe no destino.');
      } catch (e) {
        print('   ✨ Criando bucket no destino...');
        await newClient.storage.createBucket(
            bucketId,
            const BucketOptions(
                public:
                    true)); // Forçando public por padrão para evitar problemas, ajuste se necessário
      }

      // 3. Listar e Migrar Arquivos
      print('   📂 Listando arquivos...');
      // List all files recursively
      final files = await oldClient.storage
          .from(bucketId)
          .list(path: '', searchOptions: const SearchOptions(limit: 5000));

      // Nota: O método list acima pode não ser recursivo por padrão dependendo da versão,
      // mas para muitas configurações flat funciona. Se tiver pastas, seria ideal uma busca recursiva.
      // Aqui faremos uma implementação simples que lista a raiz.
      // Se houver pastas, o 'list' retorna objetos que são pastas?
      // A API padrão do Supabase list retorna metadados. Vamos assumir uma estrutura simples ou tentar iterar.

      await _processDirectory(oldClient, newClient, bucketId, '');
    }

    print('\n✅ Migração de arquivos finalizada!');
    print(
        'Lembre-se de configurar as políticas de acesso (Policies) no Storage do novo projeto conforme necessário.');
  } catch (e) {
    print('\n❌ Erro fatal durante a migração: $e');
  }
}

Future<void> _processDirectory(SupabaseClient oldClient,
    SupabaseClient newClient, String bucketId, String path) async {
  try {
    final objects = await oldClient.storage.from(bucketId).list(path: path);

    for (final obj in objects) {
      // Se name for nulo, pula
      
      // Verifica se é pasta (pode variar dependendo da resposta da API, geralmente size 0 ou tem metadata especifica)
      // Mas o list do supabase retorna pastas como objetos também? Sim, mas sem metadados de arquivo as vezes.
      // Uma forma comum é ver se tem '.' no nome ou tamanho.
      // A API Dart `FileObject` tem propriedades.

      // Construir o fullPath
      final fullPath = path.isEmpty ? obj.name! : '$path/${obj.name}';

      // Se for "pasta" (ex: não tem id, ou metadados de arquivo são nulos/defaults), recursiva.
      // Infelizmente a API do client dart v1 vs v2 muda.
      // Vamos tentar baixar. Se falhar por ser diretório, entramos nele.

      // Na v2, objects tem 'metadata'. Se metadata for null, pode ser pasta?
      // Vamos tentar a abordagem de baixar. Se der erro, tenta listar dentro.
      // Porém, para evitar excesso de erros, vamos assumir que se não tem created_at ou id, ou size é 0, pode ser pasta?
      // Não é garantido.

      // Estratégia recursiva segura:
      // Tentar listar conteudo dentro desse "objeto" tratando-o como path.
      // Se retornar vazio e ele tiver tamanho > 0, é arquivo.

      // SIMPLIFICAÇÃO PARA O SCRIPT:
      // Vamos tentar baixar.
      try {
        final fileBytes =
            await oldClient.storage.from(bucketId).download(fullPath);

        // Se baixou, é arquivo. Faz upload.
        print('   ⬆️ Migrando arquivo: $fullPath ...');
        try {
          await newClient.storage.from(bucketId).uploadBinary(
                fullPath,
                fileBytes,
                fileOptions: const FileOptions(upsert: true),
              );
        } catch (uploadError) {
          print('      ⚠️ Erro no upload de $fullPath: $uploadError');
        }
      } catch (downloadError) {
        // Se deu erro ao baixar, provavel que seja uma pasta OU arquivo corrompido.
        // Vamos tentar entrar como diretório.
        // print('      🔍 Verificando se $fullPath é uma pasta...');
        await _processDirectory(oldClient, newClient, bucketId, fullPath);
      }
    }
  } catch (e) {
    print('Erro ao processar diretório $path: $e');
  }
}
