#!bin/bash
#Shell script to execute setup payara server playbook

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
       ansible-playbook playbook.yaml -vv -e "appname=$domainname instanceport=$port whichframework=$framework adminpassword=$password domain_state=create_new_domain"
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
show_menu
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
        ansible-playbook playbook.yaml -vv -e "appname=$appname domain_state=update_single_domain"
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
            ansible-playbook playbook.yaml -vv -e "appname=$appname resourcename=$resourcename type=topicClass domain_state=update_existing_domain"
        ;;
    2)  read -p "Enter the domain name (Example : changeevent) " appname
	read -p "Enter the physical name of the resource " resourcename
	    ansible-playbook playbook.yaml -vv -e "appname=$appname resourcename=$resourcename type=queueClass domain_state=update_existing_domain"
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
