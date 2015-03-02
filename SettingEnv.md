Setting up `.env`
===================


The following steps will show you how to get the necessary `.env` keys for **Artfactum** deployment 


Keys
----------

An open source application in development may have different deployments: a production site and any number of local environments maintained by each developer. 

With everyone using same code, each of these deploys have specific configurations. One example would be credentials for an external service, such as Amazon S3. Developers may setup his S3 account, while the production sites have their own keys.


> **Note:**

> - Developers can share with themselves the keys but the production keys aren't shared with anyone
> - Your `.env` file must be set on `.gitignore` when pushing to a public repository

###Devise key

The devise key is a random hex key that needs to be setup in order to get devise running, you can get using:
    
    $ rake secret		

###Facebook

In order to use facebook to login on the aplication you need to follow those steps to gets the necessary keys:

1. Log in into [Facebook Apps](https://developers.facebook.com/apps/)
2. Click on "Create a New App"
3. Enter a Display Name, Namespace (optional) and Choose a Category
4. At your App's Dashboard you will find the App ID and the App Secret 

>FB_APP_ID = App ID from your Facebook App

>FB_APP_SECRET =  App Secret from your Facebook App

###Twitter

In order to use Twitter to login on the application you need to follow those steps to gets the necessary keys:

1. Log in into [Twitter Apps](https://apps.twitter.com/)
2. Click on "Create New App"
3. Enter a Name, Description and Website (you can use a placeholder)
4. Go to Settings and check "Allow this application to be used to Sign in with Twitter"
5. Now go to Keys and Access Tokens
6. There you will find Consumer Key and Consumer Secret

>TW_API_KEY = Twitter App Consumer Key (API Key)

>TW_API_SECRET =  Twitter App Consumer Secret (API Secret)

###Google App

In order to use Google to login on the application you need to follow those steps to gets the necessary keys:

1. Log in into [Google's Developers Console](https://console.developers.google.com/project)
2. Click on "Create Project"
3. At the sidebar find "Credentials" under "APIs and auth"
4. Click on "Create new Client ID"
5. Select "Web application" and click on "Configure consent screen"
6. Fill the form and Save 
7. At Credentials page you will find Client ID and Client Secret

>GOOGLE_CLIENT_ID = Google Project Client ID

>GOOGLE_CLIENT_SECRET =  Google Project Client Secret

###AWS S3

In order to use S3 to store files for the application you need to follow those steps to gets the necessary keys:

1. Log in into [AWS Console](https://console.aws.amazon.com)
2. Click at you User Name and click on "Security Credentials"
3. Expand Access Keys
4. Click on "Create New Access Key"
5. At the pop up click on Show Access Key
6. You will find Access Key ID and Secret Access Key 

>AWS_ACCESS_KEY_ID = AWS Access Key ID

>AWS_SECRET_ACCESS_KEY =  AWS Secret Access Key

Now you need to create a S3 Bucket:

 1. Go to [AWS Console](https://console.aws.amazon.com)
 2. Select "S3"
 3. Click on "Create a Bucket"
 4. Enter a Bucket Name and click Create

>S3_BUCKET = AWS S3 Bucket Name

