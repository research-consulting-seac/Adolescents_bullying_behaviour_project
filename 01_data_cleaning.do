**outcome variable
recode gg1109 (1=1 "yes") (2=0 "no"), gen(bullied_someone)

**age
recode gg101b (10/13 = 0 "below 14 years") (14/17 =1 "14 to 17 years") (18 19 = 2 "18 years and above"), gen (age)

**sex
tab sex

**region
tab htype

**schooling
rename(gg106) (attending_school)

**family_environment
rename (gg181) (hurt_by_parent)
recode hurt_by_parent (8 9 = .)
rename (gg207) (share_personal_matter_parents)
recode share_personal_matter_parents (8 9 =.)

**mother's schooling completed
recode gg103 (0=0 "no_schoooling") (1/5 =1 "till_primary") (6/8 = 2 "middle") ( 9/12= 3 "higher_or_secondary") (13/17= 4 "higher_studies") (98=. ), gen (mother_education)

**violence is accepted norm in family
gen new=.
replace new =1 if gg1112 ==1 | gg1113==1
replace new=2 if gg1112 ==2 & gg1113==2
replace new=3 if gg1112 ==8 & gg1113==8
replace new=2 if gg1112 ==2 & gg1113==8
replace new=2 if gg1112 ==8 & gg1113==2
rename (new) (viol_norm)
label define violent_norm 1 "yes" 2 "no" 3 "can't say" 
label value viol_norm violent_norm

**have role model
rename (gg209) (have_role_model)
recode have_role_model (8 = .)

**no of friends & freq of meeting
recode gg701 (0=0 "no friend") (1=1 "one friend") (2=2 "two friends") (3=3 "three friends") (4/70= 4 "4 or more friends"), gen (no_of_friends)
rename(gg702)(freq_meeting_friends)

**physical activity
rename (gg706) (physical_activity)

**substance abuse
gen substance_abuse= (gg1101 + gg1103)
recode substance_abuse (2 3 = 0 "yes") (4 =1 "no"), gen(sub_abuse) 
tab sub_abuse
**educational aspiration
recode gg112 (4/12 =0 "till_class_12") (13/21 =1 "higher studies") (98=. ), gen (educational_aspiration)
tab educational_aspiration

***metal health using PHQ-9 sclae 
tab gg627a, nolabel
recode gg627a (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(troub_asleep)
recode gg627b (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(tired)
recode gg627c (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(poor_apetite)
recode gg627d (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(troub_conc)
recode gg627e (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(lost_interest)
recode gg627f (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(feel_dep)
recode gg627g (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(feel_failure)
recode gg627h (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(movem)
recode gg627i (4=0 "not at all") (3=1 "less than one week") (2=2 "one week or more") (1=3 "neary everyday"), gen(thought_dead)
gen mental_health = troub_asleep+ tired+ poor_apetite+ troub_conc+ lost_interest+ feel_dep+ feel_failure+ movem+ thought_dead
gen depression=.
replace depression=1 if mental_health >=10
replace depression=0 if mental_health< 10 

**media variables
rename (gg1201) (watch_telivision)
rename (gg1202)(read_books_others)
rename (gg1204)(watch_films)

**mobile use
rename (gg1207) (use_mobile)
recode use_mobile (1 2 =1 "yes") (3=2 "no"), gen(mobile_use)

**had bf/gf
recode gg801 (1=0 "yes") (2=1 "no") (3=2 "not asked/ no response"), gen (had_gf_bf)


