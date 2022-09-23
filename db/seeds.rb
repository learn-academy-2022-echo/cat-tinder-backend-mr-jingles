cats = [ {
    id: 1,
    name: "Lindo",
    age: 4,
    enjoys: "Enjoys sleeping and being a bum. Don't expect much from him. Minimal effort type of catdude.",
    image:
      "https://images.unsplash.com/photo-1597237154674-1a0d2274cef4?ixlib=rb-1.2.1&ixid=MnwxM[…]jBjYXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  },

  {
    id: 2,
    name: "meowcycles",
    age: 7,
    enjoys: "A calico, more like caliwoah. Enjoys working out and flexing making other cats sweat.  ",
    image:
      "https://i1.sndcdn.com/artworks-000457187166-b1k6d8-t500x500.jpg" 
  }
]

cats.each do | each_cat |
    Cat.create each_cat
    puts "creating cat #{each_cat}"
end