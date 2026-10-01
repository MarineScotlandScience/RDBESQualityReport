#### Load data and packages 

## load packages
library(icesTAF)
library(icesRDBES)

#### Download CL data ####
my_filter <- list(
  dataType = "CL",
  format = "SingleCsvFile",
  hierarchies       = list("HCL"),
  clFilters         = list(
    clVesselFlagCountry = list("GB-SCT"),       # Mandatory for Permissions
    clYear              = list("2021","2022","2023","2024","2025") # Available Optional Filter
    # clArea              = list(),             # Available Optional Filter
    # clSpeciesCode       = list()              # Available Optional Filter
  )
)

# Download the data using the defined filter and save it to the specified directory
zipfile <- rdbes_download_data(my_filter)  

message("\nCL data downloaded\n")

# Define where you want it stored
new_zipfile <- file.path("CLdata", "HCL.zip")

# Create destination folder if needed
dir.create("CLdata", showWarnings = FALSE)

# Move and rename the file
file.rename(zipfile, new_zipfile)

message("\nCL data saved as ", new_zipfile, "\n")


#### Download CE data ####
my_filter <- list(
  dataType = "CE",
  format = "SingleCsvFile",
  hierarchies       = list("HCE"),
  ceFilters         = list(
    ceVesselFlagCountry = list("GB-SCT"),       # Mandatory for Permissions
    ceYear              = list("2021","2022","2023","2024","2025") # Available Optional Filter
    # clArea              = list(),             # Available Optional Filter
    # clSpeciesCode       = list()              # Available Optional Filter
  )
)

# Download the data using the defined filter and save it to the specified directory
zipfile <- rdbes_download_data(my_filter)  

message("\nCE data downloaded\n")

# Define where you want it stored
new_zipfile <- file.path("CEdata", "HCE.zip")

# Create destination folder if needed
dir.create("CEdata", showWarnings = FALSE)

# Move and rename the file
file.rename(zipfile, new_zipfile)

message("\nCE data saved as ", new_zipfile, "\n")

