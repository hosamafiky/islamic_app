import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/reader/domain/entities/reader.dart';
import 'package:islamic_app/features/reader/presentation/cubit/reader_cubit.dart';

class ReadersDropdownWidget extends StatelessWidget {
  const ReadersDropdownWidget({super.key, required this.onReaderSelected});

  final Function(Reader) onReaderSelected;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReaderCubit, ReaderState>(
      listener: (context, state) {
        if (state is ReaderSelected) {
          // Do something with the selected reader
        }
      },
      builder: (context, state) {
        if (state is ReadersError) return Text(state.error!.message);
        if (state is ReaderInitial) return const Offstage();
        return DropdownButtonHideUnderline(
          child: DropdownButton(
            value: state.selectedReader ?? state.readers.first,
            isDense: true,
            hint: const Text(
              'Select Reader',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            items: state.readers.map((reader) => _readerItem(reader)).toList(),
            menuMaxHeight: 150,
            onChanged: (reader) {
              if (reader == null) return;
              context.read<ReaderCubit>().selectReader(reader);
            },
          ),
        );
      },
    );
  }

  DropdownMenuItem<Reader> _readerItem(Reader reader) {
    return DropdownMenuItem<Reader>(
      value: reader,
      child: Text(
        reader.name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Amiri',
          color: Colors.black,
        ),
      ),
    );
  }
}
