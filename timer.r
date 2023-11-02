library(tictoc)

time_scripts <- function() {
  scripts_dir <- "parallel-computing-kamillaannakovacs/scripts/"

# List of specific scripts to time
specific_scripts <- c("solution1.r", "solution2.r", "solution3.r")

for (file in specific_scripts) {
    full_path <- file.path(scripts_dir, file)
    cat("Timing script:", file, "\n")
    tic()
    source(full_path)
    toc()
  }
}

# Calling the function to time the scripts
time_scripts()

# Unfortunately I wasnt really able to figure this one out, and it does not work for me, so the interpretations 
# wouldn't be correct either

