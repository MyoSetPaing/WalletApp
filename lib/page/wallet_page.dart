
import 'package:flutter/material.dart';
import 'package:wallet_app/const/string.dart';
import 'package:wallet_app/utils/randon_number.dart';
import '../widgets/custom_text_widget.dart';

class WalletPage extends StatelessWidget {
  final ScrollController? scrollController;

   WalletPage({this.scrollController,super.key});

  List<String> namelist= ['Myo Set Paing','Mg Mg','Alien'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextWidget(
                label: AppString.txtLinkedAccount,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: Text(
                      '${namelist[index]} | ${RandomNumber.randomCardNumberGenerator()}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text('${AppString.txtBalance} : ${RandomNumber.randomNumberGenerator()}',style: const TextStyle(color: Colors.black)),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


}


