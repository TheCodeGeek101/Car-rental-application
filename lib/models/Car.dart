class Car {
   final String name;
   final String image;
   final String image2;
   final String logo;
   final int price;

   Car(this.name, this.image, this.image2, this.logo, this.price);
}

List<Car> cars = [
  Car("Mercedez Benz AMG GT s63", "assets/benzamg.jpg", "assets/benzlogo.jpg","assets/benzamg1.jpg",2000),
  Car("Mercedez Benz c200", "assets/c2001.jpg", "assets/benzlogo.jpg","assets/c200.jpg",1000),
  Car("Bmw M5 series", "assets/bmw.jpg", "assets/bmwlogo.jpg","assets/rear.jpg",2500),
  Car("AUDI RS7", "assets/audi.jpg", "assets/audilogo.jpg","assets/audirs7.jpg",1500),
];

