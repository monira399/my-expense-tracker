import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final String percentage;
  final String subTitle;

  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;

  final Color amountColor;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.percentage,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.amountColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.12),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Icon
          CircleAvatar(
            radius: 28,
            backgroundColor: iconBackgroundColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                Text(
                  '৳ ${amount.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: amountColor,
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      icon,
                      size: 12,
                      color: iconColor,
                    ),

                    const SizedBox(width:2),

                    Text(
                      percentage,
                      style: GoogleFonts.poppins(
                        color: iconColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(width: 2),

                    Expanded(
                      child: Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}