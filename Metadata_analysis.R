#Metadata analysis

setwd("~/Documents/WHOI/Projects/STJ_SCTLD_TimeseriesExperiment/Metadata_ColoniesOverTime")

#meta table isn't in work directory, so load with direct path: 
metadata <- read.csv("~/Documents/WHOI/Projects/STJ_SCTLD_TS/meta_table.csv")
metadata <- metadata[1:219, 1:24]

library(ggplot2)
library(tidyr)
library(dplyr)


#______________________________________________________________________________

# I want to make a table where the is colony tag on the left, date on the top, 
# and the cells are filled with the health state at that time

#first I am going to pull out the Coral Bay samples for seawater
metedata_CoralBay_Seawater <- metadata %>%
  filter(Site == "Coral_Bay") %>%
  filter(Sample_Type == "Seawater")
# I got this from chat gpt:
# Use pivot_wider to reshape the data frame
Track_CoralBay_Seawater <- metedata_CoralBay_Seawater %>%
  pivot_wider(
    names_from = Date,      # Dates across the top
    values_from = HealthState, # Health state in the cells
    id_cols = Tag           # Tags on the left
  )
Track_CoralBay_Seawater <- apply(Track_CoralBay_Seawater, 2, as.character)
write.csv(Track_CoralBay_Seawater, "~/Documents/WHOI/Projects/STJ_SCTLD_TimeseriesExperiment/Metadata_ColoniesOverTime/Track_CoralBay_Seawater.csv")

#______

#Second I am going to pull out the Coral Bay samples for coral
metedata_CoralBay_Coral <- metadata %>%
  filter(Site == "Coral_Bay") %>%
  filter(Sample_Type == "Coral")
# Use pivot_wider to reshape the data frame
Track_CoralBay_Coral <- metedata_CoralBay_Coral %>%
  pivot_wider(
    names_from = Date,      # Dates across the top
    values_from = HealthState, # Health state in the cells
    id_cols = Tag           # Tags on the left
  )
Track_CoralBay_Coral <- apply(Track_CoralBay_Coral, 2, as.character)
write.csv(Track_CoralBay_Coral, "~/Documents/WHOI/Projects/STJ_SCTLD_TimeseriesExperiment/Metadata_ColoniesOverTime/Track_CoralBay_Coral.csv")


#______

#Third I am going to pull out the Fish Bay samples for seawater
metedata_FishBay_Seawater <- metadata %>%
  filter(Site == "Fish_Bay") %>%
  filter(Sample_Type == "Seawater")
# Use pivot_wider to reshape the data frame
Track_FishBay_Seawater <- metedata_FishBay_Seawater %>%
  pivot_wider(
    names_from = Date,      # Dates across the top
    values_from = HealthState, # Health state in the cells
    id_cols = Tag           # Tags on the left
  )
Track_FishBay_Seawater <- apply(Track_FishBay_Seawater, 2, as.character)
write.csv(Track_FishBay_Seawater, "~/Documents/WHOI/Projects/STJ_SCTLD_TimeseriesExperiment/Metadata_ColoniesOverTime/Track_FishBay_Seawater.csv")


#______

#Fourth I am going to pull out the Fish Bay samples for coral
metedata_FishBay_Coral <- metadata %>%
  filter(Site == "Fish_Bay") %>%
  filter(Sample_Type == "Coral")
# Use pivot_wider to reshape the data frame
Track_FishBay_Coral <- metedata_FishBay_Coral %>%
  pivot_wider(
    names_from = Date,      # Dates across the top
    values_from = HealthState, # Health state in the cells
    id_cols = Tag           # Tags on the left
  )
Track_FishBay_Coral <- apply(Track_FishBay_Coral, 2, as.character)
write.csv(Track_FishBay_Coral, "~/Documents/WHOI/Projects/STJ_SCTLD_TimeseriesExperiment/Metadata_ColoniesOverTime/Track_FishBay_Coral.csv")

#just checking to make sure I have all my samples accounted for
control <- metadata %>%
  filter(Site == "Control") 
mock <- metadata %>%
  filter(Site == "Mock") 

27+3+36+47+50+56

#______________________________________________________________________________
#______________________________________________________________________________
#______________________________________________________________________________
#______________________________________________________________________________

colors <- c(Visually_Healthy ="deepskyblue3", 
            Diseased = "darkorange2", 
            Dead = "darkgrey")

colors2 <- c(Visually_Healthy ="deepskyblue3", 
            Diseased = "darkorange2", 
            Recovered = "mediumpurple",
            Dead = "darkgrey")

metedata_CoralBay <- metadata %>%
  filter(Sample_Type == "Seawater") %>%
  filter(Site == "Coral_Bay")

ggplot(metedata_CoralBay) +
  geom_bar(aes(x = Date, fill = Healthy_Diseased_Recovered), position = "dodge") +
  theme(axis.text.x = element_text(angle = 40, hjust=1, size=12)) + 
  scale_fill_manual(values =  colors, breaks=c('Visually_Healthy', 'Diseased', 'Recovered', 'Dead')) 

### Saved as: CoralBay_fatetrack
 


metedata_FishBay <- metadata %>%
  filter(Sample_Type == "Seawater") %>%
  filter(Site == "Fish_Bay") 
  
ggplot(metedata_FishBay) +
  geom_bar(aes(x = Date, fill = Healthy_Diseased_Recovered), position = "dodge") +
  theme(axis.text.x = element_text(angle = 40, hjust=1, size=12)) +
  scale_fill_manual(values = colors2, breaks=c('Visually_Healthy', 'Diseased', 'Recovered', 'Dead'))

## Saved as: FishBay_Fatetrack
                                          

