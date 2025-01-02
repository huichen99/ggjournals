#' Custom ggplot2 theme for The Lancet Style
#'
#' This function returns a ggplot2 theme that adheres to the style guidelines of The Lancet.
#' It includes horizontal grid lines, no vertical grid lines, lines for both x and y axes, and a clean, professional look.
#' The theme also uses the Lancet color palettes for points, lines, bars, and fills.
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(x = displ, y = hwy)) +
#'   geom_point() +
#'   theme_lancet()
theme_lancet <- function() {

  ggplot2::update_geom_defaults("point", list(color = "#00539e", size = 2))
  ggplot2::update_geom_defaults("line", list(color = "#00539e", size = 1))
  ggplot2::update_geom_defaults("bar", list(fill = "#00539e", color = NA, alpha = 0.4))
  ggplot2::update_geom_defaults("boxplot", list(fill = "#00539e", color = "black", size = 0.5))
  ggplot2::update_geom_defaults("smooth", list(color = "#00539e", fill = "#00468B", alpha = 0.4, linetype = "solid"))

  theme_ops <- function(){
    ggplot2::theme_minimal() +
      ggplot2::theme(
        text = ggplot2::element_text(family = "sans", color = "black"),  # lancet uses sans-serif fonts
        title = ggplot2::element_text(size = 14, face = "bold"),
        axis.title = ggplot2::element_text(size = 12, face = "bold"),
        axis.text = ggplot2::element_text(size = 10, color = "black"),
        panel.grid.major.x = ggplot2::element_blank(),  # No vertical grid lines
        panel.grid.major.y = ggplot2::element_blank(),  # No horizontal grid lines
        panel.grid.minor = ggplot2::element_blank(),  # No minor grid lines
        axis.line = ggplot2::element_line(color = "black", size = 0.5),  # Axis lines
        axis.ticks = ggplot2::element_line(color = "black"),  # Axis ticks
        axis.ticks.length = ggplot2::unit(0.2, "cm"),  # Tick length
        legend.position = "right",  # Legend at the bottom
        legend.title = ggplot2::element_blank(),  # No legend title
        legend.text = ggplot2::element_text(size = 10),  # Legend text size
        plot.title = ggplot2::element_text(face = "bold"),  # Centered, bold title
        plot.subtitle = ggplot2::element_text(),  # Centered subtitle
        legend.justification = "left",
      )
  }

  list(
    theme_ops(),
    ggsci::scale_color_lancet(),
    ggsci::scale_fill_lancet()
  )
}
