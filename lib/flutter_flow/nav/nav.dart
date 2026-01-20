import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginPageWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: RegisterPageWidget.routeName,
          path: RegisterPageWidget.routePath,
          builder: (context, params) => RegisterPageWidget(
            nome: params.getParam(
              'nome',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: ProfileSetUpWidget.routeName,
          path: ProfileSetUpWidget.routePath,
          builder: (context, params) => ProfileSetUpWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: SingleCategoryWidget.routeName,
          path: SingleCategoryWidget.routePath,
          builder: (context, params) => SingleCategoryWidget(),
        ),
        FFRoute(
          name: AccountNotificationsWidget.routeName,
          path: AccountNotificationsWidget.routePath,
          builder: (context, params) => AccountNotificationsWidget(),
        ),
        FFRoute(
          name: ExploreWidget.routeName,
          path: ExploreWidget.routePath,
          builder: (context, params) => ExploreWidget(),
        ),
        FFRoute(
          name: SearchResultsWidget.routeName,
          path: SearchResultsWidget.routePath,
          builder: (context, params) => SearchResultsWidget(
            search: params.getParam<String>(
              'search',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: MoviePlayWidget.routeName,
          path: MoviePlayWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MoviePlayWidget(
            img: params.getParam(
              'img',
              ParamType.String,
            ),
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
            rental: params.getParam<MovieRentalsRow>(
              'rental',
              ParamType.SupabaseRow,
            ),
            coins: params.getParam(
              'coins',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: PlaySerieWidget.routeName,
          path: PlaySerieWidget.routePath,
          builder: (context, params) => PlaySerieWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MyListWidget.routeName,
          path: MyListWidget.routePath,
          builder: (context, params) => MyListWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: SubscibePremiumWidget.routeName,
          path: SubscibePremiumWidget.routePath,
          builder: (context, params) => SubscibePremiumWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => PaymentWidget(),
        ),
        FFRoute(
          name: AccountCardAddWidget.routeName,
          path: AccountCardAddWidget.routePath,
          builder: (context, params) => AccountCardAddWidget(),
        ),
        FFRoute(
          name: PaymentSummaryWidget.routeName,
          path: PaymentSummaryWidget.routePath,
          builder: (context, params) => PaymentSummaryWidget(),
        ),
        FFRoute(
          name: ProfileEditWidget.routeName,
          path: ProfileEditWidget.routePath,
          builder: (context, params) => ProfileEditWidget(),
        ),
        FFRoute(
          name: NotificationSettingsWidget.routeName,
          path: NotificationSettingsWidget.routePath,
          builder: (context, params) => NotificationSettingsWidget(),
        ),
        FFRoute(
          name: AccountPreferencesWidget.routeName,
          path: AccountPreferencesWidget.routePath,
          builder: (context, params) => AccountPreferencesWidget(),
        ),
        FFRoute(
          name: SecurityWidget.routeName,
          path: SecurityWidget.routePath,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: TermsAndPolicyWidget.routeName,
          path: TermsAndPolicyWidget.routePath,
          builder: (context, params) => TermsAndPolicyWidget(),
        ),
        FFRoute(
          name: HelpCenterWidget.routeName,
          path: HelpCenterWidget.routePath,
          builder: (context, params) => HelpCenterWidget(),
        ),
        FFRoute(
          name: AccountChatHelperWidget.routeName,
          path: AccountChatHelperWidget.routePath,
          builder: (context, params) => AccountChatHelperWidget(),
        ),
        FFRoute(
          name: PopularInterestsWidget.routeName,
          path: PopularInterestsWidget.routePath,
          builder: (context, params) => PopularInterestsWidget(),
        ),
        FFRoute(
          name: GenresWidget.routeName,
          path: GenresWidget.routePath,
          builder: (context, params) => GenresWidget(),
        ),
        FFRoute(
          name: WatchHistoryWidget.routeName,
          path: WatchHistoryWidget.routePath,
          builder: (context, params) => WatchHistoryWidget(),
        ),
        FFRoute(
          name: SubscriptionWidget.routeName,
          path: SubscriptionWidget.routePath,
          builder: (context, params) => SubscriptionWidget(),
        ),
        FFRoute(
          name: LanguagesWidget.routeName,
          path: LanguagesWidget.routePath,
          builder: (context, params) => LanguagesWidget(),
        ),
        FFRoute(
          name: RedeSocialCommentsWidget.routeName,
          path: RedeSocialCommentsWidget.routePath,
          builder: (context, params) => RedeSocialCommentsWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PerfilWidget.routeName,
          path: PerfilWidget.routePath,
          builder: (context, params) => PerfilWidget(
            urlImagem: params.getParam(
              'urlImagem',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RedeSocialHomeWidget.routeName,
          path: RedeSocialHomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RedeSocialHomeWidget(),
        ),
        FFRoute(
          name: MovieDetailsWidget.routeName,
          path: MovieDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MovieDetailsWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MovieAddWidget.routeName,
          path: MovieAddWidget.routePath,
          builder: (context, params) => MovieAddWidget(),
        ),
        FFRoute(
          name: RedeSocialNotificationsWidget.routeName,
          path: RedeSocialNotificationsWidget.routePath,
          builder: (context, params) => RedeSocialNotificationsWidget(),
        ),
        FFRoute(
          name: SerieDetailsWidget.routeName,
          path: SerieDetailsWidget.routePath,
          builder: (context, params) => SerieDetailsWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MovieAcceptRentalWidget.routeName,
          path: MovieAcceptRentalWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MovieAcceptRentalWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ResetPassSendEmailWidget.routeName,
          path: ResetPassSendEmailWidget.routePath,
          builder: (context, params) => ResetPassSendEmailWidget(),
        ),
        FFRoute(
          name: ResetPassNewPassWidget.routeName,
          path: ResetPassNewPassWidget.routePath,
          builder: (context, params) => ResetPassNewPassWidget(),
        ),
        FFRoute(
          name: RedeSocialMinhaWidget.routeName,
          path: RedeSocialMinhaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RedeSocialMinhaWidget(
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RedeSocialProfileWidget.routeName,
          path: RedeSocialProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RedeSocialProfileWidget(
            currentProfileId: params.getParam(
              'currentProfileId',
              ParamType.String,
            ),
            followedId: params.getParam(
              'followedId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyListLocadosWidget.routeName,
          path: MyListLocadosWidget.routePath,
          builder: (context, params) => MyListLocadosWidget(),
        ),
        FFRoute(
          name: MovieTrailerPlayWidget.routeName,
          path: MovieTrailerPlayWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MovieTrailerPlayWidget(
            movieId: params.getParam(
              'movieId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PaymentSummaryCopyWidget.routeName,
          path: PaymentSummaryCopyWidget.routePath,
          builder: (context, params) => PaymentSummaryCopyWidget(),
        ),
        FFRoute(
          name: PagamentoRealizadoComSucessoWidget.routeName,
          path: PagamentoRealizadoComSucessoWidget.routePath,
          builder: (context, params) => PagamentoRealizadoComSucessoWidget(),
        ),
        FFRoute(
          name: PaymentSummaryCopyCopyWidget.routeName,
          path: PaymentSummaryCopyCopyWidget.routePath,
          builder: (context, params) => PaymentSummaryCopyCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Screenshot_2-removebg-preview.png',
                      width: 250.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
