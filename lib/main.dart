import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(BrailleApp());
}

class BrailleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprende Braille',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade600],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.accessibility,
                            size: 80,
                            color: Colors.blue.shade700,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Aprende Braille',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Tu guía completa para dominar el sistema Braille',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    _buildMenuButton(
                      context,
                      'Alfabeto Braille',
                      Icons.text_fields,
                      Colors.green,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlphabetScreen())),
                    ),
                    _buildMenuButton(
                      context,
                      'Números Braille',
                      Icons.pin,
                      Colors.orange,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NumbersScreen())),
                    ),
                    _buildMenuButton(
                      context,
                      'Práctica Interactiva',
                      Icons.quiz,
                      Colors.red,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PracticeScreen())),
                    ),
                    _buildMenuButton(
                      context,
                      'Traductor',
                      Icons.translate,
                      Colors.purple,
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TranslatorScreen())),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Desarrollado por Luis Jesus Nuñez Falon',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.white),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrailleData {
  static Map<String, List<bool>> brailleAlphabet = {
    'A': [true, false, false, false, false, false],
    'B': [true, true, false, false, false, false],
    'C': [true, false, false, true, false, false],
    'D': [true, false, false, true, true, false],
    'E': [true, false, false, false, true, false],
    'F': [true, true, false, true, false, false],
    'G': [true, true, false, true, true, false],
    'H': [true, true, false, false, true, false],
    'I': [false, true, false, true, false, false],
    'J': [false, true, false, true, true, false],
    'K': [true, false, true, false, false, false],
    'L': [true, true, true, false, false, false],
    'M': [true, false, true, true, false, false],
    'N': [true, false, true, true, true, false],
    'O': [true, false, true, false, true, false],
    'P': [true, true, true, true, false, false],
    'Q': [true, true, true, true, true, false],
    'R': [true, true, true, false, true, false],
    'S': [false, true, true, true, false, false],
    'T': [false, true, true, true, true, false],
    'U': [true, false, true, false, false, true],
    'V': [true, true, true, false, false, true],
    'W': [false, true, false, true, true, true],
    'X': [true, false, true, true, false, true],
    'Y': [true, false, true, true, true, true],
    'Z': [true, false, true, false, true, true],
  };

  static Map<String, List<bool>> brailleNumbers = {
    '1': [true, false, false, false, false, false],
    '2': [true, true, false, false, false, false],
    '3': [true, false, false, true, false, false],
    '4': [true, false, false, true, true, false],
    '5': [true, false, false, false, true, false],
    '6': [true, true, false, true, false, false],
    '7': [true, true, false, true, true, false],
    '8': [true, true, false, false, true, false],
    '9': [false, true, false, true, false, false],
    '0': [false, true, false, true, true, false],
  };

  static List<bool> numberIndicator = [false, false, true, true, true, true];
}

class BrailleDot extends StatelessWidget {
  final bool isRaised;
  final double size;

  const BrailleDot({Key? key, required this.isRaised, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isRaised ? Colors.blue.shade800 : Colors.grey.shade300,
        border: Border.all(
          color: isRaised ? Colors.blue.shade900 : Colors.grey.shade400,
          width: 1,
        ),
        boxShadow: isRaised
            ? [
                BoxShadow(
                  color: Colors.blue.shade900.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(1, 1),
                ),
              ]
            : null,
      ),
    );
  }
}

class BrailleCell extends StatelessWidget {
  final List<bool> dots;
  final double size;

  const BrailleCell({Key? key, required this.dots, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BrailleDot(isRaised: dots[0], size: size),
              SizedBox(width: 8),
              BrailleDot(isRaised: dots[3], size: size),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BrailleDot(isRaised: dots[1], size: size),
              SizedBox(width: 8),
              BrailleDot(isRaised: dots[4], size: size),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BrailleDot(isRaised: dots[2], size: size),
              SizedBox(width: 8),
              BrailleDot(isRaised: dots[5], size: size),
            ],
          ),
        ],
      ),
    );
  }
}

class AlphabetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alfabeto Braille'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade400, Colors.green.shade50],
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: BrailleData.brailleAlphabet.length,
          itemBuilder: (context, index) {
            String letter = BrailleData.brailleAlphabet.keys.elementAt(index);
            List<bool> dots = BrailleData.brailleAlphabet[letter]!;

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    letter,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  BrailleCell(dots: dots),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NumbersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Números Braille'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade400, Colors.orange.shade50],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.info_outline,
                      color: Colors.orange.shade700, size: 30),
                  SizedBox(height: 10),
                  Text(
                    'Indicador Numérico',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Los números en Braille se forman usando el indicador numérico seguido de las letras A-J (que representan 1-0)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  BrailleCell(dots: BrailleData.numberIndicator),
                  Text(
                    'Indicador Numérico',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: BrailleData.brailleNumbers.length,
                itemBuilder: (context, index) {
                  String number =
                      BrailleData.brailleNumbers.keys.elementAt(index);
                  List<bool> dots = BrailleData.brailleNumbers[number]!;

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade700,
                          ),
                        ),
                        SizedBox(height: 10),
                        BrailleCell(dots: dots),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  String currentLetter = 'A';
  int score = 0;
  int totalQuestions = 0;
  List<bool> userAnswer = [false, false, false, false, false, false];
  bool showResult = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    generateNewQuestion();
  }

  void generateNewQuestion() {
    setState(() {
      currentLetter = BrailleData.brailleAlphabet.keys.elementAt(
        Random().nextInt(BrailleData.brailleAlphabet.length),
      );
      userAnswer = [false, false, false, false, false, false];
      showResult = false;
    });
  }

  void checkAnswer() {
    List<bool> correctAnswer = BrailleData.brailleAlphabet[currentLetter]!;
    isCorrect = true;
    for (int i = 0; i < 6; i++) {
      if (userAnswer[i] != correctAnswer[i]) {
        isCorrect = false;
        break;
      }
    }

    setState(() {
      showResult = true;
      totalQuestions++;
      if (isCorrect) score++;
    });

    HapticFeedback.lightImpact();
  }

  void nextQuestion() {
    generateNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Práctica Interactiva'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Score: $score/$totalQuestions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red.shade400, Colors.red.shade50],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Forma la letra:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      currentLetter,
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Toca los puntos para formar el Braille:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    _buildInteractiveBrailleCell(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              if (!showResult)
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Verificar Respuesta',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              if (showResult)
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isCorrect ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            isCorrect ? Icons.check_circle : Icons.error,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            isCorrect ? '¡Correcto!' : 'Incorrecto',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          if (!isCorrect) ...[
                            SizedBox(height: 10),
                            Text(
                              'La respuesta correcta es:',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            BrailleCell(
                              dots: BrailleData.brailleAlphabet[currentLetter]!,
                              size: 25,
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'Siguiente Pregunta',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveBrailleCell() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInteractiveDot(0),
            SizedBox(width: 20),
            _buildInteractiveDot(3),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInteractiveDot(1),
            SizedBox(width: 20),
            _buildInteractiveDot(4),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInteractiveDot(2),
            SizedBox(width: 20),
            _buildInteractiveDot(5),
          ],
        ),
      ],
    );
  }

  Widget _buildInteractiveDot(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          userAnswer[index] = !userAnswer[index];
        });
        HapticFeedback.selectionClick();
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: userAnswer[index] ? Colors.red.shade700 : Colors.grey.shade300,
          border: Border.all(
            color:
                userAnswer[index] ? Colors.red.shade900 : Colors.grey.shade400,
            width: 2,
          ),
          boxShadow: userAnswer[index]
              ? [
                  BoxShadow(
                    color: Colors.red.shade900.withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}

class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  TextEditingController textController = TextEditingController();
  String translatedText = '';

  void translateToBraille() {
    String input = textController.text.toUpperCase();
    setState(() {
      translatedText = input;
    });
  }

  void clearText() {
    setState(() {
      textController.clear();
      translatedText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traductor de Texto a Braille'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade400, Colors.purple.shade50],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Escribe tu texto:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Ingresa el texto a traducir...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: translateToBraille,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Traducir a Braille',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: clearText,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade600,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Limpiar',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              if (translatedText.isNotEmpty)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Traducción en Braille:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade700,
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: translatedText.split('').map((char) {
                                if (BrailleData.brailleAlphabet
                                    .containsKey(char)) {
                                  return Container(
                                    margin: EdgeInsets.all(4),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          char,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple.shade700,
                                          ),
                                        ),
                                        BrailleCell(
                                          dots: BrailleData
                                              .brailleAlphabet[char]!,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (char == ' ') {
                                  return Container(
                                    width: 20,
                                    height: 80,
                                    margin: EdgeInsets.all(4),
                                    child: Center(
                                      child: Text(
                                        '|',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    margin: EdgeInsets.all(4),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          char,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          child: Icon(
                                            Icons.help_outline,
                                            color: Colors.grey.shade400,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
