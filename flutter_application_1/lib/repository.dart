// import 'dart:convert';
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;

// import 'model.dart';

// class Repository {
//   // final _baseUrl = 'https://booking.kai.id/api/stations2';

//   //final _baseUrl = 'https://newsapi.org/v2/top-headlines?country=id&apiKey=8630b7cbc7ce47dda57052ae1623fe22';

//   final _baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c/data';
//   // 'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json';
//   Future getData() async {
//     try {
//       final response = await http.get(Uri.parse(_baseUrl));
//       // final json = "[" + response.body + "]";
//       if (response.statusCode == 200) {
//         // Simpan file MP3 ke dalam file sementara
//       var tempDir = await getTemporaryDirectory();
//       var filePath = '${tempDir.path}/audio.mp3';
//       var file = File(filePath);
//       await file.writeAsBytes(response.bodyBytes);

//       // Memainkan file MP3 menggunakan package audioplayers
//       AudioPlayer audioPlayer = AudioPlayer();
//       audioPlayer.play(filePath, isLocal: true);
//         // final json = response.body;
//         print(response.body);
//         Iterable it = jsonDecode(response.body);
//         List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
//         return blog;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
import 'dart:convert';
// import 'dart:io';
// import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart'; // Tambahkan package path_provider

import 'model.dart';

class Repository {
  final _baseUrl = 'https://api.npoint.io/99c279bb173a6e28359c/data';

  Future<List<Blog>> getData() async {
    // Tambahkan tipe data kembalian Future<List<Blog>>
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Simpan file JSON ke dalam file sementara
        // var tempDir = await getTemporaryDirectory();
        // var filePath = '${tempDir.path}/data.json';
        // var file = File(filePath);
        // await file.writeAsString(response.body);

        // // Memainkan file MP3 menggunakan package audioplayers
        // AudioPlayer audioPlayer = AudioPlayer();
        // audioPlayer.play(filePath, isLocal: true);

        // Parsing data JSON dan mengembalikan List<Blog>
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Blog> blogList = jsonData.map((e) => Blog.fromJson(e)).toList();
        return blogList;
      }
    } catch (e) {
      print(e.toString());
    }

    return []; // Tambahkan kembalian default jika terjadi kesalahan
  }
}
