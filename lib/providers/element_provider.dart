import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/element.dart';

const String _markdown = """
###### **Общий функционал**
 - Личный кабинет, Сообщества, Трекер 
 активности, Социальная сеть, Геймификация
###### **Дизайн**
- 7 цветов
###### **Интеграции**
 - 1С, Крафт, Клабис, Юниверс, A&A, МФ 
 Расписание, Запись на уроки, Запись к тренеру, 
 Личный кабинет
 - Настройка платежной системы (3 варианта)
###### **Рассылки**
###### **Поддержка**
- Чат со службой заботы
""";

class ElementProvider extends ChangeNotifier {
  final List<ElementOfList> _listElements = [
    ElementOfList(
        id: 0,
        checkBox: true,
        title: 'Базовый тариф',
        cost: 5000,
        description: _markdown),
    ElementOfList(
        id: 1,
        checkBox: false,
        title: 'Индивидуальный дизайн + ваш логотип',
        cost: 3000),
    ElementOfList(
      id: 2,
      checkBox: false,
      title: 'Виджет расписания на ваш сайт',
      cost: 1000,
    ),
    ElementOfList(
      id: 3,
      checkBox: false,
      title: 'Аналитика',
      cost: 1000,
    ),
    ElementOfList(
        id: 4,
        checkBox: false,
        title: 'Возможность загружать онлайн-тренировки',
        cost: 1000),
  ];

  List<ElementOfList> get getlistElements {
    return _listElements;
  }

  void changeStateSwitch(int id, bool val) {
    var elOfList = _listElements[id];
    if (id != 0) {
      elOfList.checkBox = val;
      notifyListeners();
    }
  }
}
