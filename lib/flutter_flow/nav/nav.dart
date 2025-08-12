import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
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

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? SwipeTaskerWidget()
          : GetStartedWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? SwipeTaskerWidget()
              : GetStartedWidget(),
        ),
        FFRoute(
          name: FeedbackEventsTaskerWidget.routeName,
          path: FeedbackEventsTaskerWidget.routePath,
          builder: (context, params) => FeedbackEventsTaskerWidget(),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) => ChatWidget(
            chat: params.getParam(
              'chat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chat'],
            ),
          ),
        ),
        FFRoute(
          name: TaskeeRankingTaskerWidget.routeName,
          path: TaskeeRankingTaskerWidget.routePath,
          builder: (context, params) => TaskeeRankingTaskerWidget(),
        ),
        FFRoute(
          name: ConfiguracaoTaskerWidget.routeName,
          path: ConfiguracaoTaskerWidget.routePath,
          builder: (context, params) => ConfiguracaoTaskerWidget(),
        ),
        FFRoute(
          name: VerifyYourAccountWidget.routeName,
          path: VerifyYourAccountWidget.routePath,
          builder: (context, params) => VerifyYourAccountWidget(),
        ),
        FFRoute(
          name: QuickySolutionsWidget.routeName,
          path: QuickySolutionsWidget.routePath,
          builder: (context, params) => QuickySolutionsWidget(),
        ),
        FFRoute(
          name: TaskOverviewWidget.routeName,
          path: TaskOverviewWidget.routePath,
          builder: (context, params) => TaskOverviewWidget(),
        ),
        FFRoute(
          name: AboutappWidget.routeName,
          path: AboutappWidget.routePath,
          builder: (context, params) => AboutappWidget(),
        ),
        FFRoute(
          name: FinalRequestTaskWidget.routeName,
          path: FinalRequestTaskWidget.routePath,
          builder: (context, params) => FinalRequestTaskWidget(
            taskdo: params.getParam(
              'taskdo',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: TaskStepssWidget.routeName,
          path: TaskStepssWidget.routePath,
          builder: (context, params) => TaskStepssWidget(),
        ),
        FFRoute(
          name: ContinueAsWidget.routeName,
          path: ContinueAsWidget.routePath,
          builder: (context, params) => ContinueAsWidget(),
        ),
        FFRoute(
          name: TaskeeRankingWidget.routeName,
          path: TaskeeRankingWidget.routePath,
          builder: (context, params) => TaskeeRankingWidget(),
        ),
        FFRoute(
          name: CapturaDeCameraWidget.routeName,
          path: CapturaDeCameraWidget.routePath,
          builder: (context, params) => CapturaDeCameraWidget(),
        ),
        FFRoute(
          name: PasswordTaskerWidget.routeName,
          path: PasswordTaskerWidget.routePath,
          builder: (context, params) => PasswordTaskerWidget(),
        ),
        FFRoute(
          name: QuickyTeamNotificacoesTaskeeWidget.routeName,
          path: QuickyTeamNotificacoesTaskeeWidget.routePath,
          builder: (context, params) => QuickyTeamNotificacoesTaskeeWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: ConfiguracaoTaskeeWidget.routeName,
          path: ConfiguracaoTaskeeWidget.routePath,
          builder: (context, params) => ConfiguracaoTaskeeWidget(),
        ),
        FFRoute(
          name: CreateProfileTaskerWidget.routeName,
          path: CreateProfileTaskerWidget.routePath,
          builder: (context, params) => CreateProfileTaskerWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: ConfiguracaoCopyCopyCopyWidget.routeName,
          path: ConfiguracaoCopyCopyCopyWidget.routePath,
          builder: (context, params) => ConfiguracaoCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: ProfilePageTaskerWidget.routeName,
          path: ProfilePageTaskerWidget.routePath,
          builder: (context, params) => ProfilePageTaskerWidget(),
        ),
        FFRoute(
          name: RequestCreateTaskWidget.routeName,
          path: RequestCreateTaskWidget.routePath,
          builder: (context, params) => RequestCreateTaskWidget(
            pretasks: params.getParam(
              'pretasks',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasksPreProntas'],
            ),
            materialsList: params.getParam<String>(
              'materialsList',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: RatingsTaskeesCopy3Widget.routeName,
          path: RatingsTaskeesCopy3Widget.routePath,
          builder: (context, params) => RatingsTaskeesCopy3Widget(),
        ),
        FFRoute(
          name: PhoneNumberCopy2CopyWidget.routeName,
          path: PhoneNumberCopy2CopyWidget.routePath,
          builder: (context, params) => PhoneNumberCopy2CopyWidget(),
        ),
        FFRoute(
          name: CreateTaskWidget.routeName,
          path: CreateTaskWidget.routePath,
          builder: (context, params) => CreateTaskWidget(),
        ),
        FFRoute(
          name: TaskOverviewTaskerWidget.routeName,
          path: TaskOverviewTaskerWidget.routePath,
          builder: (context, params) => TaskOverviewTaskerWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: RatingsTaskeesCopyWidget.routeName,
          path: RatingsTaskeesCopyWidget.routePath,
          builder: (context, params) => RatingsTaskeesCopyWidget(),
        ),
        FFRoute(
          name: RatingsTaskerWidget.routeName,
          path: RatingsTaskerWidget.routePath,
          builder: (context, params) => RatingsTaskerWidget(),
        ),
        FFRoute(
          name: FeedbackandEventsTaskerWidget.routeName,
          path: FeedbackandEventsTaskerWidget.routePath,
          builder: (context, params) => FeedbackandEventsTaskerWidget(),
        ),
        FFRoute(
          name: SwipeTaskerWidget.routeName,
          path: SwipeTaskerWidget.routePath,
          builder: (context, params) => SwipeTaskerWidget(),
        ),
        FFRoute(
          name: PasswordTaskeeWidget.routeName,
          path: PasswordTaskeeWidget.routePath,
          builder: (context, params) => PasswordTaskeeWidget(),
        ),
        FFRoute(
          name: SelectTaskWidget.routeName,
          path: SelectTaskWidget.routePath,
          builder: (context, params) => SelectTaskWidget(),
        ),
        FFRoute(
          name: CurrentTasksWidget.routeName,
          path: CurrentTasksWidget.routePath,
          builder: (context, params) => CurrentTasksWidget(),
        ),
        FFRoute(
          name: ProgressWidget.routeName,
          path: ProgressWidget.routePath,
          builder: (context, params) => ProgressWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: EmailTaskerWidget.routeName,
          path: EmailTaskerWidget.routePath,
          builder: (context, params) => EmailTaskerWidget(),
        ),
        FFRoute(
          name: CreateProfileWidget.routeName,
          path: CreateProfileWidget.routePath,
          builder: (context, params) => CreateProfileWidget(),
        ),
        FFRoute(
          name: FazendoTaskWidget.routeName,
          path: FazendoTaskWidget.routePath,
          builder: (context, params) => FazendoTaskWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: VerifyYourAccountTaskerWidget.routeName,
          path: VerifyYourAccountTaskerWidget.routePath,
          builder: (context, params) => VerifyYourAccountTaskerWidget(),
        ),
        FFRoute(
          name: ChatTaskerWidget.routeName,
          path: ChatTaskerWidget.routePath,
          builder: (context, params) => ChatTaskerWidget(
            chat: params.getParam(
              'chat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chat'],
            ),
          ),
        ),
        FFRoute(
          name: EmailNotificacaoTaskerWidget.routeName,
          path: EmailNotificacaoTaskerWidget.routePath,
          builder: (context, params) => EmailNotificacaoTaskerWidget(),
        ),
        FFRoute(
          name: CreateaticketWidget.routeName,
          path: CreateaticketWidget.routePath,
          builder: (context, params) => CreateaticketWidget(),
        ),
        FFRoute(
          name: EmailTaskeeWidget.routeName,
          path: EmailTaskeeWidget.routePath,
          builder: (context, params) => EmailTaskeeWidget(),
        ),
        FFRoute(
          name: ADDPhotoCreateTaskWidget.routeName,
          path: ADDPhotoCreateTaskWidget.routePath,
          builder: (context, params) => ADDPhotoCreateTaskWidget(
            pretasks: params.getParam(
              'pretasks',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasksPreProntas'],
            ),
          ),
        ),
        FFRoute(
          name: PhoneNumberTaskerWidget.routeName,
          path: PhoneNumberTaskerWidget.routePath,
          builder: (context, params) => PhoneNumberTaskerWidget(),
        ),
        FFRoute(
          name: GetStartedWidget.routeName,
          path: GetStartedWidget.routePath,
          builder: (context, params) => GetStartedWidget(),
        ),
        FFRoute(
          name: FeedbackEventsTaskeeWidget.routeName,
          path: FeedbackEventsTaskeeWidget.routePath,
          builder: (context, params) => FeedbackEventsTaskeeWidget(),
        ),
        FFRoute(
          name: EmailNotificacaoTaskeeWidget.routeName,
          path: EmailNotificacaoTaskeeWidget.routePath,
          builder: (context, params) => EmailNotificacaoTaskeeWidget(),
        ),
        FFRoute(
          name: QuickyTeamNotificacoesTaskerWidget.routeName,
          path: QuickyTeamNotificacoesTaskerWidget.routePath,
          builder: (context, params) => QuickyTeamNotificacoesTaskerWidget(),
        ),
        FFRoute(
          name: PhoneNumberTaskeeWidget.routeName,
          path: PhoneNumberTaskeeWidget.routePath,
          builder: (context, params) => PhoneNumberTaskeeWidget(),
        ),
        FFRoute(
          name: RatingsTaskeeWidget.routeName,
          path: RatingsTaskeeWidget.routePath,
          builder: (context, params) => RatingsTaskeeWidget(),
        ),
        FFRoute(
          name: PhoneNumberCopy2Widget.routeName,
          path: PhoneNumberCopy2Widget.routePath,
          builder: (context, params) => PhoneNumberCopy2Widget(),
        ),
        FFRoute(
          name: RequestEvaluationWidget.routeName,
          path: RequestEvaluationWidget.routePath,
          builder: (context, params) => RequestEvaluationWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
            momento: params.getParam(
              'momento',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LookingTaskerWidget.routeName,
          path: LookingTaskerWidget.routePath,
          builder: (context, params) => LookingTaskerWidget(
            task: params.getParam(
              'task',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['tasks'],
            ),
          ),
        ),
        FFRoute(
          name: HelpcenterWidget.routeName,
          path: HelpcenterWidget.routePath,
          builder: (context, params) => HelpcenterWidget(),
        ),
        FFRoute(
          name: PerfildosusersWidget.routeName,
          path: PerfildosusersWidget.routePath,
          builder: (context, params) => PerfildosusersWidget(
            users: params.getParam(
              'users',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: EditarperfildousuariotaskeeWidget.routeName,
          path: EditarperfildousuariotaskeeWidget.routePath,
          builder: (context, params) => EditarperfildousuariotaskeeWidget(),
        ),
        FFRoute(
          name: ChatCopyWidget.routeName,
          path: ChatCopyWidget.routePath,
          builder: (context, params) => ChatCopyWidget(
            users: params.getParam(
              'users',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: EditarperfildousuariotaskerWidget.routeName,
          path: EditarperfildousuariotaskerWidget.routePath,
          builder: (context, params) => EditarperfildousuariotaskerWidget(),
        ),
        FFRoute(
          name: EventsWidget.routeName,
          path: EventsWidget.routePath,
          builder: (context, params) => EventsWidget(),
        ),
        FFRoute(
          name: CreateNewEventWidget.routeName,
          path: CreateNewEventWidget.routePath,
          builder: (context, params) => CreateNewEventWidget(),
        ),
        FFRoute(
          name: QuickySolutionsCopyWidget.routeName,
          path: QuickySolutionsCopyWidget.routePath,
          builder: (context, params) => QuickySolutionsCopyWidget(),
        ),
        FFRoute(
          name: EventdetailsWidget.routeName,
          path: EventdetailsWidget.routePath,
          builder: (context, params) => EventdetailsWidget(
            envet: params.getParam(
              'envet',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: InstrutoraccessionWidget.routeName,
          path: InstrutoraccessionWidget.routePath,
          builder: (context, params) => InstrutoraccessionWidget(
            event: params.getParam(
              'event',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: EventdetailsCopyWidget.routeName,
          path: EventdetailsCopyWidget.routePath,
          builder: (context, params) => EventdetailsCopyWidget(
            envet: params.getParam(
              'envet',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
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
    List<String>? collectionNamePath,
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
      collectionNamePath: collectionNamePath,
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
            return '/getStarted';
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
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Artboard_14.png',
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
