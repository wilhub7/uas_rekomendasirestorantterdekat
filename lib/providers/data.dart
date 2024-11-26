import 'package:flutter/material.dart';
import 'package:nihfirebase/models/contactresto.dart';

class DataProvider extends ChangeNotifier {
  final List<Data> _datas = [
    Data(
        id: 1,
        name: 'bebek carok',
        phone: '0858-5019-5027',
        image: 'assets/becrk.jpg',
        rating: 5.0),
    Data(
        id: 2,
        name: 'gyu kaku pangeran kornel',
        phone: '022-4237999',
        image: 'assets/gyu.jpg',
        rating: 5.0),
    Data(
        id: 3,
        name: 'kisah manis',
        phone: '0821-2732-2571',
        image: 'assets/kmns.jpg',
        rating: 4.5),
    Data(
        id: 4,
        name: 'beckys',
        phone: '0811-2255-565',
        image: 'assets/beckys.jpg',
        rating: 4.5),
    Data(
        id: 5,
        name: 'bosscha space',
        phone: '0812-4949-4760',
        image: 'assets/bosscha.jpg',
        rating: 4.0),
    Data(
        id: 6,
        name: 'rogers cafe and lounge',
        phone: '022-2509009',
        image: 'assets/rcandl.jpg',
        rating: 4),
    Data(
        id: 7,
        name: 'mie gacoan',
        phone: ' 0896-3934-5020',
        image: 'assets/mieg.jpg',
        rating: 3.5),
    Data(
        id: 8,
        name: 'madame sari restaurant',
        phone: '0811-2222-3693',
        image: 'assets/masar.jpg',
        rating: 3.0),
    Data(
        id: 9,
        name: 'ayam bakar pedas h deno',
        phone: '0852-2256-7894',
        image: 'assets/aybkrphd.jpg',
        rating: 2.5),
    Data(
        id: 10,
        name: 'grassroot',
        phone: '0823-3330-0834',
        image: 'assets/grassroot.jpg',
        rating: 2.0),
  ];

  List<Data> get datas => _datas;

  void addContact(Data contact) {
    _datas.add(contact);
    notifyListeners();
  }
}
