// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_card_swiper/flutter_card_swiper.dart'; // <-- IMPORT FALTANDO AQUI

class FlutterTaskSwiper extends StatefulWidget {
  const FlutterTaskSwiper({
    Key? key,
    required this.tasks,
    required this.width,
    required this.height,
    required this.notasksdisponiveis,
    required this.visualSwipe,
    this.onSelectableButton,
  }) : super(key: key);

  final List<TasksRecord> tasks;
  final double width;
  final double height;
  final Widget Function() notasksdisponiveis;
  final Widget Function(DocumentReference task) visualSwipe;
  final Future Function(String buttonPressioned, DocumentReference taskRef)?
      onSelectableButton;

  @override
  State<FlutterTaskSwiper> createState() => _FlutterTaskSwiperState();
}

class _FlutterTaskSwiperState extends State<FlutterTaskSwiper> {
  final CardSwiperController _controller = CardSwiperController();
  int _currentIndex = 0;

  void _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    if (currentIndex != null) {
      setState(() {
        _currentIndex = currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty) {
      return widget.notasksdisponiveis();
    }

    final currentTaskRef = widget.tasks[_currentIndex].reference;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              controller: _controller,
              cardsCount: widget.tasks.length,
              numberOfCardsDisplayed: 1,
              isLoop: false,
              padding: EdgeInsets.zero,
              onSwipe: (previousIndex, currentIndex, direction) {
                _onSwipe(previousIndex, currentIndex, direction);
                return true;
              },
              cardBuilder: (context, index, percentX, percentY) {
                return Container(
                  color: Colors.transparent,
                  child: widget.visualSwipe(widget.tasks[index].reference),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          _buildButtonRow(currentTaskRef), // Passando a referência da tarefa
        ],
      ),
    );
  }

  Widget _buildButtonRow(DocumentReference currentTaskRef) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
          icon: Icons.close,
          color: const Color(0xFFF8E8D9),
          onPressed: () async {
            _controller.swipe(CardSwiperDirection.left);
            await widget.onSelectableButton?.call('reject', currentTaskRef);
          },
        ),
        const SizedBox(width: 20),
        _buildActionButton(
          icon: Icons.check,
          color: const Color(0xFFF8E8D9),
          onPressed: () async {
            _controller.swipe(CardSwiperDirection.right);
            await widget.onSelectableButton?.call('confirm', currentTaskRef);
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2), // Borda preta
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon, // Ícone que foi passado como parâmetro
              size: 40, // Tamanho maior para os ícones
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
