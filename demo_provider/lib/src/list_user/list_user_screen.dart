import 'package:demo_provider/src/login/login_viewmodel.dart';
import 'package:demo_provider/src/resource/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_user_viewmodel.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  State<ListUserScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ListUserScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListUserViewModel>(
        create: (context) => ListUserViewModel(),
        child: Consumer<ListUserViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body:SafeArea(
          child: StreamBuilder<List<UserModel>>(
              stream: viewModel.getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ...List.generate(snapshot.data!.length, (index) {
                        UserModel userModel = snapshot.data![index];
                        return ListTile(
                          title: Text(userModel.email.toString()),
                          onLongPress: () {
                            viewModel.remoteUserById(userModel.id.toString());
                            // FirebaseApi.deleteTodo(name);
                          },
                        );
                      })
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
          );
        }));
  }
}
