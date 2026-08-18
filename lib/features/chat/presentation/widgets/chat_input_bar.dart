import 'package:flutter/material.dart';

import '../../../../app/theme/app_tokens.dart';

/// Message composer.
///
/// Owns its own controller and focus node — and disposes both — so the page
/// above it stays stateless and cannot leak them.
class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    required this.hintText,
    required this.sendTooltip,
    required this.onSend,
    this.isSending = false,
    super.key,
  });

  final String hintText;
  final String sendTooltip;
  final ValueChanged<String> onSend;
  final bool isSending;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final String text = _controller.text.trim();
    if (text.isEmpty || widget.isSending) {
      return;
    }
    widget.onSend(text);
    _controller.clear();
    // Keeping focus lets the user keep typing without re-tapping the field.
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.sm,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  minLines: 1,
                  // Grows with the message, then scrolls — the composer can
                  // never eat the whole thread.
                  maxLines: 5,
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (_) => _submit(),
                  decoration: InputDecoration(hintText: widget.hintText),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              // Rebuilds only the button as the field fills, not the thread.
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _controller,
                builder:
                    (BuildContext context, TextEditingValue value, Widget? _) {
                      final bool canSend =
                          value.text.trim().isNotEmpty && !widget.isSending;
                      return IconButton.filled(
                        onPressed: canSend ? _submit : null,
                        tooltip: widget.sendTooltip,
                        icon: widget.isSending
                            ? const SizedBox.square(
                                dimension: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.send_rounded),
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
