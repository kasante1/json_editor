import 'package:flutter/material.dart';
import 'display_results.dart';

class TextFields extends StatefulWidget {

  const TextFields({Key? key, required this.queryController}) : super(key: key);
   final queryController;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return
        TextField(
              style: const TextStyle(fontSize: 20),
              controller: widget.queryController,
              decoration: const InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                hintText: "Enter texts here... ",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.9)),
        
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 16,
                  right: 15,
                  top: 14,
                  bottom: 14,
                ),
              ),
              autofocus: true,
              maxLines: 7,
        );
  }
}





class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.textInput}) : super(key: key);

    final textInput;


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(80, 60),
      side: const BorderSide(width: 1.5, color: Colors.black)),
      onPressed:(() =>
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        DisplayResults(textInput: textInput,)
        ))
        ),
         child: const Text("Submit", style: TextStyle(fontSize: 20, color: Colors.black)));
    
  }
}



