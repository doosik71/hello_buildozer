# Check packaages.

for file in \
    autoconf \
    automake \
    build-essential \
    ccache \
    cmake \
    gettext \
    git \
    libffi-dev \
    libltdl-dev \
    libtool \
    lld \
    openjdk-8-jdk \
    patch \
    pkg-config \
    python2.7 \
    python3-pip \
    python3-setuptools \
    sudo \
    unzip \
    zip \
    zlib1g-dev
do
    if dpkg -s $file > /dev/null 2>&1; then
        echo "[OK] $file installed".
    else
        echo "[ERROR] $file was not installed".
        echo "[ERROR] You can install $file with 'sudo apt install $file'"
    fi
done

# Check java version.
if [ $(java -version 2>&1 | grep -c "1.8.") -gt 0 ]; then
    echo "[OK] java 1.8.x Installed."
else
    echo "[ERROR] Java 1.8.x was not Installed or other java version is installed."
    echo "[ERROR] Buildozer only works for java 1.8.x."
    exit 1
fi

# Check python version.
if [ $(python --version 2>&1 | grep -c "3.7") -gt 0 ]; then
    echo "[OK] Python 3.7 Installed."
else
    echo "[ERROR] Python 3.7 was not Installed."
    echo "[ERROR] buildozer only works for python 3.7."
    exit 1
fi

# Check Cython version.
if [ $(pip show Cython 2>&1 | grep -c "0.28.6") -gt 0 ]; then
    echo "[OK] Cython 0.28.6 Installed."
else
    echo "[ERROR] Cython 0.28.6 was not Installed."
    echo "[ERROR] buildozer only works for Cython 0.28.6."
    echo "[ERROR] You can install Cython with 'pip install Cython==0.28.6'"
    exit 1
fi

# Check python-for-android version.
if [ $(pip show python-for-android 2>&1 | grep -c "2019.") -gt 0 ]; then
    echo "[OK] python-for-android 2019.x Installed."
else
    echo "[ERROR] python-for-android 2019.x was not Installed."
    echo "[ERROR] You can install python-for-android with 'pip install python-for-android'"
    exit 1
fi

# Check buildozer version.
if [ $(pip show buildozer 2>&1 | grep -c "0.39") -gt 0 ]; then
    echo "[OK] buildozer 0.39 Installed."
else
    echo "[ERROR] buildozer 0.39 was not Installed."
    echo "[ERROR] You can install buildozer with 'pip install buildozer==0.39'"
    exit 1
fi

# Check environment variable.
if [[ -z "$ANDROIDSDK" ]]; then
    echo "[ERROR] You must set ANDROIDSDK variable."
    echo "[EXAMPLE] export ANDROIDSDK=~/.buildozer/android/platform/android-sdk"
    exit 1
fi

if [[ -z "$ANDROIDNDK" ]]; then
    echo "[ERROR] You must set ANDROIDNDK variable."
    echo "[EXAMPLE] export ANDROIDNDK=~/.buildozer/android/platform/android-ndk-r17c"
    exit 1
fi

echo "[EXAMPLE] ~/.buildozer/android/platform/android-sdk/tools/bin/sdkmanager \"build-tools;29.0.0\""

echo "[EXAMPLE] buildozer android update"
