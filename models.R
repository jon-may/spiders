library(psych)
library(lme4)
library(stats)
library(readr)
CombinedDataSpidersLong <- read_csv("https://github.com/jon-may/spiders/raw/master/CombinedDataSpidersLong.csv", 
     col_types = cols(Condition = col_factor(levels = c("C", "A", "V"))))
View(CombinedDataSpidersLong)
attach(CombinedDataSpidersLong)

Model0.mdl <- lmer(Scariness ~ 1 + Block  + (1|PsNo) + (1|Scenario))
Model1.mdl <- lmer(Scariness ~ 1 + Block + Measure + (1|PsNo) + (1|Scenario))
Model2.mdl <- lmer(Scariness ~ 1 + Block + Condition + Measure + (1|PsNo) + (1|Scenario))
Model3.mdl <- lmer(Scariness ~ 1 + Block + Condition + Measure + Condition:Measure + (1|PsNo) + (1|Scenario))

anova(Model1.mdl,Model0.mdl)

anova(Model2.mdl,Model1.mdl)

anova(Model3.mdl,Model2.mdl)


coefficients(Model3.mdl)
