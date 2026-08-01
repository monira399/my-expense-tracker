import 'package:expense_tracker/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentIncomeCard extends StatelessWidget {
  final String title;
  final int amount;
  final Color color;
  final String date;
  final IconData icon;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? fontColor;
  final Color? iconColor;
  final double? iconSize;

  const CurrentIncomeCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    this.height,
    this.width,
    this.fontSize, this.fontColor, this.iconSize, this.iconColor, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style:GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500
              ) ,),
              Text('৳ ${amount.toString()}', style: GoogleFonts.poppins(
                fontSize: fontSize ?? 20,
                fontWeight: FontWeight.bold,
                color: fontColor ?? Colors.black
              ),),
              Text(date,style: GoogleFonts.poppins(
                  fontSize:20,
                  color: fontColor ?? Colors.black
              ),)
            ],
          ),
          CircleAvatar(
            radius: 45,
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize ?? 15,

            ),
          )
        ],
      )
    );
  }
}
