import 'package:desktop/desktop.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

const _kFontFamily = 'IBM Plex Mono';

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.topCenter,
          child: Text(
            'Adriano Souza',
            style: Theme.of(context)
                .textTheme
                .header
                .copyWith(fontFamily: _kFontFamily),
          ),
        ),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: const [
            _Subheader('Projects'),
            _ProjectItem(
              title: 'Desktop',
              url: 'https://adrianos42.github.io/desktop/',
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0),
            //   child: _ProjectItem(
            //     title: 'Data IDL',
            //     url: '',
            //   ),
            // ),
            _ProjectItem(
              title: 'Sudoku',
              url: 'https://adrianos42.github.io/sudoku/',
            ),
            _ProjectItem(
              title: 'Desktop Charts',
              url: 'https://adrianos42.github.io/desktop_charts/',
            ),
          ],
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Text(
        title,
        style: textTheme.title.copyWith(fontFamily: _kFontFamily),
      ),
    );
  }
}

class _Subheader extends StatelessWidget {
  const _Subheader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: textTheme.subheader.copyWith(fontFamily: _kFontFamily),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
      child: Text(
        title,
        style: textTheme.body1.copyWith(fontFamily: _kFontFamily),
      ),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  const _ProjectItem({
    required this.title,
    this.url,
  });

  final String title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.title.copyWith(fontFamily: _kFontFamily),
          ),
          if (url != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: HyperlinkButton(
                url!,
                padding: EdgeInsets.zero,
                onPressed: (url) async => await launchUrl(Uri.parse(url)),
              ),
            ),
        ],
      ),
    );
  }
}
