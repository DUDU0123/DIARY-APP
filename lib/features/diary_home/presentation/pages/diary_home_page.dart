// import 'package:diary_app/features/diary_home/presentation/widgets/diary_home_small_widgets.dart';
// import 'package:flutter/material.dart';

// class DiaryHomePage extends StatelessWidget {
//   const DiaryHomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: diaryHomeAppBarTitle(),
//         actions: [
//           userProfileNavigateIcon(),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../widgets/diary_search_field.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC0CB), // Light pink background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Home', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNewDiaryButton(),
            SizedBox(height: 16),
            DiarySearchField(),
            SizedBox(height: 16),
            Text('Recents', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildDiaryEntry('May 27\'22 Friday', Colors.pink[100]!, Icons.local_florist),
            SizedBox(height: 8),
            _buildDiaryEntry('May 26\'22 Thursday', Colors.green[100]!, Icons.local_florist),
            SizedBox(height: 8),
            _buildDiaryEntry('May 25\'22 Wednesday', Colors.blue[100]!, Icons.favorite),
            SizedBox(height: 8),
            _buildDiaryEntry('May 24\'22 Tuesday', Colors.red[100]!, Icons.sentiment_satisfied_alt),
          ],
        ),
      ),
    );
  }

  Widget _buildNewDiaryButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Write a New diary', style: TextStyle(fontSize: 16)),
          Icon(Icons.edit, color: Colors.purple),
        ],
      ),
    );
  }

  
  Widget _buildDiaryEntry(String date, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.red),
              SizedBox(width: 8),
              Text(date, style: TextStyle(fontSize: 16)),
            ],
          ),
          Icon(Icons.chevron_right, color: Colors.black54),
        ],
      ),
    );
  }
}