
# Super shy transaction filter
A Flutter financial transaction history flitering package that makes flitering easier. 
We provided a stunning data visualization, easy-to-use filter container, and understandable transaction model,. 

ໂປຣເຈັກນີ້ແມ່ນສ້າງຂື້ນມາເພື່ອນຳໃຊ້ເຂົ້າໃນການແຂ່ງຂັນງານ Comet Hackathon 2023 ພາຍໃຕ້ຫົວຂໍ້ທີ່ວ່າ: " ການນຳເອົາ Software ທີ່ມີຢູ່ໃນລາວ ແລະ ນຳມາປັບປຸງໃຫ້ມີປະສິດທິພາບຫຼາຍຂື້ນ ໂດຍນຳໃຊ້ flutter ເພື່ອພັດທະນາໃຫ້ຢູ່ໃນລັກສະນະ module ຫຼື package "


# Features
* Basic Data Visualization 
* Payment and income category
* Filter Payment history transactions 
*  Customizable Payment Filters 
* Summary incomes and payments of all transactions by payment categories


## Dependencies

* flutter_form_builder: ^9.1.1

 *  flutter_svg: ^2.0.9

*   hooks_riverpod: ^2.4.6

* intl: ^0.18.1

## Installation
To add the geolocator to your Flutter application

* install the packages 
Run this command:

With Flutter:

```bash
 $ flutter pub add super_shy_transaction_filter

```

This will add a line like this to your package's pubspec.yaml

 (and run an implicit flutter pub get) :

```bash
 $ dependencies:
  super_shy_transaction_filter: ^1.0.0

```

Import it

Now in your Dart code, 
you can use:
```bash
 import 'package:super_shy_transaction_filter/super_shy_transaction.dart_filter';

```


 
## Usage/Examples


* Examples



The code below shows an example how to input list of parameters to our model

```dart

import 'package:super_shy_transaction_filter/super_shy_transaction_filter.dart';

//import the necessary package as we requried

SuperShyTransaction(
    superShyTransactionList: [
    // this property required list of SuperShyTransactionModel
    SuperShyTransactionModel(
        title: "ໄດ້ຮັບເງິນ", // custom title
        value: 20000, // custom value (amount of money, etc.)
        isIncome: true, // if this true meaning Income
        date: DateTime.now()
            .subtract(const Duration(days: 20)), // custom date
        suffixTitle: "LAK", // custom currency
        category: "ອາຫານ", // custom category
    ),
    SuperShyTransactionModel(
        title: "ຊຳລະເງິນ",
        value: 200000,
        isIncome: false, // if this true meaning Payment
        date: DateTime.now().subtract(const Duration(days: 10)),
        suffixTitle: "LAK",
        category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
     ),
    ],
   )




```






    


## Full Examples

``` dart


import 'package:flutter/material.dart';
import 'package:super_shy_transaction_filter/super_shy_transaction_filter.dart';
import '../../common/common_appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: "ປະຫວັດທຸລະກຳ",
      ),
      body: SuperShyTransaction(
        superShyTransactionList: [
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now().subtract(const Duration(days: 20)),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now().subtract(const Duration(days: 10)),
            suffixTitle: "LAK",
            category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 300000,
            isIncome: true,
            date: DateTime.now().subtract(const Duration(days: 10)),
            suffixTitle: "LAK",
            category: "ສຸຂະພາບ",
          ),
          SuperShyTransactionModel(
            title: "ໄດ້ຮັບເງິນ",
            value: 20000,
            isIncome: true,
            date: DateTime.now(),
            suffixTitle: "LAK",
            category: "ຂອງຂັວນ ແລະ ການບໍລິຈາກ",
          ),
          SuperShyTransactionModel(
            title: "ຊຳລະເງິນ",
            value: 200000,
            isIncome: false,
            date: DateTime.now().subtract(const Duration(days: 1)),
            suffixTitle: "LAK",
            category: "ອາຫານ",
          ),
        ],
      ),
    );
  }
}


```
## Demo
![App Screenshot](https://i.imgur.com/HpQB29H.png)

## Issues

Please file any issues, bugs or feature requests as an issue on our [GitHub](github link ) page. you can contact us at - [@SouksavathPMS](https://github.com/SouksavathPMS). 

## Authors

- [@SouksavathPMS](https://github.com/SouksavathPMS)

- [@PatiphanVanthanouvong](https://github.com/PatiphanVanthanouvong)

## Feedback
If you have any feedback, please reach out to us at souksavathpms.official2021@gmail.com

## Comet Hackathon 2023 

[Comet Digital Agency ](https://www.facebook.com/CometDigitalAgency)
