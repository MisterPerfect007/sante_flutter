import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/custom form field/custom_text_form_field.dart';

class Appointment extends StatelessWidget {
  Appointment({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Prendre un RDV",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: Column(
              children: [
                CustomTextFormField(
                  controller: _controller,
                  labelText: 'Note (optionnel)',
                  validator: (value) => null,
                )
              ],
            )),
            const SizedBox(height: 10),
            const Text(
              "Jour du RDV : ",
              style: TextStyle(
                // fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Ouvrir le calendrier"),
            )
          ],
        ),
      ),
    );
  }
}

/* 
Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          minDate: DateTime.now(),
          showActionButtons: true,
        ),
      ),
       */