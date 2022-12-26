import 'package:weathers/models/past.dart';
import 'package:http/http.dart';
class RemoteService{

  Future<List<Post>?> getPosts() async{
    var http;
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    }
  }
}