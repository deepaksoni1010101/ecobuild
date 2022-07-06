class MyDatas {
  String name;
  String image;

  MyDatas(
    this.name,
    this.image,
  );
}

List<MyDatas> dataList = [
  MyDatas("Men", "https://avatars.githubusercontent.com/u/73026702?v=4"),
  MyDatas("Women",
      "https://media-exp2.licdn.com/dms/image/C4D03AQFEinTZ9JQbcw/profile-displayphoto-shrink_400_400/0/1648991671046?e=1661990400&v=beta&t=st5tD0vYmu0ISC8JFJvoOvej81lKDwWlu93rEmeTvgs"),
  MyDatas("Kids",
      "https://res.cloudinary.com/practicaldev/image/fetch/s--H3ErTaXk--/c_fill,f_auto,fl_progressive,h_320,q_auto,w_320/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/531379/d6ac24ed-bc25-46d7-8a24-d2b3d60db4c9.png"),
  MyDatas("Pets", "https://avatars.githubusercontent.com/u/91661583?v=4"),
  MyDatas("Beauty", "https://avatars.githubusercontent.com/u/108119062?v=4"),
];
