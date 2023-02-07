require("dotenv").config();
const app = require("./api");

const userController = require("./controllers/userController");
const productController = require("./controllers/productController");

const port = process.env.API_PORT || 3000;

app.get("/", (_request, response) => {
  response.send();
});

app.post("/user", userController.createUser);

app.post("/product", productController.createProduct);

app.get("/product/:id", productController.getUserProducts);

app.listen(port, () => console.log("listening port", port));
