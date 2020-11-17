## Send SMS and Verify mobile number by SMS code
This is a InterSystems IRIS Interoperability solution.
1) Sends an SMS message to a mobile number
2) Verify Mobile number by SMS code

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: ZPM
Open IRIS Namespace with Interoperability Enabled. Open Terminal and call: USER>zpm "install iris-sms"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/Vassil2010/iris-sms.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```



## Post-installation settings

1. To create an account on https://dashboard.nexmo.com/sign-in

2. Get API key and API Secret

3. Add Credentials  http://localhost:{port}/csp/irisapp/EnsPortal.Credentials.zen

3.1. ID = "nexmo"

3.2. User Name - API key

3.3. Password - API Secret

4. Add the Admin user in Workflow users

5. Start production bondar.irissms.Production

## Demo

1) For send SMS:

```
w ##class(bondar.irissms.Test).SendSms("79620000000", "Hello world!")
```

2) For Verify mobile number:

```
w ##class(bondar.irissms.Test).VerifyNumber("79620000000")
```

2.1.) Sends a verification code to a mobile number

2.2.) Creates a Workflow task for entering the verification code 

2.3.) The business operation checks the code

![production](https://github.com/Vassil2010/iris-sms/raw/master/misc/production.png)

![business-process](https://github.com/Vassil2010/iris-sms/raw/master/misc/business-process.png)

![visualtrace](https://github.com/Vassil2010/iris-sms/raw/master/misc/visualtrace.png)

