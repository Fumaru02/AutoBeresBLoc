import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class NewItem2 extends StatefulWidget {
  const NewItem2({super.key});

  @override
  State<NewItem2> createState() => _NewItem2State();
}

class _NewItem2State extends State<NewItem2> {
  List<dynamic> counteries = [];
  List<dynamic> statesMasters = [];
  List<dynamic> states = [];

  String? countryId;
  String? stateId;
  @override
  void initState() {
    super.initState();

    this.counteries.add({"id": 1, "label": "Indonesia"});
    this.counteries.add({"id": 2, "label": "UAE"});

    this.statesMasters = [
      {"ID": 1, "Name": "Jakarta", "ParentId": 1},
      {"ID": 2, "Name": "Bandung", "ParentId": 1},
      {"ID": 3, "Name": "Bekasi", "ParentId": 1},
      {"ID": 1, "Name": "Jatikramat", "ParentId": 2},
      {"ID": 2, "Name": "Matraman", "ParentId": 2},
      {"ID": 3, "Name": "BuahBatu", "ParentId": 2},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter - Dependent Dropdown'),
      ),
      body: Column(
        children: [
          FormHelper.dropDownWidget(
              context, "Select Country", this.countryId, this.counteries,
              (onChangedVal) {
            this.countryId = onChangedVal;
            print("Selected Country: $onChangedVal");

            this.states = this
                .statesMasters
                .where((stateItem) =>
                    stateItem['ParentId'].toString() == onChangedVal.toString())
                .toList();
            this.stateId = null;
            setState(() {});
          }, (onValidate) {
            if (onValidate == null) {
              return 'Please Select Country';
            }

            return null;
          },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: 'id',
              optionLabel: 'label'),
          FormHelper.dropDownWidgetWithLabel(
              context, "State", "Select State", this.stateId, this.states,
              (onChangeVal) {
            this.stateId = onChangeVal;
          }, (onValidate) {
            return null;
          },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: 'ID',
              optionLabel: 'Name')
        ],
      ),
    ));
  }
}
