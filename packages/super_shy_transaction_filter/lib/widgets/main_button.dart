part of super_shy_transaction_filter;

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color = ConstantColors.primary,
    this.titleColor = ConstantColors.white,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final VoidCallback? onPressed;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
          elevation: MaterialStateProperty.all(2.0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: ConstantFontSize.meduimTitle,
                color: titleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
