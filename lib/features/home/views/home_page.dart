import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/home.dart';

/// HomePage widget
/// This widget is the home page of the application.
/// It displays the user's email and name.
/// It also has a logout button in the app bar.
class HomePage extends StatefulWidget {
  /// Creates an instance of [HomePage].
  const HomePage({
    super.key,
    this.activePage = 0,
  });

  ///
  final int activePage;

  ///
  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final favoriteNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final userNavKey = GlobalKey<NavigatorState>();

  List<NavItem> items = [];
  int currentPage = 0;

  @override
  void initState() {
    currentPage = widget.activePage;
    items = [
      NavItem(
        page: const HomeView(),
        navKey: homeNavKey,
      ),
      NavItem(
        page: const FavoriteWidget(),
        navKey: favoriteNavKey,
      ),
      NavItem(
        page: const NotificationWidget(),
        navKey: notificationNavKey,
      ),
      NavItem(
        page: const UserWidget(),
        navKey: userNavKey,
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        if (items[currentPage].navKey.currentState?.canPop() ?? false) {
          items[currentPage].navKey.currentState?.pop();
          //return Future.value(false);
        } else {
          //return Future.value(true);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Home'),
          //   actions: <Widget>[
          //     IconButton(
          //       key: const Key('homePage_logout_iconButton'),
          //       icon: const Icon(Icons.exit_to_app),
          //       onPressed: () {
          //         context.read<AppBloc>().add(const AppLogoutPressed());
          //       },
          //     ),
          //   ],
          // ),
          bottomNavigationBar: NavBar(
            pageIndex: currentPage,
            onTap: (index) {
              if (index == currentPage) {
                items[index]
                    .navKey
                    .currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                setState(() {
                  currentPage = index;
                });
              }
            },
          ),
          extendBody: true,
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.homeBackgroundColor,
                  AppColors.homeBgColor,
                  AppColors.homeBgThreeColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: IndexedStack(
              index: currentPage,
              children: items
                  .map(
                    (page) => page.page,
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
