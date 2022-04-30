
class Food{

  Food(this._name, this._shortDescription, this._description,this._price, this._image, this._imageInfo, this._category);

  final _name,_shortDescription,_description,_price,_image,_imageInfo,_category;

  getName() => _name;
  getShortDescription() => _shortDescription;
  getDescription() => _description;
  getPrice()=> _price;
  getImage()=> _image;
  getImageInfo()=> _imageInfo;
  getCategory() => _category;
}