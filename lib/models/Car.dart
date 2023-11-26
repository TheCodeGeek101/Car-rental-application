class Car {
   final String name;
   final String image;
   final String image2;
   final String logo;
   final int price;

   Car(this.name, this.image, this.image2, this.logo, this.price);
}

List<Car> cars = [
  Car("Mercedez Benz AMG GT s63", "assets/images/benzamg.jpg", "assets/images/benzlogo.jpg","assets/images/benzamg1.jpg",2000),
  Car("Mercedez Benz c200", "assets/images/c2001.jpg", "assets/images/benzlogo.jpg","assets/images/c200.jpg",1000),
  Car("Bmw M5 series", "assets/images/bmw.jpg", "assets/images/bmwlogo.jpg","assets/images/rear.jpg",2500),
  Car("AUDI RS7", "assets/images/audi.jpg", "assets/images/audilogo.jpg","assets/images/audirs7.jpg",1500),
];

