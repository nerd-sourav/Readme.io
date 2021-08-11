import 'package:news/modals/category_modal.dart';

//function to return the data type of list
//first we created a function which returns the data type of list
//then inside the fucntion we created an empty list which is in the format of category modal;

List<CategoryModal> getCategories() {
  List<CategoryModal> myCategories = [];
  CategoryModal categorieModel = new CategoryModal();

  //1
  categorieModel = new CategoryModal();
  categorieModel.categoryName = "Business";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategoryModal();
  categorieModel.categoryName = "Entertainment";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1616469829941-c7200edec809?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategoryModal();
  categorieModel.categoryName = "General";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80  ";
  myCategories.add(categorieModel);

  //4

  categorieModel = new CategoryModal();
  categorieModel.categoryName = "Health";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80";
  myCategories.add(categorieModel);
  //5

  categorieModel = new CategoryModal();
  categorieModel.categoryName = "Science";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1564325724739-bae0bd08762c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  categorieModel = new CategoryModal();
  //6
  categorieModel.categoryName = "Sports";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";
  myCategories.add(categorieModel);

//7
  categorieModel = new CategoryModal();
  categorieModel.categoryName = "Technology";
  categorieModel.imageUrl =
      "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";

  myCategories.add(categorieModel);
  return myCategories;
}
