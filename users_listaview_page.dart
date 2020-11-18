import 'package:flutter/material.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/posts_user_listaview_page.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/user.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/users_posts_api.dart';


class UsersListViewPage extends StatefulWidget {



  @override
  _UsersListViewPageState createState() => _UsersListViewPageState();
}

class _UsersListViewPageState extends State<UsersListViewPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários",style: TextStyle(
          color: Colors.black,
          fontSize: 30
        ),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: UsersPostsAPI.allPost(),
        builder: (BuildContext context, AsyncSnapshot snapshort) {
          if (snapshort.hasData) {
            return _buildListViewUsers(snapshort.data);
          } else if (snapshort.hasError) {
            return Text("Erro!", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,

            ),);
          }
          return _buildCircularProgressIndicator();
        },
      ),
    );
  }

  ListView _buildListViewUsers(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int i) {
        return _listTileUsers(users, i);
      },
    );
  }

  ListTile _listTileUsers(List<User> users, int i) {
    return ListTile(
      title: Text(users[i].name),
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => PostsUserListViewPage(i+1)
        ),
        );
      },
    );
  }

  Container _buildCircularProgressIndicator() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          ),
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Text(
            'Carregando',
            style: TextStyle(
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
