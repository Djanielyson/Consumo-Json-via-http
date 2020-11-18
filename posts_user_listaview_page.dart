import 'package:flutter/material.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/post.dart';
import 'package:teste/Aula_8%20Atividade_User_Post/users_posts_api.dart';

class PostsUserListViewPage extends StatelessWidget {
  int index;

  PostsUserListViewPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Posts Usuario"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: UsersPostsAPI.getAllUserPost(index),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return _buildListViewPost(snapshot.data);
            }
            return Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Container(
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
                ));
          }),
    );
  }

  ListView _buildListViewPost(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int i) {
        return _listTilePost(posts, i);
      },
    );
  }

  ListTile _listTilePost(List<Post> posts, int i) {
    return ListTile(
      title: Text(
        "Posts: " + posts[i].title,
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        "Corpo: " + posts[i].body,
      ),
    );
  }
}
