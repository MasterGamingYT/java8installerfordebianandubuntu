read -p "This script does NOT download the JDK/JRE, you have to manually download the tar.gz format of your corresponding version from the official Orcale website. 

On Java SE 11 and higher, Orcale officially released DEB formats, so you can go install that if you want. 

If you want JavaFX, download Java 8 (JDK or JRE it doesn't matter). 
This will remove your existing java installation, understood? (y/n) " choice
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

PS3='Which Java version do you have downloaded?: '
options=("Java 8 (JDK)" "Java 8 (JRE)" "Java 14" "Java 11")
select opt in "${options[@]}"
do
    case $opt in
        "Java 8 (JDK)")
            sudo tar zxvf jdk-8u261-linux-x64.tar.gz
            sudo rm jdk-8u261-linux-x64.tar.gz
            sudo mv jdk1.8.0_261 /usr/java
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
        "Java 8 (JRE)")
            sudo tar zxvf jre-8u261-linux-x64.tar.gz
            sudo rm jre-8u261-linux-x64.tar.gz
            sudo mv jre1.8.0_261 /usr/java
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
        "Java 14")
            sudo tar zxvf jdk-14.0.2_linux-x64_bin.tar.gz
            sudo rm jdk-14.0.2_linux-x64_bin.tar.gz
            sudo mv jdk-14.0.2 /usr/java
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
        "Java 11")
            sudo tar zxvf jdk-11.0.8_linux-x64_bin.tar.gz
            sudo rm jdk-11.0.8_linux-x64_bin.tar.gz
            sudo mv jdk-11.0.8 /usr/java
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
        *) echo "Pick one of the 4 options, $REPLY isn't a valid option smh";;
    esac
done