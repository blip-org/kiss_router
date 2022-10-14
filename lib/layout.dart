part of kiss_router;

class KissLayout extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;
  final bool showBottomNavBar;
  const KissLayout({
    Key? key,
    required this.body,
    required this.appBar,
    this.showBottomNavBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: showBottomNavBar ? null : null,
    );
  }
}
