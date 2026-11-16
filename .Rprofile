# Create default folder structure for R projects
setHook(hookName = "rstudio.sessionInit", value = function(newSession) {
  if (newSession && !is.na(rstudioapi::getActiveProject())) {
    message("Setting default folder structure from .Rprofile file")

    folders <- c(
      "script/functions",
      "input/data",
      "output/plots",
      "output/tables",
	  "output/text",
      "output/objects"
    )

    # Skip folders if their singular or plural parent already exists
    for (folder in folders) {
      parent <- dirname(folder)
      plural_parent <- paste0(parent, "s")

      if (dir.exists(plural_parent)) {
        message("Skipped: ", folder, " (", plural_parent, " already exists)")
      } else if (!dir.exists(folder)) {
        dir.create(folder, recursive = TRUE)
        message("Created: ", folder)
      } else {
        message("Already exists: ", folder)
      }
    }

    cat("Folder structure checked successfully.\n")
  }
}, action = "append")
