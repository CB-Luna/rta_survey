import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/providers/answers.dart';
import 'package:encuesta_rta/ui/components/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class TextBox extends StatefulWidget {
  const TextBox(
      {Key? key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.qID,
      this.keyboardType = TextInputType.text,
      this.isEmail = false,
      this.isPhone = false})
      : super(key: key);

  final String label;
  final String hint;
  final IconData icon;
  final String qID;
  final bool isEmail;
  final bool isPhone;
  final TextInputType keyboardType;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  final CustomInputs _customInputs = CustomInputs();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: mobile(context) ? 230 : 300,
        child: TextField(
            onChanged: (value) {
              context
                  .read<Answers>()
                  .addAnswer({"id": widget.qID, "value": value});
            },
            inputFormatters: [
              widget.isEmail
                  ? MaskTextInputFormatter(
                      mask: ('#' * 36),
                      filter: {"#": RegExp(r'[a-zA-Z0-9@.]')},
                      type: MaskAutoCompletionType.lazy)
                  : widget.isPhone
                      ? MaskTextInputFormatter(
                          mask: '(###) ###-####',
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy)
                      : FilteringTextInputFormatter.deny('')
            ],
            keyboardType: widget.keyboardType,
            decoration: _customInputs.formInputDecoration(
                label: widget.label, icon: widget.icon, hint: widget.hint)));
  }
}
