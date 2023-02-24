import 'package:flutter/material.dart';
import 'dart:io';


void main() => runApp(const MyApp());



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FormBuilder Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _chaptertitleController;
  late final TextEditingController _chaptertextController;
  late final TextEditingController _fileDirectoryPathController;

  @override
  void initState() {
    super.initState();
    _chaptertitleController = TextEditingController();
    _chaptertextController = TextEditingController();
  }
  
  @override
  void dispose() {
    _chaptertitleController.dispose();
    _chaptertextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child:
          SizedBox(
            width: 600,
            child:
           Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _fileDirectoryPathController,
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
                       _fileDirectoryPathController.clear();
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
              const SizedBox(height: 50),
              TextFormField(
                controller: _chaptertitleController,
                 decoration: InputDecoration(
                focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                labelText: 'chaptertitle',
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.9)
                    ),
                    suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                    ), onPressed: (){
                       _chaptertitleController.clear();
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
              const SizedBox(height: 50),
              TextFormField(
                controller: _chaptertextController,
                decoration: InputDecoration(
                focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
                labelText: 'chaptertext',
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.9)
                    ),
                 suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                    ),
                    onPressed: () {
                      _chaptertextController.clear();
                    }
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
              maxLines: 3,
              ),
              const SizedBox(height: 20),
               SizedBox(
                  height: 50.0,
                  width: 100.0,
                  child:
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var chaptertitle = _chaptertitleController.text.toString().replaceAll("\n", " ");
                    var chaptertext = _chaptertextController.text.toString().replaceAll("\n", " ");
                    String jsonValues = """
{
"chaptertitle": "$chaptertitle",
"chaptertext": "$chaptertext"
},
  """;
                    createFile(_fileDirectoryPathController.text, jsonValues);
                  }
                },
                child: const Text('Submit'),
              ),
               ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}






createFile(var filePath, var jsoncontents) async {
// Get the system temp directory.
//var systemTempDir = Directory.systemTemp;
// Creates dir/, dir/subdir/, and dir/subdir/file.txt in the system
// temp directory.
var file = await File(filePath)
.create(recursive: true);

var writeFileContents = file.openWrite(mode:FileMode.append);

writeFileContents.write(jsoncontents);

}