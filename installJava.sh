REQUIRED_PKG="sudo"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "The essential package $REQUIRED_PKG was not found, installing..."
  su
  apt-get --assume-yes install $REQUIRED_PKG 
fi
REQUIRED_PKG="tar"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "The essential package $REQUIRED_PKG was not found, installing..."
  sudo apt-get --assume-yes install $REQUIRED_PKG 
fi
read -p "UPDATE 7/27/2020: Remember when I said that the script doesn't download the JDK/JRE? Well... The script now downloads the DEB formats for Java 14 and 11. I managed to get wget working, I'll still leave the tar.gz option just in case...

If you want JavaFX, you'd still need to download Java 8 (The Orcale JDK/JRE of course).
This will remove your existing Java installation (only applies to tar.gz installations), understood? (y/n) " choice
case "$choice" in 
  y|Y ) echo " ";;
  n|N ) echo "Abort" 
exit;;
  * ) echo -e "\e[31mYou have to say y or n, don't play with me smh"
exit;;
esac
if [[ -d "/usr/java" ]]
then
    sudo rm -r /usr/java && sudo mkdir /usr/java
else 
    sudo mkdir /usr/java
fi
PS3='Which Java version do you have downloaded? (DEB and RPM formats will be automatically downloaded): '
options=("Java 8 64bit (JDK)" "Java 8 64bit (JRE)" "Java 8 32bit (JDK)" "Java 8 32bit (JRE)" "Java 14 (RPM)" "Java 11 (RPM)" "Java 14 (tar.gz)" "Java 11 (tar.gz)" "Java 14 (DEB)" "Java 11 (DEB)")
select opt in "${options[@]}"
do
    case $opt in
        "Java 8 64bit (JDK)")
            sudo tar zxvf jdk-8u261-linux-x64.tar.gz -C /usr/java
            sudo rm jdk-8u261-linux-x64.tar.gz
            export JAVA_BIN_DIR=/usr/java/jdk1.8.0_261/bin
            cd ${JAVA_BIN_DIR}
            a=(java javac javadoc javah javap javaws)
            for exe in ${a[@]}; do
            sudo update-alternatives --install "/usr/bin/${exe}" "${exe}" "${JAVA_BIN_DIR}/${exe}" 1
            sudo update-alternatives --set ${exe} ${JAVA_BIN_DIR}/${exe}
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
            
            exit
            ;;
        "Java 8 64bit (JRE)")
            sudo tar zxvf jre-8u261-linux-x64.tar.gz -C /usr/java
            sudo rm jre-8u261-linux-x64.tar.gz
            export JAVA_BIN_DIR=/usr/java/jre1.8.0_261/bin
            cd ${JAVA_BIN_DIR}
            a=(java javac javadoc javah javap javaws)
            for exe in ${a[@]}; do
            sudo update-alternatives --install "/usr/bin/${exe}" "${exe}" "${JAVA_BIN_DIR}/${exe}" 1
            sudo update-alternatives --set ${exe} ${JAVA_BIN_DIR}/${exe}
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
            exit
            ;;
        "Java 14 (tar.gz)")
            sudo tar zxvf jdk-14.0.2_linux-x64_bin.tar.gz -C /usr/java
            sudo rm jdk-14.0.2_linux-x64_bin.tar.gz
            export JAVA_BIN_DIR=/usr/java/jdk-14.0.2/bin
            cd ${JAVA_BIN_DIR}
            a=(java javac javadoc javah javap javaws)
            for exe in ${a[@]}; do
            sudo update-alternatives --install "/usr/bin/${exe}" "${exe}" "${JAVA_BIN_DIR}/${exe}" 1
            sudo update-alternatives --set ${exe} ${JAVA_BIN_DIR}/${exe}
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
            exit
            ;;
        "Java 11 (tar.gz)")
            sudo tar zxvf jdk-11.0.8_linux-x64_bin.tar.gz -C /usr/java
            sudo rm jdk-11.0.8_linux-x64_bin.tar.gz
            export JAVA_BIN_DIR=/usr/java/jdk-11.0.8/bin
            cd ${JAVA_BIN_DIR}
            a=(java javac javadoc javah javap javaws)
            for exe in ${a[@]}; do
            sudo update-alternatives --install "/usr/bin/${exe}" "${exe}" "${JAVA_BIN_DIR}/${exe}" 1
            sudo update-alternatives --set ${exe} ${JAVA_BIN_DIR}/${exe}
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
            exit
            ;;
        "Java 8 32bit (JDK)")
            sudo tar zxvf jdk-8u261-linux-i586.tar.gz -C /usr/java
            sudo rm jdk-8u261-linux-i586.tar.gz
            export JAVA_BIN_DIR=/usr/java/jdk1.8.0_261/bin
            cd ${JAVA_BIN_DIR}
            a=(java javac javadoc javah javap javaws)
            for exe in ${a[@]}; do
            sudo update-alternatives --install "/usr/bin/${exe}" "${exe}" "${JAVA_BIN_DIR}/${exe}" 1
            sudo update-alternatives --set ${exe} ${JAVA_BIN_DIR}/${exe}
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
            
            exit
            ;;
        "Java 14 (RPM)"
            wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/14.0.2+12/205943a0976c4ed48cb16f1043c5c647/jdk-14.0.2_linux-x64_bin.rpm
            rpm -ivh jdk-14.0.2_linux-x64_bin.rpm
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
        
            exit
            ;;
        "Java 11 (RPM)"
            wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/11.0.8%2B10/dc5cf74f97104e8eac863698146a7ac3/jdk-11.0.8_linux-x64_bin.rpm
            rpm -ivh jdk-11.0.8_linux-x64_bin.rpm
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
        
            exit
            ;;
        "Java 11 (DEB)"
            wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/11.0.8%2B10/dc5cf74f97104e8eac863698146a7ac3/jdk-11.0.8_linux-x64_bin.deb
            sudo dpkg -i jdk-11.0.8_linux-x64_bin.deb
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
        
            exit
            ;;    
       "Java 14 (DEB)"
            wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/14.0.2+12/205943a0976c4ed48cb16f1043c5c647/jdk-14.0.2_linux-x64_bin.deb
            sudo dpkg -i jdk-14.0.2_linux-x64_bin.deb
        done
            if [ $? -eq 0 ]
then
    echo -e "\e[32mInstalled Java successfully, run the command java -version to test the installation."
else
    echo -e "\e[31mThe installation failed."
fi
        
            exit
            ;;     
        *) echo "Pick one of the 4 options, $REPLY isn't a valid option smh";;
    esac
done
