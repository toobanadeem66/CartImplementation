class Products {
  final String name;
  final String ImgURL;
  int qty;

  Products({required this.name, required this.ImgURL, required this.qty});
}

List<Products> products = [
  Products(
      name: "Iphone",
      ImgURL:
          "https://images.unsplash.com/photo-1600541519467-937869997e34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXBwbGUlMjBwaG9uZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      qty: 0),
  Products(
      name: "Macbook 2022",
      ImgURL:
          "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXBwbGUlMjBsYXB0b3B8ZW58MHx8MHx8&w=1000&q=80",
      qty: 0),
  Products(
      name: "HP Spectre",
      ImgURL:
          "https://images.unsplash.com/photo-1619532550465-ad4dc9bd680a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c3BlY3RyZXxlbnwwfHwwfHw%3D&w=1000&q=80",
      qty: 0)
];
