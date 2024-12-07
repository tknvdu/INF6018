library(igraph)

network<-read_graph("C:/Users/tuank/INF6018/gender_equality.net", format=c("pajek"))

# Plot the network graph
V(network)$size <- 5
V(network)$frame.color <- "white"
V(network)$color <- "orange"
V(network)$label.cex <- 0.5
plot(network, layout = layout_nicely(network))

# Calculate centrality measures
degree_cent <- degree(network)
betweenness_cent <- betweenness(network)
closeness_cent <- closeness(network)
eigenvector_cent <- eigen_centrality(network)$vector

network_centr_degree = centr_degree(network)$centralization
network_centr_betw = centr_betw(network)$centralization
network_centr_clo = centr_clo(network)$centralization
network_centr_eigen = centr_eigen(network)$centralization

# Identify vertices with NaN closeness centrality
nan_vertices <- which(is.nan(closeness_cent))

# Identify important nodes
top_nodes_degree <- head(sort(degree_cent, decreasing=TRUE), 5)
top_nodes_betw <- head(sort(betweenness_cent, decreasing=TRUE), 5)
top_nodes_clo <- head(sort(closeness_cent, decreasing=TRUE), 5)
top_nodes_eigen <- head(sort(eigenvector_cent, decreasing=TRUE), 5)
