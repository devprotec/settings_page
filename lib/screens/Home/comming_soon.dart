import '../../util/exports.dart';

class ComingSoonPage extends StatelessWidget {
  final String text;
  const ComingSoonPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(text),
      ),
    );
  }
}