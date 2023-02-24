// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   final _formKey = GlobalKey<FormState>();

//   late final TextEditingController _emailController;
//   late final TextEditingController _passwordController;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   bool emailValid = RegExp(
//                           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                       .hasMatch(value);

//                   if (!emailValid) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   if (value.length < 6) {
//                     return "Password must be at least 6 characters";
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     print(_emailController.text);
//                     print(_passwordController.text);
//                   }
//                 },
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:intl/intl.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter FormBuilder Demo',
//       debugShowCheckedModeBanner: false,
//       localizationsDelegates: const [
//         FormBuilderLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       supportedLocales: FormBuilderLocalizations.delegate.supportedLocales,
//       home: const CompleteForm(),
//     );
//   }
// }

// class CompleteForm extends StatefulWidget {
//   const CompleteForm({Key? key}) : super(key: key);

//   @override
//   State<CompleteForm> createState() {
//     return _CompleteFormState();
//   }
// }

// class _CompleteFormState extends State<CompleteForm> {
//   bool autoValidate = true;
//   bool readOnly = false;
//   bool showSegmentedControl = true;
//   final _formKey = GlobalKey<FormBuilderState>();
//   bool _ageHasError = false;
//   bool _genderHasError = false;

//   var genderOptions = ['Male', 'Female', 'Other'];

//   void _onChanged(dynamic val) => debugPrint(val.toString());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Form Builder Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               FormBuilder(
//                 key: _formKey,
//                 // enabled: false,
//                 onChanged: () {
//                   _formKey.currentState!.save();
//                   debugPrint(_formKey.currentState!.value.toString());
//                 },
//                 autovalidateMode: AutovalidateMode.disabled,
//                 initialValue: const {
//                   'movie_rating': 5,
//                   'best_language': 'Dart',
//                   'age': '13',
//                   'gender': 'Male',
//                   'languages_filter': ['Dart']
//                 },
//                 skipDisabled: true,
//                 child: Column(
//                   children: <Widget>[
//                     const SizedBox(height: 15),
//                     FormBuilderDateTimePicker(
//                       name: 'date',
//                       initialEntryMode: DatePickerEntryMode.calendar,
//                       initialValue: DateTime.now(),
//                       inputType: InputType.both,
//                       decoration: InputDecoration(
//                         labelText: 'Appointment Time',
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () {
//                             _formKey.currentState!.fields['date']
//                                 ?.didChange(null);
//                           },
//                         ),
//                       ),
//                       initialTime: const TimeOfDay(hour: 8, minute: 0),
//                       // locale: const Locale.fromSubtags(languageCode: 'fr'),
//                     ),
//                     FormBuilderDateRangePicker(
//                       name: 'date_range',
//                       firstDate: DateTime(1970),
//                       lastDate: DateTime(2030),
//                       format: DateFormat('yyyy-MM-dd'),
//                       onChanged: _onChanged,
//                       decoration: InputDecoration(
//                         labelText: 'Date Range',
//                         helperText: 'Helper text',
//                         hintText: 'Hint text',
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () {
//                             _formKey.currentState!.fields['date_range']
//                                 ?.didChange(null);
//                           },
//                         ),
//                       ),
//                     ),
//                     FormBuilderSlider(
//                       name: 'slider',
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.min(6),
//                       ]),
//                       onChanged: _onChanged,
//                       min: 0.0,
//                       max: 10.0,
//                       initialValue: 7.0,
//                       divisions: 20,
//                       activeColor: Colors.red,
//                       inactiveColor: Colors.pink[100],
//                       decoration: const InputDecoration(
//                         labelText: 'Number of things',
//                       ),
//                     ),
//                     FormBuilderRangeSlider(
//                       name: 'range_slider',
//                       // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
//                       onChanged: _onChanged,
//                       min: 0.0,
//                       max: 100.0,
//                       initialValue: const RangeValues(4, 7),
//                       divisions: 20,
//                       activeColor: Colors.red,
//                       inactiveColor: Colors.pink[100],
//                       decoration:
//                           const InputDecoration(labelText: 'Price Range'),
//                     ),
//                     FormBuilderCheckbox(
//                       name: 'accept_terms',
//                       initialValue: false,
//                       onChanged: _onChanged,
//                       title: RichText(
//                         text: const TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'I have read and agree to the ',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: 'Terms and Conditions',
//                               style: TextStyle(color: Colors.blue),
//                               // Flutter doesn't allow a button inside a button
//                               // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
//                               /*
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   print('launch url');
//                                 },
//                               */
//                             ),
//                           ],
//                         ),
//                       ),
//                       validator: FormBuilderValidators.equal(
//                         true,
//                         errorText:
//                             'You must accept terms and conditions to continue',
//                       ),
//                     ),
//                     FormBuilderTextField(
//                       autovalidateMode: AutovalidateMode.always,
//                       name: 'age',
//                       decoration: InputDecoration(
//                         labelText: 'Age',
//                         suffixIcon: _ageHasError
//                             ? const Icon(Icons.error, color: Colors.red)
//                             : const Icon(Icons.check, color: Colors.green),
//                       ),
//                       onChanged: (val) {
//                         setState(() {
//                           _ageHasError = !(_formKey.currentState?.fields['age']
//                                   ?.validate() ??
//                               false);
//                         });
//                       },
//                       // valueTransformer: (text) => num.tryParse(text),
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.required(),
//                         FormBuilderValidators.numeric(),
//                         FormBuilderValidators.max(70),
//                       ]),
//                       // initialValue: '12',
//                       keyboardType: TextInputType.number,
//                       textInputAction: TextInputAction.next,
//                     ),
//                     FormBuilderDropdown<String>(
//                       // autovalidate: true,
//                       name: 'gender',
//                       decoration: InputDecoration(
//                         labelText: 'Gender',
//                         suffix: _genderHasError
//                             ? const Icon(Icons.error)
//                             : const Icon(Icons.check),
//                         hintText: 'Select Gender',
//                       ),
//                       validator: FormBuilderValidators.compose(
//                           [FormBuilderValidators.required()]),
//                       items: genderOptions
//                           .map((gender) => DropdownMenuItem(
//                                 alignment: AlignmentDirectional.center,
//                                 value: gender,
//                                 child: Text(gender),
//                               ))
//                           .toList(),
//                       onChanged: (val) {
//                         setState(() {
//                           _genderHasError = !(_formKey
//                                   .currentState?.fields['gender']
//                                   ?.validate() ??
//                               false);
//                         });
//                       },
//                       valueTransformer: (val) => val?.toString(),
//                     ),
//                     FormBuilderRadioGroup<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'My chosen language',
//                       ),
//                       initialValue: null,
//                       name: 'best_language',
//                       onChanged: _onChanged,
//                       validator: FormBuilderValidators.compose(
//                           [FormBuilderValidators.required()]),
//                       options:
//                           ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
//                               .map((lang) => FormBuilderFieldOption(
//                                     value: lang,
//                                     child: Text(lang),
//                                   ))
//                               .toList(growable: false),
//                       controlAffinity: ControlAffinity.trailing,
//                     ),
//                     FormBuilderSegmentedControl(
//                       decoration: const InputDecoration(
//                         labelText: 'Movie Rating (Archer)',
//                       ),
//                       name: 'movie_rating',
//                       // initialValue: 1,
//                       // textStyle: TextStyle(fontWeight: FontWeight.bold),
//                       options: List.generate(5, (i) => i + 1)
//                           .map((number) => FormBuilderFieldOption(
//                                 value: number,
//                                 child: Text(
//                                   number.toString(),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ))
//                           .toList(),
//                       onChanged: _onChanged,
//                     ),
//                     FormBuilderSwitch(
//                       title: const Text('I Accept the terms and conditions'),
//                       name: 'accept_terms_switch',
//                       initialValue: true,
//                       onChanged: _onChanged,
//                     ),
//                     FormBuilderCheckboxGroup<String>(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       decoration: const InputDecoration(
//                           labelText: 'The language of my people'),
//                       name: 'languages',
//                       // initialValue: const ['Dart'],
//                       options: const [
//                         FormBuilderFieldOption(value: 'Dart'),
//                         FormBuilderFieldOption(value: 'Kotlin'),
//                         FormBuilderFieldOption(value: 'Java'),
//                         FormBuilderFieldOption(value: 'Swift'),
//                         FormBuilderFieldOption(value: 'Objective-C'),
//                       ],
//                       onChanged: _onChanged,
//                       separator: const VerticalDivider(
//                         width: 10,
//                         thickness: 5,
//                         color: Colors.red,
//                       ),
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.minLength(1),
//                         FormBuilderValidators.maxLength(3),
//                       ]),
//                     ),
//                     FormBuilderFilterChip<String>(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       decoration: const InputDecoration(
//                           labelText: 'The language of my people'),
//                       name: 'languages_filter',
//                       selectedColor: Colors.red,
//                       options: const [
//                         FormBuilderChipOption(
//                           value: 'Dart',
//                           avatar: CircleAvatar(child: Text('D')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Kotlin',
//                           avatar: CircleAvatar(child: Text('K')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Java',
//                           avatar: CircleAvatar(child: Text('J')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Swift',
//                           avatar: CircleAvatar(child: Text('S')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Objective-C',
//                           avatar: CircleAvatar(child: Text('O')),
//                         ),
//                       ],
//                       onChanged: _onChanged,
//                       validator: FormBuilderValidators.compose([
//                         FormBuilderValidators.minLength(1),
//                         FormBuilderValidators.maxLength(3),
//                       ]),
//                     ),
//                     FormBuilderChoiceChip<String>(
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       decoration: const InputDecoration(
//                           labelText:
//                               'Ok, if I had to choose one language, it would be:'),
//                       name: 'languages_choice',
//                       initialValue: 'Dart',
//                       options: const [
//                         FormBuilderChipOption(
//                           value: 'Dart',
//                           avatar: CircleAvatar(child: Text('D')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Kotlin',
//                           avatar: CircleAvatar(child: Text('K')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Java',
//                           avatar: CircleAvatar(child: Text('J')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Swift',
//                           avatar: CircleAvatar(child: Text('S')),
//                         ),
//                         FormBuilderChipOption(
//                           value: 'Objective-C',
//                           avatar: CircleAvatar(child: Text('O')),
//                         ),
//                       ],
//                       onChanged: _onChanged,
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState?.saveAndValidate() ?? false) {
//                           debugPrint(_formKey.currentState?.value.toString());
//                         } else {
//                           debugPrint(_formKey.currentState?.value.toString());
//                           debugPrint('validation failed');
//                         }
//                       },
//                       child: const Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         _formKey.currentState?.reset();
//                       },
//                       // color: Theme.of(context).colorScheme.secondary,
//                       child: Text(
//                         'Reset',
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.secondary),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// press button to reveal textfield

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   TextEditingController keyController = TextEditingController();
//   TextEditingController valueController = TextEditingController();

//   String _note = ''.replaceAll('\n', '');
//   final List<String> _notes = [];


//   _addKey() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     setState(() {
//                    _notes.add("{"" + $_note : ");
//                       keyController.clear();
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Save Note'))
//             ],
//             title: const Text('Enter Note'),
//             content: TextField(
//               controller: keyController,
//               decoration:
//                   const InputDecoration(contentPadding: EdgeInsets.all(10)),
//               onChanged: (val) {
//                 setState(() {
//                   _note = val;
//                 });
//               },
//             ),
//           );
//         });
//   }

  
//   _addValue() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     setState(() {
//                       _notes.add(_note + "$_note}");
//                       valueController.clear();
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Save Note'))
//             ],
//             title: const Text('Enter Note'),
//             content: TextField(
//               controller: valueController,
//               decoration:
//                   const InputDecoration(contentPadding: EdgeInsets.all(10)),
//               onChanged: (val) {
//                 setState(() {
//                   _note = val;
//                 });
//               },
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//           itemCount: _notes.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children:[
//              // const Text("{"),
//               Text(_notes[index].toString()),
//              // const Text("},"),
//               ]
//             );
//           }),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//            FloatingActionButton(
//             onPressed: _addKey,
//             tooltip: 'Add Key',
//             child: const Icon(Icons.key),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             onPressed: _addValue,
//             tooltip: 'Add Value',
//             child: const Icon(Icons.add),
//           ),
          
         
//         ],
//       ),
//     );
//   }
// }

