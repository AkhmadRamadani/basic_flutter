import 'package:flutter/material.dart';
import 'package:flutter_simple_ui/pemain_model.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<PemainModel> pemain = [
    PemainModel(
      nama: 'Kai Havertz',
      foto: 'assets/havertz.webp',
    ),
    PemainModel(
      nama: 'Kepa Arrizabalaga',
      foto: 'assets/kepa.jpeg',
    ),
    PemainModel(
      nama: 'Mason Mount',
      foto: 'assets/masemount.jpeg',
    ),
    PemainModel(
      nama: 'Christian Pulisic',
      foto: 'assets/pulisic.webp',
    ),
    PemainModel(
      nama: 'Raheem Sterling',
      foto: 'assets/raheemsterling.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: const [
                Expanded(
                  child: Center(
                    child: Text('Berita Terbaru'),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Pertandingan Hari Ini'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Row(
              children: [
                for (var item in pemain) ...[
                  Expanded(
                    child: Image.asset(
                      '${item.foto}',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ]
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: const Center(
              child: Text(
                '5 Pemain Chelsea Yang Paling Ditunggu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListView.separated(
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      pemain[index].foto ?? '',
                      height: 1,
                      // width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      '${index + 1}' '. ' + (pemain[index].nama ?? ''),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: pemain.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
