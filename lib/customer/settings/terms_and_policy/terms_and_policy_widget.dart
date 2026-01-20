import '/components/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_and_policy_model.dart';
export 'terms_and_policy_model.dart';

class TermsAndPolicyWidget extends StatefulWidget {
  const TermsAndPolicyWidget({super.key});

  static String routeName = 'TermsAndPolicy';
  static String routePath = '/termsAndPolicy';

  @override
  State<TermsAndPolicyWidget> createState() => _TermsAndPolicyWidgetState();
}

class _TermsAndPolicyWidgetState extends State<TermsAndPolicyWidget> {
  late TermsAndPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndPolicyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: wrapWithModel(
                      model: _model.backButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BackButtonWidget(),
                    ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERMOS DE USO E POLÍTICA DE PRIVACIDADE',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Text(
                          'Bem-vindo(a) ao SET MOV. Estes Termos de Uso (\"Termos\") regulam o acesso e o uso dos serviços oferecidos por SETMOV INOVA SIMPLES, inscrita no CNPJ sob n°. 49.452.475/0001-08, com sede à Rua Alberto Coimbra, nº650, Primavera, Bairro Renato Gonçalves, Barreiras, BA, CEP 47.806.000, através do nosso aplicativo de streaming (\"App SetMov\").\nAo acessar ou utilizar o App SetMov, você (\"Usuário\") concorda em cumprir e estar vinculado(a) a estes Termos, à nossa Política de Privacidade e a quaisquer outras políticas aplicáveis que venham a ser publicadas. Se você não concorda com estes Termos, por favor, não utilize nosso Aplicativo.\n',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. O Que Oferecemos\n1.1. O App SetMov é uma plataforma de streaming que permite a locação individual de filmes, séries e outros conteúdos audiovisuais (\"Conteúdo\").\n1.2. Nosso modelo de serviço não exige mensalidade. Você paga apenas pelo Conteúdo que escolher assistir, pelo período de tempo definido nestes Termos.\n2. Acesso e Uso do Aplicativo\n2.1. Para utilizar o App SetMov, você deve ter pelo menos 18 (dezoito) anos de idade. Se você for menor de 18 anos, você só poderá utilizar o Aplicativo com o acompanhamento e consentimento de um de seus pais ou responsável legal, que será integralmente responsável por todas as suas atividades no Aplicativo.\n2.2. É sua responsabilidade garantir que as informações fornecidas durante o cadastro sejam verdadeiras, precisas, completas e atualizadas. A conta criada por você é pessoal e intransferível, assim como as senhas criadas para acesso. Caberá a você, com exclusividade, a responsabilidade pela guarda e proteção de suas credenciais de acesso. Você é o único responsável por todas as atividades que ocorram em sua conta. Não compartilhe suas credenciais de acesso com terceiros.\n2.3. O acesso ao Conteúdo exige conexão à internet, cuja qualidade e custos são de sua exclusiva responsabilidade.\n3. Locação e Período de Acesso ao Conteúdo\n3.1. Filmes e Conteúdo Individual: Ao alugar um filme ou qualquer outro Conteúdo individual, você terá um período de 24 (vinte e quatro) horas para assisti-lo, contadas a partir da confirmação da locação. Após esse período, o acesso ao Conteúdo será automaticamente revogado.\n3.2. Séries (Conteúdo com múltiplos episódios): Ao alugar uma temporada ou múltiplos episódios de uma série, o prazo de acesso permanecerá de 24 (vinte e quatro) horas, contado de forma sucessiva para cada episódio. Isso significa que, após a locação da série, você terá 24 horas para assistir ao primeiro episódio. Ao iniciar o segundo episódio, um novo prazo de 24 horas para esse episódio será iniciado, e assim sucessivamente para os demais episódios da locação.\n3.3. Início do Prazo: O prazo de 24 horas (ou prazos sucessivos para séries) começa a ser contado imediatamente após a confirmação da locação e processamento do pagamento, independentemente de você iniciar a reprodução do Conteúdo.\n3.4. Alerta de Prazo: Sempre que o prazo de locação estiver fluindo sem que o conteúdo tenha sido acessado pelo Usuário, esta receberá alertas de prazo, permitindo que o Usuário consiga acessar o conteúdo antes do fim do prazo.\n3.5. Renovação de Locação: Após o término do período de acesso, caso deseje assistir novamente ao Conteúdo, será necessário realizar uma nova locação e pagamento, ainda que o conteúdo não tenha sido integralmente assistido pelo Usuário na locação anterior, sendo vedada a locação parcial de qualquer conteúdo individual. \n4. Pagamento e Créditos\n4.1. O preço de cada locação será claramente exibido no Aplicativo antes da confirmação da sua compra.\n4.2. São aceitas diversas formas de pagamento, que estarão disponíveis no momento da locação. Ao fornecer suas informações de pagamento, você nos autoriza a cobrar o valor correspondente através da forma escolhida, até que outra forma seja escolhida.\n4.3. Todas as transações são processadas por meio de parceiros de pagamento seguros. Não armazenamos seus dados financeiros diretamente em nossos servidores.\n4.4. Carteira Digital e Créditos: Você poderá, opcionalmente, gerar e gerir pontos/créditos dentro do Aplicativo, utilizando a carteira digital disponível em seu perfil de usuário. Contudo, tais pontos/créditos somente poderão ser utilizados para o pagamento de futuras locações de Conteúdo dentro do App SetMOv.\n4.5. Os créditos gerados na carteira digital não são e nem poderão ser resgatados em dinheiro, sob nenhuma forma de restituição ou reembolso, podendo ser utilizados, exclusivamente, dentro do ecossistema do Aplicativo e para a finalidade específica de locação de Conteúdo.\n5. Direitos e Responsabilidades do Usuário\n5.1. O Usuário concorda em utilizar o Aplicativo e o Conteúdo de forma lícita, respeitando estes Termos e a legislação brasileira aplicável à matéria.\n5.2. O Conteúdo disponibilizado é para seu, exclusivamente uso pessoal e não comercial. Sendo estritamente proibida a reprodução, distribuição, modificação, exibição pública ou qualquer outra forma de exploração do Conteúdo sem autorização expressa da Empresa ou dos detentores dos direitos autorais, salvo a possibilidade de compartilhamento de tela, disponível para o Usuário cadastrado, e quando da utilização de conteúdo pago.\n5.3. O Usuário não deve tentar contornar, desabilitar ou interferir em quaisquer recursos de segurança ou proteção de direitos autorais do Aplicativo.\n5.4. O Usuário é responsável por todas as atividades que ocorram em sua conta, devendo nos notificar, imediatamente, em caso de uso não autorizado da sua conta. \n6. Conteúdo Gerado pelo Usuário e Interação na Plataforma\n6.1. O App SetMov pode oferecer funcionalidades que permitam ao Usuário, de forma voluntária, interagir com a plataforma, como, por exemplo, enviar comentários, avaliações, resenhas até o limite de 150(cento e cinquenta) caracteres;\n6.2. Ao assim proceder, o Usuário concede ao App SetMov uma licença global, não exclusiva, gratuita, transferível e sublicenciável para usar, reproduzir, distribuir, preparar obras derivadas, exibir e executar o Conteúdo do Usuário em conexão com o Aplicativo e os negócios da Empresa, inclusive para fins de promoção e redistribuição de parte ou da totalidade do Aplicativo em quaisquer formatos de mídia e através de quaisquer canais de mídia, porquanto tal contribuição não gera qualquer tipo de obrigação ou remuneração por parte do App SetMov para com o Usuário.\n6.3. Por ser público o conteúdo inserido pelo Usuário a título de comentários, avaliações ou resenhas, poderá ser visualizado por outros usuários do Aplicativo.\n6.4. Não haverá qualquer tipo de proteção específica ou direito de propriedade intelectual do usuário sobre o conteúdo por ele enviado. \n6.5. O Usuário é o único e exclusivo responsável por todo conteúdo que publicar em seu perfil mantido no Aplicativo, devendo garantir que o mesmo não viola quaisquer direitos de terceiros ou leis aplicáveis, sendo estritamente proibida a inserção de comentário, avaliações e/ou resenhas que contenham cunho preconceituoso, discriminatório, difamatório, ofensivo, abusivo, obsceno, ilegal ou que viole os direitos de terceiros. Incluindo, mas não se limitando a, conteúdo que incite ódio, violência ou discriminação baseada em raça ou cor; sexo ou orientação sexual; etnia ou origem nacional; crença ou religião; assim como qualquer outra característica protegida pela legislação.\n6.6. O não cumprimento desta seção pode acarretar em responsabilidades civis e criminais para o usuário infrator, conforme a legislação brasileira. Ao App SetMov, portanto, reserva-se o direito de, a seu exclusivo critério, remover ou restringir o conteúdo inserido pelo Usuário que viole estes Termos ou a legislação aplicável, a qualquer momento e sem aviso prévio, não se responsabilizando pelo conteúdo removido ou restringido, mas poderá agir para manter um ambiente seguro, pacífico e em conformidade com a lei.\n7. Direitos de Propriedade Intelectual\n7.1. Todo o Conteúdo disponível no Aplicativo, incluindo filmes, séries, artes, textos, gráficos, logotipos, ícones, imagens, clipes de áudio, downloads digitais, compilações de dados e software, é de propriedade do App SetMov ou de seus licenciadores, e é protegido por leis de direitos autorais, marcas registradas e outras leis de propriedade intelectual.\n7.2. A locação de Conteúdo concede ao Usuário uma licença limitada, não exclusiva e intransferível para acessar e assistir ao Conteúdo durante o período de locação, unicamente para uso pessoal e não comercial.\n8. Cancelamento e Reembolso\n8.1. O Usuário poderá cancelar sua conta a qualquer tempo, independente de notificação e/ou solicitação prévia ao App SetMov, sem incidência de multa ou qualquer outra sanção. \n8.2. Fica desde já cientificado que o Usuário não será reembolsado de eventuais locações vigentes mas não assistidas à data do cancelamento da sua conta, assim como não terá direito  de resgate de qualquer valor decorrente de pontuação acumulada dentro do aplicativo, conforme previsto nos itens 4.4 e 4.5 destes Termos.\n8.3. Em caso de problemas técnicos que impeçam o Usuário de acessar ou assistir ao Conteúdo locado dentro do período de 24(vinte e quatro) horas, e que sejam de responsabilidade do Aplicativo, faremos o possível para resolver a questão ou oferecer um reembolso ou crédito equivalente, a nosso critério.\n8.4. Problemas de conexão à internet ou equipamentos do Usuário; locação de Conteúdo por engano; e/ou término do período de 24 horas sem que o Conteúdo tenha sido assistido não ensejarão direito de reembolso.\n9. Privacidade e Proteção de Dados\n9.1. A sua privacidade é muito importante para nós. A coleta, o uso, o armazenamento e o tratamento dos seus dados pessoais são regidos pela nossa Política de Privacidade, que é parte integrante destes Termos. Recomendamos que você a leia atentamente para entender como tratamos suas informações.\n9.2. Ao aceitar estes Termos, você também concorda com a nossa Política de Privacidade e com o tratamento dos seus dados pessoais conforme nela descrito, em conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/2018 - LGPD).\n10. Limitação de Responsabilidade\n10.1. O App SetMov se esforça para manter o Aplicativo disponível e livre de erros, mas não garante que o serviço será ininterrupto ou totalmente livre de falhas.\n10.2. Não nos responsabilizamos por quaisquer perdas ou danos resultantes de uso indevido do Aplicativo ou Conteúdo pelo Usuário; Problemas na conexão de internet ou nos dispositivos do Usuário; Falhas ou indisponibilidade de serviços de terceiros (ex: provedores de pagamento, empresas de telecomunicações); eventos de caso fortuito ou força maior.\n10.3. Em nenhuma circunstância a responsabilidade total do App SetMov por quaisquer danos ou perdas excederá o valor total pago pelo Usuário pelas locações realizadas nos últimos 12 (doze) meses.\n11. Modificações nos Termos\n11.1. Os presentes Termos podem sofrer alterações a qualquer momento, as quais entrarão em vigor imediatamente após a sua publicação no Aplicativo.\n11.2. Se as alterações forem significativas, faremos um aviso prévio no Aplicativo ou por e-mail, conforme a lei exigir. O uso continuado do Aplicativo após a publicação das alterações constitui a aceitação dos novos Termos pelo Usuário que não poderá alegar desconhecimento. \n12. Disposições Gerais\n12.1. Estes Termos constituem o acordo integral entre o Usuário e o App SetMOv em relação ao uso do Aplicativo.\n12.2. A omissão ou tolerância em exigir o cumprimento de quaisquer disposições destes Termos não constituirá renúncia de direitos.\n12.3. Se qualquer disposição destes Termos for considerada inválida ou inexequível, as demais disposições permanecerão em pleno vigor e efeito.\n13. Lei Aplicável e Foro\n13.1. Estes Termos serão regidos e interpretados de acordo com as leis da República Federativa do Brasil. Fica, desde já, eleito o foro da comarca de Barreiras, Estado da Bahia, para dirimir quaisquer dúvidas ou litígios decorrentes destes Termos, com expressa renúncia a qualquer outro, por mais privilegiado que seja.\n14. Contato\nSe você tiver dúvidas sobre estes Termos de Uso, entre em contato conosco através do nosso Canal de Suporte ao Usuário ou pelo telefone: INDICAR OS CANAIS DE ATENDIMENTO/SUPORTE.\n09 de julho de 2025.\n',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Policies',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ]
                    .divide(SizedBox(height: 40.0))
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
