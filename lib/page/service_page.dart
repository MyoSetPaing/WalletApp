import 'package:flutter/material.dart';

import '../widgets/service_icon_widget.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  List<(IconData icon, String label)> serviceList = [
    (Icons.monetization_on, 'Topup'),
    (Icons.location_on, 'Near By'),
    (Icons.arrow_back, 'Cash In'),
    (Icons.arrow_forward, 'Cash out'),
    (Icons.history, 'History'),
    (Icons.request_page_outlined, 'Request'),
    (Icons.credit_card, 'Credit Card'),
    (Icons.card_giftcard, 'Gift Card'),
    (Icons.group, 'Group Deals'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // spacing between columns
      ),
      itemCount: serviceList.length,
      // total number of items
      itemBuilder: (context, index) {
        return ServiceIcon(data: serviceList[index],);
      },
    );
  }
}
