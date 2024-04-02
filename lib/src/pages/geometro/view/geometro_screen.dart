import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dadosRecebidos = '';
  late SharedPreferences preferences;
  bool _isStart = true;
  String _stopwatchText = '00:00:00';
  String x = "";

  final _stopWatch = Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void receberDadosDoModal(String dados) {
    setState(() {
      dadosRecebidos = _stopwatchText;
    });
  }

  void _startTimeout() {
    Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    if (mounted) {
      setState(() {
        _setStopwatchText();

        //print("Parar");
      });
    }
  }

  String getMinhaVariavel() {
    return _stopwatchText;
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
        print("Parar");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Desejas finalizar a Supervisão?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _resetButtonPressed();
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text("Sim")),
                  TextButton(
                      onPressed: () {
                        _isStart = false;
                        // Navigator.of(context).pop();
                        _isStart = false;
                        _stopWatch.start();
                        _startTimeout();
                      },
                      child: const Text("Não"))
                ],
              );
            });
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText() {
    _stopwatchText =
        '${_stopWatch.elapsed.inHours.toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: Text(
              _stopwatchText,
              style: const TextStyle(fontSize: 72),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  _startStopButtonPressed();
                  //preferences.setString("x","_stopwatchText");
                },
                child: Icon(_isStart ? Icons.play_arrow : Icons.stop),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
