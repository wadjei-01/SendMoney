import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sendmoney/theme/appcolors.dart';
import 'package:sendmoney/transactions/model/transaction_model.dart';

//Container displaying a transaction
Padding transactionContainer(TransactionModel transaction) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: IntrinsicHeight(
      child: Container(
        width: 345.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1.sp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              DateFormat('hh:mm a').format(transaction.dateTime),
              style: GoogleFonts.nunito(
                  fontSize: 12.sp,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 39.r,
                  width: 39.r,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: Image.asset(transaction.recipientImage),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 169.w,
                              child: Text(
                                transaction.recipientName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.nunitoSans(fontSize: 14.sp),
                              )),
                          transaction.isSuccessful == true
                              ? successContainer(transaction)
                              : failedContainer(transaction),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            transaction.recipientPhone,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 14.sp, color: AppColors.darkGrey),
                          ),
                          Text(
                            "GHS ${transaction.amountPaid.toInt()}",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              color: AppColors.lightGrey,
              thickness: 1.sp,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25.r,
                      width: 25.r,
                      decoration: BoxDecoration(
                          color: HexColor('#BEBCEF'),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: HexColor('#7A79DF'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      transaction.senderName,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 4.5.r,
                      height: 4.5.r,
                      decoration: BoxDecoration(
                          color: AppColors.darkGrey,
                          borderRadius: BorderRadius.circular(2.25.r)),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(transaction.senderMsg,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 12.sp,
                        ))
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    ),
  );
}

Container successContainer(TransactionModel transaction) {
  return Container(
    width: 89.w,
    height: 26.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13.r),
      color: AppColors.successBG,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SvgPicture.asset('assets/icons/success_tick.svg'),
        Text(
          'Successful',
          style: TextStyle(color: AppColors.success, fontSize: 10.sp),
        )
      ]),
    ),
  );
}

Container failedContainer(TransactionModel transaction) {
  return Container(
    width: 66.44.w,
    height: 26.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13.r),
      color: AppColors.failedBG,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SvgPicture.asset('assets/icons/failed_cross.svg'),
        Text(
          'Failed',
          style: TextStyle(color: AppColors.failed, fontSize: 10.sp),
        )
      ]),
    ),
  );
}

Container dateContainer(TransactionModel currentTransaction) {
  return Container(
    margin: EdgeInsets.only(top: 32.h),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
    alignment: Alignment.center,
    height: 26.h,
    decoration: BoxDecoration(
        color: AppColors.lightGrey, borderRadius: BorderRadius.circular(13.r)),
    child: Text(
      DateFormat('MMM dd, yyyy').format(currentTransaction.dateTime),
      style: GoogleFonts.nunito(
          fontSize: 10.sp,
          color: AppColors.darkGrey,
          fontWeight: FontWeight.w800),
    ),
  );
}

Row searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 296.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.lightGrey,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: GoogleFonts.nunitoSans(
                fontSize: 14.sp, color: AppColors.darkGrey),
            prefixIcon: SizedBox(
              height: 40.r,
              width: 40.r,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
      SizedBox(
        width: 4.w,
      ),
      InkWell(
          //method to navigate to filter goes here
          onTap: () {
            print('Open');
          },
          borderRadius: BorderRadius.circular(20.r),
          child: SvgPicture.asset('assets/icons/filter.svg'))
    ],
  );
}
