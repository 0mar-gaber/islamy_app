import 'dart:io';

void main() {
  List<String> titles= [];
  List<String> content= [];
  try {

    File file = File('D:\\route\\islamy\\assets\\texts\\ahadeth.txt');
    String contents = file.readAsStringSync();
    List<String> ahadethContent = contents.trim().split("#");


    for(int i =0 ; i<ahadethContent.length ; i++){
      List<String> list2 = ahadethContent[i].toString().trim().split("\n");
      titles.add(list2[0]);
      content.add(list2[1]);
      list2.removeAt(0);
      print(titles[i]);
      // print(content[i]);
      print("\n");

    }




  } catch (e) {
    print('Error reading the file: $e');
  }
}
