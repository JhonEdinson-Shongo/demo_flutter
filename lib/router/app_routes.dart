import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOption = <MenuOption>[
    // MenuOption(
    //   route: 'home',
    //   name: 'Home Screen',
    //   screen: HomeScreen(),
    //   icon: Icons.home,
    // ),
    MenuOption(
      route: 'listview1',
      name: 'ListView1 Screen',
      screen: ListviewScreen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: 'listview2',
      name: 'ListView2 Screen',
      screen: Listview2Screen(),
      icon: Icons.list_alt,
    ),
    MenuOption(
      route: 'alertscreen',
      name: 'Alert Screen',
      screen: AlertScreen(),
      icon: Icons.add_alert,
    ),
    MenuOption(
      route: 'cardscreen',
      name: 'Card Screen',
      screen: CardScreen(),
      icon: Icons.person_pin_outlined,
    ),
    MenuOption(
      route: 'avatar',
      name: 'Circle avatar',
      screen: AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animate',
      name: 'Animate',
      screen: AnimateScreen(),
      icon: Icons.auto_fix_normal_outlined,
    ),
    MenuOption(
      route: 'inputs',
      name: 'Texts inputs',
      screen: InputsScreen(),
      icon: Icons.input_rounded,
    ),
    MenuOption(
      route: 'slider',
      name: 'Slider and checks',
      screen: SliderScreenScreen(),
      icon: Icons.slow_motion_video_sharp,
    ),
    MenuOption(
      route: 'listviewbuilder',
      name: 'ListView Builder',
      screen: ListViewBuilderScreen(),
      icon: Icons.build_circle_outlined,
    ),
    MenuOption(
      route: 'auth',
      name: 'Auntenticador',
      screen: AuthScreen(),
      icon: Icons.sensor_occupied_rounded,
    ),
    MenuOption(
      route: 'painter',
      name: 'Painter',
      screen: PainterScreen(),
      icon: Icons.format_paint_outlined,
    ),
    MenuOption(
      route: 'responsive',
      name: 'Responsive',
      screen: ResponsiveScreen(),
      icon: Icons.screen_rotation,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomeScreen()});

    for (final option in menuOption) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   '/': (BuildContext context) => HomeScreen(),
  //   '/listview1': (BuildContext context) => ListviewScreen(),
  //   '/listview2': (BuildContext context) => ListviewScreen(),
  //   '/alertscreen': (BuildContext context) => AlertScreen(),
  // };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => AlertScreen());
  }
}
