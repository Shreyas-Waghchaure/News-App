import 'package:flutter/material.dart';
import 'package:news_app/Model/article_model.dart';
import 'package:news_app/Pages/single_news_page.dart';
import 'package:news_app/Services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NewsApiModel>? newsList;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print('List is empty');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF2C394B),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C394B),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                color: const Color(0xFFFF4C29),
                child: const Text(
                  'TECH',
                  style: TextStyle(color: Colors.white, backgroundColor: Color(0xFFFF4C29)),
                )),
            const Text(' NEWS',
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: isLoading
          ? Center(
            child: Container(
                child: CircularProgressIndicator(color: Color(0xFFFF4C29),),
              ),
          )
          : ListView.builder(
            itemCount: newsList!.length,
            itemBuilder: (context, index) {
              return listItems(size, newsList![index]);
            },
          ),
    );
  }
  Widget listItems(Size size, NewsApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   NewsArticle(model: model) ));
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
              color: Color(0xFF334756),
              borderRadius: BorderRadius.circular(22)
          ),
          child: Column(
            children: [
              Container(
                child: model.imageUrl != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(22.0),topLeft: Radius.circular(22)),
                  child: Image.network(
                    model.imageUrl!,
                    fit: BoxFit.fill,
                  ),
                )
                    : Text("Cant Load image"),
              ),
              Container(
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.Description!,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

