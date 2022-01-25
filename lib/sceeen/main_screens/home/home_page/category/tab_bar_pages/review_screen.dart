import 'package:evento_user/constants/constants.dart';
import 'package:evento_user/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[0],
                rating: sampleRating[0],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[1],
                rating: sampleRating[1],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[2],
                rating: sampleRating[2],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[3],
                rating: sampleRating[3],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[4],
                rating: sampleRating[4],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
              BuildReviewWidget(
                userText: sampleName[5],
                rating: sampleRating[5],
                contentText: dummyText,
                url: sampleProfileImageUrl2,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
