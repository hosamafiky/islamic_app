import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
import 'package:islamic_app/features/reader/domain/entities/reader.dart';
import 'package:islamic_app/features/reader/presentation/cubit/reader_cubit.dart';

class ReadersDropdownWidget extends StatelessWidget {
  const ReadersDropdownWidget({super.key, required this.onReaderSelected});

  final Function(Reader) onReaderSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderCubit, ReaderState>(
      builder: (context, state) {
        if (state is ReadersError) return Text(state.error!.message);
        if (state is ReaderInitial) return const Offstage();
        if (state is ReadersLoaded || state is ReaderSelected) {
          return _buildDropdown(state, context);
        }
        return const Offstage();
      },
    );
  }

  Widget _buildDropdown(ReaderState state, BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: state.readers.isNotEmpty ? state.selectedReader : null,
        isDense: true,
        hint: Text(
          'Select Reader',
          style: LightAppTextStyles.medium12,
        ),
        items: state.readers.map((reader) => _readerItem(reader)).toList(),
        menuMaxHeight: 150,
        onChanged: (reader) {
          if (reader == null) return;
          context.read<ReaderCubit>().selectReader(reader);
        },
      ),
    );
  }

  DropdownMenuItem<Reader> _readerItem(Reader reader) {
    return DropdownMenuItem<Reader>(
      value: reader,
      child: Text(
        reader.name,
        overflow: TextOverflow.ellipsis,
        style: LightAppTextStyles.medium16.copyWith(
          fontFamily: 'Amiri',
        ),
      ),
    );
  }
}
