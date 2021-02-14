create_domain()
{
  echo "Result: $domainname $password $port $framework"
  sleep 10
ansible-playbook playbook.yaml -vv -i ./inventory -e "appname=$domainname instanceport=$port whichframework=$framework adminpassword=$password domain_status=create"
}

show_menu()
{
    clear
    echo "------------------------------------------------------------------------------"
    echo "| CREATE NEW PAYARA DOMAIN OR  UPDATE EXISTING PAYARA DOMAINS TO SUPPORT JMS  |"
    echo "------------------------------------------------------------------------------"
    echo "1) Create new  domain "
    echo "2) Update existing  domain "
    echo "X) Exit       "
    read -p "Enter your choice [ 1 - 2 ]: " choice
    case $choice in
    1) read -p "Enter the domain name (Example : changeevent) " domainname
       read -p "Enter the domain password " password
       read -p "Enter the domain base port " port
       read -p "Enter the domain framework " framework
       create_domain $domainname $password $port $framework
        ;;
    2) #read -p "Enter the application name to add default JMS configuration to an existing domain:" appname 
       show_jms_menu 
	   ;;
    x|X) exit 0
        ;;
    *) echo "Quit..."
        exit 0
        ;;
    esac
#show_menu
}
#show_menu

show_jms_menu()
{
    clear
    echo "------------------------------------------------------------------------------"
    echo "|            UPDATE EXISTING PAYARA DOMAINS TO SUPPORT JMS                   |"
    echo "------------------------------------------------------------------------------"
    echo "1) add default JMS configuration to an existing domain "
    echo "2) add custom queue / topic to existing domain "
    echo "X) Exit       "
    read -p "Enter Choice [ 1 - 2] " choice
    case $choice in
    1) read -p "Enter the domain name to add default JMS configuration to an existing domain:" appname
	   update_single_domain $appname
        ;;
    2) #read -p "Enter the application name to add default JMS configuration to an existing domain:" appname
       show_custom_topic_queue_menu
	   ;;
    x|X) exit 0
        ;;
    *) echo "Quit..."
        exit 0
        ;;
    esac
show_jms_menu
}

show_custom_topic_queue_menu()
{
    clear
    echo "------------------------------------------------------------------------------"
    echo "|            UPDATE EXISTING PAYARA DOMAINS For custom_topic_queue_menu      |"
    echo "------------------------------------------------------------------------------"
    echo "1) Add custom Topic to existing domain "
    echo "2) Add cust Queue to existing domain "
    echo "X) Exit       "
    read -p "Enter Choice [ 1 - 2] " choice
	case $choice in
    1) read -p "Enter the domain name (Example : changeevent) " appname
       read -p "Enter the physical name of the resource " resourcename
        update_existing_domain $topicClass $resourcename $appname
        ;;
    2)  read -p "Enter the domain name (Example : changeevent) " appname
	read -p "Enter the physical name of the resource " resourcename
	    update_existing_domain $queueClass $resourcename $appname
        ;;
   

    x|X) exit 0
        ;;
    *) echo "Quit..."
        exit 0
        ;;
    esac
show_custom_topic_queue_menu
}
show_menu
