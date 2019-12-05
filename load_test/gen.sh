#!/bin/bash

gen_sess() {
   local sessname="$1"
   shift
   local arr=("$@")
   echo "    "\<session name=\"$sessname\" probability=\"\" type=\"ts_http\"\> > sessions/$sessname.xml
   for trans in ${arr[@]}; do
      if ! [ "$trans" -eq "$trans" ] 2> /dev/null
      then
         # string -> real transaction
         cat transactions/$trans.xml >> sessions/$sessname.xml
      else
         # num -> thinktime
         sed 's/value=""/value="'$trans'"/g' transactions/think.xml >> sessions/$sessname.xml
      fi
   done
   echo "    "\<\/session\> >> sessions/$sessname.xml
}

SESS=("welcome" "registration" "index_page")
gen_sess registration "${SESS[@]}"

SESS=("welcome" "index_page" 5 "view_chat_pages" 5 "new_post")
gen_sess unauth "${SESS[@]}"

SESS=("welcome" "login" "index_page" 5 "view_chat_pages" 5 "upvote" 5 "downvote")
gen_sess auth_passive "${SESS[@]}"

SESS=("welcome" "login" "index_page" 5 "retwitte" 5 "index_page" 5 "view_chat_pages" 5 "upvote" 5 "profile" "to_me" "post_with_tags" 5 "new_post" "downvote" 5 "comment" "inbox_post")
gen_sess auth_active "${SESS[@]}"

SESS=("welcome" "login" "index_page" 5 "post_ad")
gen_sess ad_owner "${SESS[@]}"


gen_scenario() {
   local name="$1"
   shift
   local arr=("$@")
   cat sessions/head.xml > scenarios/$name.xml
   echo "  "\<\sessions\> >> scenarios/$name.xml
   for ele in ${arr[@]}; do
      if ! [ "$ele" -eq "$ele" ] 2> /dev/null
      then
         local session_file=$ele
      else
         sed 's/probability=""/probability="'$ele'"/g' sessions/$session_file.xml >> scenarios/$name.xml
      fi
   done
   echo "  "\<\/sessions\> >> scenarios/$name.xml
   echo \<\/tsung\> >> scenarios/$name.xml
}

SC=("registration" 100)
gen_scenario sc1 "${SC[@]}"

SC=("unauth" 100)
gen_scenario sc2 "${SC[@]}"

SC=("auth_passive" 50 "auth_active" 50)
gen_scenario sc3 "${SC[@]}"

SC=("registration" 5 "unauth" 40 "auth_passive" 35 "auth_active" 20)
gen_scenario sc4 "${SC[@]}"

SC=("registration" 5 "ad_owner" 5 "unauth" 40 "auth_passive" 30 "auth_active" 20)
gen_scenario sc5 "${SC[@]}"

