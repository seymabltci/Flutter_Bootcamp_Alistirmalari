import 'package:flutter/material.dart';
import 'package:odev3/renk.dart';

class WidgetDenemesi extends StatefulWidget {
  const WidgetDenemesi({super.key});

  @override
  State<WidgetDenemesi> createState() => _WidgetDenemesiState();
}

class _WidgetDenemesiState extends State<WidgetDenemesi> {
  var tfController = TextEditingController(); //metin alanının kontrolünü sağlayacak ve metin alanındaki girilen veriyi işlemek için kullanılacaktır.
  String alinanVeri = "";
  String resimAdi ="bike.png";
  bool switchKontrol = false;
  String mod = "Gece Modu";
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 50.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Widget Denemeleri"),
          backgroundColor: lila,
        ),
        body: Center(
          child: Column(
            children:  [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(alinanVeri),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: tfController,
                          decoration: const InputDecoration(hintText: "Veri"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          alinanVeri = tfController.text;
                        });
                      },
                      child: const Text("Veriyi Al"),
                    ),
                  ],
                ),
              ),


        const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
                ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("resimler/$resimAdi",
                  width: 70, // resim genişliği
                  height: 75, // resim yüksekliği
                ),
                ElevatedButton(onPressed: (){
                  //setStage sayfayi yeniden build eder. Onpressed ise tıklandıgındaki durum için kullanılır
                  setState(() { resimAdi = "book.png";});
                }, child: const Text("Kitap")),
                ElevatedButton(onPressed: (){
                  setState(() { resimAdi = "run.png";});
                }, child: const Text("Koşu")),
                ElevatedButton(onPressed: (){
                  setState(() { resimAdi = "sleep.png";});
                }, child: const Text("Uyku"))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 250,
            child: SwitchListTile(title:Text(mod),
                controlAffinity: ListTileControlAffinity.leading,
                value: switchKontrol,
                onChanged: (veri){
                  setState(() {
                    Text (mod);
                    switchKontrol = veri;
                    if(switchKontrol==false){
                      mod="Gece modu";
                    }
                    else{
                      mod="Gündüz Modu";
                    }
                  });
                }),
          ),
          SizedBox(width: 150,
            child: CheckboxListTile(title:const Text("Flutter"),
                controlAffinity: ListTileControlAffinity.leading,
                value: checkboxKontrol,
                onChanged: (veri){
                  setState(() {
                    checkboxKontrol = veri!;
                  });
                }),
          )
        ],
      ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
            ),
         Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 200,
          child: RadioListTile(
              title:const Text("Barcelona"),
              value: 1,
              groupValue: radioDeger,
              onChanged: (veri){
                setState(() {
                  radioDeger = veri!;});
                }),
              ),
        SizedBox(width: 200,
          child: RadioListTile(
              title:const Text("Real Madrid"),
              value: 2,
              groupValue: radioDeger,
              onChanged: (veri){
                setState(() {
                  radioDeger = veri!;});
              }),
        ),
      ],
    ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(onPressed: (){
                  //setStage sayfayi yeniden build eder. Onpressed ise tıklandıgındaki durum için kullanılır
                  setState(() { progressKontrol= true;});
                }, child: const Text("Başla")),
                Visibility(visible: progressKontrol, child: const CircularProgressIndicator()),
                ElevatedButton(onPressed: (){
                  setState(() { progressKontrol= false;});
                }, child: const Text("Bitir")),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
            ),
              Text(ilerleme.toInt().toString()),
              Slider(max:100.0, min:0.0, value: ilerleme, onChanged: (veri) {
                setState(() {
                  ilerleme = veri;
                });
              }),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 120,
                      child: TextField(controller: tfSaat, decoration: const InputDecoration(hintText: "Saat"),)),
                  IconButton(onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                        .then((value) {
                      tfSaat.text = "${value!.hour} : ${value.minute}";
                    });
                  }, icon: const Icon(Icons.access_time)),
                  SizedBox(width: 120,
                      child: TextField(controller: tfTarih, decoration: const InputDecoration(hintText: "Tarih"),)),
                  IconButton(onPressed: (){
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030))
                        .then((value) {
                      tfTarih.text = "${value!.day} / ${value.month} / ${value.year}";
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Text("-##-----##------##-----##-----##-----##----##----##-----##----"),
              ),
              DropdownButton(
                  value: secilenUlke,
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: ulkelerListesi.map((ulke) {
                    return DropdownMenuItem(value: ulke,child: Text(ulke),);
                  }).toList(),
                  onChanged: (veri){
                    setState(() {
                      secilenUlke = veri!;
                    });
                  }
              ),
              GestureDetector(
                  onTap: (){
                    print("Container tek tıkladınız");
                  },
                  onDoubleTap: (){
                    print("Container çift tıkladınız");
                  },
                  onLongPress: (){
                    print("Container üzerine uzun bastınız");
                  },
                  child: Container(width: 200,height: 50,color: pembe)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: (){
                  print("Switch durum : $switchKontrol");
                  print("Checkbox durum : $checkboxKontrol");
                  print("Radio durum : $radioDeger");
                  print("Slider durum : $ilerleme");
                  print("Ãœlke durum : $secilenUlke");
                }, child: const Text("Göster")),
              ),

            ]
        ),
    )
    );
  }
}
