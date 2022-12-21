import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module17_resources/update_user_form.dart';
import 'package:bootcamp_material/material/module17_resources/user_model.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({super.key});

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  late Color avacol;

  late Future<List<UserModel>> usersData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersData = getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    return Container(
        child: FutureBuilder<List<UserModel>>(
      future: usersData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.data?[index].gender == 0) {
                avacol = Colors.purple;
              } else {
                avacol = Colors.amber;
              }
              return ListTile(
                leading: CircleAvatar(
                    backgroundColor: avacol,
                    radius: 25,
                    child: Center(
                      child: Text(
                        "${snapshot.data?[index].firstname[0]}${snapshot.data?[index].lastname[0]}"
                            .toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )),
                title: Text(
                  "${snapshot.data?[index].firstname} ${snapshot.data?[index].lastname}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                subtitle: (snapshot.data?[index].email != null)
                    ? Text(
                        "${snapshot.data?[index].email}",
                        style: TextStyle(color: Colors.grey),
                      )
                    : Text(""),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == "edit") {
                      Navigator.pushNamed(context, "/updateuser",
                          arguments: snapshot.data![index]);
                    }
                    if (value == "delete") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete"),
                            content: Text("Are you sure delete this item?"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () async {
                                    await deleteUser(snapshot.data![index].id);
                                    Navigator.pushNamed(context, "/");
                                  },
                                  child: Text("Yes")),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("No"))
                            ],
                          );
                        },
                      );
                    }
                    ;
                  },
                  itemBuilder: (context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text("edit"),
                        value: "edit",
                        onTap: () {},
                      ),
                      PopupMenuItem(
                        child: Text("delete"),
                        value: "delete",
                        onTap: () {},
                      )
                    ];
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: const CircularProgressIndicator());
      },
    ));
  }
}
