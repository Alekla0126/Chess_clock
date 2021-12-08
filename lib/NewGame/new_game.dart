import 'package:chess_clock/translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:chess_clock/GlobalFiles/appState.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


//Widget for adding a custom game
class NewGame extends StatefulWidget {
  @override
  _NewGameState createState() {
    return _NewGameState();
  }
}

class _NewGameState extends State<NewGame> {
  Duration? _timeWhite;
  Duration? _incrementWhite;
  Duration? _timeBlack;
  Duration? _incrementBlack;
  final titleController = TextEditingController();

  void submitData(Function addGame) {
    final enteredTitle = titleController.text;
    if (enteredTitle == '' ||
        _timeWhite == null ||
        _timeBlack == null ||
        _incrementWhite == null ||
        _incrementBlack == null) return;
    addGame(
        enteredTitle, _timeWhite, _timeBlack, _incrementWhite, _incrementBlack);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    _incrementWhite = Duration(milliseconds: 0);
    _incrementBlack = Duration(milliseconds: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return SingleChildScrollView(
            child: Card(
                elevation: 5,
                child: Container(
                  color: appState.getColorTheme()['background'],
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          TextField(
                            maxLength: 15,
                            controller: titleController,
                            decoration: InputDecoration(
                                labelText: LocaleKeys.Title.tr(),
                                labelStyle: TextStyle(
                                  color: appState.getColorTheme()['black'],
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red))),
                            onSubmitted: (_) => null,
                          ),
                          //White
                          Card(
                            color: appState.getColorTheme()['white'],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: appState.getColorTheme()['buttons'],
                                  ),
                                  child: _timeWhite == null
                                      ? Text(LocaleKeys.Select_time.tr())
                                      : Row(
                                          children: <Widget>[
                                            Icon(Icons.timer),
                                            Text(
                                                '${_timeWhite!.inMinutes.toString().padLeft(2, '0')}:${(_timeWhite!.inSeconds % 60).toString().padLeft(2, '0')}'),
                                          ],
                                        ),
                                  onPressed: () {
                                    Picker(
                                      adapter: NumberPickerAdapter(
                                          data: <NumberPickerColumn>[
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 240,
                                                suffix: Text(' min')),
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 45,
                                                suffix: Text(' sec'),
                                                jump: 15),
                                          ]),
                                      delimiter: <PickerDelimiter>[
                                        PickerDelimiter(
                                          child: Container(
                                            width: 30.0,
                                            alignment: Alignment.center,
                                            child: Icon(Icons.more_vert),
                                          ),
                                        )
                                      ],
                                      hideHeader: true,
                                      confirmText: 'OK',
                                      cancelText: LocaleKeys.Cancel.tr(),
                                      cancelTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['buttons']),
                                      confirmTextStyle: TextStyle(
                                          inherit: false,
                                          color:
                                              appState.getColorTheme()['black'],
                                          fontSize: 22),
                                      title: Text(
                                        LocaleKeys.Select_time.tr(),
                                        style: TextStyle(
                                            color: appState
                                                .getColorTheme()['buttons']),
                                      ),
                                      selectedTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['buttons']),
                                      onConfirm:
                                          (Picker picker, List<int> value) {
                                        setState(() {
                                          _timeWhite = Duration(
                                              minutes:
                                                  picker.getSelectedValues()[0],
                                              seconds: picker
                                                  .getSelectedValues()[1]);
                                        });
                                      },
                                    ).showDialog(context);
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: appState.getColorTheme()['background'],
                                  ),
                                  child: _incrementWhite == null
                                      ? Text('Select Increment')
                                      : Row(
                                          children: <Widget>[
                                            Icon(Icons.arrow_upward),
                                            Text(
                                                '${_incrementWhite!.inSeconds.toString()}'),
                                          ],
                                        ),
                                  onPressed: () {
                                    Picker(
                                      adapter: NumberPickerAdapter(
                                          data: <NumberPickerColumn>[
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 60,
                                                suffix: Text(' sec')),
                                          ]),
                                      hideHeader: true,
                                      confirmText: 'OK',
                                      cancelText: LocaleKeys.Cancel.tr(),
                                      cancelTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      confirmTextStyle: TextStyle(
                                          inherit: false,
                                          color:
                                              appState.getColorTheme()['black'],
                                          fontSize: 22),
                                      title: Text(
                                        'Select Increment',
                                        style: TextStyle(
                                            color: appState
                                                .getColorTheme()['black']),
                                      ),
                                      selectedTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      onConfirm:
                                          (Picker picker, List<int> value) {
                                        setState(() {
                                          _incrementWhite = Duration(
                                              seconds: picker
                                                  .getSelectedValues()[0]);
                                        });
                                      },
                                    ).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          //Black
                          Card(
                            color: appState.getColorTheme()['black'],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: appState.getColorTheme()['buttons'],
                                  ),
                                  child: _timeBlack == null
                                      ? Text(LocaleKeys.Select_time.tr())
                                      : Row(
                                          children: <Widget>[
                                            Icon(Icons.timer),
                                            Text(
                                                '${_timeBlack!.inMinutes.toString().padLeft(2, '0')}:${(_timeBlack!.inSeconds % 60).toString().padLeft(2, '0')}'),
                                          ],
                                        ),
                                  onPressed: () {
                                    Picker(
                                      adapter: NumberPickerAdapter(
                                          data: <NumberPickerColumn>[
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 240,
                                                suffix: Text(' min')),
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 45,
                                                suffix: Text(' sec'),
                                                jump: 15),
                                          ]),
                                      delimiter: <PickerDelimiter>[
                                        PickerDelimiter(
                                          child: Container(
                                            width: 30.0,
                                            alignment: Alignment.center,
                                            child: Icon(Icons.more_vert),
                                          ),
                                        )
                                      ],
                                      hideHeader: true,
                                      confirmText: 'OK',
                                      cancelText: LocaleKeys.Cancel.tr(),
                                      cancelTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      confirmTextStyle: TextStyle(
                                          inherit: false,
                                          color:
                                              appState.getColorTheme()['black'],
                                          fontSize: 22),
                                      title: Text(
                                        'Select Time',
                                        style: TextStyle(
                                            color: appState
                                                .getColorTheme()['black']),
                                      ),
                                      selectedTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      onConfirm:
                                          (Picker picker, List<int> value) {
                                        setState(() {
                                          _timeBlack = Duration(
                                              minutes:
                                                  picker.getSelectedValues()[0],
                                              seconds: picker
                                                  .getSelectedValues()[1]);
                                        });
                                      },
                                    ).showDialog(context);
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: appState.getColorTheme()['background'],
                                  ),
                                  child: _incrementBlack == null
                                      ? Text('Select Increment')
                                      : Row(
                                          children: <Widget>[
                                            Icon(Icons.arrow_upward),
                                            Text(
                                                '${_incrementBlack!.inSeconds.toString()}'),
                                          ],
                                        ),
                                  onPressed: () {
                                    Picker(
                                      adapter: NumberPickerAdapter(
                                          data: <NumberPickerColumn>[
                                            const NumberPickerColumn(
                                                begin: 0,
                                                end: 59,
                                                suffix: Text(' sec')),
                                          ]),
                                      hideHeader: true,
                                      confirmText: 'OK',
                                      cancelText: LocaleKeys.Cancel.tr(),
                                      cancelTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      confirmTextStyle: TextStyle(
                                          inherit: false,
                                          color:
                                              appState.getColorTheme()['black'],
                                          fontSize: 22),
                                      title: Text(
                                        'Select Time',
                                        style: TextStyle(
                                            color: appState
                                                .getColorTheme()['black']),
                                      ),
                                      selectedTextStyle: TextStyle(
                                          color: appState
                                              .getColorTheme()['black']),
                                      onConfirm:
                                          (Picker picker, List<int> value) {
                                        setState(() {
                                          _incrementBlack = Duration(
                                              seconds: picker
                                                  .getSelectedValues()[0]);
                                        });
                                      },
                                    ).showDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: appState.getColorTheme()['button'],
                            ),
                            child: Text(LocaleKeys.Confirm.tr()),
                            onPressed: () => submitData(appState.addGame),
                          )
                        ],
                      );
                    },
                  ),
                )));
      },
    );
  }
}
