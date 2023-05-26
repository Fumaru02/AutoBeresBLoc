import 'package:bloc_flutter/pages/profile/data/vehicles_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.w,
                  child: DropdownButtonFormField(
                    items: [
                      for (final merk in merks.entries)
                        DropdownMenuItem(
                          value: merk.value,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22.w,
                                height: 22.h,
                                child: Image.network(merk.value.imagePath),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(merk.value.title)
                            ],
                          ),
                        )
                    ],
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Year'),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    validator: (value) {},
                    onSaved: (value) {},
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
