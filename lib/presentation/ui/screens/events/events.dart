part of presentation;

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BaseScaffold(
          backgroundColor: AppColors.anthraciteGray,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Center(child: Text('events')),
            ],
          ),
        ),
    );
  }
}
