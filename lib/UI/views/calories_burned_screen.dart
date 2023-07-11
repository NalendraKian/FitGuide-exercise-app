import 'package:fitguide_exercise/UI/views/login_screen.dart';
import 'package:fitguide_exercise/utils/animations/slide_animation.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/UI/view_models/calories_view_model.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:fitguide_exercise/widgets/buttons/button_full.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CaloriesBurnedScreen extends StatefulWidget {
  const CaloriesBurnedScreen({super.key});

  @override
  State<CaloriesBurnedScreen> createState() => _CaloriesBurnedScreenState();
}

class _CaloriesBurnedScreenState extends State<CaloriesBurnedScreen> {
  final formKey = GlobalKey<FormState>();
  late PreferencesUtils preferencesUtils;
  bool? loginStatus;

  void init() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      loginStatus = preferencesUtils.getPreferencesBool('loginStatus');
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CaloriesViewModel>(context, listen: false);
    });
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CaloriesViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('FitGuide'),
        actions: loginStatus == null || loginStatus == false
            ? [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 80,
                    child: ButtonFull(
                        title: 'Masuk',
                        color: whiteColor,
                        textColor: primaryColor,
                        borderColor: primaryColor,
                        press: () {
                          Navigator.push(
                            context,
                            SlideAnimation(page: const LoginScreen()),
                          );
                        }),
                  ),
                )
              ]
            : null,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search Calories Burned',
                    style: TextStyle(
                      fontSize: 26,
                      color: quinaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            buildSearch(),
            const SizedBox(height: 24),
            provider.calories.isNotEmpty ? showSearchCalories() : getNoResult(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget getNoResult() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
        child: Text(
          'Result not found',
          style: TextStyle(
            fontSize: 26,
            color: quinaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSearch() {
    final provider = Provider.of<CaloriesViewModel>(context, listen: false);
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: provider.searchController,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () async {
                // provider.calories.clear;
                await provider
                    .getSearchCalories(provider.searchController.text);
                setState(() {});
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            hintText: 'Search...',
            suffixIcon: IconButton(
              onPressed: () {
                provider.searchController.clear();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.blue,
              ),
            ),
            border: styleBorder(),
            enabledBorder: styleBorder(),
            focusedBorder: styleBorder(),
            disabledBorder: styleBorder(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            fillColor: Colors.blueGrey[100],
            filled: true,
          ),
        ),
      ),
    );
  }

  Consumer<CaloriesViewModel> showSearchCalories() {
    return Consumer<CaloriesViewModel>(builder: (context, provider, _) {
      final provider = Provider.of<CaloriesViewModel>(context, listen: false);

      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.calories.length,
              itemBuilder: (_, index) {
                final resultCalories = provider.calories[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(resultCalories.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Calories Burned per hour : ${resultCalories.caloriesPerHour}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Duration : ${resultCalories.durationMinutes}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Total Calories Burned : ${resultCalories.totalCalories}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            )
          ],
        ),
      );
    });
  }

  OutlineInputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.black,
      ),
    );
  }
}
