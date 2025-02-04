Assignment 2
#4
csv_files <- list.files(path = "Data/", pattern = "\\.csv$", full.names = TRUE)
print(csv_files)
#5
num_csv_files <- length(csv_files)
print(num_csv_files)
#6
df <- read.csv("Data/wingspan_vs_mass.csv")
head(df)
#7
head(df, 5)
#8
b_files <- list.files(path = "Data/", pattern = "^b", full.names = TRUE, recursive = TRUE)
print(b_files)
#9
b_files <- list.files(path = "Data/", pattern = "^b", full.names = TRUE, recursive = TRUE)

for(file in b_files) {
  cat("File:", file, "\n")
  first_line <- readLines(file, n = 1)
  cat("First line:", first_line, "\n\n")
}
#10
csv_files <- list.files(path = "Data/", pattern = "\\.csv$", full.names = TRUE, recursive = TRUE)
for(file in csv_files) {
  cat("File:", file, "\n")
  first_line <- readLines(file, n = 1)
  cat("First line:", first_line, "\n\n")
}
