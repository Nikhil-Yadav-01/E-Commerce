import 'package:e_commerce/utils/constants/enums.dart';

class RTexts {
  RTexts._();

  /// General app copy
  static const String appName = 'ReShop E-Commerce';
  static const String tagline = 'Discover, shop, and love every moment';
  static const String welcomeBack = 'Welcome back!';
  static const String exploreNow = 'Explore now';

  /// Onboarding titles and descriptions
  static const List<String> onboardingTitles = <String>[
    'Discover curated trends',
    'Unlock daily flash deals',
    'Checkout in a heartbeat',
  ];

  static const List<String> onboardingDescriptions = <String>[
    'Follow inspiring creators and discover collections tailored for your lifestyle.',
    'Never miss exclusive offers with smart reminders and personalized suggestions.',
    'Experience express checkout with saved cards, UPI, or wallets in one place.',
  ];

  /// Authentication
  static const String signInTitle = 'Sign in to continue';
  static const String signUpTitle = 'Create an account';
  static const String forgotPasswordTitle = 'Forgot your password?';
  static const String forgotPasswordSubtitle =
      'Enter your registered email and we will send a secure reset link.';
  static const String resetPasswordSuccess = 'Password reset successful';
  static const String signInButton = 'Sign in';
  static const String signUpButton = 'Create account';
  static const String continueWithGoogle = 'Continue with Google';
  static const String continueWithApple = 'Continue with Apple';

  /// Home screen copy
  static const String homeFeaturedCollections = 'Featured Collections';
  static const String homeFlashSale = 'Flash sale is live';
  static const String homeRecommendedForYou = 'Recommended for you';
  static const String homeRecentlyViewed = 'Recently viewed';
  static const String homeBestSellers = 'Shop best sellers';

  /// Product details
  static const String productDetailsOverviewTitle = 'Product overview';
  static const String productDetailsSpecificationsTitle = 'Specifications';
  static const String productDetailsReviewsTitle = 'Customer reviews';
  static const String productDetailsAddToCart = 'Add to cart';
  static const String productDetailsBuyNow = 'Buy now';
  static const String productDetailsAddedToCart = 'Added to cart';
  static const String productDetailsOutOfStock = 'Currently out of stock';

  /// Cart & checkout
  static const String cartTitle = 'Your cart';
  static const String cartEmptyTitle = 'Your cart is empty';
  static const String cartEmptySubtitle =
      'Add items from featured collections to start shopping.';
  static const String cartProceedToCheckout = 'Proceed to checkout';
  static const String cartApplyCoupon = 'Apply coupon';
  static const String checkoutTitle = 'Checkout';
  static const String checkoutDeliveryAddress = 'Delivery address';
  static const String checkoutPaymentMethod = 'Payment method';
  static const String checkoutReviewOrder = 'Review order';
  static const String checkoutPlaceOrder = 'Place order';

  /// Orders & tracking
  static const String ordersTitle = 'My orders';
  static const String ordersEmptyTitle = 'You have no orders yet';
  static const String ordersEmptySubtitle =
      'Start your shopping journey and track all your orders here.';
  static const String orderTrackingTitle = 'Track order';
  static const String orderSupportCTA = 'Need help? Contact support';

  /// Wishlist
  static const String wishlistTitle = 'Wishlist';
  static const String wishlistEmptyTitle = 'No favorites yet';
  static const String wishlistEmptySubtitle =
      'Tap the heart icons to save items you love for later.';

  /// Profile & settings
  static const String profileTitle = 'Profile';
  static const String profileEdit = 'Edit profile';
  static const String profileAddresses = 'Saved addresses';
  static const String profilePayments = 'Payment methods';
  static const String profilePreferences = 'Preferences';
  static const String profileSecurity = 'Security';
  static const String profileLogout = 'Log out';

  /// Notifications
  static const String notificationsTitle = 'Notifications';
  static const String notificationsEmptyTitle = 'You are all caught up';
  static const String notificationsEmptySubtitle =
      'We will let you know about new deals and order updates right here.';

  static const Map<RNotificationType, String> notificationTitles =
      <RNotificationType, String>{
        RNotificationType.orderUpdate: 'Order update',
        RNotificationType.promotion: 'Hot promotion',
        RNotificationType.cartReminder: 'Cart reminder',
        RNotificationType.wishlistBackInStock: 'Wishlist item is back!',
        RNotificationType.system: 'ReShop announcement',
      };

  /// Error & empty states
  static const String errorGenericTitle = 'Something went wrong';
  static const String errorGenericDescription =
      'Please try again or contact support if the issue persists.';
  static const String emptySearchTitle = 'No results found';
  static const String emptySearchSubtitle =
      'Try adjusting filters or searching for a different keyword.';

  /// Rewards & loyalty
  static const String loyaltyTitle = 'ReShop Rewards';
  static const String loyaltySubtitle =
      'Earn points on every purchase and unlock exclusive perks.';
  static const String loyaltyCTA = 'View rewards ledger';

  /// Miscellaneous copy
  static const String supportEmail = 'support@reshop.app';
  static const String contactNumber = '+1 (800) 555-0114';
  static const String termsOfService = 'Terms of Service';
  static const String privacyPolicy = 'Privacy Policy';
  static const String refundPolicy = 'Refund Policy';
}
