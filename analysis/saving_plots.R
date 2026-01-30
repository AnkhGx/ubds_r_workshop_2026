library(ggplot2)

ggplot(gapminder,
       aes(x = year, y = lifeExp,
           color = country)) +
  geom_line() + theme(legend.position = "none")

# Save most recent ggplot

ggsave("most_recent_gapminder_plot.pdf")

# Save PDF
pdf("plot_from_function_pdf_gapminder.pdf",
    width = 12, height = 4)
ggplot(gapminder,
       aes(x = year, y = lifeExp,
           color = country)) + geom_line() + theme(legend.position = "none")
dev.off()
pdf("plot_from_func_pdf_gapminder_2.pdf",
    width = 12,
    height = 4,
    pointsize = 12,
    family = "sans")
ggplot(gapminder,
       aes(x = year, y = lifeExp,
           color = country)) + geom_line() + theme(legend.position = "none")
dev.off()

pdf("multi_page.pdf", width = 10, height = 6)
plot(x = 1:10, y = 1:10)
plot(x = 1:10, y = (1:10)^2)
plot(x = 1:10, y = sqrt(1:10))
dev.off()

# Saving tables
aust_subset <- gapminder[gapminder$country == "Australia", ]
head(aust_subset)
dim(aust_subset)

write.csv(aust_subset,
          file = "data/gapminder_aust_subset.csv",
          row.names = FALSE,
          quote = FALSE)
write.table(aust_subset,
            file = "data/gapminder_aust_subset_from_write_table.csv",
            sep = ",")

# library(readxl)
# WriteXLS::WriteXLS()
# library(haven)
# write_sas(df, "location")

gapminder_australia_read_dt <- read.csv(data/gapminder_aust_subset.csv)
