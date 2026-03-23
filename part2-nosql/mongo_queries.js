// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E1001",
    name: "Smartphone X",
    category: "Electronics",
    price: 35000,
    brand: "Samsung",
    specifications: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh",
      warranty: "1 year"
    },
    features: ["5G", "AMOLED Display", "Fast Charging"],
    available: true
  },
  {
    product_id: "C2001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "Levis",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Blue", "White"],
    care_instructions: {
      wash: "Machine wash",
      dry: "Do not tumble dry"
    }
  },
  {
    product_id: "G3001",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-20"),
    nutritional_info: {
      calories: 150,
      fat: "8g",
      protein: "6g"
    },
    storage: "Keep refrigerated"
  }
]);

// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

/*
Why index?
Index improves query performance by allowing faster filtering 
on frequently searched fields like category.Since many queries filter by category (e.g., Electronics, Groceries),
MongoDB can quickly locate matching documents without scanning the entire collection.
This reduces query time and improves efficiency, especially for large datasets.
*/