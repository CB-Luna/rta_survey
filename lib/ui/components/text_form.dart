import 'package:encuesta_rta/ui/components/text_box.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Form(
        child: Column(
      children: [
        TextBox(
          hint: "Name",
          icon: Icons.person,
          label: "Name",
        ),
        SizedBox(height: 20),
        TextBox(
          hint: "Address",
          icon: Icons.location_on,
          label: "Address",
        ),
        SizedBox(height: 20),
        TextBox(
          hint: "Phone Number",
          icon: Icons.phone,
          label: "Phone Number",
          isPhone: true,
        ),
        SizedBox(height: 20),
        TextBox(
          hint: "Email address",
          icon: Icons.email,
          label: "Email address",
          isEmail: true,
        ),
        SizedBox(height: 20),
        TextBox(
          hint: "Best time to contact you",
          icon: Icons.access_time,
          label: "Best time to contact you",
        ),
      ],
    ));
  }
}
