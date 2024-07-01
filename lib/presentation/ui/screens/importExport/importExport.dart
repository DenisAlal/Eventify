part of presentation;

class ImportExportScreen extends StatefulWidget {
  const ImportExportScreen({Key? key}) : super(key: key);

  @override
  State<ImportExportScreen> createState() => _ImportExportScreenState();
}

class _ImportExportScreenState extends State<ImportExportScreen> {
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
            Center(child: Text('importExport')),
          ],
        ),
      ),
    );
  }
}
