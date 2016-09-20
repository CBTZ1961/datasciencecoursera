complete <- function(directory,id= 1:332){
  # Set directories and read files
        wd <- getwd()
        dir <- paste0(wd,'/',directory)
        complete_data <- data.frame()

               for (i in id){
                   k <- formatC(i, width=3, flag="0")
                   filename <- paste0(dir,'/',k,'.csv')
                   datafile <- read.csv(filename)
                   good <- complete.cases(datafile)
                   number_rows <- nrow(datafile[good, ])
                   if (number_rows > 0){
                       complete_data <- rbind(complete_data, c(i,number_rows))
                   }
               }
  #Output 
         names(complete_data) <- c("id", "nobs")
         complete_data
       
}