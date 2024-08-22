# 5. DECISION TREE ----------------------------------------------------
require(rpart)
require(tree)
require(pROC)
DATA <- data.frame(data)

##Set model parameters
Min_num_splits <- 3                    #Minimal number of itmes to split
Min_bucket     <- 75 #nrow(DATA)/1000     #Minimal number of items per bucket
Max_depth      <- 5                     #Maximum depth of final tree

##Choose variables and build the model
trainset1 <-trainset

mytree <- rpart(
  ##################### ENTER THE TARGET VARIABLE ############################
  NELR~
  ############################################################################ 
  ######################### 6. Factors to Include ############################
  AffinityCode_ACCF
  + AffinityCode_ACCM
  + AffinityCode_ACDT
  + AffinityCode_ACDW
  + AffinityCode_ACGC
  + AffinityCode_ACMS
  + Driver_Count
  + VolXS
  + Cover_Comprehensive
  + Cover_Third.Party.Fire.And.Theft
  + PaymentFrequency_Annual
  + PaymentFrequency_Monthly
  + Homeowner_N
  + Homeowner_Y
  + Children_Under_16
  + Class_Of_Use_CarriageOfGoods
  + Class_Of_Use_Hire.Reward
  + Class_Of_Use_SD.P
  + OtherVehicles_N
  + OtherVehicles_Y
  + Age
  + Occupation_Status_Employed
  + Occupation_Status_Household.Duties
  + Occupation_Status_Not.Employed.Due.to.Disability
  + Occupation_Status_Other
  + Occupation_Status_Retired
  + Occupation_Status_Self.Employed
  + Occupation_Status_Voluntary
  + PT_Occupation_Status_Employed
  + PT_Occupation_Status_None
  + PT_Occupation_Status_Self.Employed
  + MaritalStatus_Civil.Partnership
  + MaritalStatus_Divorced.Only
  + MaritalStatus_Married
  + MaritalStatus_Single
  + MaritalStatus_Widowed
  + OtherVehicles_1_N
  + OtherVehicles_1_Y
  + Age_1
  + MaritalStatus_1_Civil.Partnership
  + MaritalStatus_1_Divorced.Only
  + MaritalStatus_1_Married
  + MaritalStatus_1_Single
  + MaritalStatus_1_Widowed
  + OtherVehicles_2_N
  + OtherVehicles_2_Y
  + Age_2
  + MaritalStatus_2_Civil.Partnership
  + MaritalStatus_2_Divorced.Only
  + MaritalStatus_2_Married
  + MaritalStatus_2_Single
  + MaritalStatus_2_Widowed
  + OtherVehicles_3_N
  + OtherVehicles_3_Y
  + Age_3
  + MaritalStatus_3_Civil.Partnership
  + MaritalStatus_3_Divorced.Only
  + MaritalStatus_3_Married
  + MaritalStatus_3_Single
  + OtherVehicles_4_N
  + OtherVehicles_4_Y
  + Age_4
  + MaritalStatus_4_Civil.Partnership
  + MaritalStatus_4_Divorced.Only
  + MaritalStatus_4_Married
  + MaritalStatus_4_Single
  + MaritalStatus_4_Widowed
  + MainDriver_No
  + NumOfDrivers
  + DrivingRestriction_Insured.and.Spouse
  + DrivingRestriction_Insured.Only
  + Fuel_Type_Diesel
  + Fuel_Type_Petrol
  + BodyType_Flat.back
  + BodyType_Pickup
  + BodyType_Tipper
  + BodyType_Van
  + NumberSeats
  + GVW
  + Engine
  + Registered_Keeper_Partner...Civil
  + Registered_Keeper_Partner...Common.Law
  + Registered_Keeper_Proposer.Policyholder
  + Registered_Keeper_Spouse
  + Registered_Keeper_Vehicle.Leasing.Company
  + Owner_Partner...Common.Law
  + Owner_Proposer.Policyholder
  + Owner_Spouse
  + Owner_Vehicle.Leasing.Company
  + Garaged_.None.
  + Garaged_Driveway
  + Garaged_Garage
  + Garaged_Roadside
  + YearOfMake
  + Value
  + Mileage
  + Is_There_Signage_N
  + Is_There_Signage_Y
  + Vehicle_Fitted_With_Racking_N
  + Vehicle_Fitted_With_Racking_Y
  + Hazardous_goods_N
  + Hazardous_goods_Y
  + Public_liability_in_force_N
  + Public_liability_in_force_Y
  + PurchaseYear
  + Modification_1_Adapted.For.Disability
  + Modification_1_Air.Conditioning
  + Modification_1_Alloy.Wheels
  + Modification_1_Animal.Dog.Barriers
  + Modification_1_Driving.Lights
  + Modification_1_Fog.Lamps
  + Modification_1_High.Level.Brake.Light
  + Modification_1_LPG.Conversion
  + Modification_1_Magnetic.Removable.Signs
  + Modification_1_Painted.Signs..Under.25..of.side.and.door.
  + Modification_1_Parking.Sensors
  + Modification_1_Removal.Of.Seats
  + Modification_1_Roof.Rack
  + Modification_1_Satellite.N.Avigation.Equipment
  + Modification_1_Spot.Lights
  + Modification_1_Standard.Engine.Replacement
  + Modification_1_Sunroof
  + Modification_1_Tinted.Windows.or.Privacy.Glass
  + Modification_1_Towbar
  + Modification_1_Water.Tank.s.
  + Modification_1_Wheel.Trims
  + Modification_1_Wheelchair.Clamps.Straps
  + Modification_1_Wheelchair.Lift.Ramp.Winch
  + Modification_2_Alloy.Wheels
  + Modification_2_Car.Phones
  + Modification_2_ExterN.Al.Racking
  + Modification_2_Fog.Lamps
  + Modification_2_Locking.Wheel.Nuts
  + Modification_2_Parking.Sensors
  + Modification_2_Removal.Of.Seats
  + Modification_2_Roof.Rack
  + Modification_2_Satellite.N.Avigation.Equipment
  + Modification_2_Sunroof
  + Modification_2_Tinted.Windows.or.Privacy.Glass
  + Modification_2_Towbar
  + Modification_2_Wheel.Trims
  + Modification_2_Wheelchair.Clamps.Straps
  + Modification_2_Wheelchair.Lift.Ramp.Winch
  + Modification_3_Alloy.Wheels
  + Modification_3_Fog.Lamps
  + Modification_3_Locking.Wheel.Nuts
  + Modification_3_Parking.Sensors
  + Modification_3_Roof.Rack
  + Modification_3_Satellite.N.Avigation.Equipment
  + Modification_3_Tinted.Windows.or.Privacy.Glass
  + Modification_3_Towbar
  + Modification_4_Locking.Wheel.Nuts
  + Modification_4_Parking.Sensors
  + Modification_4_Roof.Rack
  + Modification_4_Wheelchair.Lift.Ramp.Winch
  + NCB_Claimed
  + NCB_Protected_N
  + NCB_Protected_Y
  + MirrorBonus_year_Company.Car.with.SDP
  + MirrorBonus_year_Company.Car.without.SDP
  + MirrorBonus_year_Motorcycle
  + MirrorBonus_year_N.Amed.Driver.on.Another.Policy
  + MirrorBonus_year_Private.Car
  + MirrorBonus_year_Van
  + Proposer_Claim_NCB_Prejudiced_1_N
  + Proposer_Claim_NCB_Prejudiced_1_Y
  + Proposer_Claim_Type_1_Attempted.Theft
  + Proposer_Claim_Type_1_Both.Cars.Reversed...Car.park
  + Proposer_Claim_Type_1_Both.Cars.Reversed...Street
  + Proposer_Claim_Type_1_Driver.Cut.into.Third.Party.s.Lane
  + Proposer_Claim_Type_1_Driver.Hit.Animal
  + Proposer_Claim_Type_1_Driver.Hit.Cyclist
  + Proposer_Claim_Type_1_Driver.Hit.Immobile.Object
  + Proposer_Claim_Type_1_Driver.Hit.Parked.Vehicle
  + Proposer_Claim_Type_1_Driver.Hit.Pedestrian
  + Proposer_Claim_Type_1_Driver.Hit.StatioN.Ary.Car
  + Proposer_Claim_Type_1_Driver.Hit.Third.Party
  + Proposer_Claim_Type_1_Driver.Hit.Third.Party.in.Rear
  + Proposer_Claim_Type_1_Driver.Lost.Control
  + Proposer_Claim_Type_1_Driver.Reversed.into.Car
  + Proposer_Claim_Type_1_Driver.Skidded
  + Proposer_Claim_Type_1_Effect.of.Weather..Storm.
  + Proposer_Claim_Type_1_Fire.Partial.Damage
  + Proposer_Claim_Type_1_Fire.Total.Loss
  + Proposer_Claim_Type_1_Flood.Damage
  + Proposer_Claim_Type_1_Multi.Vehicle.Collision
  + Proposer_Claim_Type_1_Object.Hit.Vehicle
  + Proposer_Claim_Type_1_Theft
  + Proposer_Claim_Type_1_Theft.PersoN.Al.Effects
  + Proposer_Claim_Type_1_Theft.Vehicle.not.Recovered
  + Proposer_Claim_Type_1_Theft.Vehicle.Recovered
  + Proposer_Claim_Type_1_Theft.Vehicle.Repairable
  + Proposer_Claim_Type_1_Third.Party.Cut.into.Drivers.Lane
  + Proposer_Claim_Type_1_Third.Party.Hit.Driver
  + Proposer_Claim_Type_1_Third.Party.Hit.Driver.in.Rear
  + Proposer_Claim_Type_1_Third.Party.Swerved.and.Hit.Driver
  + Proposer_Claim_Type_1_Unknown.Third.Party.Hit.Stopped.Insured
  + Proposer_Claim_Type_1_Vandalism.Repairable
  + Proposer_Claim_Type_1_Vandalism.Total.Loss
  + Proposer_Claim_Type_1_Windscreen.Crack
  + Proposer_Claim_Type_1_Windscreen.Smashed
  + Proposer_Claim_NCB_Prejudiced_2_N
  + Proposer_Claim_NCB_Prejudiced_2_Y
  + Proposer_Claim_Type_2_Attempted.Theft
  + Proposer_Claim_Type_2_Driver.Hit.Cyclist
  + Proposer_Claim_Type_2_Driver.Hit.Immobile.Object
  + Proposer_Claim_Type_2_Driver.Hit.StatioN.Ary.Car
  + Proposer_Claim_Type_2_Driver.Hit.Third.Party
  + Proposer_Claim_Type_2_Driver.Reversed.into.Car
  + Proposer_Claim_Type_2_Effect.of.Weather..Storm.
  + Proposer_Claim_Type_2_Fire.Partial.Damage
  + Proposer_Claim_Type_2_Fire.Total.Loss
  + Proposer_Claim_Type_2_Flood.Damage
  + Proposer_Claim_Type_2_Multi.Vehicle.Collision
  + Proposer_Claim_Type_2_Theft
  + Proposer_Claim_Type_2_Theft.PersoN.Al.Effects
  + Proposer_Claim_Type_2_Theft.Vehicle.not.Recovered
  + Proposer_Claim_Type_2_Theft.Vehicle.Recovered
  + Proposer_Claim_Type_2_Third.Party.Hit.Driver
  + Proposer_Claim_Type_2_Third.Party.Hit.Driver.in.Rear
  + Proposer_Claim_Type_2_Third.Party.Swerved.and.Hit.Driver
  + Proposer_Claim_Type_2_Unknown.Third.Party.Hit.Stopped.Insured
  + Proposer_Claim_Type_2_Vandalism.Repairable
  + Proposer_Claim_Type_2_Vandalism.Total.Loss
  + Proposer_Claim_Type_2_Windscreen.Crack
  + Proposer_Claim_Type_2_Windscreen.Smashed
  + Proposer_Claim_NCB_Prejudiced_3_N
  + Proposer_Claim_NCB_Prejudiced_3_Y
  + Proposer_Claim_Type_3_Attempted.Theft
  + Proposer_Claim_Type_3_Driver.Hit.Immobile.Object
  + Proposer_Claim_Type_3_Driver.Hit.StatioN.Ary.Car
  + Proposer_Claim_Type_3_Driver.Hit.Third.Party
  + Proposer_Claim_Type_3_Fire.Partial.Damage
  + Proposer_Claim_Type_3_Multi.Vehicle.Collision
  + Proposer_Claim_Type_3_Theft.PersoN.Al.Effects
  + Proposer_Claim_Type_3_Theft.Vehicle.not.Recovered
  + Proposer_Claim_Type_3_Theft.Vehicle.Recovered
  + Proposer_Claim_Type_3_Third.Party.Hit.Driver
  + Proposer_Claim_Type_3_Third.Party.Hit.Driver.in.Rear
  + Proposer_Claim_Type_3_Unknown.Third.Party.Hit.Stopped.Insured
  + Proposer_Claim_Type_3_Vandalism.Repairable
  + Proposer_Claim_Type_3_Vandalism.Total.Loss
  + Proposer_Claim_Type_3_Windscreen.Crack
  + Proposer_Claim_Type_3_Windscreen.Smashed
  + Proposer_Claim_NCB_Prejudiced_4_N
  + Proposer_Claim_NCB_Prejudiced_4_Y
  + Proposer_Claim_Type_4_Driver.Hit.Immobile.Object
  + Proposer_Claim_Type_4_Driver.Hit.Third.Party
  + Proposer_Claim_Type_4_Fire.Total.Loss
  + Proposer_Claim_Type_4_Multi.Vehicle.Collision
  + Proposer_Claim_Type_4_Third.Party.Hit.Driver
  + Proposer_Claim_Type_4_Third.Party.Hit.Driver.in.Rear
  + Proposer_Claim_Type_4_Vandalism.Repairable
  + Proposer_Claim_Type_4_Windscreen.Crack
  + Proposer_Claim_Type_4_Windscreen.Smashed
  + Proposer_Claim_NCB_Prejudiced_5_N
  + Proposer_Claim_NCB_Prejudiced_5_Y
  + Proposer_Claim_Type_5_Multi.Vehicle.Collision
  + Proposer_Claim_Type_5_Windscreen.Crack
  + Proposer_Claim_Type_5_Windscreen.Smashed
  + R_ND_Claim_NCB_Prejudiced_1_No
  + R_ND_Claim_NCB_Prejudiced_1_Yes
  + R_ND_Claim_Type_1_Attempted.Theft
  + R_ND_Claim_Type_1_Driver.Hit.Animal
  + R_ND_Claim_Type_1_Driver.Hit.Immobile.Object
  + R_ND_Claim_Type_1_Driver.Hit.Third.Party
  + R_ND_Claim_Type_1_Driver.Reversed.into.Car
  + R_ND_Claim_Type_1_Driver.Skidded
  + R_ND_Claim_Type_1_Effect.of.Weather..Storm.
  + R_ND_Claim_Type_1_Fire.Partial.Damage
  + R_ND_Claim_Type_1_Flood.Damage
  + R_ND_Claim_Type_1_Multi.Vehicle.Collision
  + R_ND_Claim_Type_1_Object.Hit.Vehicle
  + R_ND_Claim_Type_1_Theft
  + R_ND_Claim_Type_1_Theft.PersoN.Al.Effects
  + R_ND_Claim_Type_1_Theft.Vehicle.not.Recovered
  + R_ND_Claim_Type_1_Theft.Vehicle.Recovered
  + R_ND_Claim_Type_1_Third.Party.Cut.into.Drivers.Lane
  + R_ND_Claim_Type_1_Third.Party.Hit.Driver
  + R_ND_Claim_Type_1_Third.Party.Hit.Driver.in.Rear
  + R_ND_Claim_Type_1_Unknown.Third.Party.Hit.Stopped.Insured
  + R_ND_Claim_Type_1_Vandalism.Repairable
  + R_ND_Claim_Type_1_Vandalism.Total.Loss
  + R_ND_Claim_Type_1_Windscreen.Crack
  + R_ND_Claim_Type_1_Windscreen.Smashed
  + R_ND_Claim_NCB_Prejudiced_2_No
  + R_ND_Claim_NCB_Prejudiced_2_Yes
  + R_ND_Claim_Type_2_Driver.Hit.Immobile.Object
  + R_ND_Claim_Type_2_Driver.Hit.Third.Party
  + R_ND_Claim_Type_2_Fire.Total.Loss
  + R_ND_Claim_Type_2_Multi.Vehicle.Collision
  + R_ND_Claim_Type_2_Object.Hit.Vehicle
  + R_ND_Claim_Type_2_Theft.Vehicle.not.Recovered
  + R_ND_Claim_Type_2_Third.Party.Hit.Driver
  + R_ND_Claim_Type_2_Third.Party.Hit.Driver.in.Rear
  + R_ND_Claim_Type_2_Vandalism.Repairable
  + R_ND_Claim_Type_2_Vandalism.Total.Loss
  + R_ND_Claim_Type_2_Windscreen.Smashed
  + R_ND_Claim_NCB_Prejudiced_3_No
  + R_ND_Claim_NCB_Prejudiced_3_Yes
  + R_ND_Claim_Type_3_Driver.Hit.Immobile.Object
  + R_ND_Claim_Type_3_Driver.Hit.Third.Party
  + R_ND_Claim_Type_3_Multi.Vehicle.Collision
  + R_ND_Claim_Type_3_Theft.Vehicle.not.Recovered
  + R_ND_Claim_Type_3_Third.Party.Hit.Driver
  + R_ND_Claim_Type_3_Third.Party.Hit.Driver.in.Rear
  + R_ND_Claim_Type_3_Windscreen.Smashed
  + R_ND_Claim_NCB_Prejudiced_4_No
  + R_ND_Claim_NCB_Prejudiced_4_Yes
  + R_ND_Claim_Type_4_Driver.Hit.Immobile.Object
  + R_ND_Claim_Type_4_Multi.Vehicle.Collision
  + R_ND_Claim_Type_4_Third.Party.Hit.Driver.in.Rear
  + R_ND_Claim_NCB_Prejudiced_5_No
  + R_ND_Claim_Type_5_Third.Party.Hit.Driver.in.Rear
  + Proposer_Conv_Code_1_AC10
  + Proposer_Conv_Code_1_AC20
  + Proposer_Conv_Code_1_CD10
  + Proposer_Conv_Code_1_CD20
  + Proposer_Conv_Code_1_CD30
  + Proposer_Conv_Code_1_CU10
  + Proposer_Conv_Code_1_CU20
  + Proposer_Conv_Code_1_CU30
  + Proposer_Conv_Code_1_CU50
  + Proposer_Conv_Code_1_DR10
  + Proposer_Conv_Code_1_DR20
  + Proposer_Conv_Code_1_DR40
  + Proposer_Conv_Code_1_DR50
  + Proposer_Conv_Code_1_IN10
  + Proposer_Conv_Code_1_LC20
  + Proposer_Conv_Code_1_MS60
  + Proposer_Conv_Code_1_MW10
  + Proposer_Conv_Code_1_PC20
  + Proposer_Conv_Code_1_PC30
  + Proposer_Conv_Code_1_SP10
  + Proposer_Conv_Code_1_SP20
  + Proposer_Conv_Code_1_SP30
  + Proposer_Conv_Code_1_SP36
  + Proposer_Conv_Code_1_SP40
  + Proposer_Conv_Code_1_SP50
  + Proposer_Conv_Code_1_SP60
  + Proposer_Conv_Code_1_TS10
  + Proposer_Conv_Code_1_TS20
  + Proposer_Conv_Code_1_TS30
  + Proposer_Conv_Code_1_TS40
  + Proposer_Conv_Code_1_TS50
  + Proposer_Conv_Code_1_TS70
  + Proposer_Conv_Code_1_TT99
  + Proposer_Conv_MthBan_1
  + Proposer_Conv_Code_2_CD10
  + Proposer_Conv_Code_2_CD20
  + Proposer_Conv_Code_2_CD30
  + Proposer_Conv_Code_2_CU30
  + Proposer_Conv_Code_2_CU50
  + Proposer_Conv_Code_2_DR10
  + Proposer_Conv_Code_2_DR40
  + Proposer_Conv_Code_2_LC20
  + Proposer_Conv_Code_2_MW10
  + Proposer_Conv_Code_2_SP10
  + Proposer_Conv_Code_2_SP20
  + Proposer_Conv_Code_2_SP30
  + Proposer_Conv_Code_2_SP40
  + Proposer_Conv_Code_2_SP50
  + Proposer_Conv_Code_2_SP60
  + Proposer_Conv_Code_2_TS10
  + Proposer_Conv_Code_2_TS50
  + Proposer_Conv_MthBan_2
  + Proposer_Conv_Code_3_CD10
  + Proposer_Conv_Code_3_DR10
  + Proposer_Conv_Code_3_SP10
  + Proposer_Conv_Code_3_SP30
  + Proposer_Conv_Code_3_SP50
  + Proposer_Conv_MthBan_3
  + Proposer_Conv_Code_4_SP50
  + Proposer_Conv_MthBan_4
  + Proposer_Conv_MthBan_5
  + R_ND_Conv_Code_1_CD10
  + R_ND_Conv_Code_1_CD20
  + R_ND_Conv_Code_1_CD30
  + R_ND_Conv_Code_1_CU10
  + R_ND_Conv_Code_1_CU20
  + R_ND_Conv_Code_1_CU30
  + R_ND_Conv_Code_1_CU50
  + R_ND_Conv_Code_1_DR10
  + R_ND_Conv_Code_1_DR20
  + R_ND_Conv_Code_1_DR40
  + R_ND_Conv_Code_1_LC20
  + R_ND_Conv_Code_1_MS60
  + R_ND_Conv_Code_1_PC30
  + R_ND_Conv_Code_1_SP10
  + R_ND_Conv_Code_1_SP20
  + R_ND_Conv_Code_1_SP30
  + R_ND_Conv_Code_1_SP40
  + R_ND_Conv_Code_1_SP50
  + R_ND_Conv_Code_1_SP60
  + R_ND_Conv_Code_1_TS10
  + R_ND_Conv_Code_1_TS20
  + R_ND_Conv_Code_1_TS50
  + R_ND_Conv_MthBan_1
  + R_ND_Conv_Code_2_CU30
  + R_ND_Conv_Code_2_SP10
  + R_ND_Conv_Code_2_SP20
  + R_ND_Conv_Code_2_SP30
  + R_ND_Conv_Code_2_SP50
  + R_ND_Conv_Code_2_TS10
  + R_ND_Conv_MthBan_2
  + R_ND_Conv_Code_3_SP30
  + R_ND_Conv_MthBan_3
  + R_ND_Conv_MthBan_4
  + R_ND_Conv_MthBan_5
  + Prop_Licence_Years
  + NCB_Years
  + Claims_Within_3_Years
  + Unexpired_Convictions
  + Body_Type_4.x.4
  + Body_Type_4.X.4
  + Body_Type_Chassis
  + Body_Type_Crew.Cab
  + Body_Type_Double.Cab
  + Body_Type_Lifestyle
  + Body_Type_Minibus
  + Body_Type_Tipper
  + Body_Type_Unknown
  + Body_Type_Van
  + Vehicle_Variant_Select_Car.Derived
  + Vehicle_Variant_Select_Combi.Cab
  + Vehicle_Variant_Select_Crew.Cab
  + Vehicle_Variant_Select_Double.Cab
  + Vehicle_Variant_Select_MPV.Minibus
  + Vehicle_Variant_Select_Unknown
  + Vehicle_Variant_Select_Van.Single.Cab
  
  ###########################################################################
  , data=trainset1 #We are using the trainset to build the model
  , control = rpart.control(minsplit  = Min_num_splits,
                            minbucket = Min_bucket,
                            maxdepth  = Max_depth,
                            cp = 0.0001)
)

require(rpart.plot)

#?rpart
printcp(mytree)
summary(mytree)

# Predict and get ROC + AUC
predict_tree <- predict(mytree, testset)
roc_tree <- roc(testset$NELR, predict_tree)
plot(roc_tree, col='red', main='ROC curve for DecisionTree')
roc_tree$auc

#Print the prediction accuracy. What is it?

## Visualise the tree to see which variables drive the model
heat.tree <- function(tree, low.is.green=FALSE, ...) { # dots args passed to prp
  y <- tree$frame$yval
  if(low.is.green)
    y <- -y
  max <- max(y)
  min <- min(y)
  cols <- rainbow(99, end=.36)[
    ifelse(y > y[1], (y-y[1]) * (99-50) / (max-y[1]) + 50,
           (y-min) * (50-1) / (y[1]-min) + 1)]
  prp(tree, branch.col=cols, box.col=cols, ...)
}

heat.tree(mytree, type=4, varlen=0, faclen=0, fallen.leaves=TRUE, cex= 0.5, extra= 1)
roc_tree$auc

summarytree <- summary(mytree)
summarytree

Exportme <- data.frame(summarytree$frame)
#write.csv(Exportme, "DT_Nodes.csv")



