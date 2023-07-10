import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/UI/views/detailed_exercise.dart';
import 'package:fitguide_exercise/UI/view_models/exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExerciseViewModel>(context, listen: false);
    });
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExerciseViewModel>(context, listen: false);
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
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<ExerciseViewModel>(context, listen: false)
                        .getAllExercises();
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find an Exercise',
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
                'With Filter (Coming Soon)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 24),
            buildSearch(),
            const SizedBox(height: 12),
            buildFilter(),
            provider.searchExercise.isNotEmpty
                ? showSearchExercise()
                : getNoResult(provider.error),
            const SizedBox(height: 12),
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
          error,
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
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: provider.searchController,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () async {
                provider.getSearch(provider.searchController.text);
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

  Widget buildFilter() {
    final provider = Provider.of<ExerciseViewModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Difficulty',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: quinaryColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: () async {
                  const String difficulty = 'Beginner';
                  provider.getFilterSearch(
                      provider.searchController.text, difficulty);
                },
                child: Container(
                  height: 35,
                  width: 80,
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
                    'Beginner',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: quinaryColor,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  const String difficulty = 'Intermediate';
                  provider.getFilterSearch(
                      provider.searchController.text, difficulty);
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
                    'Intermediate',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: quinaryColor,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  const String difficulty = 'Expert';
                  provider.getFilterSearch(
                      provider.searchController.text, difficulty);
                },
                child: Container(
                  height: 35,
                  width: 80,
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
                    'Expert',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: quinaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
        MaterialButton(
          onPressed: () async {
            provider.offset = provider.offset - 10;
            provider.getNextSearch(
                provider.searchController.text, provider.offset);
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
        MaterialButton(
          onPressed: () async {
            provider.offset = provider.offset + 10;
            provider.getNextSearch(
                provider.searchController.text, provider.offset);
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
