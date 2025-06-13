// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:uiwidgets/presentation/alert_controllers_screen.dart' as _i12;
import 'package:uiwidgets/presentation/alexander_screen.dart' as _i1;
import 'package:uiwidgets/presentation/buttons_screen.dart' as _i2;
import 'package:uiwidgets/presentation/circular_progres_screen.dart' as _i3;
import 'package:uiwidgets/presentation/containers_screen.dart' as _i14;
import 'package:uiwidgets/presentation/data_table_detail_screen.dart' as _i7;
import 'package:uiwidgets/presentation/data_table_screen.dart' as _i4;
import 'package:uiwidgets/presentation/detail_screen.dart' as _i5;
import 'package:uiwidgets/presentation/grid_view_screen.dart' as _i6;
import 'package:uiwidgets/presentation/linear_progress_screen.dart' as _i8;
import 'package:uiwidgets/presentation/list_view_screen.dart' as _i9;
import 'package:uiwidgets/presentation/login_screen.dart' as _i10;
import 'package:uiwidgets/presentation/pickers_screen.dart' as _i11;
import 'package:uiwidgets/presentation/scroll_view_screen.dart' as _i13;
import 'package:uiwidgets/presentation/search_bar_screen.dart' as _i15;
import 'package:uiwidgets/presentation/segmented_controls_screen.dart' as _i16;
import 'package:uiwidgets/presentation/slider_screen.dart' as _i17;
import 'package:uiwidgets/presentation/stack_views_screen.dart' as _i18;
import 'package:uiwidgets/presentation/steppers_screen.dart' as _i19;
import 'package:uiwidgets/presentation/switches_screen.dart' as _i20;
import 'package:uiwidgets/presentation/tabbar_screen.dart' as _i21;
import 'package:uiwidgets/presentation/textfield_screen.dart' as _i22;

/// generated route for
/// [_i1.AlexanderScreen]
class AlexanderRoute extends _i23.PageRouteInfo<void> {
  const AlexanderRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AlexanderRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlexanderRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.AlexanderScreen();
    },
  );
}

/// generated route for
/// [_i2.ButtonsScreen]
class ButtonsRoute extends _i23.PageRouteInfo<void> {
  const ButtonsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ButtonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ButtonsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.ButtonsScreen();
    },
  );
}

/// generated route for
/// [_i3.CircularProgresScreen]
class CircularProgresRoute extends _i23.PageRouteInfo<void> {
  const CircularProgresRoute({List<_i23.PageRouteInfo>? children})
      : super(
          CircularProgresRoute.name,
          initialChildren: children,
        );

  static const String name = 'CircularProgresRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.CircularProgresScreen();
    },
  );
}

/// generated route for
/// [_i4.DataTableScreen]
class DataTableRoute extends _i23.PageRouteInfo<void> {
  const DataTableRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DataTableRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataTableRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.DataTableScreen();
    },
  );
}

/// generated route for
/// [_i5.DetailScreen]
class DetailRoute extends _i23.PageRouteInfo<void> {
  const DetailRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i5.DetailScreen();
    },
  );
}

/// generated route for
/// [_i6.GridViewScreen]
class GridViewRoute extends _i23.PageRouteInfo<void> {
  const GridViewRoute({List<_i23.PageRouteInfo>? children})
      : super(
          GridViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'GridViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.GridViewScreen();
    },
  );
}

/// generated route for
/// [_i7.KisiDetailScreen]
class KisiDetailRoute extends _i23.PageRouteInfo<KisiDetailRouteArgs> {
  KisiDetailRoute({
    _i24.Key? key,
    required _i4.Kisi kisi,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          KisiDetailRoute.name,
          args: KisiDetailRouteArgs(
            key: key,
            kisi: kisi,
          ),
          initialChildren: children,
        );

  static const String name = 'KisiDetailRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<KisiDetailRouteArgs>();
      return _i7.KisiDetailScreen(
        key: args.key,
        kisi: args.kisi,
      );
    },
  );
}

class KisiDetailRouteArgs {
  const KisiDetailRouteArgs({
    this.key,
    required this.kisi,
  });

  final _i24.Key? key;

  final _i4.Kisi kisi;

  @override
  String toString() {
    return 'KisiDetailRouteArgs{key: $key, kisi: $kisi}';
  }
}

/// generated route for
/// [_i8.LinearProgressScreen]
class LinearProgressRoute extends _i23.PageRouteInfo<void> {
  const LinearProgressRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LinearProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'LinearProgressRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.LinearProgressScreen();
    },
  );
}

/// generated route for
/// [_i9.ListViewScreen]
class ListViewRoute extends _i23.PageRouteInfo<void> {
  const ListViewRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ListViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return _i9.ListViewScreen();
    },
  );
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i23.PageRouteInfo<void> {
  const LoginRoute({List<_i23.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginScreen();
    },
  );
}

/// generated route for
/// [_i11.PickersScreen]
class PickersRoute extends _i23.PageRouteInfo<void> {
  const PickersRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PickersRoute.name,
          initialChildren: children,
        );

  static const String name = 'PickersRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.PickersScreen();
    },
  );
}

/// generated route for
/// [_i12.PinokyoAlertPage]
class PinokyoAlertRoute extends _i23.PageRouteInfo<void> {
  const PinokyoAlertRoute({List<_i23.PageRouteInfo>? children})
      : super(
          PinokyoAlertRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinokyoAlertRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.PinokyoAlertPage();
    },
  );
}

/// generated route for
/// [_i13.ScrollViewScreen]
class ScrollViewRoute extends _i23.PageRouteInfo<void> {
  const ScrollViewRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ScrollViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScrollViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i13.ScrollViewScreen();
    },
  );
}

/// generated route for
/// [_i14.ScrollableContainersPage]
class ScrollableContainersRoute extends _i23.PageRouteInfo<void> {
  const ScrollableContainersRoute({List<_i23.PageRouteInfo>? children})
      : super(
          ScrollableContainersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScrollableContainersRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.ScrollableContainersPage();
    },
  );
}

/// generated route for
/// [_i15.SearchablePersonPage]
class SearchablePersonRoute
    extends _i23.PageRouteInfo<SearchablePersonRouteArgs> {
  SearchablePersonRoute({
    _i24.Key? key,
    String? name,
    String? surname,
    List<_i23.PageRouteInfo>? children,
  }) : super(
          SearchablePersonRoute.name,
          args: SearchablePersonRouteArgs(
            key: key,
            name: name,
            surname: surname,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchablePersonRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchablePersonRouteArgs>(
          orElse: () => const SearchablePersonRouteArgs());
      return _i15.SearchablePersonPage(
        key: args.key,
        name: args.name,
        surname: args.surname,
      );
    },
  );
}

class SearchablePersonRouteArgs {
  const SearchablePersonRouteArgs({
    this.key,
    this.name,
    this.surname,
  });

  final _i24.Key? key;

  final String? name;

  final String? surname;

  @override
  String toString() {
    return 'SearchablePersonRouteArgs{key: $key, name: $name, surname: $surname}';
  }
}

/// generated route for
/// [_i16.SegmentPage]
class SegmentRoute extends _i23.PageRouteInfo<void> {
  const SegmentRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SegmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SegmentRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.SegmentPage();
    },
  );
}

/// generated route for
/// [_i17.SliderScreen]
class SliderRoute extends _i23.PageRouteInfo<void> {
  const SliderRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SliderRoute.name,
          initialChildren: children,
        );

  static const String name = 'SliderRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i17.SliderScreen();
    },
  );
}

/// generated route for
/// [_i18.StackViewsScreen]
class StackViewsRoute extends _i23.PageRouteInfo<void> {
  const StackViewsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          StackViewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StackViewsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i18.StackViewsScreen();
    },
  );
}

/// generated route for
/// [_i19.SteppersScreen]
class SteppersRoute extends _i23.PageRouteInfo<void> {
  const SteppersRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SteppersRoute.name,
          initialChildren: children,
        );

  static const String name = 'SteppersRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.SteppersScreen();
    },
  );
}

/// generated route for
/// [_i20.SwitchesScreen]
class SwitchesRoute extends _i23.PageRouteInfo<void> {
  const SwitchesRoute({List<_i23.PageRouteInfo>? children})
      : super(
          SwitchesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwitchesRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return _i20.SwitchesScreen();
    },
  );
}

/// generated route for
/// [_i21.TabbarScreen]
class TabbarRoute extends _i23.PageRouteInfo<void> {
  const TabbarRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TabbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabbarRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i21.TabbarScreen();
    },
  );
}

/// generated route for
/// [_i22.TextfieldScreen]
class TextfieldRoute extends _i23.PageRouteInfo<void> {
  const TextfieldRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TextfieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextfieldRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i22.TextfieldScreen();
    },
  );
}
