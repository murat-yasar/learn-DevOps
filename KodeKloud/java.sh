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


