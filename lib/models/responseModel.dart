import 'package:http/http.dart' as http;

class GetResponse
{
  String key;
  GetResponse(this.key);

  Future<dynamic> getResponse()
  async{
    // print(key);
    http.Response response=await http.get(key);

    if(response.statusCode==200)
    {
      // print(response.body);
      return response.body;
    }
    else
    { 
      print(response.statusCode);
      return null;
    }
  }

}