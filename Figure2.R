## Script to reproduce Figure 2 in R
# -----------------------------------------------------------------------
# Influence of baseball construction on the increase in offensive
# statistics in the Mexican baseball league
# Juan Carlos Torres-Galván, Orlando Guarneros García, Francisco Oviedo-Tolentino
# Jaime Meade Collins, Edgar Guevara
# -----------------------------------------------------------------------

## Boxplots of the physical characteristics of the balls

library(ggplot2)

# Import CSV with the data to analyze
Balls <- read.csv('Balls.csv')

Rawlings <- subset(Balls, ï..Company == "Traditional")
Franklin <- subset(Balls, ï..Company == "New")

## Making a plot for each physical characteristic

# Mass (g)

Rawl <- Rawlings$mass
Fran <- Franklin$mass

TheData <- data.frame(Rawl, Fran)


jpeg("Fig2a.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="Mass (g)", col = "white")
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()
# Volume (cm3)

Rawl <- Rawlings$Volume
Fran <- Franklin$Volume

TheData <- data.frame(Rawl, Fran)

jpeg("Fig2b.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", 
        ylab=expression(paste("Volume (", cm^{3},")")),
        col = "white",
        outline = FALSE)
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# Density (g / cm3)


Rawl <- Rawlings$Density
Fran <- Franklin$Density

TheData <- data.frame(Rawl, Fran)

jpeg("Fig2c.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", 
        ylab=expression(paste("Density (", g/cm^{3},")")),
        col = "white")
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# Seam width (mm)


Rawl <- Rawlings$seams_width
Fran <- Franklin$seams_width

TheData <- data.frame(Rawl, Fran)

jpeg("Fig2d.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="Seams width (mm)", 
        col = "white")
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# Seam height (mm)


Rawl <- Rawlings$seams_height
Fran <- Franklin$seams_height

TheData <- data.frame(Rawl, Fran)
par(mgp=c(2,0.8,0))

jpeg("Fig2e.jpg", width=5, height=5, units="in", res=900)

boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="Seams height (mm)", 
        col = "white")
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# Roughness (mm)


Rawl <- Rawlings$roughness
Fran <- Franklin$roughness

TheData <- data.frame(Rawl, Fran)
par(mgp=c(2,0.8,0))

jpeg("Fig2f.jpg", width=5, height=5, units="in", res=900)

boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="Roughness (mm)", 
        col = "white", outline = FALSE)
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# COR


Rawl <- Rawlings$COR
Fran <- Franklin$COR

TheData <- data.frame(Rawl, Fran)

jpeg("Fig2g.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="COR", 
        col = "white", outline = FALSE)
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()

# Homogeneity


Rawl <- Rawlings$homogeneity
Fran <- Franklin$homogeneity

TheData <- data.frame(Rawl, Fran)

jpeg("Fig2h.jpg", width=5, height=5, units="in", res=900)

par(mgp=c(2,0.8,0))
boxplot(TheData, names = c("Traditional", "New"), 
        xlab="Ball", ylab="Homogeneity", 
        col = "white", outline = FALSE)
stripchart(TheData, vertical = TRUE, 
           method = "jitter", pch = 19,
           add = TRUE, col = c("#B52735", "#6DA74B"))

dev.off()