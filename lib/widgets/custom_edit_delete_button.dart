import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomEditDeleteButton extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  CustomEditDeleteButton({@required this.onDelete, @required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onDelete,
          buttonText: 'Delete',
          borderColor: Colors.white,
        ),
        CustomButton(
          onPressed: onEdit,
          buttonText: 'Edit',
          color: Theme.of(context).accentColor,
          textColor: Colors.black,
        )
      ],
    );
  }
}
