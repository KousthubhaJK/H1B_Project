#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************APP MENU***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1a)${MENU} Is the number of petitions with Data Engineer job title increasing over time? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1b)${MENU} Find top 5 job titles who are having highest avg growth in applications? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2a)${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2b)${MENU} find top 5 locations in the US who have got certified visa for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3a)${MENU} Which industry(SOC_NAME) has the most number of Data Scientist positions? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3b)${MENU} Which industry(SOC_NAME) has the most number of Data Scientist positions? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4a)${MENU} Which top 5 employers file the most petitions each year? - Case Status - ALL ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4b)${MENU} Which top 5 employers file the most petitions each year? - Case Status - ALL ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?
                                --for all the applications? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} Find the percentage and the count of each case status on total applications for each year.          Create a line graph depicting the pattern of All the cases over the period of time? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU} Create a bar graph to depict the number of applications for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)Find the average Prevailing Wage for each Job for each Year for part time and  Arrange the output in descending order? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 9)Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed more than 1000)? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10)Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed more than 1000)? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11)Export result for question no 10 to MySql database? ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1a) clear;
        option_picked "Is the number of petitions with Data Engineer job title increasing over time?";
        hadoop jar q1a.jar Q1a /user/hive/warehouse/h1b.db/h1b_final /user/hduser/hadoop/q1aoutput;
        hadoop fs -cat /user/hduser/hadoop/q1aoutput/p*;
        show_menu;
        ;;

        1b) clear;
        option_picked "Find top 5 job titles who are having highest avg growth in applications.";
        hadoop jar q1b.jar Q1b /user/hive/warehouse/h1b.db/h1b_final /user/hduser/hadoop/q1boutput;
        hadoop fs -cat /user/hduser/hadoop/q1boutput/p*;
        show_menu;
        ;;
            
        2a) clear;
        option_picked "Which part of the US has the most Data Engineer jobs for each year?";
        pig 2a.pig;
        show_menu;
        ;;
	
        2b) clear;
        option_picked "find top 5 locations in the US who have got certified visa for each year.";
        pig 2b.pig;
        show_menu;
        ;;
            
	3a) clear;
        option_picked "Which industry(SOC_NAME) has the most number of Data Scientist positions?";
        hive -f 3a.txt;
        show_menu;
        ;;
        3b) clear;
        option_picked "Which industry(SOC_NAME) has the most number of Data Scientist positions?";
        hadoop jar q3.jar Q3 /user/hive/warehouse/h1b.db/h1b_final /user/hduser/hadoop/q3output;
        hadoop fs -cat /user/hduser/hadoop/q3output/p*;
        show_menu;
        ;;
        4a) clear;
        option_picked "Which top 5 employers file the most petitions each year? - Case Status - ALL";
        hive -f 4a.txt;
        show_menu;
        ;;   
        4b) clear;
        option_picked "Which top 5 employers file the most petitions each year? - Case Status - ALL";
        hadoop jar q4.jar Q4 /user/hive/warehouse/h1b.db/h1b_final /user/hduser/hadoop/q4output;
        hadoop fs -cat /user/hduser/hadoop/q4output/p*;
        show_menu;
        ;;             
            
        5) clear;
        option_picked "Find the most popular top 10 job positions for H1B visa applications for each year? for only certified applications?";
        hadoop jar q5.jar Q5 /user/hive/warehouse/h1b.db/h1b_final /user/hduser/hadoop/q5output;
        hadoop fs -cat /user/hduser/hadoop/q5output/p*;
        show_menu;
        ;;  
        6) clear;
        option_picked "Find the percentage and the count of each case status on total applications for each year. Create a line graph      depicting the pattern of All the cases over the period of time.";
        pig 6.pig;
        show_menu;      
         ;;
            7) clear;
            option_picked "Create a bar graph to depict the number of applications for each year";
            hive -f 7.txt;
             show_menu;
                ;;
   
            8) clear;
            option_picked "Find the average Prevailing Wage for each Job for each Year for full time and Arrange the output in descending order?";
            hive -f 8.txt;
             show_menu;
              ;;
            
            9) clear;
              option_picked "Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed more than 1000) ?";
              pig 9.pig;
             show_menu;
               ;;
            10) clear;
               option_picked "Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed more than 1000)?";
              pig 10.pig;
              show_menu;
                ;;
             11) clear;
               option_picked "Export result for question no 10 to MySql database.";
             show_menu;
               ;;
        \n) exit;
        ;;

        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi



done


