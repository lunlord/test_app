import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import '../main.dart';
import '../models/element.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CalculatorScreen extends StatelessWidget {
  final String _underscore = """
  ***
 """;

  // Text _textTitleBuilding(String data, double fontSize) {
  //   return Text(
  //     data,
  //     style: TextStyle(fontSize: fontSize),
  //     textAlign: TextAlign.center,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          // _textTitleBuilding(' Калькулятор стоимости продления', 26),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Калькулятор стоимости продления',
                style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
          ),
          const SizedBox(
            height: 10,
          ),
          // _textTitleBuilding(' Выберите функции, которые вам необходимы', 21, ),
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
          SizedBox(height: 15, child: Markdown(data: _underscore)),
          Consumer(
            builder: (context, ref, child) {
              final val = ref.watch(sumProvider);
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Итого ${val} руб.'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Оплатить'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor)),
                    )
                  ]);
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

class _CheckBoxWidgetState extends ConsumerState<CheckBoxWidget> {
  final String _markdown = """
###### Общий функционал
 - Личный кабинет, Сообщества, Трекер 
 активности, Социальная сеть, Геймификация
###### Дизайн
- 7 цветов
###### Интеграции
 - 1С, Крафт, Клабис, Юниверс, A&A, МФ 
 Расписание, Запись на уроки, Запись к тренеру, 
 Личный кабинет
 - Настройка платежной системы (3 варианта)
###### Рассылки
###### Поддержка
- Чат со службой заботы
""";

  Widget bulidCheckbox(ElementOfList el) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: el.checkBox,
              onChanged: ((value) {
                if (el.checkBox == true && el.title != 'Базовый тариф') {
                  setState(() {
                    el.checkBox = value!;
                    final val = ref.watch(sumProvider.notifier).update((state) {
                      return state - el.cost;
                    });
                  });
                } else if (el.checkBox == false &&
                    el.title != 'Базовый тариф') {
                  setState(() {
                    el.checkBox = value!;
                    final val = ref.watch(sumProvider.notifier).update((state) {
                      return state + el.cost;
                    });
                  });
                }
              }),
            ),
            Expanded(
                child: Text(
              '${el.title} ${el.cost} руб',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
          ],
        ),
        el.title == 'Базовый тариф'
            ? SizedBox(height: 300, child: Markdown(data: _markdown))
            : SizedBox(
                height: 5,
              )
      ],
    );
  }

  final List<ElementOfList> _listElements = [
    ElementOfList(checkBox: true, title: 'Базовый тариф', cost: 5000),
    ElementOfList(
        checkBox: false,
        title: 'Индивидуальный дизайн + ваш логотип',
        cost: 3000),
    ElementOfList(
        checkBox: false, title: 'Виджет расписания на ваш сайт', cost: 1000),
    ElementOfList(checkBox: false, title: 'Аналитика', cost: 1000),
    ElementOfList(
        checkBox: false,
        title: 'Возможность загружать онлайн-тренировки',
        cost: 1000),
  ];

  List<ElementOfList> get getListElements {
    return _listElements;
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _listElements.length,
        itemBuilder: (context, index) {
          return bulidCheckbox(_listElements[index]);
        },
      ),
    );
  }
}
