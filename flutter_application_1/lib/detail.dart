import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

class Detail extends StatelessWidget {
  final String? arti;
  final String? asma;
  final String? audio;
  final String? keterangan;
  final String? nama;

  const Detail({
    Key? key,
    this.arti,
    this.asma,
    this.audio,
    this.keterangan,
    this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mosque_outlined,
                      size: 50,
                    ),
                    Text(
                      '\t$nama',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('\t ($arti)'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$keterangan',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                Text('asma: $asma'),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.mic_none_outlined,
                          size: 20,
                          // color: Colors.yellow,
                        ),
                      ),
                      TextSpan(
                        text: '$audio',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
