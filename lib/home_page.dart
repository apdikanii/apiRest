import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weathers/models/past.dart';
import 'package:weathers/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  getData()async{
    posts = await RemoteService().getPosts();
    if (posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(
                posts![index].name, ),
            );
          }
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          ),
    );
  }
}