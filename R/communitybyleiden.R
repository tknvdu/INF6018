library(igraph)

network<-read_graph("C:/Users/tuank/INF6018/gender_equality.net", format=c("pajek"))
plot_file="C:/Users/tuank/INF6018/communitybyleiden.pdf"

# Quantiles 25% 2,  50% 3, 75% 4
r <- quantile(strength(network))[2] / (gorder(network) - 1)

# What is resolution
print("resolution")
print(r)

# Set seed for sake of reproducibility
set.seed(1)
ldc <- cluster_leiden(network, resolution = r)
print(ldc)

pdf(plot_file,30,30)
igraph.options(plot.layout=layout.graphopt, vertex.size=7)
plot(ldc, network)
dev.off()

# How to extract community information 
print(ldc$membership)