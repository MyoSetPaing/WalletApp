import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_app/const/string.dart';
import 'package:wallet_app/page/wallet_page.dart';
import '../page/service_page.dart';
import '../widgets/balance_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  static const double minExtent = 0.14;
  static const double maxExtent = 1;
  double initialExtent = minExtent;
  final DraggableScrollableController _draggableScrollableController =
  DraggableScrollableController();
  BuildContext? draggableSheetContext;

  bool showLinkedAccount = false;
  bool showService = false;
  bool showCard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: LayoutBuilder(builder: (context, safeAreaSize) {
                  return DraggableScrollableActuator(
                    child: DraggableScrollableSheet(
                      minChildSize: minExtent,
                      maxChildSize: maxExtent,
                      initialChildSize: initialExtent,
                      controller: _draggableScrollableController,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        draggableSheetContext = context;
                        return Container(
                          color: Colors.white,
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: [
                              SliverPersistentHeader(
                                delegate: SliverAppBarDelegate(
                                  height: 120,
                                  TabWidget(
                                    onClickQR: ()=> _toggleDraggableScrollableSheet(),
                                    onClickWallet: () {
                                      setState(() {
                                        isExpanded = true;
                                        initialExtent = maxExtent;
                                        showLinkedAccount = true;
                                        showCard = true;
                                        showService = false;
                                        DraggableScrollableActuator.reset(draggableSheetContext!);
                                      });
                                    },
                                    onClickService: () {
                                      setState(() {
                                        isExpanded = true;
                                        initialExtent = maxExtent;
                                        showService = true;
                                        showLinkedAccount = false;
                                        showCard = false;
                                        DraggableScrollableActuator.reset(draggableSheetContext!);
                                      });
                                    },
                                  ),
                                ),
                                pinned: true,
                              ),
                              SliverPadding(
                                padding: EdgeInsets.all(12),
                                sliver: SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      AnimatedOpacity(
                                        // If the widget is visible, animate to 0.0 (invisible).
                                        // If the widget is hidden, animate to 1.0 (fully visible).
                                          opacity: showCard ? 1.0 : 0.0,
                                          duration: const Duration(milliseconds: 1000),
                                          child:
                                          Visibility(visible: showCard, child: BalanceWidget())),
                                      AnimatedOpacity(
                                        // If the widget is visible, animate to 0.0 (invisible).
                                        // If the widget is hidden, animate to 1.0 (fully visible).
                                        opacity: showLinkedAccount ? 1.0 : 0.0,
                                        duration: const Duration(milliseconds: 2000),
                                        child: Visibility(
                                          visible: showLinkedAccount,
                                          child: WalletPage(),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        // If the widget is visible, animate to 0.0 (invisible).
                                        // If the widget is hidden, animate to 1.0 (fully visible).
                                          opacity: showService ? 1.0 : 0.0,
                                          duration: const Duration(milliseconds: 2000),
                                          child: Visibility(
                                            visible: showService,
                                            child: ServicePage(),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }

  void _toggleDraggableScrollableSheet() {
    if (draggableSheetContext != null) {
      setState(() {
        initialExtent = isExpanded ? minExtent : maxExtent;
        isExpanded = !isExpanded;
      });
      DraggableScrollableActuator.reset(draggableSheetContext!);
    }
  }
}

class TabWidget extends StatefulWidget {
  final VoidCallback onClickWallet;
  final VoidCallback onClickService;
  final VoidCallback onClickQR;

  TabWidget(
      {required this.onClickWallet, required this.onClickService, required this.onClickQR , super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  double turnsWallet = 0.0;
  double turnsService = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    widget.onClickWallet(),
                    setState(
                          () => turnsWallet += 1,
                    )
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedRotation(
                            turns: turnsWallet,
                            duration: Duration(seconds: 1),
                            child: Icon(Icons.wallet)),
                        const Text(
                          AppString.txtWallet,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(),
                GestureDetector(
                  onTap: () => {
                    widget.onClickService(),
                    setState(
                          () => turnsService += 1,
                    )
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedRotation(
                          turns: turnsService,
                          duration: const Duration(seconds: 1),
                          child: const Icon(Icons.miscellaneous_services)),
                      const Text(
                        AppString.txtService,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: ()=> widget.onClickQR(),
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.qr_code_2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  double height;

  SliverAppBarDelegate(
      this.tabBar, {
        this.height = 120,
      });

  final Widget? tabBar;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 2,
      child: Container(
        color: Colors.grey,
        child: tabBar,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
