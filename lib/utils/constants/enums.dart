enum TextSizes {
  small,
  medium,
  large,
}

enum OrderStatus {
  processing,
  shipped,
  delivered,
}

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum RProductSortOption {
  newest,
  priceLowToHigh,
  priceHighToLow,
  ratingHighToLow,
  bestSelling,
  recommended,
}

enum RPaymentStatus {
  unpaid,
  awaitingConfirmation,
  paid,
  failed,
  refunded,
}

enum RPaymentMethod {
  card,
  netBanking,
  upi,
  wallet,
  cashOnDelivery,
}

enum RAddressType {
  home,
  work,
  other,
}

enum RNotificationType {
  orderUpdate,
  promotion,
  cartReminder,
  wishlistBackInStock,
  system,
}

enum RUserTier {
  bronze,
  silver,
  gold,
  platinum,
}

enum RDevicePlatform {
  android,
  ios,
  web,
  desktop,
}