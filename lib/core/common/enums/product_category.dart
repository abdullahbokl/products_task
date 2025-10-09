/// Product categories enum
enum ProductCategory {
  architecture('الهندسة المعمارية', 'Architecture'),
  electronics('الإلكترونيات', 'Electronics'),
  fashion('الأزياء', 'Fashion'),
  food('الطعام', 'Food'),
  furniture('الأثاث', 'Furniture'),
  sports('الرياضة', 'Sports'),
  books('الكتب', 'Books'),
  toys('الألعاب', 'Toys');

  final String arabicName;
  final String englishName;

  const ProductCategory(this.arabicName, this.englishName);

  String getDisplayName() => arabicName;
}

