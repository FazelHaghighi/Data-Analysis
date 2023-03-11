import numpy as np
import pandas as pd


def survival_chance(titanic_df, start_age, end_age):
    Survived = titanic_df.Survived[~titanic_df.Age.isna()].tolist()
    Ages = titanic_df.Age[~titanic_df.Age.isna()].to_list()
    Sex = titanic_df.Sex[~titanic_df.Age.isna()].tolist()

    male = 0
    female = 0
    male_survived = 0
    female_survived = 0
    for i in range(len(Ages)):
        if Ages[i] >= start_age and Ages[i] <= end_age:
            if Sex[i] == "male":
                male += 1
                if Survived[i] == 1:
                    male_survived += 1
            if Sex[i] == "female":
                female += 1
                if Survived[i] == 1:
                    female_survived += 1
    if female == 0:
        female_return = -1
    else:
        female_return = round(female_survived / female, 3)

    if male == 0:
        male_return = -1
    else:
        male_return = round(male_survived / male, 3)

    dict_return = {"female": female_return, "male": male_return}
    return dict_return
