import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository.dart';
import 'detail.dart';
import 'model.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ujian Akhir Semester',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Al-Quran Indonesia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Blog> LisBlog = [];
  Repository repository = Repository();
  getData() async {
    LisBlog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            widget.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(50),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    leading: const Icon(
                      Icons.chrome_reader_mode_rounded,
                      color: const Color.fromARGB(255, 243, 243, 243),
                      size: 50,
                    ),
                    title: Text(
                      LisBlog[index].nama,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      LisBlog[index].arti,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => Detail(
                                    arti: LisBlog[index].arti,
                                    asma: LisBlog[index].asma,
                                    audio: LisBlog[index].audio,
                                    keterangan: LisBlog[index].keterangan,
                                    nama: LisBlog[index].nama,
                                  )));
                    },
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: LisBlog.length,
      ),
    );
  }
}
