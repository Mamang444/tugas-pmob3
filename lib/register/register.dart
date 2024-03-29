import 'package:flutter/material.dart';
import 'package:mamang/login_interface/login.dart';
import 'package:mamang/service/list_users_service.dart';
import 'package:mamang/model/list_users_model.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  late String Username = "";
  late String Password = "";
  late String nama = "";
  late String nim = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Koprasi Undiksha'),
        //   centerTitle: true,
        //   backgroundColor: Colors.blue,
        // ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
            child: Column(children: [
              // SizedBox(height: 20),
              Container(
                child: Image.asset('images/logo.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Material(
                      // elevation: 10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Color(0xFF1C2474)),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 20),
                                TextField(
                                  onChanged: (value) {
                                    Username = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '  Username',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      contentPadding: EdgeInsets.all(1)),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  onChanged: (value) {
                                    Password = value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '  Password',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.all(1),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  onChanged: (value) {
                                    nama = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '  Nama',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.all(1),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  onChanged: (value) {
                                    nim = value;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '  NIM',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.all(1),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      ListUsersService _service =
                                          ListUsersService();
                                      bool cekregister =
                                          await _service.postRegister(
                                              Username, Password, nama, nim);
                                      if (cekregister) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
                                        );
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => register()),
                                        );
                                      }
                                    },
                                    child: Text("Daftar"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: StadiumBorder(),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()),
                                        );
                                      },
                                      child: Text(
                                        'Sudah Daftar?',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Lupa Password?',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  ],
                                )
                              ]))))
            ]),
          )),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Color.fromARGB(255, 13, 9, 124),
            height: 20,
            child: Text(
              'Copyright@2022 by Yandi Lesmana',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
