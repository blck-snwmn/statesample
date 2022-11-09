import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final txtProvider = StateProvider((ref) {
  return "no text1";
});

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(txtProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          Text(value),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditPage()));
            },
            child: const Icon(Icons.arrow_circle_right),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}

class EditPage extends ConsumerWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(txtProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          TextField(
            controller: TextEditingController(text: controller.state),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (txt) {
              controller.state = txt;
            },
          ),
          const Spacer(),
          const Spacer(),
        ]),
      ),
    );
  }
}
