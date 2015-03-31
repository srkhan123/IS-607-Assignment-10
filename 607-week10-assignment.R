# 607-week10-assignment.R
# [For your convenience], here is provided code based in Jared Lander's R for Everyone, 

#install.packages("XML")
#install.packages("rvest")
library(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
class(bowlPool)
#[1] "data.frame"

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?
class(hvalues)
#[1] "list"

# 3. Write R code that shows how many HTML tables are represented in hvalues
sapply(hvalues, nrow)


# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe

hvalues2 <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
class(hvalues2) #[1] "data.frame"

# 5. Modify the returned data frame so only the Last Name and Points columns are shown.

drops <- c("V1","V2")
hvalues2[,!(names(hvalues2) %in% drops)]


# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  

theURL <- "http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"

# 7 How many HTML tables does that page contain?
wiki <- readHTMLTable(theURL)
wiki

sapply(wiki, nrow) #5 tables

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

# ---My web browser is Chrome Version 41.0.2272.101 m
# ---In order to View Page Source I have to put my cursor anywhere on the page and right click,
# ---this pops up a menu, and then I click on View Page Source. 
# ---This open up a new tab with the Source code

# 9 (Optional challenge exercise)
# Instead of using readHTMLTable from the XML package, use the functionality in the rvest package to perform the same task.  
# Which method do you prefer?  Why might one prefer one package over the other?


library("rvest")
url <- "http://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
population <- url %>%
  html() %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/table[1]') %>%
  html_table()
population <- population[[1]]

head(population)
class(population)









