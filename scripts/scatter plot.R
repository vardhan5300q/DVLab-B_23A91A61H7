#Load and understand DataSet
data(diamonds)
data(package = .packages(all.available = TRUE))
library(ggplot2)
data(diamonds)
str(diamonds)
dim(diamonds)
?diamonds

#Very Basic Scatter
plot(diamonds$carat, diamonds$price)

#Improved Scatter
plot(diamonds$carat, diamonds$price, col = rgb(0, 0, 1, 0, 1), pch = 16, 
     main = "Scatter Plot: Carat VS Price")

#Hexbin Using Base R
#install.packages('hexbin')
library(hexbin)
hb <- hexbin(diamonds$carat, diamonds$price, xbins = 40)
plot(hb, main = "Hexbin Plot")

#Basic Hexbin
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex()

#Labeled Hexbin Plot
ggplot(diamonds, aes(carat, price)) +
  geom_hex() +
  labs(title = "Hexagon Binning: Diamonds Structure", x = "Carat", y = "Price") +
  theme_minimal()

#Control Hexagon Density
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 10) +
  theme_minimal()

#Add Color Palette(Gradient)
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 40) +
  scale_fill_gradient(low = "lightgreen", high = "red") +
  theme_minimal()
#color meaning:
#-Light -> fewer diamonds
#-Dark -> dense region

#Professional Palette(Viridis)
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 35) +
  scale_fill_viridis_c() +
  theme_minimal() 

#Add Legend Title
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 20) +
  scale_fill_viridis_c(name = "Count") +
  labs(title = "Density Structure of Diamonds", x = "Carat", y = "Price") +
  theme_minimal()

#Faceted Hexbin
ggplot(diamonds, aes(carat, price)) +
  geom_hex() +
  scale_fill_viridis_c() +
  facet_wrap(~cut) +
  theme_minimal()

#Log Scale Hexbin
ggplot(diamonds, aes(carat, price)) +
  geom_hex() +
  scale_fill_viridis_c() +
  scale_y_log10() +
  theme_minimal()
