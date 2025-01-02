#' Custom ggplot2 theme for JAMA Style
#'
#' This function returns a ggplot2 theme that adheres to the style guidelines of JAMA (Journal of the American Medical Association).
#' It includes horizontal grid lines, no vertical grid lines, lines for both x and y axes, and a clean, professional look.
#' The theme also uses the JAMA color palettes for points, lines, bars, and fills.
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(x = displ, y = hwy)) +
#'   geom_point() +
#'   theme_jama()
theme_jama <- function() {

  ggplot2::update_geom_defaults("point", list(color = "#2f5763", size = 2))  # JAMA blue color
  ggplot2::update_geom_defaults("line", list(color = "#2f5763", size = 1))  # JAMA blue color
  ggplot2::update_geom_defaults("bar", list(fill = "#eaf1f4", color = "#828384", size = 0.5, alpha=1))  # JAMA blue fill
  ggplot2::update_geom_defaults("boxplot", list(fill = "#eaf1f4", color = "#828384", size = 0.5))  # JAMA blue fill
  ggplot2::update_geom_defaults("smooth", list(color = "#2f5763", fill = "#c8ced1", alpha = 0.4, linetype = "solid"))

  theme_ops <- function(){
    ggplot2::theme_minimal() +
      ggplot2::theme(
        text = ggplot2::element_text(family = "sans", color = "black"),  # JAMA uses sans-serif fonts
        title = ggplot2::element_text(size = 14, face = "bold"),
        axis.title = ggplot2::element_text(size = 12, face = "bold"),
        axis.text = ggplot2::element_text(size = 10, color = "#828384"),
        panel.grid.major.x = ggplot2::element_blank(),  # No vertical grid lines
        panel.grid.major.y = ggplot2::element_line(color = "#c8ced1"),  # Light horizontal grid lines
        panel.grid.minor = ggplot2::element_blank(),  # No minor grid lines
        axis.line = ggplot2::element_line(color = "#828384", size = 0.5),  # Axis lines
        axis.ticks = ggplot2::element_line(color = "#828384"),  # Axis ticks
        axis.ticks.length = ggplot2::unit(0.2, "cm"),  # Tick length
        legend.position = "bottom",  # Legend at the bottom
        legend.title = ggplot2::element_blank(),  # No legend title
        legend.text = ggplot2::element_text(size = 10),  # Legend text size
        plot.title = ggplot2::element_text(hjust = 0.5, face = "bold", size = 16),  # Centered, bold title
        plot.subtitle = ggplot2::element_text(hjust = 0.5, size = 12),  # Centered subtitle
        plot.caption = ggplot2::element_text(hjust = 1, size = 9)  # Right-aligned caption
      )
  }

  list(
    theme_ops(),
    ggsci::scale_color_jama(),
    ggsci::scale_fill_jama()
  )
}
