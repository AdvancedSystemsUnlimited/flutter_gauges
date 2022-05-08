import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

class CenteredTextPage extends StatefulWidget {
  const CenteredTextPage({Key? key}) : super(key: key);

  @override
  _CenteredTextPageState createState() => _CenteredTextPageState();
}

class _CenteredTextPageState extends State<CenteredTextPage> {
  double _pointerValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = min(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height) -
        100;
    return Scaffold(
      appBar: AppBar(
        title: Text('Centered Text'),
        actions: [
          IconButton(
            icon: Icon(Icons.code_outlined),
            onPressed: () async {
              await launch(
                  'https://github.com/JulianAssmann/flutter_gauges/tree/master/example/lib/pages/ticks_in_between_page.dart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dial(
                      value: 80,
                      valueColor: Colors.amber,
                      valueText: 'Spiritual',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dial(
                      value: 50,
                      valueColor: Colors.green[700]!,
                      valueText: 'Financial',
                    ),
                    Dial(
                      value: 64,
                      valueColor: Colors.blue[700]!,
                      valueText: 'Physical',
                    ),
                    Dial(
                      value: 91,
                      valueColor: Colors.red[700]!,
                      valueText: 'Emotional',
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dial(
                      value: 72,
                      valueColor: Colors.amber[700]!,
                      valueText: 'Relational',
                    ),
                    Dial(
                      value: 77,
                      valueColor: Colors.greenAccent,
                      valueText: 'Intellectual',
                    ),
                    Dial(
                      value: 33,
                      valueColor: Colors.deepPurple,
                      valueText: 'Social',
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dial(
                      value: 44,
                      valueColor: Colors.pink,
                      valueText: 'Job/Career',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Dial extends StatelessWidget {
  const Dial(
      {Key? key,
      double value = 0.0,
      Color valueColor = Colors.blue,
      String? valueText})
      : _value = value,
        _valueColor = valueColor,
        _valueText = valueText,
        super(key: key);

  final double _value;
  final Color _valueColor;
  final String? _valueText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RadialGauge(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: _valueColor, fontSize: 40.0),
              ),
              if (_valueText != null)
                Text(_valueText!,
                    style: TextStyle(color: _valueColor, fontSize: 20.0)),
            ],
          )),
          axes: [
            RadialGaugeAxis(
              rotation: 180, // starts at the bottom
              minValue: 0,
              maxValue: ((_value + 1) / 100) * 360,
              minAngle: 0,
              maxAngle: ((_value + 1) / 100) * 360,
              radius: 0.6,
              color: Colors.transparent,
              ticks: [
                RadialTicks(
                  interval: 5,
                  alignment: RadialTickAxisAlignment.inside,
                  color: _valueColor,
                  length: 0.1,
                ),
              ],
            ),
            RadialGaugeAxis(
              rotation: 180,
              minValue: (((_value + 1) / 100) * 360) + 2,
              maxValue: 358,
              minAngle: (((_value + 1) / 100) * 360) + 2,
              maxAngle: 358,
              radius: 0.6,
              color: Colors.transparent,
              ticks: [
                RadialTicks(
                  interval: 5,
                  alignment: RadialTickAxisAlignment.inside,
                  color: Colors.grey,
                  length: 0.1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
