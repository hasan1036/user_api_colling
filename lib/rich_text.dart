import 'package:flutter/material.dart';
import 'package:user_api2/utility.dart';

import 'model/user_details.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class RichText1 extends StatefulWidget {
  const RichText1({Key? key}) : super(key: key);

  @override
  State<RichText1> createState() => _RichText1State();
}

class _RichText1State extends State<RichText1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rich Api")),

      body:FutureBuilder(
          future: getApi(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                    itemCount: userDetails.length,
                    itemBuilder: (context, index){
                      return   Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xffc40de4),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        height: 200,

                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            getText( "ID: ", userDetails[index].id.toString()),
                            getText( "Name: ", userDetails[index].name.toString()),
                            getText( "UserName: ", userDetails[index].username.toString()),
                            getText( "Email: ", userDetails[index].email.toString()),
                            getText( "Address: ", '${userDetails[index].address!.suite.toString()},${userDetails[index].address!.street.toString()},${userDetails[index].address!.city.toString()},${userDetails[index].address!.zipcode.toString()},${userDetails[index].address!.geo!.lat.toString()},${userDetails[index].address!.geo!.lng.toString()}, ' ,   ),


                          ],
                        ),
                      );


                    });

            }else{
              return CircularProgressIndicator();
            }

      })



    );
  }

  RichText getText( String fieldName, String content) {
    return RichText(text: TextSpan(
            children: [
              TextSpan(text: fieldName, style: richText1),
              TextSpan(text: content, style: TextStyle(fontSize: 14, color: Colors.black)),
            ]
          ));
  }

   List<UserDetails> userDetails = [];
   Future<List<UserDetails>> getApi()async{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
     final data = convert.jsonDecode(response.body.toString());
     if(response.statusCode == 200){
       for(Map<String, dynamic> index in data){
         userDetails.add(UserDetails.fromJson(index));
       }
       return userDetails;
     }else{
       return userDetails;
     }
   }


}
