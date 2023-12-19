import 'package:eyeq/controllers/utils/app_colors.dart';
import 'package:eyeq/controllers/utils/common_functions.dart';
import 'package:eyeq/views/widgets/primary_card.dart';
import 'package:flutter/material.dart';

class ExamineScreen extends StatefulWidget {
  final List<Map<String, dynamic>> quiz;
  const ExamineScreen({
    super.key,
    required this.quiz,
  });

  @override
  State<ExamineScreen> createState() => _ExamineScreenState();
}

class _ExamineScreenState extends State<ExamineScreen> {
  int activeIndex = 0;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Color Blindness Test",
                style: CommonFunctions.largeTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.05),
              Text(
                widget.quiz[activeIndex]['question'],
                style: CommonFunctions.mediumTextStyle.copyWith(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.05),
              Image.asset(widget.quiz[activeIndex]['image']),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.quiz[activeIndex]['options'].map<Widget>((e) {
                  return PrimaryCard(
                    cardColor: selectedAnswer != null && selectedAnswer == e
                        ? AppColors.primaryColor
                        : Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 25.0,
                    ),
                    child: Text(
                      e,
                      style: CommonFunctions.mediumTextStyle.copyWith(
                        color: selectedAnswer != null && selectedAnswer == e
                            ? Colors.white
                            : AppColors.primaryColor,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.textLightColor.withOpacity(0.5),
                    value: 0.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
