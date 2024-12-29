import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFListScreen extends StatelessWidget {
  final List<Map<String, String>> pdfList = [
    {
      'title': 'Nptel Iot Week 01',
      'url': 'https://drive.google.com/file/d/1YTUMYUVkzBx1gkTFUoZmV_RVWdTZOJEx/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 02',
      'url': 'https://drive.google.com/file/d/1rUFQ8D77d_1DndhQOehOCYeA_mKQJss2/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 03',
      'url': 'https://drive.google.com/file/d/1GggVbYyT4ab2uGVLUFtf72HXZAbflaVR/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 04',
      'url': 'https://drive.google.com/file/d/1GcqQKnNWS9huugh6Qrsa4WXHqaW_Ts7x/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 05',
      'url': 'https://drive.google.com/file/d/1WgfSizZ6AS4KC4EONSHqqeVSt47bbT14/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 06',
      'url': 'https://drive.google.com/file/d/1isR-xIIJSEiAWZRN9F8oKO17t2jLCgn5/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 07',
      'url': 'https://drive.google.com/file/d/1B5ciCLdJ7q8b9KsztlNDEJLhdB_9dF-a/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 08',
      'url': 'https://drive.google.com/file/d/1zvoEjnvj1l5ESZmVawaBsIU-3cdwcfHH/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 09',
      'url': 'https://drive.google.com/file/d/12wd85C4q8EmCH8PtUWvfVD2FCcg5i-zL/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 10',
      'url': 'https://drive.google.com/file/d/10YRn9EuRLlRtkWWsrYxACu0IiZIjG-Rv/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 11',
      'url': 'https://drive.google.com/file/d/1MKnOR4HOSBMhGEB6nV3VUrBQ4LXHn7JE/view?usp=drive_link'
    },
    {
      'title': 'Nptel Iot Week 12',
      'url': 'https://drive.google.com/file/d/17eK3nIY-jszmcLRgqktM0JSJdw2ChvrL/view?usp=drive_link'
    },
  ];

  Future<void> openPDF(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open PDF')),
      );
    }
  }

  Future<void> downloadPDF(String url) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: '/storage/emulated/0/Download',
        fileName: 'downloaded_pdf.pdf',
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      print('Storage permission denied.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('NPTEL IoT PDFs', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        child: ListView.builder(
          itemCount: pdfList.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.05,
                ),

                leading: GestureDetector(
                  onTap: () => openPDF(context, pdfList[index]['url']!),
                  child: Hero(
                    tag: pdfList[index]['title']!,
                    child: ClipOval(
                      child: Image.network(
                        'https://th.bing.com/th/id/OSK.HERO0Ke_Xhh9uP6fmblY4FpKGx-z4mGE4e7exXfZUl2crKM?rs=1&pid=ImgDetMain',
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  pdfList[index]['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.download, color: Colors.green, size: screenWidth * 0.07),
                  onPressed: () => downloadPDF(pdfList[index]['url']!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
