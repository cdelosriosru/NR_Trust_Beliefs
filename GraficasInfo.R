


# PROJECT :     	Mining-Oil-Gallup
# AUTHOR :				Lina Diaz
# PURPOSE :				?

#--------------------------------------------------------------------
# INITIALIZE
#--------------------------------------------------------------------
#Clean the workspace
rm(list=ls())
cat("\014")
local({r <- getOption("repos"); r["CRAN"] <- "http://cran.r-project.org"; options(repos=r)}) #set repo


#Load Packages

z<-c("tidyverse","haven","dplyr","ggplot") # some classic packages that I use. 
lapply(z, library, character.only = TRUE)
rm(z)


# Paths-----

user = "C:/Users/cdelo/Dropbox/" #Aquí el directorio personal, el resto es idéntico para todos.
data = paste(user,"Gallup-Experimental/NR_Trust_Beliefs/Data", sep="")



########################### MINERIA ###########################

# Read Data-------
setwd(data)

Rinformacion_mineria <- read_dta("Rinformacion_mineria.dta")
#Rinformacion_mineria <- read.csv("Rinformacion_mineria.csv") # Este archivo no existe.

#View database 
View(Rinformacion_mineria)

#Factor for country
levels(Rinformacion_mineria$pais)
Rinformacion_mineria$pais <- gsub(pattern = 1, replacement = "Colombia", x = Rinformacion_mineria$pais) 
Rinformacion_mineria$pais <- gsub(pattern = 2, replacement = "Peru", x = Rinformacion_mineria$pais) 
Rinformacion_mineria$pais <- gsub(pattern = 3, replacement = "Ecuador", x = Rinformacion_mineria$pais) 
Rinformacion_mineria$pais <- gsub(pattern = 4, replacement = "Bolivia", x = Rinformacion_mineria$pais) 
Rinformacion_mineria$pais <- gsub(pattern = 5, replacement = "Venezuela", x = Rinformacion_mineria$pais) 

levels(as.factor(Rinformacion_mineria$pais))
Rinformacion_mineria$pais <- factor(Rinformacion_mineria$pais,
         levels = c("Colombia", "Peru", "Ecuador", "Bolivia", "Venezuela"))

#Factor for informacion_mineria
levels(Rinformacion_mineria$informacion_mineria)
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 1, replacement = "Familiar o amigo", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 2, replacement = "No se informó", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 3, replacement = "Internet", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 4, replacement = "Otros", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 5, replacement = "Prensa", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 6, replacement = "Radio", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 7, replacement = "Redes sociales", x = Rinformacion_mineria$informacion_mineria) 
Rinformacion_mineria$informacion_mineria <- gsub(pattern = 8, replacement = "Televisión", x = Rinformacion_mineria$informacion_mineria) 

levels(as.factor(Rinformacion_mineria$informacion_mineria))
Rinformacion_mineria$informacion_mineria <- factor(Rinformacion_mineria$informacion_mineria,
                                    levels = c("Familiar o amigo", "No se informó", "Internet", "Otros", "Prensa", "Radio", "Redes sociales", "Televisión"))

#Creating dataset 
Rinformacion_mineria = Rinformacion_mineria %>% arrange(pais, pc)

#Set a number of 'empty bar' to add at the end of each group
empty_bar=3
to_add = data.frame( matrix(NA, empty_bar*nlevels(Rinformacion_mineria$pais), ncol(Rinformacion_mineria)) )
colnames(to_add) = colnames(Rinformacion_mineria)
to_add$pais=rep(levels(Rinformacion_mineria$pais), each=empty_bar)
Rinformacion_mineria=rbind(Rinformacion_mineria, to_add)
Rinformacion_mineria=Rinformacion_mineria %>% arrange(pais)
Rinformacion_mineria$id=seq(1, nrow(Rinformacion_mineria))

# Get the name and the y position of each label
label_data_L=Rinformacion_mineria
number_of_bar_L=nrow(label_data_L)
angle= 90 - 360 * (label_data_L$id-0.5) /number_of_bar_L     # I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)
label_data_L$hjust<-ifelse(angle < -90, 1, 0)
label_data_L$angle<-ifelse(angle < -90, angle+180, angle)

# prepare a data frame for base lines
base_data_L=Rinformacion_mineria %>% 
  group_by(pais) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))

# prepare a data frame for grid (scales)
grid_data_L = base_data_L
grid_data_L$end = grid_data_L$end[ c( nrow(grid_data_L), 1:nrow(grid_data_L)-1)] + 1
grid_data_L$start = grid_data_L$start - 1
grid_data_L=grid_data_L[-1,]



# Make the plot
Graph_L = ggplot(Rinformacion_mineria, aes(x=as.factor(id), y=pc, fill=pais)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  geom_bar(aes(x=as.factor(id), y=pc, fill=pais), stat="identity", alpha=0.5) +
  
  # Add a val=80/60/40/20 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data_L, aes(x = end, y = 80, xend = start, yend = 80), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 40, xend = start, yend = 40), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 20, xend = start, yend = 20), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +

  # Add text showing the value of each 100/75/50/25 lines
  annotate("text", x = rep(max(Rinformacion_mineria$id),4), y = c(20, 40, 60, 80), label = c("20", "40", "60", "80") , color="grey", size=3 , angle=0, fontface="bold", hjust=1) +
  geom_bar(aes(x=as.factor(id), y=pc, fill=pais), stat="identity", alpha=0.5) +
  ylim(-100,120) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm"))  +
  coord_polar()+
  geom_text(data=label_data_L, aes(x=id, y=pc+10, label=informacion_mineria, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2, angle= label_data_L$angle, inherit.aes = FALSE ) +

  # Add base line information
  geom_segment(data=base_data_L, aes(x = start, y = -5, xend = end, yend = -5), colour = "black", alpha=0.8, size=0.6 , inherit.aes = TRUE ) +
  geom_text(data=base_data_L, aes(x = title, y = -18, label=pais), colour = "black", alpha=0.8, size=3, fontface="bold", inherit.aes = TRUE)

Graph_L
ggsave("info_mineria.png", units="in", width=5, height=4, dpi=300)


# hjust=c(0.5,0.5,0.5,0.5


##################### HIDROCARBUROS ######################


#Database 
Rinformacion_hidrocar <- read_dta("Rinformacion_hidrocarburos.dta")
#Rinformacion_hidrocar <- read.csv("Rinformacion_hidrocarburos.csv") # Este archivo no existe.

#View database 
View(Rinformacion_hidrocar)

#Factor for country
levels(Rinformacion_hidrocar$pais)
Rinformacion_hidrocar$pais <- gsub(pattern = 1, replacement = "Colombia", x = Rinformacion_hidrocar$pais) 
Rinformacion_hidrocar$pais <- gsub(pattern = 2, replacement = "Peru", x = Rinformacion_hidrocar$pais) 
Rinformacion_hidrocar$pais <- gsub(pattern = 3, replacement = "Ecuador", x = Rinformacion_hidrocar$pais) 
Rinformacion_hidrocar$pais <- gsub(pattern = 4, replacement = "Bolivia", x = Rinformacion_hidrocar$pais) 
Rinformacion_hidrocar$pais <- gsub(pattern = 5, replacement = "Venezuela", x = Rinformacion_hidrocar$pais) 

levels(as.factor(Rinformacion_hidrocar$pais))
Rinformacion_hidrocar$pais <- factor(Rinformacion_hidrocar$pais,
                                    levels = c("Colombia", "Peru", "Ecuador", "Bolivia", "Venezuela"))

#Factor for informacion_hidrocarburos
  levels(Rinformacion_hidrocar$informacion_hidrocarburos)
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 10, replacement = "Trabajadores empresas", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 1, replacement = "Familiar o amigo", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 2, replacement = "No se informó", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 3, replacement = "Internet", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 4, replacement = "Otros", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 5, replacement = "Prensa", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 6, replacement = "Radio", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 7, replacement = "Redes sociales", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 8, replacement = "Sindicatos", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  Rinformacion_hidrocar$informacion_hidrocarburos <- gsub(pattern = 9, replacement = "Televisión", x = Rinformacion_hidrocar$informacion_hidrocarburos) 
  

levels(as.factor(Rinformacion_hidrocar$informacion_hidrocarburos))
Rinformacion_hidrocar$informacion_hidrocarburos <- factor(Rinformacion_hidrocar$informacion_hidrocarburos,
                                                   levels = c("Familiar o amigo", "No se informó", "Internet", "Otros", "Prensa", "Radio", "Redes sociales", "Sindicatos", "Televisión", "Trabajadores empresas"))


#Creating dataset 
Rinformacion_hidrocar = Rinformacion_hidrocar %>% arrange(pais, pc)

#Set a number of 'empty bar' to add at the end of each group
empty_bar=3
to_add = data.frame( matrix(NA, empty_bar*nlevels(Rinformacion_hidrocar$pais), ncol(Rinformacion_hidrocar)) )
colnames(to_add) = colnames(Rinformacion_hidrocar)
to_add$pais=rep(levels(Rinformacion_hidrocar$pais), each=empty_bar)
Rinformacion_hidrocar=rbind(Rinformacion_hidrocar, to_add)
Rinformacion_hidrocar=Rinformacion_hidrocar %>% arrange(pais)
Rinformacion_hidrocar$id=seq(1, nrow(Rinformacion_hidrocar))

# Get the name and the y position of each label
label_data_L=Rinformacion_hidrocar
number_of_bar_L=nrow(label_data_L)
angle= 90 - 360 * (label_data_L$id-0.5) /number_of_bar_L     # I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)
label_data_L$hjust<-ifelse(angle < -90, 1, 0)
label_data_L$angle<-ifelse(angle < -90, angle+180, angle)

# prepare a data frame for base lines
base_data_L=Rinformacion_hidrocar %>% 
  group_by(pais) %>% 
  summarize(start=min(id), end=max(id) - empty_bar) %>% 
  rowwise() %>% 
  mutate(title=mean(c(start, end)))

# prepare a data frame for grid (scales)
grid_data_L = base_data_L
grid_data_L$end = grid_data_L$end[ c( nrow(grid_data_L), 1:nrow(grid_data_L)-1)] + 1
grid_data_L$start = grid_data_L$start - 1
grid_data_L=grid_data_L[-1,]



# Make the plot
Graph_L = ggplot(Rinformacion_hidrocar, aes(x=as.factor(id), y=pc, fill=pais)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  geom_bar(aes(x=as.factor(id), y=pc, fill=pais), stat="identity", alpha=0.5) +
  
  # Add a val=80/60/40/20 lines. I do it at the beginning to make sur barplots are OVER it.
  geom_segment(data=grid_data_L, aes(x = end, y = 80, xend = start, yend = 80), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 60, xend = start, yend = 60), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 40, xend = start, yend = 40), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  geom_segment(data=grid_data_L, aes(x = end, y = 20, xend = start, yend = 20), colour = "grey", alpha=1, size=0.3 , inherit.aes = FALSE ) +
  
  # Add text showing the value of each 100/75/50/25 lines
  annotate("text", x = rep(max(Rinformacion_hidrocar$id),4), y = c(20, 40, 60, 80), label = c("20", "40", "60", "80") , color="grey", size=3 , angle=0, fontface="bold", hjust=1) +
  geom_bar(aes(x=as.factor(id), y=pc, fill=pais), stat="identity", alpha=0.5) +
  ylim(-100,120) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm"))  +
  coord_polar()+
  geom_text(data=label_data_L, aes(x=id, y=pc+10, label=informacion_hidrocarburos, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2, angle= label_data_L$angle, inherit.aes = FALSE ) +
  
  # Add base line information
  geom_segment(data=base_data_L, aes(x = start, y = -5, xend = end, yend = -5), colour = "black", alpha=0.8, size=0.6 , inherit.aes = TRUE ) +
  geom_text(data=base_data_L, aes(x = title, y = -18, label=pais), colour = "black", alpha=0.8, size=3, fontface="bold", inherit.aes = TRUE)

Graph_L
ggsave("info_hidrocarburos.png", units="in", width=5, height=4, dpi=300)

