import 'package:el_emegim/dao/firebase.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_emegim/core/colors.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _MastersPageState createState() => _MastersPageState();
}

class _MastersPageState extends State<Favorites> {

  // FirebaseFirestore.instance.collection('Yemekler').snapshots();
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('Yemekler').doc("Tuzlu_yemekler").collection("tuzlu_yemekler").snapshots();



  @override
  Widget build(BuildContext context) {
    // return Container(child: Text("deneme"),);
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Someting wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Something went wrong');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var veri = snapshot.data!.docs[index].data() as Map;
              var deneme = veri["name"];
              print("geliyor");
              print(veri);
              print(deneme);
              return Card(
                //ünvanları aldığımız deneme
                //title: Text("${deneme.toString()}"),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(6),
                borderOnForeground: true,
                elevation: 25,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                semanticContainer: true,
                color: color9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //network den resim çekiyoruz.
                          // child: Image.network('${veri["Resim"]}'),
                          child: Image.network('${veri["image"]}'),
                          // child: Image.network('https://pixabay.com/get/gc89424e721f701a0cfa974d65272f80c7fc3891f4fdc7f4c745c33eded2a47feee22d145bd677612c8ff8dc0e5fc1f6a83b986df1faaf5bf76ff356093b3d77c67350547bee613aa51bc61024ab9db5c_1920.jpg'),

                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                  child: Text(
                                    "${veri["name"]}",
                                    style: TextStyle(fontSize: 16),
                                  )),
                              color: color7,
                              height:
                              MediaQuery.of(context).size.height * 0.050,
                            ),
                            Divider(
                              height:
                              MediaQuery.of(context).size.height * 0.005,
                            ),
                            /*Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              actions: [
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.face,
                                ),
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.face,
                                ),
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.phone_in_talk,
                                ),
                              ],
                              child: Container(
                                child: ListTile(
                                    title: Text(
                                      "${veri["Adres"]}",
                                      style: TextStyle(fontSize: 10),
                                    )),
                                color: bg2Color,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    // padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        flex: 15,
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: "Telefon ",
                                      style: TextStyle(fontSize: 13),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.phone_in_talk_sharp,
                                            size: 20,
                                            color: bg2Color,
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.17,
                              height: MediaQuery.of(context).size.height * 0.030,
                              color: color7,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Harita ",
                                      style: TextStyle(fontSize: 13),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.map,
                                            size: 20,
                                            color: color6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.17,
                                height:
                                MediaQuery.of(context).size.height * 0.030,
                                color: color7,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Web ",
                                      style: TextStyle(fontSize: 13),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.web_outlined,
                                            size: 20,
                                            color: color5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.17,
                                height:
                                MediaQuery.of(context).size.height * 0.030,
                                color: color7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

Widget buildFile(BuildContext context, FirebaseFile file) {
  return ListTile(
    //resimleri indirme=image network
    //oval şekle getirme =ClipOval
    leading: ClipOval(
      child: Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
    ),

    // ilk text alanı tanımlandı. Tüm resimlerin sadece isim ve uzantılarını text halinde alıyor.
    title: Text(
      file.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
  );
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(15),
        borderOnForeground: true,
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        semanticContainer: true,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.asset('assets/services/Can Oto Servis.jpg'),
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: Column(children: [
                  Container(
                    child: Center(child: Text("absürWD")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absQQWDQWASDQWDQWDW")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: Column(children: [
                  Container(
                    child: Center(child: Text("absürWD")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absQQWDQWASDQWDQWDW")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
