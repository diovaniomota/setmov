# Guia de Migração: Supabase Self-Hosted para Supabase Cloud

Este guia descreve os passos para migrar seu banco de dados, políticas RLS e arquivos de armazenamento (Storage) do seu ambiente self-hosted para o Supabase Cloud.

## Pré-requisitos

1.  **Acesso ao Terminal**: Você precisará de um terminal com `pg_dump` e `psql` instalados (ferramentas padrão do PostgreSQL).
2.  **Dart Instalado**: Para rodar o script de migração de storage.
3.  **Credenciais Antigas (Source)**:
    *   Connection String do banco (ex: `postgres://postgres:senha@seu-ip:5432/postgres`)
    *   URL da API e Service Role Key (para o script de storage).
4.  **Credenciais Novas (Target)**:
    *   Crie um novo projeto no [Supabase Cloud](https://supabase.com/dashboard).
    *   Pegue a Connection String do banco (Settings -> Database -> Connection string).
    *   Pegue a URL e a Service Role Key (Settings -> API).

---

## Passo 1: Migração do Banco de Dados (Schema e Dados)

O banco de dados contém suas tabelas, dados e as políticas de segurança (RLS). A melhor forma de migrar é usando `pg_dump` e `psql` (ou a CLI do Supabase).

### 1.1 Exportar os dados (Backup)

No seu terminal, execute o comando abaixo para gerar um arquivo SQL com todo o seu schema `public` e dados.

```bash
# Substitua a URL abaixo pela conexão do seu banco SELF-HOSTED
pg_dump "postgres://postgres:SUA_SENHA@SEU_IP_ANTIGO:5432/postgres" \
  --schema=public \
  --clean \
  --if-exists \
  --quote-all-identifiers \
  --exclude-table="spatial_ref_sys" \
  > dump_setmov.sql
```

> **Nota**: O `--clean` gera comandos `DROP` para limpar o banco de destino antes de criar as tabelas, garantindo uma cópia limpa.

### 1.2 Importar no Supabase Cloud

Agora, restaure esse arquivo no seu novo projeto Supabase Cloud.

```bash
# Substitua a URL abaixo pela conexão do seu NOVO banco no SUPABASE CLOUD
# Você pega isso em Settings -> Database -> Connection String -> URI
psql "postgresql://postgres:[SUA_SENHA]@db.hwkkrylnqyoerpaiujfq.supabase.co:5432/postgres" -f dump_setmov.sql
```

Se houver erros de permissão sobre `role "postgres" does not exist`, você pode ignorá-los, pois o Supabase Cloud gerencia os usuários de banco de forma diferente, mas as tabelas e dados serão criados.

---

## Passo 2: Migração do Auth (Usuários)

A migração de usuários (tabela `auth.users`) é sensível.
**Opção Recomendada**: Se você tem poucos usuários ou pode pedir para eles recriarem senha, o mais simples é não migrar as senhas hashes diretamente sem cuidado.
**Opção Adequada**: Use a CLI do Supabase para fazer dump apenas do schema `auth`.

```bash
pg_dump "postgres://postgres:SUA_SENHA@SEU_IP_ANTIGO:5432/postgres" \
  --schema=auth \
  --data-only \
  --table=auth.users \
  --table=auth.identities \
  > dump_users.sql
```

Depois restaure no novo banco:

```bash
psql "postgresql://postgres:[SUA_SENHA]@db.hwkkrylnqyoerpaiujfq.supabase.co:5432/postgres" -f dump_users.sql
```

> **Atenção**: Migrar o schema `auth` pode ser complexo devido a triggers e chaves de criptografia. Verifique se os usuários conseguem logar.

---

## Passo 3: Migração do Storage (Arquivos)

Criei um script automatizado para copiar seus buckets e arquivos.

### 3.1 Configurar o Script

Abra o arquivo `tool/migrate_storage.dart` e edite as constantes no início do arquivo com suas credenciais reais:

```dart
const String oldSupabaseUrl = 'SUA_URL_ANTIGA';
const String oldSupabaseServiceRoleKey = 'SUA_KEY_ANTIGA';

const String newSupabaseUrl = 'SUA_URL_NOVA';
const String newSupabaseServiceRoleKey = 'SUA_KEY_NOVA';
```

### 3.2 Executar a Migração

No terminal, na raiz do projeto, rode:

```bash
dart run tool/migrate_storage.dart
```

O script irá:
1. Listar todos os buckets do projeto antigo.
2. Criar os mesmos buckets no projeto novo (se não existirem).
3. Baixar e enviar cada arquivo, mantendo as pastas.

---

## Passo 4: Atualizar o App Flutter

1. Abra `lib/backend/supabase/supabase.dart`.
2. Atualize `_kSupabaseUrl` e `_kSupabaseAnonKey` com as chaves do **novo** projeto (Chave 'anon', não a 'service_role'!).
3. Rode o app e teste:
   - Login
   - Carregamento de listas (Banco de dados)
   - Visualização de imagens (Storage)

Parabéns! Sua migração deve estar completa.
