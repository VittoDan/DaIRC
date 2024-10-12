agent_name="${1%.[^.]*}"
echo "$agent_name"
echo "agent('Examples/advanced/work/$agent_name','$agent_name','no',italian,['Examples/advanced/conf/communication'],['$2/communication_fipa','$2/learning','$2/planasp'],'no','$2/onto/dali_onto.txt',[],'$agent_name')." > "Examples/advanced/conf/mas/$1"
