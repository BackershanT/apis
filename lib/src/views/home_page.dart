import 'package:apis/src/model/post_model.dart';
import 'package:apis/src/servives/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> ? posts;
  var isLoaded = false;
  @override
  void initState(){
    super.initState();
    ///fetch data from api
    getData();
  }
  getData()async{
posts = await RemoteService().getPosts();
if(posts != null){
  setState(() {
    isLoaded = true;
  });
}
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
title: Text('POSTS MEthod',)
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts!.length,
            itemBuilder: (context,index){
             return Container(
               padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),color: Colors.grey
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts![index].title,maxLines: 3,overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                        Text(posts![index].body ?? '',maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.justify,
                          // style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
             );
            }),
        replacement: Center(child: CircularProgressIndicator()),
      ),

    );
  }
}
