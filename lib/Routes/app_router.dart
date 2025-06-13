import 'package:auto_route/auto_route.dart';
import 'package:uiwidgets/Routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: ScrollableContainersRoute.page),
        AutoRoute(page: ButtonsRoute.page),
        AutoRoute(page: TextfieldRoute.page),
        AutoRoute(page: SliderRoute.page),
        AutoRoute(page: SwitchesRoute.page),
        AutoRoute(page: SteppersRoute.page),
        AutoRoute(page: AlexanderRoute.page),
        AutoRoute(page: SegmentRoute.page),
        AutoRoute(page: PinokyoAlertRoute.page),
        AutoRoute(page: CircularProgresRoute.page),
        AutoRoute(page: LinearProgressRoute.page),
        AutoRoute(page: StackViewsRoute.page),
        AutoRoute(page: ScrollViewRoute.page),
        AutoRoute(page: TabbarRoute.page),
        AutoRoute(page: PickersRoute.page),
        AutoRoute(page: DataTableRoute.page),
        AutoRoute(page: KisiDetailRoute.page),
        AutoRoute(page: SearchablePersonRoute.page),
        AutoRoute(page: GridViewRoute.page),
        AutoRoute(page: ListViewRoute.page),
      ];
}
