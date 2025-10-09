/// Product categories enum
enum ProductCategory {
  electronics(
    'الإلكترونيات',
    'Electronics',
    'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
  ),
  fashion(
    'الأزياء',
    'Fashion',
    'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400',
  ),
  food(
    'الطعام',
    'Food',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400',
  ),
  furniture(
    'الأثاث',
    'Furniture',
    'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400',
  ),
  sports(
    'الرياضة',
    'Sports',
    'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=400',
  ),
  books(
    'الكتب',
    'Books',
    'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400',
  ),
  toys(
    'الألعاب',
    'Toys',
    'https://images.unsplash.com/photo-1558877385-09dd715f6a2c?w=400',
  ),
  architecture(
    'الهندسة المعمارية',
    'Architecture',
    'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400',
  );

  final String arabicName;
  final String englishName;
  final String imageUrl;

  const ProductCategory(this.arabicName, this.englishName, this.imageUrl);

  String getDisplayName() => arabicName;
}
