import 'package:aturdompet/core/models/outcome/outcome_hari.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_hari.dart';
import 'package:aturdompet/widgets/custom_date_time_picker.dart';
import 'package:aturdompet/widgets/custom_input_value.dart';
import 'package:aturdompet/widgets/custom_modal_action_button.dart';
import 'package:aturdompet/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddOutcome extends StatefulWidget {
  @override
  _AddOutcomeState createState() => _AddOutcomeState();
}

class _AddOutcomeState extends State<AddOutcome> {
  DateTime _selectedDate = DateTime.now();
  final _descController = TextEditingController();
  final _valueController = TextEditingController();
  // final _valueController = MaskedTextController(mask: '0.000.000.000.000');


  void addOutcome() {
    final desc = _descController.text;
    final value = _valueController.text;
    // final date = DateFormat('dd-MM-yyyy').format(_selectedDate);

    if (desc.isNotEmpty && value.isNotEmpty) {
      final outcome = OutcomeHari(desc, int.parse(value), _selectedDate);
      OutcomeHariViewModel.add(outcome);
      Navigator.pop(context);
    }
  }

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (datepick != null) {
      setState(() {
        _selectedDate = datepick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Text(
                'Add Outcome Harian',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            CustomTextField(
                labelText: 'Enter description', controller: _descController),
            SizedBox(height: 12),
            CustomInputValue(
                labelText: 'Enter value', controller: _valueController),
            SizedBox(height: 12),
            CustomDateTimePicker(
              icon: Icons.date_range,
              onPressed: _pickDate,
              value: DateFormat('dd-MM-yyyy').format(_selectedDate),
            ),
            SizedBox(height: 24),
            CustomModalActionButton(
              onClose: () => Navigator.of(context).pop(),
              onSave: () {
                addOutcome();
              },
            )
          ],
        ),
      ),
    );
  }
}
