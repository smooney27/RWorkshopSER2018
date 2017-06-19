# Slide 11 -- Note that it's good practice to load all libraries up front
# Note that you'll need to replace <yourpath> with your path
library(sas7bdat)
demo <- read.sas7bdat('<yourpath>\\DEMO_D.sas7bdat')
phthalates <- read.sas7bdat('<yourpath>\\phthte_d.sas7bdat')

# Slide 12 - horizontal merge the two NHANES data frames
nhanes <- merge(demo, phthalates, by='SEQN')

# Slide 13
women <- nhanes[nhanes$RIAGENDR == 2,]
women1545 <- women[women$RIDAGEEX >= 15*12 & women$RIDAGEEX <= 45*12,]
nrow(women1545)

# Slide 17 -- identify columns
colnames(women1545)
phthalate_column_names <- c('URXMHP',
				'URXMHH',
				'URXECP',
				'URXMOH',
				'URXMC1',
				'URXMIB',
				'URXMBP',
				'URXMZP',
				'URXMEP')
phthalate_column_names

# Slide 18 -- the elegant way
log_phthalate_column_names <- paste('Ln', phthalate_column_names, sep='')
log_phthalate_column_names
women1545[,log_phthalate_column_names] <- log(women1545[,phthalate_column_names])

# Slide 18, how I actually did it the first time before I thought about it
log_phthalate_column_names <- vector(length=length(phthalate_column_names))
for (i in 1:length(phthalate_column_names)) {
	new_column_name <- paste('Ln', phthalate_column_names[i], sep='')
	women1545[,new_column_name] <- log(women1545[,phthalate_column_names[i]])
	log_phthalate_column_names[i] <- new_column_name
}
log_phthalate_column_names

# Slide 18, The brute force way, which also works
women1545$LnURXMHP <- log(women1545$URXMHP)
women1545$LnURXMHH <- log(women1545$URXMHH)
women1545$LnURXECP <- log(women1545$URXECP)
women1545$LnURXMOH <- log(women1545$URXMOH)
women1545$LnURXMC1 <- log(women1545$URXMC1)
women1545$LnURXMIB <- log(women1545$URXMIB)
women1545$LnURXMBP <- log(women1545$URXMBP)
women1545$LnURXMZP <- log(women1545$URXMZP)
women1545$LnURXMEP <- log(women1545$URXMEP)

# Slide 24 -- load FactoMineR
library(FactoMineR)
complete_women1545 <- women1545[complete.cases(women1545[,log_phthalate_column_names]),]
pca.result <- PCA(complete_women1545[,log_phthalate_column_names], 
                    row.w=complete_women1545$WTMEC2YR)
round(pca.result$eig[,1:2], 2)

# Slide 29 -- do the PCA with just 2 components and do a varimax rotation
pca.result <- PCA(complete_women1545[,log_phthalate_column_names], 
			ncp=2,
                    row.w=complete_women1545$WTMEC2YR)
rotated <- varimax(pca.result$var$coord)
round(matrix(rotated$loadings, ncol=2), 2)
