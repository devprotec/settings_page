import '../../../util/exports.dart';

class CoachCard extends StatelessWidget {
  final ProfesionalDataModel coach;
  const CoachCard({Key? key, required this.coach}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineLightblue90019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
    );
  }
}
