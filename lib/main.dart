import 'package:flutter/material.dart';
import 'package:radis_demo/screens/main_screen.dart';
import 'package:radis_demo/screens/room_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Diary',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => MainScreen(),
         RoomScreen.routeName: (ctx) =>
             RoomScreen(),
        // MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        // FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
    );
  }
}