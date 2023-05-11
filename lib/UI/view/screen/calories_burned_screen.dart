import 'package:fitguide_exercise/UI/constant/color.dart';
import 'package:fitguide_exercise/UI/view_model/calories_view_model.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CaloriesBurnedScreen extends StatefulWidget {
  const CaloriesBurnedScreen({super.key});

  @override
  State<CaloriesBurnedScreen> createState() => _CaloriesBurnedScreenState();
}

class _CaloriesBurnedScreenState extends State<CaloriesBurnedScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CaloriesViewModel>(context);
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'with extra stuffs coming soon',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 24),
            buildSearch(),
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
                provider.getSearchCalories(provider.searchController.text);
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.calories.length,
              itemBuilder: (_, index) {
                final resultCalories = provider.calories[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(resultCalories.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Calories Burned per hour : ${resultCalories.caloriesPerHour}'),
                      Text(
                        'Duration : ${resultCalories.durationMinutes}',
                      ),
                      Text(
                          'Total Calories Burned : ${resultCalories.totalCalories}'),
                    ],
                  ),
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
