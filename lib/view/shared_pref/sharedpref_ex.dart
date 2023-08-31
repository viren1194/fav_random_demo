// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefEx extends StatefulWidget {
  const SharedPrefEx({super.key});

  @override
  State<SharedPrefEx> createState() => _SharedPrefExState();
}

class _SharedPrefExState extends State<SharedPrefEx> {
  late SharedPreferences prefs;
  int cnt = 0;
  @override
  void initState() {
    
    super.initState();
    initPref();
   
    
  }

  Future<void> initPref()async{
    prefs = await SharedPreferences.getInstance();
     show();
  }
  Future<void> incre()async{
    setState(() {
      cnt++;
    });
    await prefs.setInt('counter', cnt);

  }
  Future<void> show()async{
    cnt =  prefs.getInt('counter') ?? 0;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox( constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column( children: [
                  Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        const SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),
                       SizedBox(height: 16,),
                     Text(cnt.toString(),style: TextStyle(fontSize: 20),),

                  Spacer(),
                  ElevatedButton(onPressed: () {
                    incre();
                  }, child: Text('Add'))
                ],),
              ),
            ),
          );
        }
      ),
    );
  }
}