# =================================================================
# Interactive renv Tutorial
# Run this script step-by-step with your students
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


# # PART 6: WHAT'S IN THE LOCKFILE? ==============================
# cat("\n=== PART 6: Inspecting the lockfile ===\n\n")
#
# # View the lockfile
# cat("13. The lockfile (renv.lock) contains:\n")
# cat("    - R version\n")
# cat("    - Package versions\n")
# cat("    - Package sources\n\n")
#
# # You can peek at it
# if (file.exists("renv.lock")) {
#     lockfile <- jsonlite::read_json("renv.lock")
#     cat("R version:", lockfile$R$Version, "\n")
#     cat("Number of packages:", length(lockfile$Packages), "\n")
#     cat("Some packages:", paste(head(names(lockfile$Packages), 5), collapse = ", "), "...\n")
# }
#
# cat("\n>>> Press Enter to continue to Part 7...")
# readline()
#


# PART 8: CLEANUP (OPTIONAL) ===================================
# cat("\n\n=== PART 8: Cleanup (optional) ===\n\n")
#
# cat("If you want to remove renv from this project:\n")
# cat("    - renv::deactivate()  : Deactivate renv\n")
# cat("    - Delete renv/, .Rprofile, renv.lock\n\n")
#
# cat("Do you want to deactivate renv now? (y/n): ")
# response <- readline()
#
# if (tolower(response) == "y") {
#     renv::deactivate()
#     cat("renv deactivated. You can manually delete the renv files.\n")
# } else {
#     cat("renv remains active. Happy coding!\n")
# }

renv::deactivate()
renv::activate()

# PART 7: SHARING YOUR PROJECT ===============================
cat("\n=== PART 7: Sharing your project ===\n\n")

cat("14. To share your project:\n")
cat("    a) Share your code + renv.lock file\n")
cat("    b) Collaborators run: renv::restore()\n")
cat("    c) renv will install the EXACT same package versions\n\n")

cat("15. Key renv commands:\n")
cat("    - renv::init()      : Initialize renv in project\n")
cat("    - renv::install()   : Install packages\n")
cat("    - renv::snapshot()  : Save current state to lockfile\n")
cat("    - renv::restore()   : Install packages from lockfile\n")
cat("    - renv::status()    : Check project status\n")
cat("    - renv::update()    : Update packages\n")

renv::deactivate()

# Safe removal with checks
# if (dir.exists("renv")) unlink("renv", recursive = TRUE)
if (dir.exists(".renv")) unlink(".renv", recursive = TRUE)
if (file.exists(".Rprofile")) file.remove(".Rprofile")

list.files()
renv::activate()
renv::restore()

# cowsay::say("Hello from renv!", by = "cow")
