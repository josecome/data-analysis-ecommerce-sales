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
dir <- ""

# Suppliers
id <- seq(1, 6000, by=1)
company_name <- LETTERS[1:20]
contact_f_name <- LETTERS[1:20]
address <- LETTERS[1:20]
city <- LETTERS[1:3]
state <- LETTERS[1:12]
postalcode <- LETTERS[1:1]
country <- LETTERS[1:1]
payment_methods <- seq(1, 4, by=1)
email <- LETTERS[1:20]
url <- LETTERS[1:20]
note <- LETTERS[1:1]

suppliers <- data.frame (
  id, company_name, contact_f_name, address, city, state, postalcode, country,  email, 
  payment_methods, email, url, note
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
deleted <- 0
deleted_date <- c("2000-01-01")
paid <- seq(1, 2, by=1)
payment_date <- c("2000-01-01")
fulfilled <- seq(1, 2, by=1)

orders <- data.frame(
  id, customer_id, order_number, payment_id, order_date, ship_date, request_date, sales_tax,
  freight, deleted, deleted_date, paid, payment_date, fulfilled
)
orders$ship_date <- as.Date(orders$ship_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)
orders$deleted_date <- as.Date(orders$deleted_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)
orders$deleted_date[sample(nrow(orders),5500)]<-NA
orders$payment_date <- as.Date(orders$payment_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)
orders$deleted <- ifelse(is.na(orders$deleted_date), 1, 0)

# Order Details
id <- seq(1, 6000, by=1)
product_id <- seq(1, 6000, by=1)
order_number <- seq(1, 6000, by=1)
qnty <- seq(1, 6, by=1)
price <- 1
discount <-1
final_price <- 1
deleted <- seq(1, 2, by=1)
deleted_date <- c("2000-01-01")
paid <- seq(1, 2, by=1)
payment_date <- c("2000-01-01")
fulfilled <- seq(1, 2, by=1)

order_details <- data.frame(
  id, product_id, order_number, qnty, price, discount,final_price, deleted, deleted_date,
  paid, payment_date, fulfilled
)
order_details$deleted_date <- as.Date(order_details$deleted_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)
order_details$deleted_date[sample(nrow(order_details),5500)]<-NA
order_details$payment_date <- as.Date(order_details$payment_date, format = "%m/%d/%y") + runif(n=1, min=1, max=6000)
order_details$price <-sample(1:100, nrow(order_details), replace = TRUE)
order_details$discount <- sample(1:10, nrow(order_details), replace = TRUE)
order_details$discount <- ifelse(order_details$discount > 0, order_details$discount, NA)
order_details$final_price <- order_details$price - order_details$discount


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

dir.create(file.path(dir, "data"), showWarnings = FALSE)

write.csv(suppliers, paste0(dir, "data/suppliers.csv"), row.names = FALSE)
write.csv(categories, paste0(dir, "data/categories.csv"), row.names = FALSE)
write.csv(products, paste0(dir, "data/products.csv"), row.names = FALSE)
write.csv(orders, paste0(dir, "data/orders.csv"), row.names = FALSE)
write.csv(order_details, paste0(dir, "data/order_details.csv"), row.names = FALSE)
write.csv(payments, paste0(dir, "data/payments.csv"), row.names = FALSE)
write.csv(customers, paste0(dir, "data/customers.csv"), row.names = FALSE)



