import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkH{
  NetworkH(this.url);
  final String url;

 Future getdata()async{

   http.Response response = await http.get( Uri.parse(url));
   if (response.statusCode == 200) {
     String output = response.body;
     var decode = jsonDecode(output);

     return jsonDecode(output);
   } else {
     print(response.statusCode);
   }
  }
}

