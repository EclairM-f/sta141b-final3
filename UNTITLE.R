list1  <- function(x){table$type[[x]][1]}
json <- content(r, as = "text",encoding = "UTF-8")
 table <- fromJSON(json)$response$holidays
 if (length(table)==0){print("Oops! There aren't any holidays within the time frame of your choice. Please change year or month.")}else{
     table <- table %>% mutate(country=table$country$name,date=as.character(as.Date(table$date$iso)),type=sapply(1:length(table$type),list1),states=NULL)
 }
table 
df <- table$type %>% unlist %>% as.data.frame
colnames(df) <- c("TYPE")
new_df <- df %>% group_by(TYPE) %>% count()
colnames(new_df) <- c("Holiday Type","Number of Holidays")
new_df
