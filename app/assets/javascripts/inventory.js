function addRemoveItem(){

    if (document.getElementsByClass("cart-image").src == '/assets/shopping-cart.png') {
      document.getElementsByClass("cart-image").src='/assets/shopping-cart-added.png';
    } else {
      document.getElementsByClass("cart-image").src='/assets/shopping-cart.png';
    }

}
