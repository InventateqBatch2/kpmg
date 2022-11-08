#!/bin/bash
          
val='{                                                     
    "a": {                                                 
        "description": "Oauth 2.0 implicit authentication",
        "b": {                                                                  
            "c": {                                                              
                "authorizationUrl": "https://accounts.google.com/o/oauth2/auth",           
                "d": {                                                                                                       
                    "https://www.googleapis.com/auth/youtube": "Manage your YouTube account",                                 
                    "https://www.googleapis.com/auth/youtube.channel-memberships.creator": "See a list of your current active 
                    "https://www.googleapis.com/auth/youtube.force-ssl": "See, edit, and permanently delete your YouTube video
                    "https://www.googleapis.com/auth/youtube.readonly": "View your YouTube account",                          
                    "https://www.googleapis.com/auth/youtube.upload": "Manage your YouTube videos",                           
                    "https://www.googleapis.com/auth/youtubepartner": "View and manage your assets and associated content on Y
                    "https://www.googleapis.com/auth/youtubepartner-channel-audit": "View private information of your YouTube
                }
            }
        }
    }
}'

echo $val | jq '.[].b[].d'

#I get below calues

{                                                                                                       
"https://www.googleapis.com/auth/youtube": "Manage your YouTube account",                                 
"https://www.googleapis.com/auth/youtube.channel-memberships.creator": "See a list of your current active 
"https://www.googleapis.com/auth/youtube.force-ssl": "See, edit, and permanently delete your YouTube video
"https://www.googleapis.com/auth/youtube.readonly": "View your YouTube account",                          
"https://www.googleapis.com/auth/youtube.upload": "Manage your YouTube videos",                           
"https://www.googleapis.com/auth/youtubepartner": "View and manage your assets and associated content on Y
"https://www.googleapis.com/auth/youtubepartner-channel-audit": "View private information of your YouTube
}