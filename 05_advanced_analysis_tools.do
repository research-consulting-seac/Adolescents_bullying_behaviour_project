**factor analysis for depression
pwcorr troub_asleep tired poor_apetite troub_conc lost_interest feel_dep feel_failure movem thought_dead, sig
factortest troub_asleep tired poor_apetite troub_conc lost_interest feel_dep feel_failure movem thought_dead
factor troub_asleep tired poor_apetite troub_conc lost_interest feel_dep feel_failure movem thought_dead
rotate, promax
predict depression_new
**to see if the depression score mean value differs across the two bullyig groups
ttest depression_new, by (bullied_someone)
cohend depression_new bullied_someone

**pca for social inclusivity
rename gg1306 (mix_freely_other_caste)
rename gg1307 (mix_freely_other_religion)
rename gg1308 (eat_together)
corr mix_freely_other_caste mix_freely_other_religion eat_together
pca mix_freely_other_caste mix_freely_other_religion eat_together
predict social_inclusivity
ttest social_inclusivity, by (bullied_someone)

**pca for mobility
rename gg308 (mobility_inside_village)
rename gg309 (mobility_outside_village)
rename gg310 (attend_programme)

corr mobility_inside_village mobility_outside_village attend_programme
pca mobility_inside_village mobility_outside_village attend_programme
predict mobility
ttest mobility, by(bullied_someone)
cohend mobility bullied_someone


***final model
logit bullied_someone i.age sex i.htype i.attending_school hurt_by_parent##share_personal_matter_parents i.mother_education i.viol_norm have_role_model i.no_of_friends##i.freq_meeting_friends physical_activity sub_abuse educational_aspiration depression i.watch_telivision i.read_books_others i.watch_films mobile_use had_gf_bf c.social_inclusivity c.mobility, or, if sex==1
logit bullied_someone i.age sex htype i.attending_school hurt_by_parent##share_personal_matter_parents i.mother_education i.viol_norm have_role_model i.no_of_friends##i.freq_meeting_friends physical_activity sub_abuse educational_aspiration depression i.watch_telivision i.read_books_others i.watch_films mobile_use had_gf_bf c.social_inclusivity c.mobility, or, if sex==2
