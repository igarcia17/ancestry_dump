mds.cluster = read.csv("SPAiN_prueba1mds.csv", header=T)
ur.num = length(mds.cluster$C1) -988
colors = rev(c(rep("red", ur.num), rep("lightblue", 112), rep("brown", 84), 
               rep("yellow", 113),rep("green", 88), rep("purple", 86), 
               rep("orange", 85), rep("grey50", 50), rep("black", 88),
               rep("darkolivegreen", 49), rep("magenta", 90), rep("darkblue", 143))); 

pdf(file="SPAiN_prueba1mds.pdf",width=7,height=7)
plot(rev(mds.cluster$C2), rev(mds.cluster$C1), col=colors, ylab="Dimension 1", xlab="Dimension 2", pch=20)
legend("topleft", c("BP sample", "CEU","CHB","YRI", "TSI", "JPT", "CHD", "MEX", "GIH", "ASW","LWK", "MKK"), 
       fill=c("red", "lightblue", "brown", "yellow", "green", "purple", "orange",
                   "grey50", "black", "darkolivegreen", "magenta", "darkblue"))
dev.off()

