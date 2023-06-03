import 'dart:io';
import 'package:flutter/material.dart';
import 'package:peaapp/module/books/pdf_viewer_page.dart';
import 'package:peaapp/module/books/sensitive_book.dart';

class SuggestedBooks extends StatefulWidget {
  const SuggestedBooks({Key key}) : super(key: key);

  @override
  _SuggestedBooksState createState() => _SuggestedBooksState();
}

class _SuggestedBooksState extends State<SuggestedBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              InkWell(
                onTap: ()async {
                  // final url = 'narcissistic.pdf';
                  // final file = await PDFApi.loadFirebase(url);
                  //
                  // if (file == null) return;
                  // openPDF(context, file);
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/narcissistic.jpg')),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child:
                          Text('The Handbook Of Narcissism And Narcissistic Personality Disorder',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: ()async {
                  // final url = 'sensitive.pdf';
                  // final file = await PDFApi.loadFirebase(url);
                  //
                  // if (file == null) return;
                  // openPDF(context, file);
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/sensitive.jpg')),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child:
                          Text('The Highly Sensitive Brain ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: ()async {
                  // final url = 'social.pdf';
                  // final file = await PDFApi.loadFirebase(url);
                  //
                  // if (file == null) return;
                  // openPDF(context, file);
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/social.jpg')),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child:
                          Text('Handbook Of Child Psychology',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // void openPDF(BuildContext context, File file) => Navigator.of(context).push(
  //   MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  // );
}
