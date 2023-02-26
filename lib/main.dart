import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:multi_textfields/write_file.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      home: CompleteForm(),
    );
  }
}





class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<CompleteForm> createState() {
    return _CompleteFormState();
  }
}

class _CompleteFormState extends State<CompleteForm> {

  TextEditingController valueController = TextEditingController();

  late final TextEditingController chaptertitleController;
  late final TextEditingController subtitleController;
  late final TextEditingController subtextController;

  final TextEditingController fileDirectoryPathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chaptertitleController = TextEditingController();
    subtitleController = TextEditingController();
    subtextController = TextEditingController();
    fileDirectoryPathController.text = '/home/asante/Desktop/file.json';
  }

  @override
  void dispose() {
  subtitleController.dispose();
  subtextController.dispose();
  fileDirectoryPathController;
    super.dispose();
  }

  List textFieldLists = [];



  String textFieldItems = "";

  // get text field name from the icon button

  addTextField(List textfieldIdentities) {
      setState(() {
        textFieldLists.add(textfieldIdentities);
      });
  }


  TextField newTextField(hintText, controller){

    return  TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.blue)),

                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.9,
                    color: Colors.black)),
                // prefixIcon: IconButton(
                //     icon: const Icon(Icons.arrow_back), onPressed: () {}),
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                    ),
                    onPressed: () {
                      controller.clear();
                    }),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 20,
                  top: 14,
                  bottom: 14,
                ),
              ),

            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Builder Example')),
      body:
      Row(
        children:[
          const SizedBox(width: 100,),
          SingleChildScrollView(
            child:
             Column(
              children:[

                for(var index in textFieldLists)

                  Row(children: [
                    SizedBox(width:500,
                  child:newTextField(index[0], index[1])),
                  const SizedBox(width:20),
                   IconButton(
            color: Colors.blue,
            iconSize: 40.0,
            onPressed:((){
              setState(() {
                textFieldLists.removeAt(textFieldLists.indexOf(index));
              });
            }),
            tooltip: 'remove text field',
            icon: const Icon(Icons.cancel_outlined),
           ),
           ],
           ),

                const SizedBox(height: 30,),
                 SizedBox(
                  width: 100,
                  height: 100,
                  child:
                ElevatedButton(
                      onPressed: () {
                        createFile(fileDirectoryPathController.text,
                        chaptertitleController.text, subtitleController.text,
                        subtextController.text);
                      },

                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                 ),


              ],
              ),
              ),

              const SizedBox(width: 20,),
              Column(
            children: [
            const SizedBox(height: 50,),
            SizedBox(
              width: 300,
               child:TextFormField(
                controller: fileDirectoryPathController,
                 decoration: InputDecoration(
                focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                labelText: 'File Path',
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.9)
                    ),
                    suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                    ), onPressed: (){
                       fileDirectoryPathController.clear();
                        },

                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 20,
                  top: 14,
                  bottom: 14,
                ),

              ),
              autofocus: true,
              maxLines: 2,
              ),
            ),
              const SizedBox(height: 50),
           IconButton(
            color: Colors.blue,
            iconSize: 40.0,
            onPressed:(() => addTextField(["chaptertitle", chaptertitleController])),
            tooltip: 'chaptertitle',
            icon: const Icon(Icons.text_fields_outlined),

           ),
           const SizedBox(height: 30,),
            IconButton(
               color: Colors.blue,
            iconSize: 40.0,
            onPressed:(() => addTextField(["subtitle",subtitleController])),
            tooltip: 'subtitle',
            icon:const Icon(Icons.subject),
           ),
           const SizedBox(height: 30,),
            IconButton(
               color: Colors.blue,
            iconSize: 40.0,
            onPressed:(() => addTextField(["subtext",subtextController])),
            tooltip: 'subtext',
            icon:const Icon(Icons.subtitles),
           ),

                  ]
                 )
        ]
                )

    );
  }

}

