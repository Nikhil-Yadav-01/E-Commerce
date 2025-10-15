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

  static const List<String> onboardingSubTitles = <String>[
    'Follow inspiring creators and discover collections tailored for your lifestyle.',
    'Never miss exclusive offers with smart reminders and personalized suggestions.',
    'Experience express checkout with saved cards, UPI, or wallets in one place.',
  ];

  /// Authentication
  static const String signInTitle = 'Sign in to continue';
  static const String signUpTitle = 'Create an account';
  static const String signInSubTitle = "We will send a one time SMS message.";
  static const String signUpSubTitle =
      'Create an account to start shopping and managing your orders.';
  static const String forgotPasswordTitle = 'Forgot your password?';
  static const String forgotPasswordSubtitle =
      'Enter your registered email and we will send a secure reset link.';
  static const String resetPasswordSuccess = 'Password reset successful';
  static const String signInButton = 'Sign in';
  static const String signUpButton = 'Create account';
  static const String continueWithGoogle = 'Continue with Google';
  static const String continueWithApple = 'Continue with Apple';
  static const String orSignInWith = "Or Sign In with";


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

  // -- GLOBAL Texts
  static const String tNo = "No";
  static const String and = "and";
  static const String tYes = "Yes";
  static const String skip = "Skip";
  static const String done = "Done";
  static const String tNext = "Next";
  static const String tLogin = "Login";
  static const String email = "E-Mail";
  static const String submit = "Submit";
  static const String tEmail = "E-Mail";
  static const String tSignup = "Signup";
  static const String tLogout = "Logout";
  static const String ohSnap = "Oh Snap!";
  static const String tSuccess = "Success";
  static const String tPhoneNo = "Phone No";
  static const String password = "Password";
  static const String tContinue = "Continue";
  static const String tPassword = "Password";
  static const String tFullName = "Full Name";
  static const String tGetStarted = "Get Started";
  static const String tForgetPassword = "Forget Password?";
  static const String tSignInWithGoogle = "Sign-In with Google";

  // -- Validation --
  static const String tEmailCannotEmpty = "Email cannot be empty";
  static const String tInvalidEmailFormat = "Invalid email format";
  static const String tNoRecordFound = "No record found";

  // -- SnackBar --
  static const String tAlert = "Alert";
  static const String tOhSnap = "Oh Snap";
  static const String tEmailSent = "Hurray!!! Email is on its way.";
  static const String tCongratulations = "Congratulations";
  static const String tEmailLinkToResetPassword = "Email Link To Reset Password";
  static const String tAccountCreateVerifyEmail = "Account Create Verify Email";

  // -- Splash Screen Text
  static const String tAppName = "Starter Template";
  static const String tAppTagLine = "Learn To Code. \nFree For Everyone";

  // -- On Boarding Text
  static const String tOnBoardingTitle1 = "Build Awesome Apps";
  static const String tOnBoardingTitle2 = "Learn from YouTube";
  static const String tOnBoardingTitle3 = "Get Code & Resources";
  static const String tOnBoardingSubTitle1 = "Let's start your journey with us on this amazing and easy platform.";
  static const String tOnBoardingSubTitle2 = "Get Video Tutorials of each topic to learn things easily.";
  static const String tOnBoardingSubTitle3 = "Save time by just copy pasting complete apps you learned from videos.";
  static const String tOnBoardingCounter1 = "1/3";
  static const String tOnBoardingCounter2 = "2/3";
  static const String tOnBoardingCounter3 = "3/3";

  // -- Login Screen Text
  static const String tLoginTitle = "Welcome Back,";
  static const String tLoginSubTitle = "Make it work, make it right, make it fast.";
  static const String tRememberMe = "Remember Me?";
  static const String tDontHaveAnAccount = "Don't have an Account";
  static const String tEnterYour = "Enter your";
  static const String tResetPassword = "Reset Password";
  static const String tOR = "OR";
  static const String tConnectWith = "Connect With";
  static const String tFacebook = "Facebook";
  static const String tPhoneNumber = "Phone Number";
  static const String tGoogle = "Google";

  // -- Sign Up Screen Text
  static const String tSignUpTitle = "Get On Board!";
  static const String tSignUpSubTitle = "Create your profile to start your Journey.";
  static const String tAlreadyHaveAnAccount = "Already have an Account";

  // -- Verify Email Screen Text
  static const String confirmEmail = "Verify your email address!";
  static const String confirmEmailSubTitle = "Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.";
  static const String resendEmail = "Resend Email";
  static const String yourAccountCreatedTitle = "Your account successfully created!";
  static const String yourAccountCreatedSubTitle = "Welcome to Your Application: Your Account is Created, Unleash the Joy of Seamless Online Experience!";

  // -- Forget Password Text
  static const String tForgetPasswordTitle = "Make Selection!";
  static const String tForgetPasswordSubTitle = "Select one of the options given below to reset your password.";
  static const String tResetViaEMail = "Reset via Mail Verification";
  static const String tResetViaPhone = "Reset via Phone Verification";

  // -- Forget Password Via Phone - Text
  static const String tForgetPhoneSubTitle = "Enter your registered Phone No to receive OTP";

  // -- Forget Password Via E-Mail - Text
  static const String tForgetMailSubTitle = "Enter your registered E-Mail to receive OTP";

  // -- OTP Screen - Text
  static const String tOtpTitle = "CO\nDE";
  static const String tOtpSubTitle = "Verification";
  static const String tOtpMessage = "Enter the verification code sent on your Phone Number ";

  // -- Phone Number Authentication - Text
  static const String phoneNo = '745-628-5429';
  static const String selectCountry = 'Select Country';
  static const String otpVerification = "OTP Verification";
  static const String selectCountryCode = "Select Country Code";
  static const String sendingOTP = "Sending OTP...";
  static const String phoneVerifiedTitle = "Phone Verified";
  static const String phoneVerifiedMessage = "Your phone number has been verified.";
  static const String noInternet = "No Internet";
  static const String checkInternetConnection = "Please check your internet connection and try again.";
  static const String unableToSendOTP = "Unable to send OTP";
  static const String otpSendTitle = "OTP Send";
  static const String otpSendMessage = "OTP Send to your phone number successfully.";
  static const String otpFooter = "Didn’t receive OTP?";
  static const String otpSubTitle = "Please enter the six digit OTP code that we’ve send to your phone number";
  static const String enter6digitOTPCode = "Enter 6 digit OTP Code";
  static const String inText = "in";
  static const String resendOTP = "Re-Send OTP";
  static const String thenLets = "Then let’s ";

  // -- Email Verification
  static const String tEmailVerificationTitle = "Verify your email address";
  static const String tEmailVerificationSubTitle =
      "We have just send email verification link on your email. Please check email and click on that link to verify your Email address. \n\n If not auto redirected after verification, click on the Continue button.";
  static const String tResendEmailLink = "Resend E-Mail Link";
  static const String tBackToLogin = "Back to login";

  // -- Dashboard Screen - Text
  static const String tDashboardTitle = "Hey, Coding with T";
  static const String tDashboardHeading = "Explore Courses";
  static const String tDashboardSearch = "Search...";
  static const String tDashboardBannerTitle2 = "JAVA";
  static const String tDashboardButton = "View All";
  static const String tDashboardTopCourses = "Top Courses";
  static const String tDashboardBannerSubTitle = "10 Lessons";
  static const String tDashboardBannerTitle1 = "Android for Beginners";

  // -- Profile Screen - Text
  static const String tProfile = "Profile";
  static const String tEditProfile = "Edit Profile";
  static const String tLogoutDialogHeading = "Logout";
  static const String tProfileHeading = "Coding with T";
  static const String tProfileSubHeading = "superAdmin@codingwitht.com";

  // -- Menu
  static const String tMenu5 = tLogout;
  static const String tMenu1 = "Settings";
  static const String tMenu4 = "Information";
  static const String tMenu2 = "Billing Details";
  static const String tMenu3 = "User Management";

  // -- Update Profile Screen - Text
  static const String tDelete = "Delete";
  static const String tJoined = "Joined ";
  static const String tJoinedAt = " 31 October 2022";

  // -- Validation
  static const String dateOfBirthError = "You must be at least 18 years old.";

  // -- Dashboard 1
  static const String popularProducts = "Popular Products";
  static const String homeAppbarTitle = "Good day for shopping";
  static const String homeAppbarSubTitle = "Buy more, Save more!";

  static var firstName = "First name";

  static var lastName = "Last name";

  static String changeYourPasswordTitle = "Change your password";

  static String changeYourPasswordSubTitle = "Enter your new password";

}
