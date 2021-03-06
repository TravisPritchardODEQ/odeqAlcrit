devtools::install_github('TravisPritchardODEQ/deqalcrit', force = TRUE)


library(tidyverse)
library(deqalcrit)

al_data_AWQMS <- AWQMSdata::AWQMS_Data(char = "Aluminum",
                                       media = 'Water',
                                       project = 'Surface Water Ambient Monitoring',
                                       station = '10917-ORDEQ')



al_data <- al_data_AWQMS %>%
  dplyr::select(MLocID, AU_ID, Lat_DD, Long_DD, SampleStartDate, SampleStartTime,
                SampleMedia, SampleSubmedia, Char_Name, Char_Name, Sample_Fraction,
                Result_Numeric,Result_Operator,  Result_Unit )

ancillary_data<- deqalcrit::al_anc_query(al_data)

al_data_joined <- deqalcrit::al_combine_ancillary(al_df = al_data,
                                       ancillary_df = ancillary_data)

al_criteria <- deqalcrit::AL_crit_calculator(al_data_joined)

al_criteria_extra <- deqalcrit::AL_crit_calculator(al_data_joined, verbose = TRUE)
