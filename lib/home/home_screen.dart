import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:test__api/controller/api.dart';

import '../model/api_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List name=[];
  List des=[];
  List profilePic=[];
  int count=10;
  String test="";
  late UserInfo userInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController condroll = TextEditingController();
    return FutureBuilder(
      future: getHomeScreenData(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          count=snapshot.data!.data.length;
        // print("kbfkj");akhi
        if(name.isEmpty||test.isEmpty){
          name.clear();
  for(int i=0;i<count;i++){
            name.add(snapshot.data!.data[i].name);
             des.add(snapshot.data!.data[i].about);
             profilePic.add(snapshot.data!.data[i].profilePic);
          }
        }
        

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: const InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: const EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
         
              test=string;
              List  sample=[];
              print("bjhbfg");
              sample.addAll(name);
              List about=[];
              about.addAll(des);
              List profile=[];
              profile.addAll(profilePic);
              name.clear();
              name=sample.where((element) =>element.toString().toLowerCase().contains(string.toLowerCase())).toList();
              des.clear();
              profilePic.clear();
              print(des.length);
              for(int i=0;i<name.length;i++){
                  des.add(about[sample.indexOf(name[i])]);
                  profilePic.add(profile[sample.indexOf(name[i])]);
              }
           
            
            setState(() {
              
            });
              },
            ),
          ),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: name.length,
            itemBuilder: (context, index) {
            return  ListTile(
              leading:  SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profilePic[index]),),
              ),
              title: Text(name[index],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
               subtitle: Text(snapshot.data!.data[index].about,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
              
              
            );
          }, separatorBuilder: (BuildContext context, int index) { return const Divider(color: Colors.black,); },),
        ),
      );
      } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
