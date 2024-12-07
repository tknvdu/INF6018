# Read the file in which countries are clustered according to the education attainment based on gender equality 
library(readr)
education <- read_csv("C:/Users/tuank/INF6018/cluster_gender_statistics_education_output.csv")
# View(education) to inspect the data table
print(names(education))
# column Cluster contains cluster labels
# column EAGPI contains gender equality metric for education attainment

edu_clusters<-data.frame(education$CountryName, education$Cluster, education$EAGPI_overall)
community_ids<-data.frame(ldc$names, ldc$membership)

merged <- merge(x = community_ids, y = edu_clusters, by.x = "ldc.names", by.y = "education.CountryName")
merged

print("How many clusters")
print(unique(merged$education.Cluster) )

print("How many communities")
print(unique(merged$ldc.membership) )

# Cross tabulate the education and community membership
table(merged$education.Cluster,merged$ldc.membership)

# Map color onto the vertices
clusters<-merged$education.Cluster 
names(clusters) <- merged$ldc.names
#print(clusters)
cluster_colors<-c("red","darkgreen","blue","magenta","brown","cyan")
names(cluster_colors)<-c("C1","C2","C3","C4","C5",NA)

# Map size onto the vertices
EAGPI<-as.double(merged$education.EAGPI_overall)
names(EAGPI)<-merged$ldc.names

V(network)$label.cex <- 0.7

plot(network,
     layout = layout.graphopt,
     vertex.color = cluster_colors[clusters[V(network)]], 
     vertex.size = rep(EAGPI, length.out = vcount(network)) * 3.5)

plot(ldc,
     network,
     layout = layout.graphopt,
     vertex.label.color = cluster_colors[clusters[V(network)]],
     vertex.size = rep(EAGPI, length.out = vcount(network)) * 3.5)

# Enlarge the result with pdf
plot_file="C:/Users/tuank/INF6018/community_and_education_plot.pdf"
pdf(plot_file,60,60)

plot(ldc,
     network,
     layout = layout.graphopt,
     vertex.label.color = cluster_colors[clusters[V(network)]], 
     vertex.size = rep(EAGPI, length.out = vcount(network)) * 3.5,
     vertex.label.cex = 2.8)

dev.off()
browseURL(paste0(plot_file))
