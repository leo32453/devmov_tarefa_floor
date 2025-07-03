import 'package:flutter/material.dart' as main_page;

import '../../l10n/app_localizations.dart';
import '../../viewmodels/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends main_page.StatefulWidget {
  const MainPage({super.key});

  @override
  main_page.State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends main_page.State<MainPage> {

  @override
  // void initState() {
  //   super.initState();
  //
  //   MainViewModel viewModel = Provider.of<MainViewModel>(context, listen: false);
  //   viewModel.addListener(() {
  //     if (viewModel.isLoading) {
  //       main_page.showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (_) => LoadingDialog()
  //       );
  //     } else {
  //       if (main_page.Navigator.of(context).canPop()) {
  //         main_page.Navigator.of(context).pop();
  //       }
  //     }
  //   });
  // }
  
  @override
  main_page.Widget build(main_page.BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);

    return main_page.Scaffold(
      appBar: main_page.AppBar(
        backgroundColor: main_page.Theme.of(context).colorScheme.inversePrimary,
        title: main_page.Text(AppLocalizations.of(context)!.main_page),
      ),
      body: main_page.Center(
        child: main_page.Column(
          children: [
            main_page.SizedBox(height: 10),
            main_page.TextFormField(
              controller: viewModel.nameController,
              decoration: main_page.InputDecoration(
                labelText: AppLocalizations.of(context)!.name,
                border: main_page.OutlineInputBorder(),
              ),
            ),
            main_page.SizedBox(height: 10),
            main_page.TextFormField(
              controller: viewModel.ageController,
              decoration: main_page.InputDecoration(
                labelText: AppLocalizations.of(context)!.age,
                border: main_page.OutlineInputBorder(),
              ),
            ),
            main_page.SizedBox(height: 10),
              main_page.FilledButton(
                onPressed: () => viewModel.addUser(),
                child: main_page.Text(AppLocalizations.of(context)!.add),
              ),
            main_page.SizedBox(height: 10),
            main_page.Expanded(
              child: main_page.ListView.builder(
                itemCount: viewModel.persons.length,
                itemBuilder: (context, index) {
                  return PersonCard(
                      name: viewModel.persons[index].name,
                      age: viewModel.persons[index].age);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonCard extends main_page.StatelessWidget {
  final String name;
  final String age;

  const PersonCard({
    super.key,
    required this.name,
    required this.age,
  });

  @override
  main_page.Widget build(main_page.BuildContext context) {
    return main_page.Container(
      decoration: main_page.BoxDecoration(
        border: main_page.Border.all(color: main_page.Colors.black38),
      ),
      child: main_page.ListTile(
        title: main_page.Text("Name: $name, Age: $age"),
      ),
    );
  }
}