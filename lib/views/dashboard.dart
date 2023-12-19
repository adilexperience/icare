import 'package:eyeq/controllers/utils/app_colors.dart';
import 'package:eyeq/controllers/utils/common_functions.dart';
import 'package:eyeq/controllers/utils/local_assets.dart';
import 'package:eyeq/views/examine/examine_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<dynamic> items = [
    {
      "title": "Snellen chart",
      "image": LocalAssets.snellenChart,
    },
    {
      "title": "Color Blindness",
      "image": LocalAssets.colorBlindness,
      "quiz": [
        {
          "question": "What number do you see?",
          "image": LocalAssets.question1,
          "answer": "15",
          "options": ["15", "27", "74", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question2,
          "answer": "8",
          "options": ["25", "8", "74", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question3,
          "answer": "6",
          "options": ["25", "6", "74", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question4,
          "answer": "96",
          "options": ["25", "8", "96", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question5,
          "answer": "3",
          "options": ["25", "3", "74", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question6,
          "answer": "29",
          "options": ["25", "8", "29", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question7,
          "answer": "16",
          "options": ["25", "8", "74", "16"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question8,
          "answer": "27",
          "options": ["25", "8", "27", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question9,
          "answer": "57",
          "options": ["25", "8", "57", "90"]
        },
        {
          "question": "What number do you see?",
          "image": LocalAssets.question10,
          "answer": "5",
          "options": ["25", "5", "74", "90"]
        }
      ],
    },
    {
      "title": "Astigmatism",
      "image": LocalAssets.astigmatism,
    },
    {
      "title": "Recovery Exercises",
      "image": LocalAssets.exercises,
    },
    {
      "title": "Report History",
      "image": LocalAssets.history,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Home",
                    style: CommonFunctions.largeTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "It's time you start treating your eye. Examine your eye strength using tailored eye test and exercises.",
                    style: CommonFunctions.mediumTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.005,
              ),
              child: Text(
                "Select from following test:",
                style: CommonFunctions.mediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.005,
              ),
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> item = items[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: item['quiz'] != null
                          ? () => CommonFunctions.pushScreen(
                                context,
                                ExamineScreen(quiz: item['quiz']),
                              )
                          : null,
                      child: ListTile(
                        tileColor: AppColors.primaryColor.withOpacity(0.35),
                        title: Text(
                          item['title'],
                          style: CommonFunctions.mediumTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Image.asset(item['image']),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.02,
                          horizontal: width * 0.025,
                        ),
                        trailing: item['quiz'] != null
                            ? CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                child: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(height: height * 0.005)
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
