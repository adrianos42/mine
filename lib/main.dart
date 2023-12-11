import 'package:desktop/desktop.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final dialogTheme = DialogTheme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.topCenter,
          child: Text(
            'adrianosouza.dev',
            style: Theme.of(context).textTheme.header,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: dialogTheme.barrierColor!,
          ),
          child: BackdropFilter(
            filter: dialogTheme.imageFilter!,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: const [
                  _ProjectItem(
                    title: 'Desktop',
                    url: 'adrianos42.github.io/desktop/',
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20.0),
                  //   child: _ProjectItem(
                  //     title: 'Data IDL',
                  //     url: '',
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: _ProjectItem(
                      title: 'Sudoku',
                      url: 'adrianos42.github.io/sudoku/',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: _ProjectItem(
                      title: 'Desktop Charts',
                      url: 'adrianos42.github.io/desktop_charts/',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(color: colorScheme.background[0]),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.title,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: HyperlinkButton(
              url,
              padding: EdgeInsets.zero,
              onPressed: (url) async => await launchUrl(Uri.parse(url)),
            ),
          ),
        ],
      ),
    );
  }
}
