# Check Java version
java -version

# Download JDK-20
sudo curl https://download.java.net/java/GA/jdk20/bdc68b4b9cbc4ebcb30745c85038d91d/36/GPL/openjdk-20_linux-x64_bin.tar.gz --output /opt/openjdk-20_linux-x64_bin.tar.gz

# Uncompress OpenJDK-20 tar file into /opt/
sudo tar -xf /opt/openjdk-20_linux-x64_bin.tar.gz -C /opt/

# Verify that JDK-20 runs and correct version is installed
/opt/jdk-20/bin/java -version

# Set path variable
export PATH=$PATH:/opt/jdk-20/bin


# Compile / Build / Document / Debug

# Compile java class in /opt/app/
javac /opt/app/MyClass.java

# Run compiled MyClass.class
cd /opt/app;
java MyClass

# Generate documentation for MyClass.java into /opt/app/doc directory
javadoc -d doc MyClass.java

# Install the Apache Ant build tool (with preconfirmation -yes)
sudo yum install -y ant

# Read build configuration of Ant
cat /opt/ant/build.xml

# Compile and generate jar package using ant
cd /opt/ant;
ant compile jar

# Run "ant" to carry out all steps specified in the build configuration file /opt/ant/build.xml.
cd /opt/ant;
ant

# Install maven
sudo yum install maven

# Please compile and package the application inside /opt/maven/my-app/ with maven
cd /opt/maven/my-app;
sudo mvn package;

# Execute /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar
java -cp /opt/maven/my-app/target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App


