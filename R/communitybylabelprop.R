library(igraph)

network<-read_graph("C:/Users/tuank/INF6018/gender_equality.net", format=c("pajek"))
plot_file="C:/Users/tuank/INF6018/communitybylabelprop.pdf"

lp <- cluster_label_prop(network, mode="out")
print(lp)

pdf(plot_file,30,30)
igraph.options(plot.layout=layout.graphopt, vertex.size=7)
plot(lp, network)
dev.off()