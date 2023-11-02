# Updating the MTweedieTests function for parallel processing

# Splitting the R script content into lines 
lines = r_script_content.split('\n')

# Finding the start and end line numbers of the MTweedieTests function
start_line = None
end_line = None
for i, line in enumerate(lines):
    if 'MTweedieTests <-' in line:
        start_line = i
    elif start_line is not None and line.strip() == "}":
        end_line = i
        break

updated_script = r_script_content
if start_line is not None and end_line is not None:
    # Construct the updated function with parallel processing
    updated_function = """
MTweedieTests <-  
  function(N, M, sig) { 
    library(parallel)
    no_cores <- detectCores() - 1
    cl <- makeCluster(no_cores)
    on.exit(stopCluster(cl))
    sim_results <- parSapply(cl, 1:M, function(i) simTweedieTest(N))
    sum(sim_results < sig) / M 
  } 
    """
# Replacing the old function in the script with the new one
    updated_script = '\n'.join(lines[:start_line]) + updated_function + '\n'.join(lines[end_line+1:])

# Displaying a part of the updated script for review
updated_script[:2000]  # Display the first 2000 characters for initial inspection

