
import 'dart:io';



createFile(var filePath, chaptertitle, subtitle, subtext) async {


// Get the system temp directory.
//var systemTempDir = Directory.systemTemp;
// Creates dir/, dir/subdir/, and dir/subdir/file.txt in the system
// temp directory.

var fileContents = formatTextContents(chaptertitle, subtitle, subtext);


var file = await File(filePath)
.create(recursive: true);

var writeFileContents = file.openWrite(mode:FileMode.append);

writeFileContents.write(fileContents);

  }
//}


/// format the text content
/// to write to file

formatTextContents(chaptertitle, subtitle, subtext){

    if (chaptertitle != ""){

      String chapterTitle = chaptertitle.toString().replaceAll("\n", " ");
      String subTitle = subtitle.toString().replaceAll("\n", " ");
      String subText = subtext.toString().replaceAll("\n", " ");

      return startChapterText(chapterTitle, subTitle, subText);

    }else if(subtitle != "" && subtext != ""){
      var subTitle = subtitle.toString().replaceAll("\n", " ");
      var subText = subtext.toString().replaceAll("\n", " ");

      return subTextContents(subTitle, subText);
    }
    else if(subtitle != ""){
      var subTitle = subtitle.toString().replaceAll("\n", " ");
      
      return subTextContentsList(subTitle);
    }


}


/// write closing bracket and curly bracket 

String endChapterTextContents (){
    return """


              ]
    }, 


  """;
 }



/// write closing brackets for sub texts

String endSubTextContentsList (){
    return """


              ]
    }, 


  """;
   }


// write opening brackets and subtitles

String subTextContentsList (String subtitle){
  return  """

    {
      "subtitle":"$subtitle",
      "subtext":
              [ 


  """;

 }


/// write opening brackets, chapter title
/// and chapter texts opening bracket for 
/// subtexts 

String startChapterText(String chaptertitle, String subtitle, String subtext){
    return """
{
"chaptertitle": "$chaptertitle",
"chaptertext":
  [
     {
      "subtitle":"$subtitle",
      "subtext": "$subtext"

    },
    
  """;

  }


String subTextContents(String subtitle, String subtext){
    return """

    {
      "subtitle":"$subtitle",
      "subtext": "$subtext"

    },


  """;
  }