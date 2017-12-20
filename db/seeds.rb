# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin account
u = User.new
u.email = "yyouko22@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = false
u.is_admin = true
u.save

#分類
Category.create!(name: "比利時")
Category.create!(name: "韓國")
Category.create!(name: "日本")

# Initialize Product
Product.create!(title: "比利時1",
  description: "比利時巧克力",
  price: 100,
  quantity: 10,
  category_id: 1,
  image: open("app/assets/images/b1.jpeg")
  )

Product.create!(title: "韓國1",
  description: "韓國巧克力1",
  price: 50,
  quantity: 25,
  category_id: 2,
  image: open("app/assets/images/k1.jpg")
  )

Product.create!(title: "日本1",
  description: "日本巧克力1",
  price: 50,
  quantity: 25,
  category_id: 2,
  image: open("app/assets/images/j1.jpg")
  )


  Product.create!(title: "比利時2",
    description: "比利時巧克力2",
    price: 200,
    quantity: 20,
    category_id: 1,
    image: open("app/assets/images/b2.jpg")
    )


  Product.create!(title: "韓國2",
    description: "韓國巧克力2",
    price: 40,
    quantity: 40,
    category_id: 2,
    image: open("app/assets/images/k2.jpg")
    )

  Product.create!(title: "日本2",
    description: "日本巧克力2",
    price: 40,
    quantity: 40,
    category_id: 2,
    image: open("app/assets/images/j2.jpg")
    )
