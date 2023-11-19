
# Super shy transaction filter
Introducing a Flutter package for streamlined financial transaction history filtering, enhancing the filtering process. Our offering includes visually appealing data visualization, an intuitive filter container, and a comprehensible transaction model. 

# Features
- Basic Data Visualization
- Payment and Income Category
- Filter Payment History Transactions
- Customizable Payment Filters
- Summary of Incomes and Payments by Payment Categories


## Dependencies

- `flutter_form_builder: ^9.1.1`
- `flutter_svg: ^2.0.9`
- `hooks_riverpod: ^2.4.6`
- `intl: ^0.18.1`

## Installation
To add "super_shy_transaction_filter" to your Flutter application, follow these steps:

1. Install the packages by running the following command in your terminal:

   ```bash
   $ flutter pub add super_shy_transaction_filter
   ```

This command will automatically add the package to your project's dependencies in the pubspec.yaml file.

2. Once the package is added, your pubspec.yaml file should now include a line similar to the following:

```bash
dependencies:
  super_shy_transaction_filter: ^1.0.0
```
If not, you can manually add it to your dependencies.

3. Save the changes to your pubspec.yaml file and run the following command to fetch the package:
 ```bash
 $ flutter pub get
 ```
 This command will ensure that your project is updated with the newly added package.
4. Now, you can import the package in your Dart code by adding the following import statement:
 ```bash
 import 'package:super_shy_transaction_filter/super_shy_transaction.dart_filter';
 ```

 You are now ready to utilize the features of the "super_shy_transaction_filter" package in your Flutter application.
 
## Usage/Examples
Here's a simple example of how to use the package:


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
For a more detailed example, check the code in the HistoryScreen class, which includes a demo of the SuperShyTransaction widget and its usage.

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

## Code coverage unit testing
![App Screenshot](https://i.imgur.com/A8iAltJ.png)

## Remaining Features or To-Do
* Modification of the model
* Customization of the user interface (UI) for widgets, including tab bar, date picker, and container
* Parameter modification for payment and income

## Issues
Please report any issues, bugs, or feature requests on our [GitHub](https://github.com/cometdigitalagency/hackathon-banking) page. Feel free to reach out to us on GitHub or via email at souksavathpms.official2021@gmail.com.

## Authors

- [@SouksavathPMS](https://github.com/SouksavathPMS)

- [@PatiphanVanthanouvong](https://github.com/PatiphanVanthanouvong)

## Feedback
If you have any feedback, please reach out to us at souksavathpms.official2021@gmail.com

## Comet Hackathon 2023 
[Comet Digital Agency ](https://www.facebook.com/CometDigitalAgency)

ໂປຣເຈັກນີ້ແມ່ນສ້າງຂື້ນມາເພື່ອນຳໃຊ້ເຂົ້າໃນການແຂ່ງຂັນງານ Comet Hackathon 2023 ພາຍໃຕ້ຫົວຂໍ້ທີ່ວ່າ: " ການນຳເອົາ Software ທີ່ມີຢູ່ໃນລາວ ແລະ ນຳມາປັບປຸງໃຫ້ມີປະສິດທິພາບຫຼາຍຂື້ນ ໂດຍນຳໃຊ້ flutter ເພື່ອພັດທະນາໃຫ້ຢູ່ໃນລັກສະນະ module ຫຼື package "

