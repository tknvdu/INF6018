library(igraph)

network<-read_graph("C:/Users/tuank/INF6018/gender_equality.net", format=c("pajek"))
plot_file="C:/Users/tuank/INF6018/communitybyedgebetweenness.pdf"

eb <- cluster_edge_betweenness(network)
print(eb)

pdf(plot_file,30,30)
igraph.options(plot.layout=layout.graphopt, vertex.size=7)
plot(eb, network)
dev.off()