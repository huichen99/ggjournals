#' Custom ggplot2 theme for BMJ Style
#'
#' This function returns a ggplot2 theme that adheres to the style guidelines of the BMJ (British Medical Journal).
#' It includes horizontal grid lines, no vertical grid lines, and lines for both x and y axes.
#' The theme also uses the BMJ color palettes for points, lines, bars, and fills.
#'
#' @return A ggplot2 theme object combined with color and fill palettes.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(x = displ, y = hwy)) +
#'   geom_point() +
#'   theme_bmj()
theme_bmj <- function() {
  
  ggplot2::update_geom_defaults("point", list(color = "#2A6EBB", size = 2))  # BMJ blue color
  ggplot2::update_geom_defaults("line", list(color = "#2A6EBB", size = 1))  # BMJ blue color
  ggplot2::update_geom_defaults("bar", list(fill = "#2A6EBB", color = NA, alpha = 0.4))  # BMJ blue fill
  ggplot2::update_geom_defaults("boxplot", list(fill = "#2A6EBB", color = "black", size = 0.5))  # BMJ blue fill
  ggplot2::update_geom_defaults("smooth", list(color = "#2A6EBB", fill = "#2A6EBB", alpha = 0.4, linetype = "solid"))  # BMJ blue color
  
  theme_ops <- function(){
    ggplot2::theme_minimal() +
      ggplot2::theme(
        text = ggplot2::element_text(family = "sans"),
        title = ggplot2::element_text(face = "bold"),
        axis.title = ggplot2::element_text(size = 12),
        axis.text = ggplot2::element_text(size = 10),
        panel.grid.major.x = ggplot2::element_blank(),  # No vertical grid lines
        panel.grid.major.y = ggplot2::element_line(color = "#D4D4D5"),  # Horizontal grid lines
        panel.grid.minor = ggplot2::element_blank(),  # No minor grid lines
        axis.line = ggplot2::element_line(color = "#747678"),  # Add lines for x and y axes
        axis.ticks = ggplot2::element_line(color = "#747678"),  # Add ticks
        axis.ticks.length = ggplot2::unit(-0.15, "cm"),  # Set tick length
        axis.ticks.x = ggplot2::element_line(),  # Ensure ticks are displayed on x-axis
        axis.ticks.y = ggplot2::element_blank(),  # No ticks on y-axis
        legend.position = "top",
        legend.justification = "left",
      )
  }
  list(
    theme_ops(),
    ggsci::scale_color_bmj(),
    ggsci::scale_fill_bmj()
  )
}