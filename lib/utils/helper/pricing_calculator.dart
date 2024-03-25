
class TPricingCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  static double getTaxRateForLocation(String location) {
    return 0.0;
  }

  static double getShippingCost(String location) {
    return 0.0;
  }

  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currretPrice) => previousPrice + (currretPrice ?? 0));
  // }
}
