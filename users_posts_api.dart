import 'dart:convert'  as convert;
import 'package:http/http.dart' as http;
import 'package:teste/Aula_8%20Atividade_User_Post/post.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/user.dart';

class UsersPostsAPI{


  static Future<List<Post>> getAllUserPost(int idPost) async {
    List<Post> comment = [];

    String url = "https://jsonplaceholder.typicode.com/user/$idPost/posts";
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> maps = convert.jsonDecode(response.body);
        comment = maps.map((e) => Post.fromJson(e)).toList();
        comment.forEach((p) => print(p.title));
      } else {
        throw Exception(
            'Erro ao ler o dado -> STATUS CODE: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return comment;
  }

  static Future<List<User>> allPost() async {
    List<User> users = [];

    String url = "https://jsonplaceholder.typicode.com/users";

    try{

      http.Response response = await http.get(url);


      if(response.statusCode == 200){
        List<dynamic> maps = convert.jsonDecode(response.body);
        users = maps.map((e) => User.fromJson(e)).toList();
      }else {
        throw Exception(
            "Erro ao ler os dados -> STATUS CODE: ${response.statusCode}"
        );
      }


    } catch(e){
      print(e);
    }
    return users;
  }

  static Future<User> getPostId(int IdUsuario) async{
    User posts;
    String url = "https://jsonplaceholder.typicode.com/posts?userId="+ IdUsuario.toString() ;

    try{
      http.Response response = await http.get(url);
      if (response.statusCode == 200){
        Map<String, dynamic> map = convert.jsonDecode((response.body));
        return User.fromJson(map);
      }else {
        throw Exception (
            "Erro ao ler os dados -> STATUS CODE: ${response.statusCode}");
      }
    }catch(e) {
      print(e);
    }
    return posts;
  }
}