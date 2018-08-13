# CodeBook

## Variables
1. dtr_X : training data recording
2. dts_X : test data recording
3. n: number of subjects (30)
4. dtr_s : subjects in training set
5. dts_s : subjects in test set
6. dtr_a : activities in training set
7. dts_a : activitites in test set
8. al : activity labels
9. rf : recording labels (features) dataframe with id
10. rl : only the names of features
11. m_tr_1 : horizontally merged training data subject and activities
12. m_ts_1 : horizontally merged test data subject and activities
13. m_tr_2 : horizontally merged training data
14. m_ts_2 : horizontally merged test data
15. m : vertically merged training and test data
16. means_i : indexes of 'mean' featuresin rl
17. std_i : indexes of standard deviation featues in rl
18. x: final list, to be populated
19. i: counter
20. ac: activities
21. s : subjects
22. v1 : filtered m with activity and subject
23. cm : column means from v1
24. v2 : column means with activity and subject
25. df : final dataframe converted from X
