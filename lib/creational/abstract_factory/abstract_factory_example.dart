import 'package:flutter/material.dart';

import 'abstract_factory.dart';

class AbstractFactoryExample extends StatefulWidget {
  const AbstractFactoryExample({super.key});

  @override
  State createState() => _AbstractFactoryExampleState();
}

class _AbstractFactoryExampleState extends State<AbstractFactoryExample> {
  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];

  int _selectedFactoryIndex = 0;

  late IActivityIndicator _activityIndicator;

  late ISlider _slider;
  double _sliderValue = 50.0;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  late ISwitch _switch;
  bool _switchValue = false;
  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int? index) {
    setState(() {
      _selectedFactoryIndex = index!;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: <Widget>[
              for (final widgetFactory in widgetsFactoryList)
                RadioListTile(
                  title: Text(widgetFactory.getTitle()),
                  value: widgetsFactoryList.indexOf(widgetFactory),
                  groupValue: _selectedFactoryIndex,
                  onChanged: _setSelectedFactoryIndex,
                ),
              const SizedBox(height: 32.0),
              Text(
                'Widgets showcase',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 48.0),
              Text(
                'Process indicator',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 32.0),
              _activityIndicator.render(),
              const SizedBox(height: 48.0),
              Text(
                'Slider ($_sliderValueString%)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 32.0),
              _slider.render(_sliderValue, _setSliderValue),
              const SizedBox(height: 48.0),
              Text(
                'Switch ($_switchValueString)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 32.0),
              _switch.render(
                value: _switchValue,
                onChanged: _setSwitchValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
