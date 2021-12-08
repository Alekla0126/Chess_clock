import 'package:chess_clock/translations/locale_keys.g.dart';
import 'package:chess_clock/GlobalFiles/appState.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//Settings screen
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> title = [
    LocaleKeys.Theme.tr(),
    LocaleKeys.Vibration.tr(),
    LocaleKeys.Rate_this_app.tr(),
    LocaleKeys.Change_language.tr(),
  ];
  List<String> content = [
    LocaleKeys.Choose_theme.tr(),
    LocaleKeys.Customize_haptic.tr(),
    LocaleKeys.Rate_this_app.tr(),
    LocaleKeys.Change_language.tr(),
  ];

  showThemeDialog(BuildContext context, Function setColorTheme) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(LocaleKeys.Theme.tr()),
            children: <Widget>[
              SimpleDialogOption(
                child: Text(LocaleKeys.Light_theme.tr()),
                onPressed: () {
                  setColorTheme(true);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                  child: Text(LocaleKeys.Dark_theme.tr()),
                  onPressed: () {
                    setColorTheme(false);
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  showVibrationDialog(BuildContext context, Function setVibration) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(LocaleKeys.Vibration.tr()),
            children: <Widget>[
              SimpleDialogOption(
                child: Text(LocaleKeys.Vibration_on.tr()),
                onPressed: () {
                  setVibration(true);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                  child: Text(LocaleKeys.Vibration_off.tr()),
                  onPressed: () {
                    setVibration(false);
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  showLanguageDialog(BuildContext context) {
    String dropdownValue =
        Localizations.localeOf(context).countryCode.toString();
    if (dropdownValue == "ES") {
      dropdownValue = "Español";
    } else {
      dropdownValue = "English";
    }
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(LocaleKeys.Change_language.tr()),
            children: <Widget>[
              SimpleDialogOption(
                child: Text(LocaleKeys.Espanol.tr()),
                onPressed: () async {
                  await context.setLocale(context.supportedLocales[1]);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget)
                  );
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                  child: Text(LocaleKeys.English.tr()),
                  onPressed: () async {
                    await context.setLocale(context.supportedLocales[0]);
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget)
                    );
                    setState(() {});
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  void linkToAppStore() {
    LaunchReview.launch();
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext builderContext) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          backgroundColor: appState.getColorTheme()['background'],
          appBar: AppBar(
            backgroundColor: appState.getColorTheme()['bar'],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: appState.getColorTheme()['accent'],
              ),
              onPressed: () {
                Navigator.pop(builderContext, true);
              },
            ),
            title: Text(
              LocaleKeys.Settings.tr(),
              style: TextStyle(color: appState.getColorTheme()['accent']),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      showThemeDialog(builderContext, appState.setColorTheme);
                    }
                    if (index == 1) {
                      showVibrationDialog(
                          builderContext, appState.setVibration);
                    }
                    if (index == 2) {
                      linkToAppStore();
                    }
                    if (index == 3) {
                      showLanguageDialog(builderContext);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: appState.getColorTheme()['accent']!))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          title[index],
                          style: TextStyle(
                              color: appState.getColorTheme()['accent']),
                        ),
                        Text(
                          content[index],
                          style: TextStyle(
                              color: appState.getColorTheme()['black']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
