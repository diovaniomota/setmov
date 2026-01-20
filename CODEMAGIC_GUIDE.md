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

1.  No painel do Codemagic, vá nas configurações do seu App.
2.  Vá na aba **Environment variables**? Não, vá direto em **Teams > Personal Account > Integrations > App Store Connect**.
3.  Adicione uma nova chave:
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

1.  Clique em **Start new build**.
2.  Escolha o workflow `iOS Build & Release` (que está no arquivo `codemagic.yaml`).
3.  Se tudo der certo, o Codemagic vai:
    *   Criar o certificado e o Profile na sua conta da Apple automaticamente.
    *   Gerar o `.ipa`.
    *   Enviar para o TestFlight.

> **Nota**: O Bundle ID configurado no projeto é `com.migambi.netflex`. Certifique-se de que esse App ID já existe na sua conta da Apple Developer ou que a chave de API tem permissão para criar novos App IDs.
