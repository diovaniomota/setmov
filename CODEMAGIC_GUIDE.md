# Guia de Configuração Codemagic (iOS)

Como você exportou o projeto do FlutterFlow, as chaves de assinatura não vêm junto com o código. Vamos configurá-las no Codemagic para que ele possa gerar o app (`.ipa`) e enviar para a Apple.

## Passo 1: Subir o código para o Git

1.  Crie um repositório no GitHub/GitLab/Bitbucket.
2.  Envie todos os arquivos dessa pasta para lá.

## Passo 2: Criar conta no Codemagic

1.  Acesse [codemagic.io](https://codemagic.io/) e faça login com sua conta do Git.
2.  Adicione o repositório do seu app.

## Passo 3: Conectar com a Apple (App Store Connect)

Para o Codemagic criar certificados e assinar o app automaticamente, ele precisa de uma chave de API da Apple.

1.  Acesse o [App Store Connect](https://appstoreconnect.apple.com/access/api).
2.  Vá em **Users and Access** -> **Integrations** -> **App Store Connect API**.
3.  Clique no `+` para gerar uma nova chave.
    *   **Name**: Codemagic Key
    *   **Access**: App Manager (ou Admin)
4.  Baixe o arquivo `.p8` (Guarde bem, só dá para baixar uma vez!).
5.  Anote o **Issuer ID** e o **Key ID**.

> **Nota sobre FlutterFlow**: A imagem que você mandou mostra que o FlutterFlow já tem uma chave configurada (`X2N87BA3G5`).
> *   **Se você tem o arquivo .p8 dessa chave salvo no seu computador**: Pode usar esse mesmo Issuer ID e Key ID que estão na tela.
> *   **Se você NÃO tem o arquivo .p8**: Você **precisa criar uma nova chave** seguindo os passos acima, pois a Apple não permite baixar a chave privada novamente.

## Passo 4: Configurar no Codemagic

1.  No painel do Codemagic, olhe no menu lateral esquerdo e clique em **Teams**.
2.  Vai aparecer uma lista (provavelmente só com "diovaniomota's Team" ou "Personal Account"). Clique **em cima do nome** desse time.
3.  Agora vai abrir uma nova tela de configurações do time. Procure uma aba chamada **Team integrations** (ou **Integrations**).
4.  Clique em **App Store Connect**.
5.  Adicione uma nova chave (ou verifique o nome da existente):
    *   **Key ID**: `32538K79K2`
    *   **Issuer ID**: (O ID que aparece na tabela do App Store Connect)
    *   **Private Key**:
        1.  Vá até a pasta onde o arquivo `.p8` foi baixado.
        2.  Clique com o botão direito nele -> "Abrir com" -> "Bloco de Notas" (ou qualquer editor de texto).
        3.  Copie **TODO** o texto que aparecer dentro dele (incluindo as linhas `-----BEGIN PRIVATE KEY-----` e `-----END PRIVATE KEY-----`).
        4.  Cole esse texto no campo "Private Key" no site do Codemagic.
4.  Salve.

## Passo 5: Configurar Variáveis de Ambiente

No seu projeto no Codemagic, vá na aba **Environment variables**.
Precisamos criar um grupo chamado `app_store_connect` (exatamente como está no arquivo `codemagic.yaml`).
Na verdade, se você conectou a integração no passo 4, o Codemagic já sabe usar.
*   Apenas certifique-se de que na aba **Distribution > iOS App Store**, a chave que você criou está selecionada.


## Passo 6: Rodar o Build

Agora que o erro de configuração sumiu (pois enviamos a correção):

1.  **Recarregue a página** do Codemagic para garantir que ele pegou a versão nova.
2.  Clique no botão azul **"Start new build"** (ou "Start your first build") que fica no topo à direita.
3.  Vai abrir uma janelinha.
4.  Em **Workflow**, selecione **"iOS Build & Release"**.
5.  Em **Branch**, deixe **"master"**.
6.  Clique em **Start new build**.

O Codemagic vai alugar um Mac mini, instalar tudo, gerar as chaves na Apple e compilar seu app. Pode demorar uns 15-30 minutos.
Fique de olho nos logs (texto preto passando na tela). Se der tudo verde no final, seu app vai aparecer no **TestFlight** da Apple em breve!
