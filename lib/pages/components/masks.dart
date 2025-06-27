import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final cpfFormatter = MaskTextInputFormatter(
  mask: '###.###.###-##',
  filter: {"#": RegExp(r'[0-9]')},
);

final cnpjFormatter = MaskTextInputFormatter(
  mask: '##.###.###/####-##',
  filter: {"#": RegExp(r'[0-9]')},
);

final phoneFormatter = MaskTextInputFormatter(
  mask: '(##) #####-####',
  filter: {"#": RegExp(r'[0-9]')},
);

final cnaeFormatter = MaskTextInputFormatter(
  mask: '##.##-#-##',
  filter: {"#": RegExp(r'[0-9]')},
);

final rgpFormatter = MaskTextInputFormatter(
  mask: '#######/@@',
  filter: {
    "#": RegExp(r'[0-9]'),
    "@": RegExp(r'[A-Za-z]'),
  },
);

final localizacaoFormatter = MaskTextInputFormatter(
  mask: '##,#° @',
  filter: {
    "#": RegExp(r'[0-9]'),
    "@": RegExp(r'[SNLOsnlo]'),
  },
);

final outorgaFormatter = MaskTextInputFormatter(
  mask: '#####/####',
  filter: {"#": RegExp(r'[0-9]')},
);

final ctfFormatter = MaskTextInputFormatter(
  mask: '#######',
  filter: {"#": RegExp(r'[0-9]')},
);

final oesaFormatter = MaskTextInputFormatter(
  mask: '######',
  filter: {"#": RegExp(r'[0-9]')},
);








