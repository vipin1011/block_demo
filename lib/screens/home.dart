import 'package:dummy_bloc/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Dashboard"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),

          SizedBox(width: MediaQuery.of(context).size.width,),
          Text('Click below button to Load data from api'),
          ElevatedButton(
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen()));
              },
              child: Text("Fetch Dummy Api")),
          Spacer(),
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(child: Container(
                  height: 60.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Demo Api - '),
                    ],
                  ),
                )),
                WidgetSpan(
                    child: Container(
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () async {
                            final String url = 'https://fakestoreapi.com/products'; // Replace with your desired URL
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              throw 'Could not launch $url';
                            }
                          }, child: Text('https://fakestoreapi.com/products'),),
                        ],
                      ),
                    ))
              ]
            )
          ),
          Spacer(),
        ],
      ),
    );
  }
}
