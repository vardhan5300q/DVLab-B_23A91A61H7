data(mtcars)
str(mtcars)
head(mtcars)
heatmap(as.matrix(mtcars))

#improved Heat Map wirth Labels
heatmap(as.matrix(mtcars), main="HeatMap of mtcars Dataset", Colv= NA , Rowv =NA)

#Heat Map with Custom Colors
colors<- colorRampPalette(c("blue","yellow","red"))(50)
heatmap(as.matrix(mtcars), col= colors, main="custom Color HeatMap", Colv= NA , Rowv =NA)

#Correlation Heat MAp(Base R)
corr_matrix <-cor(mtcars)
heatmap( corr_matrix, col =colorRampPalette(c("blue","white","red"))(50),
         main="Correlation Heatmap of mtcars", Colv= NA , Rowv =NA)

#ggplot Heat Map(Basic)
library(reshape2)
mtcars$Car <- rownames(mtcars)
mtcars_long <- melt(mtcars , id.cars="Car")
View(mtcars_long)

library(ggplot2)
ggplot(mtcars_long, aes(x=variable ,y=Car , fill=value))+ geom_tile()

#Styled ggplot Heat map
ggplot(mtcars_long, aes(x=variable ,y=Car , fill=value))+ geom_tile()+
  scale_fill_gradient(low="white", high="red")+
  theme_minimal()+ labs(title="HeatMap of mtcars Dataset")

#Another way
ggplot(mtcars_long , aes(variable,Car,fill=value))+
  geom_tile() + scale_fill_viridis_c() +  theme_minimal()

#CORRELATION HeatMap with ggplot2
corr_matrix <-cor(mtcars[, sapply(mtcars, is.numeric)])
corr_long <- melt(corr_matrix)
ggplot(corr_long , aes(x=Var1 , y=Var2 , fill=value))+
  geom_tile()+
  scale_fill_gradient2(low = "blue",mid="white",high="red",midpoint = 0)+
  theme_minimal()+
  labs(title = "Correlation HeatMap of mtcars")

#HEatMap with values displayed
ggplot(corr_long , aes(x=Var1 , y=Var2 , fill=value)) +
  geom_tile()+
  geom_text(aes(label=round(value,2)))+
  scale_fill_gradient2(low = "blue",mid="white",high="red",midpoint = 0)+
  theme_minimal()

#Advanced Heat Map using `pheatmap`
install.packages("pheatmap")
library(pheatmap)
pheatmap(
  cor(mtcars[, sapply(mtcars, is.numeric)]),
  display_numbers = round(corr_matrix, 2),
  main = "Advanced Correlation Heatmap"
)
