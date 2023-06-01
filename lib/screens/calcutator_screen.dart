import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test_app/providers/element_provider.dart';
import 'package:test_app/widgets/list_item.dart';
import '../main.dart';
import '../models/element.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CalculatorScreen extends StatelessWidget {
  final String _underscore = """
  ***
 """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
                height: 100,
                width: 150,
                child: Image.asset(
                  'assets/images/MF-LOGO.png',
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              width: 20,
            ),
            const Text('Калькулятор')
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Калькулятор стоимости продления',
                style: TextStyle(fontSize: 28), textAlign: TextAlign.center),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ' Выберите функции, которые вам необходимы',
            style:
                TextStyle(fontSize: 21, color: Color.fromARGB(255, 52, 51, 51)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          CheckBoxWidget(),
          SizedBox(height: 10, child: MarkdownBody(data: _underscore)),
          Consumer(
            builder: (context, ref, child) {
              final val = ref.watch(sumProvider);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Итого: ${val} руб.'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Оплатить'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                      )
                    ]),
              );
            },
          )
        ],
      ),
    );
  }
}

class CheckBoxWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

final ElementProvider elementProvider = ElementProvider();

class _CheckBoxWidgetState extends ConsumerState<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    List<ElementOfList> list = ref.watch(stateProvider).getlistElements;
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListItem(list[index]);
        },
      ),
    );
  }
}
