import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final greetingProvider = Provider((ref) => 'Hello Riverpod!!!');

final counterStateProvider = StateProvider((ref) => 0);

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

class FakeHttpClient {
  Future<String> get(String url) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Response from $url';
  }
}

final fakeHttpClientProvider = Provider((ref) => FakeHttpClient());
final responseProvider =
    FutureProvider.family<String, String>((ref, url) async {
  final httpClient = ref.read(fakeHttpClientProvider);
  return httpClient.get(url);
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final responseAsyncValue =
                  ref.watch(responseProvider('https://resocoder.com'));
              return responseAsyncValue.map(
                data: (_) => Text(_.value),
                error: (_) => Text(_.error.toString()),
                loading: (_) => const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
