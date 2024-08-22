# 3. DATA PREPARATION -----------------------------------------------------
data <- data_2

#ONE HOT CODING
#data$ggd_char <- as.factor(as.character(data$GGD))

# Dummify categorical variables
to_dummify <- c(
  ########################### 3a. Character Columns To Hotkey ###########################
  'AffinityCode',
  'Cover',
  'PaymentFrequency',
  'Homeowner',
  'Class_Of_Use',
  'OtherVehicles',
  'Occupation_Status',
  'PT_Occupation_Status',
  'MaritalStatus',
  'OtherVehicles_1',
  'MaritalStatus_1',
  'OtherVehicles_2',
  'MaritalStatus_2',
  'OtherVehicles_3',
  'MaritalStatus_3',
  'OtherVehicles_4',
  'MaritalStatus_4',
  'DrivingRestriction',
  'Fuel_Type',
  'BodyType',
  'Registered_Keeper',
  'Owner',
  'Garaged',
  'Is_There_Signage',
  'Vehicle_Fitted_With_Racking',
  'Hazardous_goods',
  'Public_liability_in_force',
  'Modification_1',
  'Modification_2',
  'Modification_3',
  'Modification_4',
  'NCB_Protected',
  'MirrorBonus_year',
  'Proposer_Claim_NCB_Prejudiced_1',
  'Proposer_Claim_Type_1',
  'Proposer_Claim_NCB_Prejudiced_2',
  'Proposer_Claim_Type_2',
  'Proposer_Claim_NCB_Prejudiced_3',
  'Proposer_Claim_Type_3',
  'Proposer_Claim_NCB_Prejudiced_4',
  'Proposer_Claim_Type_4',
  'Proposer_Claim_NCB_Prejudiced_5',
  'Proposer_Claim_Type_5',
  'R_ND_Claim_NCB_Prejudiced_1',
  'R_ND_Claim_Type_1',
  'R_ND_Claim_NCB_Prejudiced_2',
  'R_ND_Claim_Type_2',
  'R_ND_Claim_NCB_Prejudiced_3',
  'R_ND_Claim_Type_3',
  'R_ND_Claim_NCB_Prejudiced_4',
  'R_ND_Claim_Type_4',
  'R_ND_Claim_NCB_Prejudiced_5',
  'R_ND_Claim_Type_5',
  'Proposer_Conv_Code_1',
  'Proposer_Conv_Code_2',
  'Proposer_Conv_Code_3',
  'Proposer_Conv_Code_4',
  'Proposer_Conv_Code_5',
  'R_ND_Conv_Code_1',
  'R_ND_Conv_Code_2',
  'R_ND_Conv_Code_3',
  'R_ND_Conv_Code_4',
  'R_ND_Conv_Code_5',
  'Body_Type',
  'Vehicle_Variant_Select'
  
  #######################################################################################
)

data_X <- data
#data <- data_X

require(data.table)
require(mltools)
data_HotKey <- one_hot(data.table(data), cols=to_dummify, dropCols=FALSE)
data_HotKey <- data.frame(data_HotKey)

data <- data_HotKey


# Delete columns
Drop_These_Columns <- c(
  ################################# 3b. Columns to Drop #################################
  'Quote_Event_ID',
  'Quote_Transaction_Date',
  'OriginalQuoteDate',
  'InceptionDate',
  'OriginalInceptionDate',
  'PolicyType',
  'Postcode',
  'Area',
  'District',
  'LYPremium',
  'Sector',
  'Prop_Date_Of_Birth',
  'MedCond',
  'LicenceType',
  'LicenceDate',
  'Residence_Year',
  'Gender',
  'DRV_Relationship',
  'Prev_Ins_Decline',
  'Occupation',
  'R_Business',
  'PT_Occupation',
  'R_PT_Business',
  'NonRTAConv',
  'DOB_1',
  'MedCond_1',
  'Occupation_Status_1',
  'PT_Occupation_Status_1',
  'LicenceType_1',
  'LicenceDate_1',
  'Residence_Year_1',
  'Gender_1',
  'DRV_Relationship_1',
  'Prev_Ins_Decline_1',
  'Occupation_1',
  'R_Business_1',
  'PT_Occupation_1',
  'R_PT_Business_1',
  'NonRTAConv_1',
  'DOB_2',
  'MedCond_2',
  'Occupation_Status_2',
  'PT_Occupation_Status_2',
  'LicenceType_2',
  'LicenceDate_2',
  'Residence_Year_2',
  'Gender_2',
  'DRV_Relationship_2',
  'Prev_Ins_Decline_2',
  'Occupation_2',
  'R_Business_2',
  'PT_Occupation_2',
  'R_PT_Business_2',
  'NonRTAConv_2',
  'DOB_3',
  'MedCond_3',
  'Occupation_Status_3',
  'PT_Occupation_Status_3',
  'LicenceType_3',
  'LicenceDate_3',
  'Residence_Year_3',
  'Gender_3',
  'DRV_Relationship_3',
  'Prev_Ins_Decline_3',
  'Occupation_3',
  'R_Business_3',
  'PT_Occupation_3',
  'R_PT_Business_3',
  'NonRTAConv_3',
  'DOB_4',
  'MedCond_4',
  'Occupation_Status_4',
  'PT_Occupation_Status_4',
  'LicenceType_4',
  'LicenceDate_4',
  'Residence_Year_4',
  'Gender_4',
  'DRV_Relationship_4',
  'Prev_Ins_Decline_4',
  'Occupation_4',
  'R_Business_4',
  'PT_Occupation_4',
  'R_PT_Business_4',
  'NonRTAConv_4',
  'PH_no',
  'KeptPostcode',
  'KeptDistrict',
  'KeptArea',
  'RegistrationNo',
  'ABI_Code',
  'PurchaseDate',
  'LeftHand',
  'IsVehicleImported',
  'Dash_Cam_Fitted',
  'Member_of_organisation',
  'Transmission',
  'Modification_5',
  'Modification_6',
  'KeptSector',
  'NCB_TypeOfInsurance',
  'NCB_HeldConstinuously',
  'NCB_Prev_Protected',
  'NCB_PrevInsurerCode',
  'NCB_ExpiryType',
  'NCB_Type',
  'ENR_SCID',
  'ENR_SIRA',
  'ENR_CUEPI',
  'RetailBlock',
  'ENR_CUEMOTOR',
  'ENR_CallReport_Match_Score',
  'ENR_CallReport_IDV',
  'ENR_CallReport',
  'TypeOfExposure',
  'Proposer_Claim_Incident_Date_1',
  'Proposer_Claim_DriverNum_1',
  'Proposer_Claim_ThisPolicy_1',
  'Proposer_Claim_Incident_Date_2',
  'Proposer_Claim_DriverNum_2',
  'Proposer_Claim_ThisPolicy_2',
  'Proposer_Claim_Incident_Date_3',
  'Proposer_Claim_DriverNum_3',
  'Proposer_Claim_ThisPolicy_3',
  'Proposer_Claim_Incident_Date_4',
  'Proposer_Claim_DriverNum_4',
  'Proposer_Claim_ThisPolicy_4',
  'Proposer_Claim_Incident_Date_5',
  'Proposer_Claim_DriverNum_5',
  'Proposer_Claim_ThisPolicy_5',
  'R_ND_Claim_Incident_Date_1',
  'R_ND_Claim_NDNum_1',
  'R_ND_Claim_ThisPolicy_1',
  'R_ND_Claim_Incident_Date_2',
  'R_ND_Claim_NDNum_2',
  'R_ND_Claim_ThisPolicy_2',
  'R_ND_Claim_Incident_Date_3',
  'R_ND_Claim_NDNum_3',
  'R_ND_Claim_ThisPolicy_3',
  'R_ND_Claim_Incident_Date_4',
  'R_ND_Claim_NDNum_4',
  'R_ND_Claim_ThisPolicy_4',
  'R_ND_Claim_Incident_Date_5',
  'R_ND_Claim_NDNum_5',
  'R_ND_Claim_ThisPolicy_5',
  'Proposer_ConvOffence_Date_1',
  'Proposer_Conv_DriverNum_1',
  'Proposer_ConvOffence_Date_2',
  'Proposer_Conv_DriverNum_2',
  'Proposer_ConvOffence_Date_3',
  'Proposer_Conv_DriverNum_3',
  'Proposer_ConvOffence_Date_4',
  'Proposer_Conv_DriverNum_4',
  'Proposer_ConvOffence_Date_5',
  'Proposer_Conv_DriverNum_5',
  'R_ND_Conv_Date_1',
  'R_ND_Conv_NDNum_1',
  'R_ND_Conv_Date_2',
  'R_ND_Conv_NDNum_2',
  'R_ND_Conv_Date_3',
  'R_ND_Conv_NDNum_3',
  'R_ND_Conv_Date_4',
  'R_ND_Conv_NDNum_4',
  'R_ND_Conv_Date_5',
  'R_ND_Conv_NDNum_5',
  'Quote_Marker',
  'Quote_Marker_Deduped',
  'Quote_Net',
  'Quote_Comm',
  'Quote_IPT',
  'Quote_GP',
  'Clickthrough_Marker',
  'Sale_Marker',
  'RTP_Marker',
  'Sold_Net',
  'Sold_Comm',
  'Sold_IPT',
  'Sold_GP',
  'Manufacturer',
  'Model_Desc',
  'Body_Style',
  'Type',
  'Body_Type_0001',
  'Vulnerability_Score',
  'AIL_POL_REF',
  'Policy_Number',
  'netp',
  'EX',
  'Claim_Count'
  
  #######################################################################################
)

data_excl <- data[ !names(data) %in% Drop_These_Columns]

data <- data_excl

#Make sure all variables are formatted correctly.
################################# 3c. Format columns ##################################
data$Driver_Count <- as.numeric(data$Driver_Count)
data$VolXS <- as.numeric(data$VolXS)
data$Children_Under_16 <- as.numeric(data$Children_Under_16)
data$Age <- as.numeric(data$Age)
data$Age_1 <- as.numeric(data$Age_1)
data$Age_2 <- as.numeric(data$Age_2)
data$Age_3 <- as.numeric(data$Age_3)
data$Age_4 <- as.numeric(data$Age_4)
data$MainDriver_No <- as.numeric(data$MainDriver_No)
data$NumOfDrivers <- as.numeric(data$NumOfDrivers)
data$NumberSeats <- as.numeric(data$NumberSeats)
data$GVW <- as.numeric(data$GVW)
data$Engine <- as.numeric(data$Engine)
data$YearOfMake <- as.numeric(data$YearOfMake)
data$Value <- as.numeric(data$Value)
data$Mileage <- as.numeric(data$Mileage)
data$PurchaseYear <- as.numeric(data$PurchaseYear)
data$NCB_Claimed <- as.numeric(data$NCB_Claimed)
data$Proposer_Conv_MthBan_1 <- as.numeric(data$Proposer_Conv_MthBan_1)
data$Proposer_Conv_MthBan_2 <- as.numeric(data$Proposer_Conv_MthBan_2)
data$Proposer_Conv_MthBan_3 <- as.numeric(data$Proposer_Conv_MthBan_3)
data$Proposer_Conv_MthBan_4 <- as.numeric(data$Proposer_Conv_MthBan_4)
data$Proposer_Conv_MthBan_5 <- as.numeric(data$Proposer_Conv_MthBan_5)
data$R_ND_Conv_MthBan_1 <- as.numeric(data$R_ND_Conv_MthBan_1)
data$R_ND_Conv_MthBan_2 <- as.numeric(data$R_ND_Conv_MthBan_2)
data$R_ND_Conv_MthBan_3 <- as.numeric(data$R_ND_Conv_MthBan_3)
data$R_ND_Conv_MthBan_4 <- as.numeric(data$R_ND_Conv_MthBan_4)
data$R_ND_Conv_MthBan_5 <- as.numeric(data$R_ND_Conv_MthBan_5)
data$Prop_Licence_Years <- as.numeric(data$Prop_Licence_Years)
data$NCB_Years <- as.numeric(data$NCB_Years)
data$Claims_Within_3_Years <- as.numeric(data$Claims_Within_3_Years)
data$Unexpired_Convictions <- as.numeric(data$Unexpired_Convictions)
data$NEP <- as.numeric(data$NEP)
data$AD_INC <- as.numeric(data$AD_INC)
data$FT_INC <- as.numeric(data$FT_INC)
data$WS_INC <- as.numeric(data$WS_INC)
data$TPD_INC <- as.numeric(data$TPD_INC)
data$TPI_INC <- as.numeric(data$TPI_INC)

#data$Ernd_LR <- as.numeric(data$INC_U50K) / as.numeric(data$Prop_EP)
data$Tot_Inc <- as.numeric(data$AD_INC) + as.numeric(data$FT_INC) + as.numeric(data$WS_INC) + as.numeric(data$TPD_INC)
                + as.numeric(data$TPI_INC)
data$NELR <- as.numeric(data$Tot_Inc) / as.numeric(data$NEP)
############################################################################################

### Need to replace any NA's with 0.
#data[is.na(data)] <- 0 #Any remaining NA will be replaced with a 0.
#data <- mutate_if(data, is.character, ~replace(., is.na(.), 'Unknown'))
## FEATURE ENGINEERING
################################# 3d. Feature Engineering ##################################
#data$Score1Pass <- 0
#data$Score1Pass[data$SCORE1 >= 70] <- 1

#data$Red1Pass <- 0
#data$Red1Pass[data$RED1 == 0] <- 1

#data$AU_Length_Grp <- 0
#data$AU_Length_Grp[data$AU_LENGTH <= 3750] <- 0
#data$AU_Length_Grp[data$AU_LENGTH >= 3750 & data$AU_LENGTH <= 3999] <- 1
#data$AU_Length_Grp[data$AU_LENGTH >= 4000 & data$AU_LENGTH <= 4199] <- 2
#data$AU_Length_Grp[data$AU_LENGTH >= 4200] <- 3

#data$Profit_n_Los <- as.numeric(data$Prop_EP - data$TPD_INC)
#data$TPD_Freq <- as.numeric(data$TPD_NUM / data$EX)
#data$TPD_per <- as.numeric(data$TPD_NUM / data$NUMCLM_XNIL)



############################################################################################

# Check for number of NA's - will be useful in excluding
na_count <- sapply(data, function(y) sum(length(which(is.na(y)))))
na_perc <- round(na_count/nrow(data)*100, digits=1)
na <- data.frame(na_count, na_perc)
print(na)

na_df <- cbind(Variables = rownames(na), na)

datastr3 <- data.frame(variable = names(data),
                       classe = sapply(data, class)
)
dataOut <- cbind(datastr3, na_df)
#write.csv(dataOut, "4. New Dataset.csv")
## lets try and merge the two of these together.

data_3 <- data
