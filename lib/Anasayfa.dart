import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev3/renk.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("resimler/arkaplan.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 40 ,left: 15, right: 15 ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello Siddu",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Today you have 4 tasks.",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 25),
                        child: Row(

                          children: [
                            const Text(
                              "Pinned",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              "resimler/done2.png",
                              width: 25, // resim genişliği
                              height: 35, // resim yüksekliği
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 15, // İlk butondan önce boşluk
                          ),
                          SizedBox(
                            width: 150,
                            height: 180,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: lila,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Köşelerin yuvarlaklığı
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    "resimler/bike.png",
                                    width: 90,
                                    height: 95,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Cycling Around", style: TextStyle( fontWeight: FontWeight.bold)),
                                  ),
                                  const Text("8.00-11.00 AM")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30), // İki buton arasındaki boşluk
                          SizedBox(
                            width: 150,
                            height: 180,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: pembe,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // Köşelerin yuvarlaklığı
                                ),
                              ),
                              onPressed: () {},
                              child: Column(
                                children: [
                                  Image.asset(
                                    "resimler/run.png",
                                    width: 90,
                                    height: 95,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Feeding Run", style: TextStyle( fontWeight: FontWeight.bold)),
                                  ),
                                  const Text("4.00-5.00 PM")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width:20, // İkinci butondan sonra boşluk
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        hafta("Sun", "01"),
                          const SizedBox(width: 20,),
                        hafta("Sat", "02"),
                          const SizedBox(width: 20,),
                        hafta("Wed", "03"),
                          const SizedBox(width: 20,),
                        hafta("Sun", "04"),
                          const SizedBox(width: 20,),
                        hafta("Fri", "05"),
                        ],
                        ),
                      ),

                   Padding(
                     padding: const EdgeInsets.only(top: 18, bottom: 18),
                     child: Row(
                        children: [
                        const Text(
                          "All Task",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                          Image.asset(
                            "resimler/doc.png",
                            width: 20,
                            height: 25,
                          ),
                        ],
                      ),
                   ),
             Column(
              children: [
                task("Hobby Time", "7.00-9.30 AM", "resimler/hobby.png"),
                task("Reading Book", "10.00-11.00 PM", "resimler/book.png"),
                task("Playing Game", "12.00-1.00 AM", "resimler/game.png"),
                task("Sleeping Time", "1.00-7.00 AM", "resimler/sleep.png"),

              ]
             )
                    ],
                  ),
                ),
              ],
             ),
            );
          }
         }

  Widget hafta(String gun, String sayisi) {

    return SizedBox(
      width: 50,
      height: 55,

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: gri,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Köşelerin yuvarlaklığı
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(gun, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                Text(sayisi,style: const TextStyle(fontSize: 12),),
              ],
            ),
          ],
        ),
      ),
    );
  }


Widget task(String task, String zaman, String imagePath) {
  return SizedBox(
    width: 450,
    height: 90,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: gri,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Köşelerin yuvarlaklığı
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(task, style: const TextStyle( fontSize: 12, fontWeight: FontWeight.bold),),
                Text(zaman, style: const TextStyle(fontSize: 12,))
              ],
            ),
            Image.asset(imagePath, width: 90, height: 90),
          ],
        ),
      ),
    ),
  );
}

