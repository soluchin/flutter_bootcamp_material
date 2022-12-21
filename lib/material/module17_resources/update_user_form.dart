import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validators;
import 'package:bootcamp_material/material/module17_resources/user_model.dart';

class UpdateUserForm extends StatefulWidget {
  final UserModel oldValue;
  UpdateUserForm({super.key, required UserModel this.oldValue});

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  UserModel? data;
  String? fn;
  String? ln;
  String? email;
  int? gender = 1;

  List<String> _genders = ["wanita", "pria"];

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "${widget.oldValue.firstname}",
                  labelText: "nama depan"),
              onChanged: (newValue) {
                setState(() {
                  if (newValue == null) {
                    fn = widget.oldValue.firstname;
                  } else {
                    fn = newValue;
                  }
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "${widget.oldValue.lastname}",
                  labelText: "nama belakang"),
              onChanged: (newValue) {
                setState(() {
                  if (newValue == null) {
                    ln = widget.oldValue.lastname;
                  } else {
                    ln = newValue;
                  }
                });
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "${widget.oldValue.email}",
                  labelText: "email adress"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("gender:"),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return RadioListTile(
                  title: Text("${_genders[index]}"),
                  groupValue: gender,
                  value: index,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() async {
                    data = new UserModel(
                        id: widget.oldValue.id,
                        firstname:
                            (fn == null) ? widget.oldValue.firstname : fn!,
                        lastname: (ln == null) ? widget.oldValue.lastname : ln!,
                        email: (email == null) ? widget.oldValue.email : email!,
                        gender: gender!);
                    await updateUser(widget.oldValue.id, data!);
                    Navigator.pushNamed(context, "/");
                  });
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
