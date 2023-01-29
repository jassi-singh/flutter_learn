import 'package:flutter/material.dart';

enum AlignType {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  custom
}

class LearnAlign extends StatefulWidget {
  const LearnAlign({Key? key}) : super(key: key);

  @override
  State<LearnAlign> createState() => _LearnAlignState();
}

class _LearnAlignState extends State<LearnAlign> {
  AlignType? _selectedAlignType = AlignType.center;
  double _xValue = 0, _yValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Align(
                alignment: _getAlignment(),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DropdownButton<AlignType?>(
            value: _selectedAlignType,
            items: _dropDownItems(),
            onChanged: (value) => {
              setState(() {
                _selectedAlignType = value;
                if (value == AlignType.custom) {
                  _xValue = 0;
                  _yValue = 0;
                }
              })
            },
          ),
          if (_selectedAlignType == AlignType.custom) ...[
            Slider(
              min: -2,
              max: 2,
              value: _xValue,
              onChanged: (value) => {
                setState(() {
                  _xValue = value;
                })
              },
            ),
            Slider(
              min: -2,
              max: 2,
              value: _yValue,
              onChanged: (value) => {
                setState(() {
                  _yValue = value;
                })
              },
            ),
            Text(
              "x: ${_xValue.toStringAsFixed(2)} y: ${_yValue.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ]
        ],
      ),
    );
  }

  _dropDownItems() {
    return AlignType.values.map((e) {
      return DropdownMenuItem<AlignType>(
        value: e,
        child: Text(
          e.toString().split('.').last,
        ),
      );
    }).toList();
  }

  _getAlignment() {
    switch (_selectedAlignType) {
      case AlignType.topLeft:
        return Alignment.topLeft;
      case AlignType.topCenter:
        return Alignment.topCenter;
      case AlignType.topRight:
        return Alignment.topRight;
      case AlignType.centerLeft:
        return Alignment.centerLeft;
      case AlignType.center:
        return Alignment.center;
      case AlignType.centerRight:
        return Alignment.centerRight;
      case AlignType.bottomLeft:
        return Alignment.bottomLeft;
      case AlignType.bottomCenter:
        return Alignment.bottomCenter;
      case AlignType.bottomRight:
        return Alignment.bottomRight;
      case AlignType.custom:
        return Alignment(_xValue, _yValue);
      default:
        return Alignment.center;
    }
  }
}
