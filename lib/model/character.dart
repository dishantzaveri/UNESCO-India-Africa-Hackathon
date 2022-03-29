class Character {
  final String title;
  final String value;
  bool isSelected;

  Character(
      {required this.value, required this.title, this.isSelected = false});
}

List<Character> amnioticFuildList = <Character>[
  Character(value: 'I', title: 'Membrane intact', isSelected: true),
  Character(value: 'C', title: 'Membrane rupture (liquor clear)'),
  Character(value: 'M', title: 'Membrane rupture (meconiun stained liquor)'),
  Character(value: 'A', title: 'Membrane rupture (liquor absent)'),
];

List<Character> moudlingList = <Character>[
  Character(value: '0', title: 'bones separated', isSelected: true),
  Character(value: '+', title: 'bones touching but can be separated'),
  Character(value: '++', title: 'bone over lapping'),
  Character(value: '+++', title: 'bones over lapping severely'),
];

 
List<Character> urineList = <Character>[
  Character(value: '-', title: 'NIL', isSelected: true),
  Character(value: '+', title: 'PRESENT')
];
