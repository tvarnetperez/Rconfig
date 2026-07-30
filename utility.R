# Wrapper for multiple inspecting function calls
# To use only interactively/in console
whatis <- function(x, print_str = TRUE){
  # Numeric aspects of the object
  numeric_vector <- c(capture.output(dim(x)), as.character(length(x)), is.atomic(x))
  names(numeric_vector) <- c("Dimension", "Length", "Atomic?")
  # Type, class and mode 
  character_vector <- c(class(x), mode(x), typeof(x))
  names(character_vector) <- c("Class", "Mode", "Type of")
  # Structure, since it has multiple elements
  structure <- capture.output(str(x))
  names(structure) <- "Structure"
  # Print a list with both vectors
  print(list(numeric_vector, character_vector, if(print_str == TRUE) structure))
}
