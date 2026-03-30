import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:family_time/constant/AppColor.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Example'),
        backgroundColor: AppColor.primary,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _openModal(),
          child: const Text('Open Modal'),
        ),
      ),
    );
  }
}

class _openModal {
    void call(BuildContext context) {
        WoltModalSheet.show<void>(
        context: context,
        pageListBuilder: (modalSheetContext) {
            return [
            WoltModalSheetPage(
                topBarTitle: const Text("My Modal"),
                isTopBarLayerAlwaysVisible: true,
                trailingNavBarWidget: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(modalSheetContext).pop(),
                ),
                child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Hello 👋 This is your modal content"),
                ),
                stickyActionBar: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                    onPressed: () => Navigator.of(modalSheetContext).pop(),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Close"),
                    ),
                ),
                ),
            ),
            ];
        },
        );
    }
}