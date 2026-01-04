import 'package:flutter/material.dart';

void main() => runApp(HomePage());

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = const TextStyle(fontSize: 31);

//////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlutterLayoutArticle(<Example>[
    Example1(),
    Example2(),
    Example3(),
    Example4(),
    Example5(),
    Example6(),
    Example7(),
    Example8(),
    Example9(),
    Example10(),
    Example11(),
    Example12(),
    Example13(),
    Example14(),
    Example15(),
    Example16(),
    Example17(),
    Example18(),
    Example19(),
    Example20(),
    Example21(),
    Example22(),
    Example23(),
    Example24(),
    Example25(),
    Example26(),
    Example27(),
    Example28(),
    Example29(),
  ]);
}

//////////////////////////////////////////////////

abstract class Example extends StatelessWidget {
  String get code;

  String get explanation;
}

//////////////////////////////////////////////////

class FlutterLayoutArticle extends StatefulWidget {
  final List<Example> examples;

  FlutterLayoutArticle(this.examples);

  @override
  _FlutterLayoutArticleState createState() => _FlutterLayoutArticleState();
}

//////////////////////////////////////////////////

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    count = 1;
    code = Example1().code;
    explanation = Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    code = example.code;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Article',
      home: SafeArea(
        child: Material(
          color: Colors.black,
          child: FittedBox(
            child: Container(
              width: 400,
              height: 670,
              color: Color(0xFFCCCCCC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      child: widget.examples[count - 1],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.black,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < widget.examples.length; i++)
                            Container(
                              width: 58,
                              padding: const EdgeInsets.only(
                                left: 4.0,
                                right: 4.0,
                              ),
                              child: button(i + 1),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        key: ValueKey(count),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Center(child: Text(code)),
                              SizedBox(height: 15),
                              Text(
                                explanation,
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    height: 273,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(int exampleNumber) => Button(
    key: ValueKey("button$exampleNumber"),
    isSelected: this.count == exampleNumber,
    exampleNumber: exampleNumber,
    onPressed: () {
      showExample(
        exampleNumber,
        widget.examples[exampleNumber - 1].code,
        widget.examples[exampleNumber - 1].explanation,
      );
    },
  );

  void showExample(int exampleNumber, String code, String explanation) =>
      setState(() {
        this.count = exampleNumber;
        this.code = code;
        this.explanation = explanation;
      });
}

//////////////////////////////////////////////////

class Button extends StatelessWidget {
  final Key key;
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  Button({
    required this.key,
    required this.isSelected,
    required this.exampleNumber,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isSelected ? Colors.grey : Colors.grey[800],
      child: Text(
        exampleNumber.toString(),
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Scrollable.ensureVisible(
          context,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeOut,
          alignment: 0.5,
        );
        onPressed();
      },
    );
  }
}
//////////////////////////////////////////////////

class Example1 extends Example {
  final String code = "Container(color: red)";
  final String explanation =
      "屏幕是 Container 的父组件。"
      "它强制红色 Container 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Container 填满整个屏幕并全部变为红色。";

  @override
  Widget build(BuildContext context) {
    return Container(color: red);
  }
}

//////////////////////////////////////////////////

class Example2 extends Example {
  final String code = "Container(width: 100, height: 100, color: red)";
  final String explanation =
      "红色 Container 希望尺寸为 100x100，但无法实现，"
      "因为屏幕强制其与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Container 填满整个屏幕。";

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

//////////////////////////////////////////////////

class Example3 extends Example {
  final String code =
      "Center(\n"
      "   child: Container(width: 100, height: 100, color: red))";
  final String explanation =
      "屏幕强制 Center 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Center 填满整个屏幕。"
      "\n\n"
      "Center 告诉 Container 它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "现在 Container 确实可以是 100x100。";

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(width: 100, height: 100, color: red));
  }
}

//////////////////////////////////////////////////

class Example4 extends Example {
  final String code =
      "Align(\n"
      "   alignment: Alignment.bottomRight,\n"
      "   child: Container(width: 100, height: 100, color: red))";
  final String explanation =
      "此示例与前一示例不同之处在于使用 Align 而非 Center。"
      "\n\n"
      "Align 同样告诉 Container 它可以任意尺寸，但如果有空白空间，它不会将 Container 居中，"
      "而是将其对齐到可用空间的右下角。";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 300,
        height: 300,
        color: red,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text("123", style: TextStyle(color: Colors.yellow)),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example5 extends Example {
  final String code =
      "Center(\n"
      "   child: Container(\n"
      "              color: red,\n"
      "              width: double.infinity,\n"
      "              height: double.infinity))";
  final String explanation =
      "屏幕强制 Center 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Center 填满整个屏幕。"
      "\n\n"
      "Center 告诉 Container 它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "Container 希望是无限尺寸，但由于不能超过屏幕大小，它将只是填满屏幕。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: red,
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example6 extends Example {
  final String code = "Center(child: Container(color: red))";
  final String explanation =
      "屏幕强制 Center 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Center 填满整个屏幕。"
      "\n\n"
      "Center 告诉 Container 它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "由于 Container 没有子组件且没有固定尺寸，它决定尽可能大，因此填满整个屏幕。"
      "\n\n"
      "但为什么 Container 会这样决定？ "
      "仅仅是因为 Container 组件的设计决策。"
      "它本可以设计成不同的行为，实际上你需要阅读 Container 的文档以了解其在各种情况下的行为。 ";

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(color: red));
  }
}

//////////////////////////////////////////////////

class Example7 extends Example {
  final String code =
      "Center(\n"
      "   child: Container(color: red\n"
      "      child: Container(color: green, width: 30, height: 30)))";
  final String explanation =
      "屏幕强制 Center 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Center 填满整个屏幕。"
      "\n\n"
      "Center 告诉红色 Container 它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "由于红色 Container 没有固定尺寸但有子组件，它决定与其子组件尺寸相同。"
      "\n\n"
      "红色 Container 告诉其子组件它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "子组件恰好是一个绿色 Container，希望尺寸为 30x30。"
      "\n\n"
      "如前所述，红色 Container 将根据其子组件尺寸调整自身，因此它也将是 30x30。"
      "红色将不可见，因为绿色 Container 将占据整个红色 Container。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example8 extends Example {
  final String code =
      "Center(\n"
      "   child: Container(color: red\n"
      "      padding: const EdgeInsets.all(20.0),\n"
      "      child: Container(color: green, width: 30, height: 30)))";
  final String explanation =
      "红色 Container 将根据其子组件尺寸调整自身，但会考虑自身的 padding。"
      "因此它也将是 30x30，加上 20x20 的 padding。"
      "由于 padding，红色将可见，且绿色 Container 的尺寸与前一示例相同。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: red,
        child: Container(color: green, width: 30, height: 30),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example9 extends Example {
  final String code =
      "ConstrainedBox(\n"
      "   constraints: BoxConstraints(\n"
      "              minWidth: 70, minHeight: 70,\n"
      "              maxWidth: 150, maxHeight: 150),\n"
      "      child: Container(color: red, width: 10, height: 10)))";
  final String explanation =
      "你可能认为 Container 的尺寸必须在 70 到 150 像素之间，但这是错误的。"
      "ConstrainedBox 仅施加从其父组件接收到的约束之外的额外约束。"
      "\n\n"
      "此处，屏幕强制 ConstrainedBox 与屏幕尺寸完全相同，"
      "因此它将告诉其子 Container 也采用屏幕尺寸，"
      "从而忽略其 'constraints' 参数。";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(color: red, width: 10, height: 10),
    );
  }
}

//////////////////////////////////////////////////

class Example10 extends Example {
  final String code =
      "Center(\n"
      "   child: ConstrainedBox(\n"
      "      constraints: BoxConstraints(\n"
      "                 minWidth: 70, minHeight: 70,\n"
      "                 maxWidth: 150, maxHeight: 150),\n"
      "        child: Container(color: red, width: 10, height: 10))))";
  final String explanation =
      "现在，Center 将允许 ConstrainedBox 达到屏幕尺寸的任何大小。"
      "\n\n"
      "ConstrainedBox 将向其子组件施加来自其 'constraints' 参数的额外约束。"
      "\n\n"
      "因此 Container 的尺寸必须在 70 到 150 像素之间。它希望是 10 像素，因此最终将是 70（最小值）。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 10, height: 10),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example11 extends Example {
  final String code =
      "Center(\n"
      "   child: ConstrainedBox(\n"
      "      constraints: BoxConstraints(\n"
      "                 minWidth: 70, minHeight: 70,\n"
      "                 maxWidth: 150, maxHeight: 150),\n"
      "        child: Container(color: red, width: 1000, height: 1000))))";
  final String explanation =
      "Center 将允许 ConstrainedBox 达到屏幕尺寸的任何大小。"
      "\n\n"
      "ConstrainedBox 将向其子组件施加来自其 'constraints' 参数的额外约束。"
      "\n\n"
      "因此 Container 的尺寸必须在 70 到 150 像素之间。它希望是 1000 像素，因此最终将是 150（最大值）。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 1000, height: 1000),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example12 extends Example {
  final String code =
      "Center(\n"
      "   child: ConstrainedBox(\n"
      "      constraints: BoxConstraints(\n"
      "                 minWidth: 70, minHeight: 70,\n"
      "                 maxWidth: 150, maxHeight: 150),\n"
      "        child: Container(color: red, width: 100, height: 100))))";
  final String explanation =
      "Center 将允许 ConstrainedBox 达到屏幕尺寸的任何大小。"
      "\n\n"
      "ConstrainedBox 将向其子组件施加来自其 'constraints' 参数的额外约束。"
      "\n\n"
      "因此 Container 的尺寸必须在 70 到 150 像素之间。它希望是 100 像素，这正是它将具有的尺寸，因为 100 在 70 到 150 之间。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: red, width: 100, height: 100),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example13 extends Example {
  final String code =
      "UnconstrainedBox(\n"
      "   child: Container(color: red, width: 20, height: 50));";
  final String explanation =
      "屏幕强制 UnconstrainedBox 与屏幕尺寸完全相同。"
      "\n\n"
      "然而，UnconstrainedBox 允许其子 Container 具有任意尺寸。";

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 20, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example14 extends Example {
  final String code =
      "UnconstrainedBox(\n"
      "   child: Container(color: red, width: 4000, height: 50));";
  final String explanation =
      "屏幕强制 UnconstrainedBox 与屏幕尺寸完全相同，"
      "且 UnconstrainedBox 允许其子 Container 具有任意尺寸。"
      "\n\n"
      "不幸的是，本例中 Container 宽度为 4000 像素，过大而无法适应 UnconstrainedBox，"
      "因此 UnconstrainedBox 将显示令人畏惧的 \"overflow warning\"。";

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example15 extends Example {
  final String code =
      "OverflowBox(\n"
      "   child: Container(color: red, width: 4000, height: 50));";
  final String explanation =
      "屏幕强制 OverflowBox 与屏幕尺寸完全相同，"
      "且 OverflowBox 允许其子 Container 具有任意尺寸。"
      "\n\n"
      "OverflowBox 与 UnconstrainedBox 类似，区别在于如果子组件不适应空间，它不会显示任何警告。"
      "\n\n"
      "本例中 Container 宽度为 4000 像素，过大而无法适应 OverflowBox，"
      "但 OverflowBox 将仅显示其能显示的部分，不给出警告。";

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(color: red, width: 4000, height: 50),
    );
  }
}

//////////////////////////////////////////////////

class Example16 extends Example {
  final String code =
      "UnconstrainedBox(\n"
      "   child: Container(color: Colors.red, width: double.infinity, height: 100));";
  final String explanation =
      "这将不会渲染任何内容，并且你将在控制台中看到错误。"
      "\n\n"
      "UnconstrainedBox 允许其子组件具有任意尺寸，"
      "但其子组件是尺寸无限的 Container。"
      "\n\n"
      "Flutter 无法渲染无限尺寸，因此将抛出错误，消息如下："
      "'BoxConstraints forces an infinite width.'";

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(color: Colors.red, width: double.infinity, height: 100),
    );
  }
}

//////////////////////////////////////////////////

class Example17 extends Example {
  final String code =
      "UnconstrainedBox(\n"
      "   child: LimitedBox(maxWidth: 100,\n"
      "      child: Container(color: Colors.red,\n"
      "                       width: double.infinity, height: 100));";
  final String explanation =
      "此处将不再出现错误，"
      "因为当 LimitedBox 从 UnconstrainedBox 获得无限尺寸时，"
      "它将向子组件传递最大宽度 100。"
      "\n\n"
      "注意，如果将 UnconstrainedBox 更改为 Center 组件，"
      "LimitedBox 将不再应用其限制（因为其限制仅在获得无限约束时应用），"
      "且 Container 宽度将被允许超过 100。"
      "\n\n"
      "这清楚地说明了 LimitedBox 与 ConstrainedBox 的区别。";

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 100,
        child: Container(
          color: Colors.red,
          width: double.infinity,
          height: 100,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example18 extends Example {
  final String code =
      "FittedBox(\n"
      "   child: Text('Some Example Text.'));";
  final String explanation =
      "屏幕强制 FittedBox 与屏幕尺寸完全相同。"
      "\n\n"
      "Text 将具有自然宽度（也称为固有宽度），这取决于文本量、字体大小等。"
      "\n\n"
      "FittedBox 将允许 Text 具有任意尺寸，"
      "但在 Text 将其尺寸告知 FittedBox 后，"
      "FittedBox 将缩放 Text 直到填满所有可用宽度。";

  @override
  Widget build(BuildContext context) {
    return FittedBox(child: Text("Some Example Text."));
  }
}

//////////////////////////////////////////////////

class Example19 extends Example {
  final String code =
      "Center(\n"
      "   child: FittedBox(\n"
      "      child: Text('Some Example Text.')));";
  final String explanation =
      "但如果将 FittedBox 置于 Center 内部会发生什么？"
      "Center 将允许 FittedBox 达到屏幕尺寸的任何大小。"
      "\n\n"
      "FittedBox 随后将根据 Text 调整自身尺寸，并允许 Text 具有任意尺寸。"
      "\n\n"
      "由于 FittedBox 和 Text 尺寸相同，不会发生缩放。";

  @override
  Widget build(BuildContext context) {
    return Center(child: FittedBox(child: Text("Some Example Text.")));
  }
}

////////////////////////////////////////////////////

class Example20 extends Example {
  final String code =
      "Center(\n"
      "   child: FittedBox(\n"
      "      child: Text('…')));";
  final String explanation =
      "然而，如果 FittedBox 在 Center 内部，但 Text 过大无法适应屏幕，会发生什么？"
      "\n\n"
      "FittedBox 将尝试根据 Text 调整自身尺寸，但不能超过屏幕大小。"
      "随后它将采用屏幕尺寸，并调整 Text 尺寸以使其适应屏幕。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text(
          "This is some very very very large text that is too big to fit a regular screen in a single line.",
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example21 extends Example {
  final String code =
      "Center(\n"
      "   child: Text('…'));";
  final String explanation =
      "然而，如果移除 FittedBox，"
      "Text 将从屏幕获取其最大宽度，"
      "并将换行以使其适应屏幕。";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This is some very very very large text that is too big to fit a regular screen in a single line.",
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example22 extends Example {
  final String code =
      "FittedBox(\n"
      "   child: Container(\n"
      "      height: 20.0, width: double.infinity));";
  final String explanation =
      "注意 FittedBox 只能缩放有界组件（具有非无限宽度和高度）。"
      "\n\n"
      "否则，它将不会渲染任何内容，并且你将在控制台中看到错误。";

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(height: 20.0, width: double.infinity, color: Colors.red),
    );
  }
}

//////////////////////////////////////////////////

class Example23 extends Example {
  final String code =
      "Row(children:[\n"
      "   Container(color: red, child: Text('Hello!'))\n"
      "   Container(color: green, child: Text('Goodbye!'))]";
  final String explanation =
      "屏幕强制 Row 与屏幕尺寸完全相同。"
      "\n\n"
      "就像 UnconstrainedBox 一样，Row 不会对其子组件施加任何约束，"
      "而是允许它们具有任意尺寸。"
      "\n\n"
      "随后 Row 将并排放置它们，任何额外空间将保持空白。";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: red,
          child: Text("Hello!", style: big),
        ),
        Container(
          color: green,
          child: Text("Goodbye!", style: big),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example24 extends Example {
  final String code =
      "Row(children:[\n"
      "   Container(color: red, child: Text('…'))\n"
      "   Container(color: green, child: Text('Goodbye!'))]";
  final String explanation =
      "由于 Row 不会对其子组件施加任何约束，"
      "子组件很可能过大而无法适应可用的 Row 宽度。"
      "\n\n"
      "在这种情况下，就像 UnconstrainedBox 一样，Row 将显示 \"overflow warning\"。";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: red,
          child: Text(
            "This is a very long text that won't fit the line.",
            style: big,
          ),
        ),
        Container(
          color: green,
          child: Text("Goodbye!", style: big),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example25 extends Example {
  final String code =
      "Row(children:[\n"
      "   Expanded(\n"
      "       child: Container(color: red, child: Text('…')))\n"
      "   Container(color: green, child: Text('Goodbye!'))]";
  final String explanation =
      "当 Row 的子组件被 Expanded 组件包裹时，Row 将不再允许该子组件定义其自身宽度。"
      "\n\n"
      "相反，它将根据其他子组件定义 Expanded 的宽度，然后 Expanded 组件将强制原子组件具有 Expanded 的宽度。"
      "\n\n"
      "换句话说，一旦使用 Expanded，原子组件的宽度将变得无关紧要，并被忽略。";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Container(
              color: red,
              child: Text(
                "This is a very long text that won't fit the line.",
                style: big,
              ),
            ),
          ),
        ),
        Container(
          color: green,
          child: Text("Goodbye!", style: big),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example26 extends Example {
  final String code =
      "Row(children:[\n"
      "   Expanded(\n"
      "       child: Container(color: red, child: Text('…')))\n"
      "   Expanded(\n"
      "       child: Container(color: green, child: Text('Goodbye!'))]";
  final String explanation =
      "如果 Row 的所有子组件都被 Expanded 组件包裹，每个 Expanded 将具有与其 flex 参数成比例的尺寸，"
      "然后每个 Expanded 组件将强制其子组件具有 Expanded 的宽度。"
      "\n\n"
      "换句话说，Expanded 忽略其子组件的首选宽度。";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: red,
            child: Text(
              "This is a very long text that won't fit the line.",
              style: big,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: green,
            child: Text("Goodbye!", style: big),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example27 extends Example {
  final String code =
      "Row(children:[\n"
      "   Flexible(\n"
      "       child: Container(color: red, child: Text('…')))\n"
      "   Flexible(\n"
      "       child: Container(color: green, child: Text('Goodbye!'))]";
  final String explanation =
      "使用 Flexible 而非 Expanded 的唯一区别在于，"
      "Flexible 允许其子组件小于 Flexible 的宽度，"
      "而 Expanded 强制其子组件与 Expanded 宽度相同。"
      "\n\n"
      "但 Expanded 和 Flexible 在调整自身尺寸时都会忽略其子组件的宽度。"
      "\n\n"
      "注意，这意味着不可能根据子组件尺寸按比例扩展 Row 的子组件。"
      "Row 要么使用子组件的精确宽度，要么在使用 Expanded 或 Flexible 时完全忽略它。";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            color: red,
            child: Text(
              "This is a very long text that won't fit the line.",
              style: big,
            ),
          ),
        ),
        Flexible(
          child: Container(
            color: green,
            child: Text("Goodbye!", style: big),
          ),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////

class Example28 extends Example {
  final String code =
      "Scaffold(\n"
      "   body: Container(color: blue,\n"
      "   child: Column(\n"
      "      children: [\n"
      "         Text('Hello!'),\n"
      "         Text('Goodbye!')])))";

  final String explanation =
      "屏幕强制 Scaffold 与屏幕尺寸完全相同。"
      "\n\n"
      "因此 Scaffold 填满整个屏幕。"
      "\n\n"
      "Scaffold 告诉 Container 它可以任意尺寸，但不能超过屏幕大小。"
      "\n\n"
      "注意：当组件告诉其子组件可以小于特定尺寸时，"
      "我们称该组件向其子组件提供 \"loose\" 约束。稍后将详述。";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blue,
        child: Column(children: [Text('Hello!'), Text('Goodbye!')]),
      ),
    );
  }
}

//////////////////////////////////////////////////

class Example29 extends Example {
  final String code =
      "Scaffold(\n"
      "   body: Container(color: blue,\n"
      "   child: SizedBox.expand(\n"
      "      child: Column(\n"
      "         children: [\n"
      "            Text('Hello!'),\n"
      "            Text('Goodbye!')]))))";

  final String explanation =
      "如果我们希望 Scaffold 的子组件与 Scaffold 本身尺寸完全相同，"
      "可以将其子组件包裹在 SizedBox.expand 中。"
      "\n\n"
      "注意：当组件告诉其子组件必须具有特定尺寸时，"
      "我们称该组件向其子组件提供 \"tight\" 约束。稍后将详述。";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: blue,
          child: Column(children: [Text('Hello!'), Text('Goodbye!')]),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////
