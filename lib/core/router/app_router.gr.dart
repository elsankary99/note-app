// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddNotePage(),
      );
    },
    EditNoteRoute.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditNotePage(
          key: args.key,
          note: args.note,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NoteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NoteDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoteDetailsPage(
          key: args.key,
          note: args.note,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AddNotePage]
class AddNoteRoute extends PageRouteInfo<void> {
  const AddNoteRoute({List<PageRouteInfo>? children})
      : super(
          AddNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditNotePage]
class EditNoteRoute extends PageRouteInfo<EditNoteRouteArgs> {
  EditNoteRoute({
    Key? key,
    required NoteModel note,
    List<PageRouteInfo>? children,
  }) : super(
          EditNoteRoute.name,
          args: EditNoteRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'EditNoteRoute';

  static const PageInfo<EditNoteRouteArgs> page =
      PageInfo<EditNoteRouteArgs>(name);
}

class EditNoteRouteArgs {
  const EditNoteRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteModel note;

  @override
  String toString() {
    return 'EditNoteRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoteDetailsPage]
class NoteDetailsRoute extends PageRouteInfo<NoteDetailsRouteArgs> {
  NoteDetailsRoute({
    Key? key,
    required NoteModel note,
    List<PageRouteInfo>? children,
  }) : super(
          NoteDetailsRoute.name,
          args: NoteDetailsRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteDetailsRoute';

  static const PageInfo<NoteDetailsRouteArgs> page =
      PageInfo<NoteDetailsRouteArgs>(name);
}

class NoteDetailsRouteArgs {
  const NoteDetailsRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteModel note;

  @override
  String toString() {
    return 'NoteDetailsRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
