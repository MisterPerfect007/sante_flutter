import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sante_app/controllers/categories_controller.dart';
import 'package:sante_app/core/navigator/navigator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controllers/appointment_controller.dart';
import '../../core/custom form field/custom_text_form_field.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  String date = "";

  void setDate(newDate) {
    setState(() {
      date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => goBack(context),
          child: const Icon(Icons.arrow_back_rounded, 
          size: 30, 
          color: Colors.black,)),
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
                  controller: controller,
                  labelText: 'Note (optionnel)',
                  validator: (value) => null,
                )
              ],
            )),
            const SizedBox(height: 20),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Jour du RDV : ",
                ),
                Text(
                    date.isNotEmpty
                        ? DateFormat("dd-MM-yyyy").format(DateTime.parse(date))
                        : '',
                    // "${date == '' ? '' : DateTime.parse(date)}",
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            // Obx(() => Text(
            //   _appointmentController.appointmentDate.string,
            // )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                goToPage(
                    context,
                    DatePicker(
                      setDate: setDate,
                    ));
              },
              child: const Text("Ouvrir le calendrier"),
            ),
            date.isNotEmpty ? ElevatedButton(
              onPressed: () {
                goBack(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green
              ),
              child: const Text("Valider le RDV"),
            ) : Container()
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final Function setDate;
  const DatePicker({Key? key, required this.setDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.single,
            minDate: DateTime.now(),
            showActionButtons: true,
            showNavigationArrow: true,
            onCancel: () {
              goBack(context);
            },
            onSubmit: (value) {
              if (value is DateTime) {
                setDate(value.toString());
                goBack(context);
              }
            },
          ),
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