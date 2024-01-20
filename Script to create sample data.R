# By this script, tables are created
# Updates for this Script still ongoing
#=======================================Tables============================================
# Suppliers
# Products
# Categories
# Orders
# Order_details
# Suppliers_payment
# Payment
# Customers
#========================================================================================
dir <- "C:/Users/COME/Downloads/Master Degree/Coding/Analisis/Data Analisis/data_analysis_ecommerce_sales/"

# Suppliers
id <- seq(1, 6000, by=1)
company_name <- LETTERS[1:20]
contact_f_name <- LETTERS[1:20]
address <- LETTERS[1:1]
city <- LETTERS[1:1]
state <- LETTERS[1:1]
postalcode <- LETTERS[1:1]
country <- LETTERS[1:1]
phone <- runif(n=11, min=400000000, max=900000000)
fax <- runif(n=11, min=400000000, max=900000000)
email <- LETTERS[1:20]
url <- LETTERS[1:20]
payment_methods <- seq(1, 4, by=1)
note <- LETTERS[1:1]

suppliers <- data.frame (
  id, company_name, contact_f_name, address, city, state, postalcode, country, phone,
  fax, email, url, payment_methods, note
)

# Products
id <- seq(1, 6000, by=1)
vendor_id <- seq(1, 6000, by=1)
supplier_id <- seq(1, 2000, by=1)
name <- LETTERS[1:20]
description <- LETTERS[1:20]
notes <- LETTERS[1:20]

products <- data.frame(
  id, vendor_id, supplier_id, name, description, notes
)

# Categoris
id <- seq(1, 6000, by=1)
name <- LETTERS[1:20]
description <- LETTERS[1:20]

categories <- data.frame(
  id, name, description
)

# Orders
id <- seq(1, 6000, by=1)
customer_id <- seq(1, 6000, by=1)
order_number <- seq(1, 6000, by=1)
payment_id <- seq(1, 6000, by=1)
order_date <- c("2000-01-01")
ship_date <- c("2000-01-01")
request_date <- c("2000-01-01")
sales_tax <- 1
freight <- LETTERS[1:1]
deleted <- seq(1, 2, by=1)
deleted_date <- c("2000-01-01")
paid <- seq(1, 2, by=1)
payment_date <- c("2000-01-01")
fulfilled <- seq(1, 2, by=1)

orders <- data.frame(
  id, customer_id, order_number, payment_id, order_date, ship_date, request_date, sales_tax,
  freight, deleted, deleted_date, paid, payment_date fulfilled
)

# Order Details
id <- seq(1, 6000, by=1)
product_id <- seq(1, 6000, by=1)
order_number <- seq(1, 6000, by=1)
qnty <- seq(1, 6, by=1)
price <- runif(n=11, min=400000000, max=900000000)
discount <- runif(n=11, min=400000000, max=900000000)
total_price <- runif(n=11, min=400000000, max=900000000)
deleted <- seq(1, 2, by=1)
deleted_date <- c("2000-01-01")
paid <- seq(1, 2, by=1)
payment_date <- c("2000-01-01")
fulfilled <- seq(1, 2, by=1)

order_details <- data.frame(
  id, product_id, order_number, qnty, price, discount, total_price, deleted, deleted_date,
  paid, payment_date, fulfilled
)

# Payments
id <- seq(1, 6000, by=1)
payment_type <- LETTERS[1:1]
allowed <- seq(1, 2, by=1)

payments <- data.frame(
  id, payment_type, allowed
)

# Customer
id <- seq(1, 6000, by=1)
first_name <- LETTERS[1:20]
last_name <- LETTERS[1:20]
city <- LETTERS[1:1]
state <- LETTERS[1:1]
country <- LETTERS[1:1]

customers <- data.frame(
  id, first_name, last_name, city, state, country
)

orders$ship_date <- as.Date(orders$ship_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)

dir.create(file.path(dir, "data"), showWarnings = FALSE)

write.csv(suppliers, paste0(dir, "data/suppliers.csv"), row.names = FALSE)
write.csv(categories, paste0(dir, "data/categories.csv"), row.names = FALSE)
write.csv(products, paste0(dir, "data/products.csv"), row.names = FALSE)
write.csv(orders, paste0(dir, "data/orders.csv"), row.names = FALSE)
write.csv(order_details, paste0(dir, "data/order_details.csv"), row.names = FALSE)
write.csv(payments, paste0(dir, "data/payments.csv"), row.names = FALSE)
write.csv(customers, paste0(dir, "data/customers.csv"), row.names = FALSE)



