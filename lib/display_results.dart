
import 'package:flutter/material.dart';


class DisplayResults extends StatefulWidget {
  const DisplayResults({
    super.key,
    required this.textInput
  });

  final textInput;

  @override
  State<DisplayResults> createState() => _DisplayResultsState();
}

class _DisplayResultsState extends State<DisplayResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text inputs')),
      body: Center(child: widget.textInput),
    );
  }
}


