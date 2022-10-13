import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2/bloc/user_bloc.dart';

import 'model/user_model.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => UserBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<UserModel> lists = [];
  @override
  void initState() {
    context.read<UserBloc>().add(GetUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UserList"),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoaded) {
        lists = state.users;
      }
      if (state is UserDelete) {
        lists = state.users;
      }
      return _buildUsers(context, lists, state);
    });
  }

  Widget _buildUsers(
      BuildContext context, List<UserModel> lists, UserState state) {
    return state is UserLoading
        ? _buildLoading()
        : ListView.builder(
            itemCount: lists.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("UserId ${lists[index].userId}"),
                    Text("Id ${lists[index].id}"),
                    Text("Body ${lists[index].body}"),
                    Text("Title ${lists[index].title}"),
                    TextButton(
                        onPressed: () {
                          int? id = lists[index].id;
                          _deleteUser(id!);
                        },
                        child: const Text("Delete"))
                  ],
                ),
              );
            },
          );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _deleteUser(int id) {
    context.read<UserBloc>().add(DeleteUser(id));
  }
}
