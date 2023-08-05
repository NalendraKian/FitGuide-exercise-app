import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/UI/views/detailed_exercise.dart';
import 'package:fitguide_exercise/UI/view_models/exercise_view_model.dart';
import 'package:fitguide_exercise/widgets/filter/exercise_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchQuery = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExerciseViewModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExerciseViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Provider.of<ExerciseViewModel>(context, listen: false)
                        .getAllExercises();
                    Navigator.pop(context);
                  },
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
              child: Text(
                'Find an Exercise',
                style: TextStyle(
                  fontSize: 26,
                  color: quinaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 24),
            buildSearch(),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: FilterExercise(exerciseName: searchQuery),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Text(
                'Result for $searchQuery',
                style: TextStyle(
                  fontSize: 26,
                  color: quinaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            provider.searchExercise.isNotEmpty
                ? showSearchExercise()
                : Center(child: getNoResult(provider.error)),
            nextAndPreviousButton(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget getNoResult(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
        child: Text(
          'No Matching Result',
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
    final provider = Provider.of<ExerciseViewModel>(context, listen: false);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: provider.searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
              onPressed: () async {
                await provider.getSearch(provider.searchController.text);
                if (provider.searchController.text == '') {
                  provider.searchController.text = "all exercise";
                }
                searchQuery = provider.searchController.text;
                setState(() {});
                provider.searchController.clear();
              },
              icon: Icon(
                Icons.search,
                color: primaryColor,
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

  Consumer<ExerciseViewModel> showSearchExercise() {
    return Consumer<ExerciseViewModel>(builder: (context, provider, _) {
      final provider = Provider.of<ExerciseViewModel>(context, listen: false);

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: provider.searchExercise.length,
            itemBuilder: (_, index) {
              final searchExercise = provider.searchExercise[index];
              return GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        DetailedExercise(
                      name: searchExercise.name,
                      type: searchExercise.type,
                      difficulty: searchExercise.difficulty,
                      equipment: searchExercise.equipment,
                      instructions: searchExercise.instructions,
                      muscle: searchExercise.muscle,
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: Column(
                      children: [
                        const Image(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/2827392/pexels-photo-2827392.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            searchExercise.name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }

  Widget nextAndPreviousButton() {
    final provider = Provider.of<ExerciseViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () async {
            provider.offset = provider.offset - 10;
            provider.getNextSearch(
                provider.searchController.text, provider.offset);
            setState(() {});
          },
          child: Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              'Previous',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: quinaryColor,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          onPressed: () async {
            provider.offset = provider.offset + 10;
            provider.getNextSearch(
                provider.searchController.text, provider.offset);
            setState(() {});
          },
          child: Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              'Next',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: quinaryColor,
              ),
            ),
          ),
        ),
      ],
    );
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
