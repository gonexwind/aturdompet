import 'package:aturdompet/core/models/outcome/outcome_minggu.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_minggu.dart';
import 'package:aturdompet/widgets/custom_date_time_picker.dart';
import 'package:aturdompet/widgets/custom_input_value.dart';
import 'package:aturdompet/widgets/custom_modal_action_button.dart';
import 'package:aturdompet/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditOutcome extends StatefulWidget {
  final OutcomeMinggu outcome;
  final int index;
  EditOutcome({this.outcome, this.index});

  @override
  _EditOutcomeState createState() => _EditOutcomeState();
}

class _EditOutcomeState extends State<EditOutcome> {
  DateTime _selectedDate = DateTime.now();
  final _descController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _descController.text = widget.outcome.desc;
    _valueController.text = widget.outcome.value.toString();
    _selectedDate = widget.outcome.date;
  }

  void editOutcome() {
    final desc = _descController.text;
    final value = _valueController.text;

    if (desc.isNotEmpty && value.isNotEmpty) {
      final outcome = OutcomeMinggu(desc, int.parse(value), _selectedDate);

      OutcomeMingguViewModel.update(outcome, widget.index);
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
                'Edit Outcome Mingguan',
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
                editOutcome();
              },
            )
          ],
        ),
      ),
    );
  }
}
