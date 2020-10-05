import 'package:advanced_provider/FutureProvider/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _users = Provider.of<List<User>>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'FutureProvider Example - Load Infor từ file Json'
          ),
        ),
        Expanded(
            child: _users == null ? Container(child: CupertinoActivityIndicator(radius: 50.0)) :
            ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index){
                  return Container(
                      height: 50,
                      color: Colors.grey[(index*200) % 400],
                      child: Center(
                          child: Text(
                              '${_users[index].name} - ${_users[index].job} | ${_users[index].website}'
                          )
                      )
                  );
                }
            )
        )
      ],
    );

  }
}
