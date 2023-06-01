import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/main.dart';

import '../models/element.dart';

class ListItem extends ConsumerStatefulWidget {
  ElementOfList element;

  ListItem(this.element);

  @override
  ConsumerState<ListItem> createState() => _ListItemState();
}

class _ListItemState extends ConsumerState<ListItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          '${widget.element.title} ${widget.element.cost} руб.',
          style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
        ),
      ),
      value: widget.element.checkBox,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (val) {
        ref
            .watch(stateProvider.notifier)
            .changeStateSwitch(widget.element.id, val);
        // print(widget.element.checkBox);
        if (widget.element.checkBox == true && widget.element.id != 0) {
          ref
              .watch(sumProvider.notifier)
              .update((state) => state + widget.element.cost);
        } else if (widget.element.checkBox == false && widget.element.id != 0) {
          ref
              .watch(sumProvider.notifier)
              .update((state) => state - widget.element.cost);
        }
      },
      subtitle: MarkdownBody(
        data: widget.element.description,
      ),
    );
  }
}
