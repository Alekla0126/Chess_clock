import 'package:chess_clock/GamesList/scrollable_games_grid.dart';
import 'package:chess_clock/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:chess_clock/Screens/settings_screen.dart';
import 'package:chess_clock/GlobalFiles/appState.dart';
import 'package:chess_clock/NewGame/new_game.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('es', 'SP')],
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'),
      path: 'assets/translations',
      child: ChangeNotifierProvider(
        child: MyApp(),
        create: (BuildContext context) => AppState(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Consumer<AppState>(builder: (context, appState, child) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: LocaleKeys.title.tr(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                fontFamily: 'Opensans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(color: appState.getColorTheme()['background'])),
        ),
        home: MyHomePage(title: LocaleKeys.title.tr()),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({required this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return Scaffold(
        backgroundColor: appState.getColorTheme()['background'],
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: appState.getColorTheme()['accent'],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            )
          ],
          backgroundColor: appState.getColorTheme()['bar'],
          title: Text(LocaleKeys.title.tr(),
              style: TextStyle(fontSize: 20, color: appState.getColorTheme()['accent'])),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollableGamesGrid(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'btn2',
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return NewGame();
                });
          },
          label: Text(LocaleKeys.Add_game.tr()),
          icon: Icon(Icons.add),
          backgroundColor: appState.getColorTheme()['buttons'],
        ),
      );
    });
  }
}