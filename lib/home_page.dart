import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:user_api2/model/user_details.dart';
import 'package:user_api2/utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: userDetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.all(10),

                      height: 220,
                      //color: Colors.green,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          getText( "ID : ", userDetails[index].id.toString()),


                          getText( "Name : ", userDetails[index].name.toString()),
                          getText( "Em ail : ",
                              userDetails[index].email.toString()),
                          getText( "Phone : ",
                              userDetails[index].phone.toString()),
                          getText("Website : ",
                              userDetails[index].website.toString()),
                          getText( "Company Name : ",
                              userDetails[index].company.toString()),
                          getText( "Address : ",
                              '${userDetails[index].address?.suite.toString()},${userDetails[index].address?.street.toString()},${userDetails[index].address?.city.toString()},${userDetails[index].address?.zipcode.toString()}, '),


                        ],
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Text getText( String fieldName, String content) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: fieldName, style: richText1),
      TextSpan(text: content, style: TextStyle(fontSize: 15)),
    ]));
  }

  /////////////////
  List<UserDetails> userDetails = [];
  Future<List<UserDetails>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = convert.jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userDetails.add(UserDetails.fromJson(index));
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }
}
