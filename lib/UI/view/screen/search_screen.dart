// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fitguide_exercise/UI/view/screen/detailed_exercise.dart';
import 'package:fitguide_exercise/UI/view_model/exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExerciseViewModel>(context, listen: false).getSearch('');
    });
  }

  final formKey = GlobalKey<FormState>();
  // String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find an searchExercise',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'With Filter (Coming Soon)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 24),
              buildSearch(),
              SizedBox(height: 24),
              showSearchExercise(),
            ],
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: provider.searchController,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () async {
                provider.getSearch(provider.searchController.text);
              },
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
            ),
            hintText: 'Search...',
            suffixIcon: IconButton(
              onPressed: () {
                provider.searchController.clear();
              },
              icon: Icon(
                Icons.clear,
                color: Colors.blue,
              ),
            ),
            border: styleBorder(),
            enabledBorder: styleBorder(),
            focusedBorder: styleBorder(),
            disabledBorder: styleBorder(),
            contentPadding: EdgeInsets.symmetric(
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

  styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 2,
        color: Colors.black,
      ),
    );
  }

  Consumer<ExerciseViewModel> showSearchExercise() {
    return Consumer<ExerciseViewModel>(builder: (context, provider, _) {
      final modelView = Provider.of<ExerciseViewModel>(context, listen: false);

      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: modelView.searchExercise.length,
        itemBuilder: (_, index) {
          final searchExercise = modelView.searchExercise[index];
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
              padding: EdgeInsets.all(8),
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg"),
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
      );
    });
  }
}
