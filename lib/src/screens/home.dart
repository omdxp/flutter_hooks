import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/hooks/timer_hook.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  int _number = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _number = _timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HOokS!'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          '$_number',
          style: TextStyle(fontSize: 35),
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class HomePageHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _numberNotifier = useState(0);

    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _numberNotifier.value = timer.tick;
      });
      return timer.cancel;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HOokS!'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          _numberNotifier.value.toString(),
          style: TextStyle(fontSize: 35),
        ),
      )),
    );
  }
}

class HomePageCustomHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final number = useInfiniteTimer(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HOokS!'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 35),
        ),
      )),
    );
  }
}
