import 'dart:math';

import 'package:flutter/material.dart';

import 'flyweight.dart';

class FlyweightExample extends StatefulWidget {
  const FlyweightExample({super.key});

  @override
  State createState() => _FlyweightExampleState();
}

class _FlyweightExampleState extends State<FlyweightExample> {
  static const int shapesCount = 1000;

  final shapeFactory = const ShapeFactory();

  late final ShapeFlyweightFactory _shapeFlyweightFactory;
  late List<IPositionedShape> _shapesList;

  int _shapeInstancesCount = 0;
  bool _useFlyweightFactory = false;

  @override
  void initState() {
    super.initState();

    _shapeFlyweightFactory = ShapeFlyweightFactory(
      shapeFactory: shapeFactory,
    );

    _buildShapesList();
  }

  void _buildShapesList() {
    var shapeInstancesCount = 0;
    _shapesList = <IPositionedShape>[];

    for (var i = 0; i < shapesCount; i++) {
      final shapeType = _getRandomShapeType();
      final shape = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShape(shapeType)
          : shapeFactory.createShape(shapeType);

      shapeInstancesCount++;
      _shapesList.add(shape);
    }

    setState(() {
      _shapeInstancesCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  ShapeType _getRandomShapeType() {
    const values = ShapeType.values;

    return values[Random().nextInt(values.length)];
  }

  void _toggleUseFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });

    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          for (var shape in _shapesList)
            shape.render(
              Random().nextDouble() * MediaQuery.of(context).size.width,
              Random().nextDouble() * MediaQuery.of(context).size.height,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SwitchListTile.adaptive(
                title: const Text(
                  'Use flyweight factory',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                activeColor: Colors.black,
                value: _useFlyweightFactory,
                onChanged: _toggleUseFlyweightFactory,
              ),
            ],
          ),
          Center(
            child: Text(
              'Shape instances count: $_shapeInstancesCount',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
