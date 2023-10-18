import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VipDesktop extends StatefulWidget {
  const VipDesktop({super.key});

  @override
  State<VipDesktop> createState() => _VipDesktopState();
}

class _VipDesktopState extends State<VipDesktop> {
  late Future<Vipmodel> futureAlbum;
  Future<Vipmodel> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://earnusdt.shop/webapp/api/v1/vip-list'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body.toString());
      return Vipmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vip List"),
      ),
      body: FutureBuilder<Vipmodel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 207, 144, 232),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(4, 4))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 6.0, left: 5),
                                  child: Text(
                                    "Order Commission",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.grey.shade300,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "\$${snapshot.data!.data[index].usdt}",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 33,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 5),
                                  child: Text(
                                    snapshot.data!.data[index].level,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/pngtree-red-hot-button-label-sticker-fire-news-highlight-png-image_3417756-removebg-preview.png')),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child:
                                          Icon(Icons.lock, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}


// To parse this JSON data, do
//
//     final vipmodel = vipmodelFromJson(jsonString);



Vipmodel vipmodelFromJson(String str) => Vipmodel.fromJson(json.decode(str));

String vipmodelToJson(Vipmodel data) => json.encode(data.toJson());

class Vipmodel {
    String message;
    List<Datum> data;
    int status;

    Vipmodel({
        required this.message,
        required this.data,
        required this.status,
    });

    factory Vipmodel.fromJson(Map<String, dynamic> json) => Vipmodel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}

class Datum {
    String level;
    String dailytask;
    String singleprofit;
    String dailyprofit;
    String totalprofit;
    String usdt;
    int levelId;

    Datum({
        required this.level,
        required this.dailytask,
        required this.singleprofit,
        required this.dailyprofit,
        required this.totalprofit,
        required this.usdt,
        required this.levelId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        level: json["level"],
        dailytask: json["dailytask"],
        singleprofit: json["singleprofit"],
        dailyprofit: json["dailyprofit"],
        totalprofit: json["totalprofit"],
        usdt: json["usdt"],
        levelId: json["level_id"],
    );

    Map<String, dynamic> toJson() => {
        "level": level,
        "dailytask": dailytask,
        "singleprofit": singleprofit,
        "dailyprofit": dailyprofit,
        "totalprofit": totalprofit,
        "usdt": usdt,
        "level_id": levelId,
    };
}
