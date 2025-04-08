import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/manage_watchlist/manage_watchlist_bloc.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enities/watchlist_entity.dart';

class WatchlistEditSheet extends StatefulWidget {
  const WatchlistEditSheet({super.key, required this.watchlist});
  final WatchlistEntity watchlist;

  @override
  State<WatchlistEditSheet> createState() => _WatchlistEditSheetState();
}

class _WatchlistEditSheetState extends State<WatchlistEditSheet> {
  late TextEditingController controller;
  final fomKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController(text: widget.watchlist.id);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fomKey,
      child: Container(
        height: 220 + MediaQuery.of(context).viewInsets.bottom,
        width: double.infinity,
        decoration: BoxDecoration(
          color: k262626Color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          border: Border.all(color: k5D5D5DColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              buildTextForm(),
              Spacer(),
              BlocSelector<ManageWatchlistBloc, ManageWatchlistState, bool>(
                selector: (state) => state is AddWatchlistLoading,
                builder: (context, state) {
                  return RectButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      final isValid = fomKey.currentState?.validate() ?? false;
                      if (!isValid) return;

                      final oldName = widget.watchlist.id.trim();
                      final newName = controller.text.trim();
                      ManageWatchlistEvent event = CreateWatchlistEvent(
                        newName,
                      );
                      if (oldName.isNotEmpty) {
                        event = ChangeWatchlistNameEvent(
                          oldName: widget.watchlist.id,
                          newName: newName,
                        );
                      }
                      context.read<ManageWatchlistBloc>().add(event);
                    },
                    title: "Save",
                    isEnabled: true,
                    isLoading: state,
                  );
                },
              ),
              BlocListener<ManageWatchlistBloc, ManageWatchlistState>(
                listener: (context, state) {
                  if (state is WatchlistNameUpdated ||
                      state is WatchlistAdded) {
                    context.read<WatchlistBloc>().add(InitWatchlistEvent());
                    context.pop();
                  }
                },
                child: SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextForm() {
    return TextFormField(
      controller: controller,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: kBlueColor),
        ),
        enabledBorder: border,
        errorBorder: border.copyWith(
          borderSide: border.borderSide.copyWith(color: kRedColor),
        ),
        hintText: "Name",
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value?.trim().isEmpty ?? false) return "Empty value";
        if (value?.toLowerCase() == widget.watchlist.id.toLowerCase()) {
          return "Same value entered";
        }
        return null;
      },
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: k5D5D5DColor),
    );
  }
}
