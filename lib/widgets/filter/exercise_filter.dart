import 'package:fitguide_exercise/UI/view_models/exercise_view_model.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterExercise extends StatefulWidget {
  String? exerciseName;

  FilterExercise({
    super.key,
    this.exerciseName,
  });

  @override
  State<FilterExercise> createState() => _FilterExerciseState();
}

class _FilterExerciseState extends State<FilterExercise> {
  String exerciseName = '';
  bool toggleType1 = false; //cardio
  bool toggleType2 = false; //olympic_weightlifting
  bool toggleType3 = false; //plyometrics
  bool toggleType4 = false; //powerlifting
  bool toggleType5 = false; //strength
  bool toggleType6 = false; //strecthing
  bool toggleType7 = false; //strongman

  bool toggleMuscle1 = false; //abdominals
  bool toggleMuscle2 = false; //abductors
  bool toggleMuscle3 = false; //adductors
  bool toggleMuscle4 = false; //biceps
  bool toggleMuscle5 = false; //calves
  bool toggleMuscle6 = false; //chest
  bool toggleMuscle7 = false; //forearms
  bool toggleMuscle8 = false; //glutes
  bool toggleMuscle9 = false; //hamstrings
  bool toggleMuscle10 = false; //lats
  bool toggleMuscle11 = false; //lower_back
  bool toggleMuscle12 = false; //middle_back
  bool toggleMuscle13 = false; //neck
  bool toggleMuscle14 = false; //quadriceps
  bool toggleMuscle15 = false; //traps
  bool toggleMuscle16 = false; //triceps

  bool toggleDifficulty1 = false; //beginner
  bool toggleDifficulty2 = false; //intermediate
  bool toggleDifficulty3 = false; //expert

  String exerciseType = '';
  String exerciseMuscle = '';
  String exerciseDifficulty = '';

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Filter',
          style: TextStyle(
            color: tertiaryColor,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          )),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              width: 70,
                              child: Divider(
                                height: 8,
                                thickness: 3,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Filter By',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Text(
                              'Type',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleType1
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType1
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType1 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType3 = false;
                                          toggleType4 = false;
                                          toggleType5 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType = "cardio";
                                          toggleType1 = !toggleType1;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType1 = !toggleType1;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Cardio",
                                      style: TextStyle(
                                        color: toggleType1
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.54,
                                  decoration: BoxDecoration(
                                    color: toggleType2
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType2
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType2 == false) {
                                        setState(() {
                                          toggleType1 = false;
                                          toggleType3 = false;
                                          toggleType4 = false;
                                          toggleType5 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType =
                                              "olympic_weightlifting";
                                          toggleType2 = !toggleType2;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType2 = !toggleType2;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Olympic Weightlifting",
                                      style: TextStyle(
                                        color: toggleType2
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleType3
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType3
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType3 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType1 = false;
                                          toggleType4 = false;
                                          toggleType5 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType = "plyometrics";
                                          toggleType3 = !toggleType3;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType3 = !toggleType3;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Plyometrics",
                                      style: TextStyle(
                                        color: toggleType3
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.54,
                                  decoration: BoxDecoration(
                                    color: toggleType4
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType4
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType4 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType3 = false;
                                          toggleType1 = false;
                                          toggleType5 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType = "powerlifting";
                                          toggleType4 = !toggleType4;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType4 = !toggleType4;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Powerlifting",
                                      style: TextStyle(
                                        color: toggleType4
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleType5
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType5
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType5 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType3 = false;
                                          toggleType4 = false;
                                          toggleType1 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType = "strength";
                                          toggleType5 = !toggleType5;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType5 = !toggleType5;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Strength",
                                      style: TextStyle(
                                        color: toggleType5
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleType6
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType6
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType6 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType3 = false;
                                          toggleType4 = false;
                                          toggleType5 = false;
                                          toggleType1 = false;
                                          toggleType7 = false;
                                          exerciseType = "stretching";
                                          toggleType6 = !toggleType6;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType6 = !toggleType6;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Stretching",
                                      style: TextStyle(
                                        color: toggleType6
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleType7
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleType7
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleType7 == false) {
                                        setState(() {
                                          toggleType2 = false;
                                          toggleType3 = false;
                                          toggleType4 = false;
                                          toggleType5 = false;
                                          toggleType6 = false;
                                          toggleType7 = false;
                                          exerciseType = "strongman";
                                          toggleType7 = !toggleType7;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseType = '';
                                            toggleType7 = !toggleType7;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Strongman",
                                      style: TextStyle(
                                        color: toggleType7
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Filter by Muscle
                            SizedBox(
                              height: 32,
                            ),
                            const Text(
                              'Muscles',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle1
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle1
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle1 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "abdominals";
                                          toggleMuscle1 = !toggleMuscle1;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle1 = !toggleMuscle1;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Abdominals",
                                      style: TextStyle(
                                        color: toggleMuscle1
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle2
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle2
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle2 == false) {
                                        setState(() {
                                          toggleMuscle1 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "abductors";
                                          toggleMuscle2 = !toggleMuscle2;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle2 = !toggleMuscle2;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Abductors",
                                      style: TextStyle(
                                        color: toggleMuscle2
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle3
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle3
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle3 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "adductors";
                                          toggleMuscle3 = !toggleMuscle3;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle3 = !toggleMuscle3;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Adductors",
                                      style: TextStyle(
                                        color: toggleMuscle3
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle4
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle4
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle4 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "biceps";
                                          toggleMuscle4 = !toggleMuscle4;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle4 = !toggleMuscle4;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Biceps",
                                      style: TextStyle(
                                        color: toggleMuscle4
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle5
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle5
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle5 == false) {
                                        setState(() {
                                          toggleMuscle1 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle2 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "calves";
                                          toggleMuscle5 = !toggleMuscle5;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle5 = !toggleMuscle5;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Calves",
                                      style: TextStyle(
                                        color: toggleMuscle5
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle6
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle6
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle6 == false) {
                                        setState(() {
                                          toggleMuscle3 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle2 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "chest";
                                          toggleMuscle6 = !toggleMuscle6;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle6 = !toggleMuscle6;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Chest",
                                      style: TextStyle(
                                        color: toggleMuscle6
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle7
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle7
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle7 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "forearms";
                                          toggleMuscle7 = !toggleMuscle7;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle7 = !toggleMuscle7;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Forearms",
                                      style: TextStyle(
                                        color: toggleMuscle7
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle8
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle8
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle8 == false) {
                                        setState(() {
                                          toggleMuscle1 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle2 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "glutes";
                                          toggleMuscle8 = !toggleMuscle8;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle8 = !toggleMuscle8;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Glutes",
                                      style: TextStyle(
                                        color: toggleMuscle8
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle9
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle9
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle9 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "hamstrings";
                                          toggleMuscle9 = !toggleMuscle9;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle9 = !toggleMuscle9;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Hamstrings",
                                      style: TextStyle(
                                        color: toggleMuscle9
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle10
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle10
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle10 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "lats";
                                          toggleMuscle10 = !toggleMuscle10;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle10 = !toggleMuscle10;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Lats",
                                      style: TextStyle(
                                        color: toggleMuscle10
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle11
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle11
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle11 == false) {
                                        setState(() {
                                          toggleMuscle1 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle2 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "lower_back";
                                          toggleMuscle11 = !toggleMuscle11;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle11 = !toggleMuscle11;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Lower Back",
                                      style: TextStyle(
                                        color: toggleMuscle11
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle12
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle12
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle12 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "middle_back";
                                          toggleMuscle12 = !toggleMuscle12;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle12 = !toggleMuscle12;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Middle Back",
                                      style: TextStyle(
                                        color: toggleMuscle12
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle13
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle13
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle13 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "neck";
                                          toggleMuscle13 = !toggleMuscle13;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle13 = !toggleMuscle13;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Neck",
                                      style: TextStyle(
                                        color: toggleMuscle13
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle14
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle14
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle14 == false) {
                                        setState(() {
                                          toggleMuscle1 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle2 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "quadriceps";
                                          toggleMuscle14 = !toggleMuscle14;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle14 = !toggleMuscle14;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Quadriceps",
                                      style: TextStyle(
                                        color: toggleMuscle14
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle15
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle15
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle15 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle10 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle16 = false;

                                          exerciseMuscle = "traps";
                                          toggleMuscle15 = !toggleMuscle15;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle15 = !toggleMuscle15;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Traps",
                                      style: TextStyle(
                                        color: toggleMuscle15
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleMuscle16
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleMuscle16
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleMuscle16 == false) {
                                        setState(() {
                                          toggleMuscle2 = false;
                                          toggleMuscle3 = false;
                                          toggleMuscle4 = false;
                                          toggleMuscle5 = false;
                                          toggleMuscle6 = false;
                                          toggleMuscle7 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle8 = false;
                                          toggleMuscle9 = false;
                                          toggleMuscle1 = false;
                                          toggleMuscle11 = false;
                                          toggleMuscle12 = false;
                                          toggleMuscle13 = false;
                                          toggleMuscle14 = false;
                                          toggleMuscle15 = false;
                                          toggleMuscle10 = false;

                                          exerciseMuscle = "triceps";
                                          toggleMuscle16 = !toggleMuscle16;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseMuscle = '';
                                            toggleMuscle16 = !toggleMuscle16;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Triceps",
                                      style: TextStyle(
                                        color: toggleMuscle16
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Filter by Difficulty
                            SizedBox(
                              height: 32,
                            ),
                            const Text(
                              'Difficulty',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleDifficulty1
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleDifficulty1
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleDifficulty1 == false) {
                                        setState(() {
                                          toggleDifficulty2 = false;
                                          toggleDifficulty3 = false;

                                          exerciseDifficulty = "beginner";
                                          toggleDifficulty1 =
                                              !toggleDifficulty1;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseDifficulty = '';
                                            toggleDifficulty1 =
                                                !toggleDifficulty1;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Beginner",
                                      style: TextStyle(
                                        color: toggleDifficulty1
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleDifficulty2
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleDifficulty2
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleDifficulty2 == false) {
                                        setState(() {
                                          toggleDifficulty1 = false;
                                          toggleDifficulty3 = false;

                                          exerciseDifficulty = "intermediate";
                                          toggleDifficulty2 =
                                              !toggleDifficulty2;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseDifficulty = '';
                                            toggleDifficulty2 =
                                                !toggleDifficulty2;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Intermediate",
                                      style: TextStyle(
                                        color: toggleDifficulty2
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  decoration: BoxDecoration(
                                    color: toggleDifficulty3
                                        ? primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1.5,
                                        color: toggleDifficulty3
                                            ? primaryColor
                                            : searchBarTextColor),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (toggleDifficulty3 == false) {
                                        setState(() {
                                          toggleDifficulty2 = false;
                                          toggleDifficulty1 = false;

                                          exerciseDifficulty = "expert";
                                          toggleDifficulty3 =
                                              !toggleDifficulty3;
                                        });
                                      } else {
                                        setState(
                                          () {
                                            exerciseDifficulty = '';
                                            toggleDifficulty3 =
                                                !toggleDifficulty3;
                                          },
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Expert",
                                      style: TextStyle(
                                        color: toggleDifficulty3
                                            ? whiteColor
                                            : blackColor,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                    // Save Filter
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primaryColor),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.read<ExerciseViewModel>().getFilterSearch(
                              exerciseName,
                              exerciseType,
                              exerciseMuscle,
                              exerciseDifficulty,
                            );
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
