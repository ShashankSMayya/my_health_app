import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/theme/app_colors.dart';
import 'package:my_health_app/utils/file_utils.dart';
import 'package:provider/provider.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  final _formKey = GlobalKey<FormState>();
  late final ReactionDisposer _disposer;
  String? _documentName;
  String? _fileName;
  String? _fileSize;
  File? _documentFile;
  FileTypes? _fileType;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction(
      (_) => context.read<DocumentsStore>().addDocumentFuture?.status,
      (result) {
        print(result);
        if (result == FutureStatus.fulfilled) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Document added successfully'),
            ),
          );
          Navigator.pop(context);
        }
        if (result == FutureStatus.rejected) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error adding document'),
            ),
          );
        }
        if (result == FutureStatus.pending) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Adding document...'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Document'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Document Name'),
              const Gap(10),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter document name'),
                onSaved: (value) => _documentName = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter document name';
                  }
                  return null;
                },
              ),
              const Gap(10),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: _documentFile == null
                        ? const SizedBox.shrink()
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              _fileType == FileTypes.image
                                  ? Image.file(
                                      _documentFile!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.description),
                              Positioned(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _documentFile = null;
                                    });
                                  },
                                  child: const Icon(Icons.cancel,
                                      color: AppColors.primary),
                                ),
                                top: 0,
                                right: 2,
                              ),
                            ],
                          ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  const Gap(10),
                  _documentFile == null
                      ? TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton.icon(
                                    onPressed: () async {
                                      final XFile? file = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera);
                                      if (file != null) {
                                        setState(() {
                                          _documentFile = File(file.path);
                                          _fileType = FileTypes.image;
                                          _fileName =
                                              DateFormat('ddMMyyyyhhmmss')
                                                      .format(DateTime.now()) +
                                                  '.' +
                                                  FileUtils.getFileExtension(
                                                      file.name);
                                          _fileSize =
                                              FileUtils.getFileSizeString(
                                                  bytes: _documentFile!
                                                      .lengthSync());
                                        });
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                    label: const Text('Camera'),
                                  ),
                                  const Divider(),
                                  TextButton.icon(
                                    onPressed: () async {
                                      final XFile? file = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      if (file != null) {
                                        setState(() {
                                          _documentFile = File(file.path);
                                          _fileType = FileTypes.image;
                                          _fileName =
                                              DateFormat('ddMMyyyyhhmmss')
                                                      .format(DateTime.now()) +
                                                  '.' +
                                                  FileUtils.getFileExtension(
                                                      file.name);
                                          _fileSize =
                                              FileUtils.getFileSizeString(
                                                  bytes: _documentFile!
                                                      .lengthSync());
                                        });
                                      }
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.photo_library),
                                    label: const Text('Photo Library'),
                                  ),
                                  const Divider(),
                                  TextButton.icon(
                                    onPressed: () async {
                                      final FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                              allowedExtensions: ['pdf'],
                                              type: FileType.custom);
                                      if (result != null) {
                                        setState(() {
                                          _documentFile =
                                              File(result.files.first.path!);
                                          _fileType = FileTypes.pdf;

                                          _fileName =
                                              DateFormat('ddMMyyyyhhmmss')
                                                      .format(DateTime.now()) +
                                                  '.' +
                                                  FileUtils.getFileExtension(
                                                      result.files.first.path!);
                                          _fileSize =
                                              FileUtils.getFileSizeString(
                                                  bytes: _documentFile!
                                                      .lengthSync());
                                          Navigator.pop(context);
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.description,
                                    ),
                                    label: const Text('Document'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Select File'))
                      : Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _fileName ?? 'file',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(10),
                              Text(
                                _fileSize ?? 'file size',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(5),
                            ],
                          ),
                        ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _documentFile != null) {
                          _formKey.currentState!.save();
                          Uint8List bytes = await _documentFile!.readAsBytes();
                          final docStore = context.read<DocumentsStore>();

                          await docStore.addDocument(DocumentModel(
                            name: _documentName!,
                            fileBytes: bytes,
                            fileType: _fileType!,
                            fileName: _fileName!,
                            fileExtension:
                                FileUtils.getFileExtension(_documentFile!.path),
                            uploadDate: DateTime.now(),
                            lastModified: DateTime.now(),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Please fill all the fields'),
                          ));
                        }
                      },
                      child: const Text('Save')),
                  const Gap(10),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
