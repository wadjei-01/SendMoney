import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sendmoney/theme/appcolors.dart';
import 'package:sendmoney/transactions/components/components.dart';
import 'package:sendmoney/transactions/model/transaction_model.dart';
import 'model/mockdata.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ContainedTabBarView(
          tabs: [
            Text(
              'History',
            ),
            Text(
              'Transaction Summary',
              style: GoogleFonts.nunitoSans(
                fontSize: 14.sp,
              ),
            ),
          ],
          tabBarProperties: TabBarProperties(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black.withOpacity(0.2),
            unselectedLabelStyle: GoogleFonts.nunitoSans(
              fontSize: 14.sp,
            ),
            labelStyle: GoogleFonts.nunitoSans(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w800),
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 50.h, bottom: 18.h),
            indicator: ContainerTabIndicator(
              width: 168.w,
              radius: BorderRadius.circular(6.r),
              color: Colors.white,
            ),
            height: 103.h,
            background: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: 45.h, bottom: 13.h, left: 14.w, right: 14.w),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                ),
              ),
            ),
          ),
          views: [
            History(),
            Container(
                alignment: Alignment.center, child: Text('Nothing Here oo'))
          ],
        ),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var data;

  @override
  void initState() {
    delayData();
    super.initState();
  }

  Future<void> delayData() async {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        data = MockData.fetchData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 17.h,
            ),
            searchBar(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: FutureBuilder<List<TransactionModel>>(
                  // the fecthdata function retrieves the mock data created in the [MockData] class
                  future: data,
                  builder: (context, snapshot) {
                    //if there is an error found from fecthData, an error message would be shown to the user
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('There was an error'),
                      );
                    }

                    //if fetchData has data, the user's screen would be populated
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            // Get the current transaction
                            var currentTransaction = snapshot.data![index];

                            // Get the previous transaction
                            var previousTransaction =
                                index > 0 ? snapshot.data![index - 1] : null;

                            // Check if the current transaction's date is different from the previous transactions's date
                            bool showDate = previousTransaction == null ||
                                currentTransaction.dateTime.day !=
                                    previousTransaction.dateTime.day;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showDate == true
                                    ? IntrinsicWidth(
                                        child:
                                            dateContainer(currentTransaction),
                                      )
                                    : SizedBox(),
                                transactionContainer(snapshot.data![index]),
                              ],
                            );
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                    }
                  }),
            ),
          ]),
    );
  }
}
