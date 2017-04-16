User.create(username: 'artfactum', email: 'artfactum@example.com',
  password: 'artfactum', password_confirmation: 'artfactum', admin: true)

Category.create(name: 'Applied Art', slug: 'applied')
Category.create(name: 'Digital Art', slug: 'digital')
Category.create(name: 'Literature', slug: 'literature')
Category.create(name: 'Performing Art', slug: 'performing')
Category.create(name: 'Public Art', slug: 'public')
Category.create(name: 'Music', slug: 'music')
Category.create(name: 'Visual Art', slug: 'visual')
Category.create(name: 'Other Art', slug: 'other')

SubCategory.create(name: 'Architecture', slug: 'architecture', category_id: 1)
SubCategory.create(name: 'Arts & Crafts', slug: 'crafts', category_id: 1)
SubCategory.create(name: 'Decorative Arts', slug: 'decorative', category_id: 1)
SubCategory.create(name: 'Data Art', slug: 'data', category_id: 2)
SubCategory.create(name: 'Comic', slug: 'comic', category_id: 3)


