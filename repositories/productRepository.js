
// Dependencies

// require the database connection
const { sql, dbConnPoolPromise } = require('../database/db.js');

// models
const Product = require('../models/product.js');

// Define SQL statements here for use in function below
// These are parameterised queries note @named parameters.
// Input parameters are parsed and set before queries are executed

// for json path - Tell MS SQL to return results as JSON 
const SQL_SELECT_ALL = 'SELECT * FROM wdd.product ORDER BY product_name ASC for json path;';

// for json path, without_array_wrapper - use for single json result
const SQL_SELECT_BY_ID = 'SELECT * FROM wdd.product WHERE _id = @id for json path, without_array_wrapper;';

// for json path, without_array_wrapper - use for single json result
const SQL_SELECT_BY_CATID = 'SELECT * FROM wdd.product WHERE category_id = @id ORDER BY product_name ASC for json path;';

// Second statement (Select...) returns inserted record identified by ProductId = SCOPE_IDENTITY()
const SQL_INSERT = 'INSERT INTO wdd.product (category_id, product_name, product_description, product_stock, product_price) VALUES (@categoryId, @productName, @productDescription, @ProductStock, @ProductPrice); SELECT * from dbo.Product WHERE ProductId = SCOPE_IDENTITY();';
const SQL_UPDATE = 'UPDATE wdd.product SET category_id = @categoryId, product_name = @productName, product_description = @productDescription, ProductStock = @ProductStock, ProductPrice = @ProductPrice WHERE ProductId = @id; SELECT * FROM dbo.Product WHERE ProductId = @id;';
const SQL_DELETE = 'DELETE FROM wdd.product WHERE _id = @id;';


// Get all products
// This is an async function named getProducts defined using ES6 => syntax
let getProducts = async () => {

    // define variable to store products
    let products;

    // Get a DB connection and execute SQL (uses imported database module)
    // Note await in try/catch block
    try {
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // execute query
            .query(SQL_SELECT_ALL);
        
        // first element of the recordset contains products
        products = result.recordset[0];

    // Catch and log errors to cserver side console 
    } catch (err) {
        console.log('DB Error - get all products: ', err.message);
    }

    // return products
    return products;
};

// get product by id
// This is an async function named getProductById defined using ES6 => syntax
let getProductById = async (productId) => {

    let product;

    // returns a single product with matching id
    try {
        // Get a DB connection and execute SQL
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // set @id parameter in the query
            .input('id', sql.Int, productId)
            // execute query
            .query(SQL_SELECT_BY_ID);

        // Send response with JSON result    
        product = result.recordset[0];

        } catch (err) {
            console.log('DB Error - get product by id: ', err.message);
        }
        
        // return the product
        return product;
};

// Get products by category
let getProductByCatId = async (categoryId) => {

    let products;

    // returns products with matching category id
    try {
        // Get a DB connection and execute SQL
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // set named parameter(s) in query
            .input('id', sql.Int, categoryId)
            // execute query
            .query(SQL_SELECT_BY_CATID);

        // Send response with JSON result    
        products = result.recordset[0];

        } catch (err) {
            console.log('DB Error - get product by category id: ', err.message);
        }

    return products;
};


// To be implemented
// insert/ create a new product
let createProduct = async (product) => {

    return true;
};

// update an existing product
let updateProduct = async (product) => {

    return true;
};

// delete a product
let deleteProduct = async (id) => {

    return true;
};

// Export 
module.exports = {
    getProducts,
    getProductById,
    getProductByCatId,
    createProduct,
    updateProduct,
    deleteProduct
};
