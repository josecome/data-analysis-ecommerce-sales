# By this script, tables are imported from MySQL Server
# Updates for this Script still ongoing
#=======================================Tables============================================
suppliers <- data.frame()
supplier_payments <- data.frame()
categories <- data.frame()
products <- data.frame()
carts <- data.frame()
payments <- data.frame()
customers <- data.frame()
dir <- "path"
#====================================Table of Dates=======================================
id <- seq(1, 2000, by=1)
date_of_act <- c("02/18/22")
dates <- data.frame (id,date_of_act)
dates$date_of_act <- as.Date(dates$date_of_act, format = "%m/%d/%y") + seq(1, 2000, by=1)
dates$year_month <- format(dates$date_of_act, format = '%Y%m')
dates$ymd <- format(dates$date_of_act, format = '%Y%m%d')
# dates <- dates[!duplicated(dates$year_month), ]
#====================================Import tables========================================
library(RMySQL)
mysql_conn <- dbConnect(RMySQL::MySQL(),
                            dbname='laravel',
                            host='127.0.0.1',
                            port=3306,
                            user='root',
                            password='')

for(i in c('prod_categories', 'products', 'carts', 'payments', 'suppliers', 'supplier_payments', 'customers')) {
  # res <- dbListFields(mysql_conn, 'products')
  res <- dbGetQuery(mysql_conn, paste('select * from ', i))
  if(i == 'prod_categories') {
    categories = res
  } else if(i == 'products') {
    products = res
  } else if(i == 'carts') {
    carts = res
  } else if(i == 'payments') {
    payments = res
  } else if(i == 'suppliers') {
    suppliers = res
  } else if(i == 'supplier_payments') {
    supplier_payments = res
  } else if(i == 'customers') {
    customers = res
  }
}
dbDisconnect(mysql_conn)
#===================================Transformation========================================
categories$created_date <- as.Date(categories$created_at)
products$created_date <- as.Date(products$created_at)
carts$created_date <- as.Date(carts$created_at)
carts$qnty_paid <- 0
carts$qnty_paid <- ifelse(!is.na(carts$purchased) & carts$purchased == 1, carts$qnty, carts$qnty_paid)
payments$created_date <- as.Date(payments$created_at)
customers$created_date <- as.Date(customers$created_at)
suppliers$created_date <- as.Date(suppliers$created_at)
supplier_payments$created_date <- as.Date(supplier_payments$created_at)

#----------------------------------Only for Testing purpose------------------------------------------
categories$created_date <- categories$created_date + floor(runif(nrow(categories), min=0, max=350))
products$created_date <- products$created_date + floor(runif(nrow(products), min=0, max=350))
carts$created_date <- carts$created_date + floor(runif(nrow(carts), min=0, max=350))
payments$created_date <- payments$created_date + floor(runif(nrow(payments), min=0, max=350))
customers$created_date <- customers$created_date + floor(runif(nrow(customers), min=0, max=350))
suppliers$created_date <- suppliers$created_date + floor(runif(nrow(suppliers), min=0, max=350))
supplier_payments$created_date <- supplier_payments$created_date + floor(runif(nrow(supplier_payments), min=0, max=350))
#---------------------------------End of only for testing purpose------------------------------------

categories$created_at_ymd <- format(categories$created_date, format = '%Y%m%d')
products$created_at_ymd <- format(products$created_date, format = '%Y%m%d')
carts$created_at_ymd <- format(carts$created_date, format = '%Y%m%d')
payments$created_at_ymd <- format(payments$created_date, format = '%Y%m%d')
suppliers$created_at_ymd <- format(suppliers$created_date, format = '%Y%m%d')
supplier_payments$created_at_ymd <- format(supplier_payments$created_date, format = '%Y%m%d')
customers$created_at_ymd <- format(customers$created_date, format = '%Y%m%d')

customers$customer_id <- customers$id
carts <- merge(x = carts, y = customers[,c('customer_id', 'country')], by = c('customer_id'), all.x = TRUE)
#==================================Output Tables=========================================
dir.create(file.path(dir, "transformed_data"), showWarnings = FALSE)
# Saving transformed data
write.csv(dates, paste0(dir, "transformed_data/dates.csv"), row.names = FALSE)
write.csv(suppliers, paste0(dir, "transformed_data/suppliers.csv"), row.names = FALSE)
write.csv(supplier_payments, paste0(dir, "transformed_data/supplier_payments.csv"), row.names = FALSE)
write.csv(categories, paste0(dir, "transformed_data/categories.csv"), row.names = FALSE)
write.csv(products, paste0(dir, "transformed_data/products.csv"), row.names = FALSE)
write.csv(carts, paste0(dir, "transformed_data/carts.csv"), row.names = FALSE)
# write.csv(order_details, paste0(dir, "transformed_data/order_details.csv"), row.names = FALSE)
write.csv(payments, paste0(dir, "transformed_data/payments.csv"), row.names = FALSE)
write.csv(customers, paste0(dir, "transformed_data/customers.csv"), row.names = FALSE)



