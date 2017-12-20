##### Script for generating multifaceted power analysis plots #####
### In this example, data was subset to include only results that were simulated under high mutation rate scenarios.
### Variables: These denote header values in the csv results file
###            s = number of samples per population
###            ut = marker locus combinations, e.g. SNP_100, Microsat_10, etc
###            mig = migration rate
###            ps = population size
###            y can be changed to plot the power, standard deviation, or Fst values

library(ggplot2)

power.2fast<- ggplot(data=pow_fast,aes(x=s,y=power,col=ut)) + # plot s on x axis, power on y, and ut as separate lines
  geom_line(size=.9) + # plot data as line
  facet_grid(mig~ps) + # create facets with migration as rows and population sizes as columns
  scale_y_continuous(breaks=c(0.25,0.50,0.75,1.00)) + # scale y axis and insert breaks, in this case for power
  scale_x_continuous(breaks=c(25,50,100),limits=c(20,100)) + # scale y axis by number of samples
  theme(axis.title.x=element_text(size=14)) + # adjust x axis title
  theme(axis.title.y=element_text(size=14)) + # adjust y axis title
  theme(legend.title=element_text(size=12),legend.text=element_text(size=11)) + # format legend
  scale_color_manual(name="Marker_Loci", values = c("green", "red", "yellow",  "blue", "orange", "black")) # choose line colors 
power.2fast
