# =================================================================
# Interactive renv Tutorial
# Run this script step-by-step
# =================================================================

# PART 1: BEFORE RENV =============================================
.libPaths()

# Check if a package is available in system library
"cowsay" %in% rownames(installed.packages())

# If TRUE, you can load it. If FALSE, it's not installed system-wide
# Let's try loading it (only works if you have it installed)
# library(cowsay)


# PART 2: INITIALIZE RENV =========================================
renv::init()

# PART 3: AFTER RENV INITIALIZATION ==============================

# Check library paths again - they've changed!
.libPaths()

# Check the project status
renv::status()

check_locked_packs <- function() {
    lockfile <- jsonlite::read_json("renv.lock")
    names(lockfile$Packages)
}
check_locked_packs()

# Now system-wide packages are NOT available
"cowsay" %in% rownames(installed.packages())


# PART 4: INSTALLING PACKAGES IN RENV ===========================

# Install a package in the renv library
# renv::install("cowsay")
# install.packages("cowsay")

# Check if it's now available
"cowsay" %in% rownames(installed.packages())

# You can now use it!
# library(cowsay)
# say("Hello from renv!", by = "cow")
# say("Hello from renv!", by = "rms")
# say("Hello from renv!", by = "hypnotoad")


# PART 5: SNAPSHOT - RECORDING THE STATE =======================

# Check status - cowsay is installed but not in lockfile
renv::status()
check_locked_packs()

# Take a snapshot to record the package in renv.lock
# library(cowsay)
renv::status()
renv::snapshot()

# Check status again - everything is in sync!
renv::status()
check_locked_packs()



renv::deactivate()
renv::activate()


# Safe removal with checks
# if (dir.exists("renv")) unlink("renv", recursive = TRUE)
if (dir.exists(".renv")) unlink(".renv", recursive = TRUE)
if (file.exists(".Rprofile")) file.remove(".Rprofile")

list.files()
renv::activate()
renv::restore()

# cowsay::say("Hello from renv!", by = "cow")
