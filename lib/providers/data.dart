import 'package:flutter/material.dart';
import 'package:nihfirebase/models/contactresto.dart';

class DataProvider extends ChangeNotifier {
  final List<Data> _datas = [
    Data(id: 1, name: 'mcd', phone: '14045', image: 'assets/mcdternate.jpg'),
    Data(id: 2, name: 'kfc', phone: '14022', image: 'assets/kfc.jpg'),
  ];

  List<Data> get datas => _datas;

  void addContact(Data contact) {
    _datas.add(contact);
    notifyListeners();
  }
}
