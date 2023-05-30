import 'package:bloc_flutter/pages/home/features_page/modul/models/car_model.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

const availableCategories = [
  Category(
      id: 'bp1',
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
      id: 'e3',
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
    categories: ['bp1'],
    description: [
      ' Chassis mobil berfungsi sebagai kerangka utama yang menopang dan mendukung semua, bagian mobil, memasang komponen kendaraan untuk memastikan keamanan dan kestabilan, serta mempengaruhi kinerja dan kestabilan mobil.',
    ],
    imageUrl:
        'https://1.bp.blogspot.com/-rJxpoxk20Jw/YVFLUI-W5NI/AAAAAAAAIFM/P2-awM-kPl81UFndgKAoi67_2FwUtdLLwCLcBGAsYHQ/s590/on_body_frame_chasis.JPG',
    title: 'Chassis',
    details: [
      ' Chassis mobil adalah kerangka atau rangkaian utama dari mobil yang berfungsi sebagai basis atau fondasi bagi semua komponen mobil yang lain. Beberapa fungsi penting dari chassis mobil adalah:',
      '1. Mendukung beban: Chassis mobil memberikan dukungan untuk semua komponen mobil, termasuk mesin, transmisi, roda, dan suspensi. Ini memungkinkan mobil untuk menahan beban dengan aman dan efisien, dan membantu mencegah kerusakan pada bagian-bagian mobil yang lebih kecil.',
      '2. Stabilitas: Chassis juga berfungsi untuk memberikan stabilitas pada mobil dan menjaga agar mobil tetap stabil saat bergerak. Chassis mobil dirancang untuk menahan gaya-gaya yang muncul selama mobil melaju dan membantu menjaga keseimbangan mobil, sehingga mobil dapat bergerak dengan aman dan lancar.',
      '3. Perlindungan: Chassis mobil juga berfungsi sebagai perlindungan bagi pengemudi dan penumpang saat mobil mengalami tabrakan. Dalam situasi ini, chassis dapat menyerap sebagian besar energi tabrakan dan membantu melindungi penumpang dari cedera.',
      '4. Modularitas: Chassis mobil sering dirancang untuk menjadi modular, artinya beberapa bagian dapat diganti dengan mudah. Hal ini memungkinkan perawatan dan perbaikan mobil menjadi lebih mudah dan efisien.',
      '5. Pemisahan getaran: Chassis mobil juga berfungsi untuk memisahkan getaran yang dihasilkan oleh mesin atau jalan raya dari mobil itu sendiri. Ini membantu mengurangi rasa tidak nyaman atau guncangan yang dirasakan oleh penumpang dan meningkatkan kenyamanan berkendara.'
    ],
  ),
  CarModel(
    id: 'm2',
    categories: ['bp1'],
    description: [
      ' Body mobil adalah bagian dari mobil yang mencakup panel luar, interior, dan bagian-bagian.',
      'lain yang memberikan keseluruhan bentuk dan tampilan mobil. Beberapa fungsi penting dari body mobil adalah:',
    ],
    imageUrl:
        'https://asset.kompas.com/crops/hNOho08QgN7K7IHF7YTwBu_vQQc=/0x0:780x390/780x390/data/photo/2016/10/12/2348486monokok780x390.jpg',
    title: 'Body',
    details: [
      ' Chassis mobil adalah kerangka atau rangkaian utama dari mobil yang berfungsi sebagai basis atau fondasi bagi semua komponen mobil yang lain. Beberapa fungsi penting dari chassis mobil adalah:',
      '1. Pelindung: Body mobil melindungi penumpang dan barang-barang dalam mobil dari elemen lingkungan yang berbahaya seperti hujan, angin, dan debu.',
      '2. Estetika: Body mobil memberikan tampilan dan desain yang menarik dan dapat mempengaruhi penilaian orang terhadap mobil. Tampilan mobil yang menarik dapat meningkatkan kepercayaan diri pengemudi dan meningkatkan citra merek mobil.',
      '3. Identitas merek: Body mobil juga membantu mengidentifikasi mobil dengan merek tertentu. Desain body mobil dapat memperlihatkan karakteristik khas merek tersebut.',
      '4. Fungsionalitas: Body mobil harus dirancang dengan fungsionalitas yang tepat untuk memenuhi kebutuhan pengemudi dan penumpang, termasuk ruang yang cukup untuk kaki dan kepala, akses ke tempat duduk yang mudah, dan tempat penyimpanan yang memadai.',
      '5. Pengurangan kebisingan: Body mobil dapat membantu mengurangi kebisingan dan getaran yang dihasilkan oleh mesin dan jalan raya, sehingga penumpang merasa lebih nyaman dan santai.'
          '6. Keamanan: Body mobil dapat dirancang dengan fitur keamanan yang dapat membantu melindungi penumpang dalam kecelakaan, seperti sistem pengurangan benturan dan airbag.'
    ],
  ),
  CarModel(
    id: 'm3',
    categories: ['bp1'],
    description: [
      '''
      Pintu mobil adalah komponen penting yang memungkinkan pengemudi dan penumpang,
      masuk dan keluar dari mobil. Beberapa fungsi penting dari pintu mobil adalah:,
    '''
    ],
    imageUrl: 'https://s1.bukalapak.com/img/18755497003/s-250-250/data.png',
    title: 'Pintu/Door',
    details: [
      '''
  Pintu mobil adalah komponen penting yang memungkinkan pengemudi dan penumpang masuk dan keluar dari mobil. Beberapa fungsi penting dari pintu mobil adalah:
1. Akses: Fungsi utama dari pintu mobil adalah untuk memberikan akses pengemudi dan penumpang ke dalam dan keluar dari mobil dengan mudah dan aman.
2. Keselamatan: Pintu mobil dilengkapi dengan berbagai fitur keamanan, seperti kunci pintu dan sistem alarm, untuk melindungi mobil dari pencurian. Pintu mobil juga membantu melindungi pengemudi dan penumpang dari bahaya luar seperti kecelakaan, cuaca buruk, dan pencurian.
3. Ventilasi: Pintu mobil juga dapat membantu menyediakan ventilasi dan sirkulasi udara di dalam mobil, sehingga pengemudi dan penumpang dapat merasa lebih nyaman.
4. Suara: Pintu mobil dapat membantu meredam suara dari luar mobil dan mempertahankan ketenangan di dalam mobil. Fitur ini juga sangat membantu ketika kita ingin memutar musik dengan volume yang cukup keras.
5. Tampilan: Pintu mobil juga memainkan peran dalam penampilan keseluruhan mobil. Desain pintu mobil yang baik dapat memberikan tampilan yang menarik pada mobil, meningkatkan citra merek dan nilai jualnya.
6. Fungsionalitas: Pintu mobil harus dirancang dengan fungsionalitas yang tepat untuk memenuhi kebutuhan pengemudi dan penumpang. Misalnya, pintu mobil harus cukup lebar untuk memungkinkan penumpang masuk dan keluar dengan mudah, dan memiliki ruang yang cukup untuk kaki dan kepala.
     '''
    ],
  ),
  CarModel(
    id: 'm3',
    categories: ['bp1'],
    description: [
      '''
      Kaca mobil memiliki beberapa fungsi penting, antara lain:
    '''
    ],
    imageUrl:
        'https://awsimages.detik.net.id/community/media/visual/2021/03/27/jendela-mobil_169.jpeg?w=700&q=90',
    title: 'Window/Kaca Mobil',
    details: [
      '''
  Kaca mobil memiliki beberapa fungsi penting, antara lain:
1. Melindungi dari elemen luar: Kaca mobil melindungi penumpang dari angin, hujan, debu, dan benda lain yang mungkin terlempar ke dalam mobil. Kaca mobil juga membantu menjaga kebersihan dan kenyamanan di dalam mobil.
2. Visibilitas: Kaca mobil memberikan visibilitas yang jelas ke luar mobil, sehingga pengemudi dan penumpang dapat melihat jalan dan lingkungan sekitar mereka. Hal ini sangat penting untuk keselamatan dalam berkendara.
3. Pencahayaan: Kaca mobil juga memungkinkan cahaya matahari masuk ke dalam mobil, sehingga membuat interior terlihat lebih terang dan nyaman. Kaca mobil juga dapat membantu mengurangi kebutuhan untuk menghidupkan lampu di siang hari, yang dapat membantu menghemat energi.
4. Perlindungan dari sinar UV: Kaca mobil dapat melindungi pengemudi dan penumpang dari sinar UV berbahaya yang dapat merusak kulit dan menyebabkan kanker kulit. Beberapa jenis kaca mobil juga dilengkapi dengan filter UV untuk melindungi pengemudi dan penumpang.
5. Pengurangan kebisingan: Kaca mobil dapat membantu meredam suara dari luar mobil dan membantu menciptakan lingkungan yang lebih tenang dan nyaman di dalam mobil.
6. Tampilan: Kaca mobil juga memainkan peran penting dalam tampilan mobil. Kaca mobil yang berkualitas tinggi dan dirancang dengan baik dapat meningkatkan tampilan keseluruhan mobil dan nilai jualnya.    '''
    ],
  ),
  CarModel(
    id: 'm4',
    categories: ['e3'],
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
