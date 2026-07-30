# Last updated theme (27-05-2025), as used in PBA and Multiverse paper:
# Define custom plot theme
theme_tvp <- function(base_size = 17L,
                      no_grid = FALSE,
                      manuscript_mode = FALSE,
                      ...){
  # Pseudo-import the %+replace% function
  `%+replace%` <- ggplot2::`%+replace%`

  half_line <- base_size/2

  # Build from `theme_bw` as base
  tmp_theme <- ggplot2::theme_bw(base_size = base_size, ...) %+replace%
    ggplot2::theme(
      text                   = ggplot2::element_text(color = "gray45")
      , axis.text            = ggplot2::element_text(size = ggplot2::rel(1))
      , axis.title.x         = ggplot2::element_text(size = ggplot2::rel(1.25), color = 'gray8', margin = ggplot2::margin(t = half_line/2))
      , axis.title.y         = ggplot2::element_text(size = ggplot2::rel(1.25), color = 'gray8', angle = 90, margin = ggplot2::margin(r = half_line/2), vjust = 1)
      , panel.border         = ggplot2::element_blank()
      , axis.line            = ggplot2::element_line(color = 'gray8')
      , legend.position      = 'bottom'
      , legend.justification = 'left'
      , panel.grid           = ggplot2::element_line(color = 'gray92')
      , strip.text           = ggplot2::element_text(color = "white")
      , strip.background     = ggplot2::element_rect(fill  = "gray45",
                                                     color = "gray45")
      , plot.tag             = ggplot2::element_text(color = 'black',
                                                     size = ggplot2::rel(1.25))
    )

  if (manuscript_mode == TRUE) { # Omit all titles, subtitles and captions
    tmp_theme <- tmp_theme + ggplot2::theme(
      plot.title      = ggplot2::element_blank()
      , plot.subtitle = ggplot2::element_blank()
      , plot.caption  = ggplot2::element_blank()
      , legend.title  = ggplot2::element_blank()
    )
  } else { # Define appropriate sizes and colors for titles and subtitles
    tmp_theme <- tmp_theme + ggplot2::theme(
      plot.title      = ggplot2::element_text(size = ggplot2::rel(1.6)
                                                   , color = "gray8"
                                                   , family = "serif")
      , plot.subtitle = ggplot2::element_text(size = ggplot2::rel(1.25))
    )
  }

  if (no_grid == TRUE) { # Remove grid
    tmp_theme <- tmp_theme + ggplot2::theme(
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank()
    )
  }
  tmp_theme
}
