import 'package:bloc_flutter/pages/features_page/modul/model/car_model.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';

const availableCategories = [
  Category(
      id: 'c1',
      title: 'BodyParts',
      color: Colors.purple,
      imageURL:
          'https://www.carwrecker.nz/wp-content/uploads/2018/06/used-panel-parts.jpg'),
  Category(
      id: 'c2',
      title: 'EngineParts',
      color: Colors.blue,
      imageURL:
          'https://i0.wp.com/www.engineeringchoice.com/wp-content/uploads/2020/12/Car-engine-parts.jpg?fit=1280%2C720&ssl=1'),
  Category(
      id: 'c3',
      title: 'Electrical',
      color: Colors.orange,
      imageURL:
          'https://www.ebaymotorsblog.com/motors/blog/wp-content/uploads/2012/12/Electrical_600x400-740x480.jpg'),
  Category(
      id: 'c4',
      title: 'Interior',
      color: Colors.red,
      imageURL:
          'https://media.istockphoto.com/id/942333682/id/foto/interior-mobil-kustom-dengan-sistem-audio-dan-layar-lcd.jpg?s=612x612&w=0&k=20&c=rQvSLKOk2RovsBbCliiB7Rv9h1IiZIlDy8XcUTdxeB4='),
];

const dummyCar = [
  CarModel(
    id: 'm1',
    categories: ['c3'],
    description: [
      'Dinamo starter mobil adalah sebuah komponen listrik yang berfungsi',
      'ntuk memutar mesin mobil pada saat dihidupkan.',
      'Dinamo starter ini terdiri dari sebuah motor listrik yang mampu',
    ],
    imageUrl:
        'https://blog.moservice.id/wp-content/uploads/2022/11/ilustrasi-gambar-dinamo-starter-mobil.jpg',
    title: 'Dinamo Starter',
    details: [
      'Dinamo starter mobil adalah sebuah komponen listrik yang berfungsi untuk memutar mesin mobil',
      'pada saat dihidupkan. Dinamo starter ini terdiri dari sebuah motor listrik yang',
      'mampu menghasilkan putaran tinggi dan sebuah gear atau roda gigi yang berfungsi untuk',
      'menghubungkan dinamo starter dengan mesin mobil. Ketika kunci kontak diputar, arus listrik akan',
      'mengalir ke dinamo starter sehingga motor listrik akan berputar dan gear akan menggerakkan mesin mobil untuk dihidupkan. Dinamo starter mobil biasanya terletak di dekat mesin mobil dan dihubungkan dengan sistem baterai mobil.'
    ],
  ),
  CarModel(
    id: 'm2',
    categories: ['c1', 'c2'],
    description: [
      'Dinamo starter mobil adalah sebuah komponen listrik yang berfungsi',
      'ntuk memutar mesin mobil pada saat dihidupkan.',
      'Dinamo starter ini terdiri dari sebuah motor listrik yang mampu',
    ],
    imageUrl:
        'https://blog.moservice.id/wp-content/uploads/2022/11/ilustrasi-gambar-dinamo-starter-mobil.jpg',
    title: 'Dinamo Starter',
    details: [
      'Dinamo starter mobil adalah sebuah komponen listrik yang berfungsi untuk memutar mesin mobil',
      'pada saat dihidupkan. Dinamo starter ini terdiri dari sebuah motor listrik yang',
      'mampu menghasilkan putaran tinggi dan sebuah gear atau roda gigi yang berfungsi untuk',
      'menghubungkan dinamo starter dengan mesin mobil. Ketika kunci kontak diputar, arus listrik akan',
      'mengalir ke dinamo starter sehingga motor listrik akan berputar dan gear akan menggerakkan mesin mobil untuk dihidupkan. Dinamo starter mobil biasanya terletak di dekat mesin mobil dan dihubungkan dengan sistem baterai mobil.'
    ],
  )
];
