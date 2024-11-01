import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final int price = 2000;

  //데이터를 지속적으로 전달 받는 스트림

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder'),
      ),
      body: StreamBuilder<int>(
        //지속적으로 들어오는 데이터를 구독하는 기능을 가짐
        initialData: price,
        stream: addStreamValue(), //1. 이 메소드로부터 새로운 데이터를 받을 때마다
        builder: (context, snapshot) {
          //2. 이 데이터를 스냅샷에 저장하고 3.빌더 메서드를 통해서 매번 새로운 데이터로 화면에 출력 할 수 있게 된다.
          final priceNumber = snapshot.data.toString(); //스냡샷이 인트형이므로
          return Center(
            child: Text(
              priceNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          );
        }, //스냅샷은 스트림의 결과물. 스트림빌더에게 데이터를 사용하라고 지정을 해줘야한다.
      ),
    );
  }

  Stream<int> addStreamValue() {
    return Stream<int>.periodic(
        const Duration(seconds: 1), (count) => price + count);
  }
}
