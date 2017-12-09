# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin account
u = User.new
u.email = "admin@test.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

# user account
u = User.new
u.email = "yyouko22@test.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = false
u.save

# Initialize Product
Product.create!(title: "比利時1",
  description: "比利時巧克力",
  price: 100,
  quantity: 10,
  image: open("https://johnlewis.scene7.com/is/image/JohnLewis/231834314alt1?$prod_main$")
  )

  Product.create!(title: "比利時2",
    description: "比利時巧克力2",
    price: 200,
    quantity: 20,
    image: open("http://www.qklnews.com/uploadfile/2009/0614/20090614010359716.jpg")
    )

  Product.create!(title: "韓國",
    description: "韓國巧克力",
    price: 50,
    quantity: 25,
    image: open("https://gw.alicdn.com/bao/uploaded/i6/T1zGtJXf8IXXc3jyna_121436.jpg_460x460xz.jpg")
    )

  Product.create!(title: "韓國2",
    description: "韓國巧克力2",
    price: 40,
    quantity: 40,
    image: open("https://tshop.r10s.com/243/9c9/dc96/c07a/b06b/4018/2ea5/1122e5b190005056b72487.jpg?_ex=330x330")
    )
