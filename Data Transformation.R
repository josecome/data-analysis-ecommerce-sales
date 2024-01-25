library(plyr)
library(dplyr)
library(gdata)
library(tidyr)
library(data.table)

# Get data in data folder and transform to be used in PowerBI
dir <- ""

# import files
suppliers <- read.csv(paste0(dir, "data/suppliers.csv"))
categories <- read.csv(paste0(dir, "data/categories.csv"))
products <- read.csv(paste0(dir, "data/products.csv"))
orders <- read.csv(paste0(dir, "data/orders.csv"))
order_details <- read.csv(paste0(dir, "data/order_details.csv"))
payments <- read.csv(paste0(dir, "data/payments.csv"))
customers <- read.csv(paste0(dir, "data/customers.csv"))

#======================================Data transformation========================================================
# Transformation not yet made
transformed_suppliers <- suppliers
transformed_categories <- categories
transformed_products <- products
transformed_orders <- orders
transformed_order_details <- order_details
transformed_payments <- payments
transformed_customers <- customers


#==================================End of data transfomation======================================================

dir.create(file.path(dir, "transformed_data"), showWarnings = FALSE)
# Saving transformed data
write.csv(suppliers, paste0(dir, "transformed_data/transformed_suppliers.csv"), row.names = FALSE)
write.csv(categories, paste0(dir, "transformed_data/transformed_categories.csv"), row.names = FALSE)
write.csv(products, paste0(dir, "transformed_data/transformed_products.csv"), row.names = FALSE)
write.csv(orders, paste0(dir, "transformed_data/transformed_orders.csv"), row.names = FALSE)
write.csv(order_details, paste0(dir, "transformed_data/transformed_order_details.csv"), row.names = FALSE)
write.csv(payments, paste0(dir, "transformed_data/transformed_payments.csv"), row.names = FALSE)
write.csv(customers, paste0(dir, "transformed_data/transformed_customers.csv"), row.names = FALSE)
