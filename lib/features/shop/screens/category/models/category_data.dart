class CategoryData {
  static Map<String, String> getCategorySections(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'sports':
        return {
          'Sports Equipment': 'equipment',
          'Sports Shoes': 'shoes',
          'Track Suits': 'suits',
        };
      case 'cosmetics':
        return {
          'Makeup': 'makeup',
          'Skincare': 'skincare',
          'Fragrances': 'fragrances',
        };
      case 'electronics':
        return {
          'Smartphones': 'phones',
          'Laptops': 'laptops',
          'Accessories': 'accessories',
        };
      case 'clothing':
        return {
          'Men\'s Wear': 'mens',
          'Women\'s Wear': 'womens',
          'Kids Wear': 'kids',
        };
      case 'furniture':
        return {
          'Living Room': 'living',
          'Bedroom': 'bedroom',
          'Office': 'office',
        };
      default:
        return {
          'Products': 'products',
          'Accessories': 'accessories',
          'Premium': 'premium',
        };
    }
  }
}