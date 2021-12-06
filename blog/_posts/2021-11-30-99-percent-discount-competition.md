---
title: "99 percent discount Treasure Hunt"
published: true
date: 2021-11-30 00:00:06
tags: [Competition, Bounty, Python, Fun ]
---

![](/blog/assets/bounty1.png)

Recently, There was a treasure hunt competition in an online store. It included 99% discount on a bunch of over 1000$ products and you could also buy any other product you wanted with this amount instead. There were about 1700 items in many pages with the total of around 12000 images and all you had to do was to be the first one to find the discount code that was hidden between these images within the announced timeframe. So the concept was very attractive and looked like easy money! How you might ask? I thought you already know the answer! :)
Well, I don't take the kind of competitions that are based on chance alone seriously because the chance of you winning is very low even if the competition is not rigged! But this one was different and looked fun to me, why? Because I instantly realized I could write a simple robot to automate the process of clicking product URLs, download every image from the opened product pages and move on to the next page of products and repeat the whole process till the last page. So the whole script looks easy, I used Python, so the following code was written within a few hours (I edited some parts about target URL and services to maintain confidentiality but you can still get the idea):

```python
from urllib.request import Request, urlopen, urlretrieve
from urllib.parse import quote
from bs4 import BeautifulSoup as soup
from time import sleep
from random import randint

maxpages = 100
pageno = 1

while pageno < maxpages:
    print("Scraping page "+str(pageno)+"...")

    # Edited for confidentiality:
    request = Request("[TARGET URL OF LIST OF PRODUCTS PAGE]"+str(pageno))
    #

    # Get the latest User-Agent Header from: https://httpbin.org/anything
    request.add_header('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36')
    request.add_header('Referer', 'https://www.google.com/')
    #

    content = urlopen(request).read()
    urlopen(request).close()

    page_soup = soup(content, "html.parser")

    # Edited for Confidentiality:
    products = page_soup.findAll("[TRGET PAGE ITEM ELEMENT]",{"TARGET PAGE CLASS"})  
    #

    if len(products)>0:
        itemno=1
        for product in products:

            # Edited for Confidentiality:
            item = quote(product["[TARGET PAGE ELEMENT]"])
            #

            print("Scraping item " + str(itemno) + ": " + item + " ...")

            # Edited for Confidentiality:
            item_request = Request("[TARGET SERVICE URL]" + item)
            #

            item_request.add_header('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36')
            item_request.add_header('Referer', 'https://www.google.com/')

            item_content = urlopen(item_request).read()
            urlopen(item_request).close()

            item_soup = soup(item_content, "html.parser")

            # Edited for Confidentiality:
            images = item_soup.findAll("[TARGET PAGE ELEMENT]",{"[TARGET PAGE CLASS]"})
            #

            imageno = 1
            for image in images:

                # Edited for Confidentiality:
                if hasattr(image.img, "[TARGET PAGE ELEMENT ATTRIBUTE]"):
                    image_url = image.img["[TARGET PAGE ELEMENT ATTRIBUTE]"]

                    print("Saving image " + str(imageno) + "...")
                    urlretrieve(image_url, "C:/downloaded/page" + str(pageno) + "_item" + str(itemno) + "_" + str(imageno) + ".jpg")

                    # if imageno == 10:
                    #     print("Sleeping 1~2 seconds, image 10...")
                    #     sleep(randint(1,2))
                    # elif imageno == 20:
                    #     print("Sleeping 1~2 seconds, image 20...")
                    #     sleep(randint(1,2))
                    # elif imageno == 30:
                    #     print("Sleeping 1~2 seconds, image 30...")
                    #     sleep(randint(1,2))

                    imageno += 1
                #

            # if itemno == 15:
            #     print("Sleeping 1~2 seconds, item 15...")
            #     sleep(randint(1,2))
            # elif itemno == 30:
            #     print("Sleeping 1~2 seconds, item 30...")
            #     sleep(randint(1,2))

            itemno += 1
    else:
        break

    pageno += 1
    # print("Sleeping 1~3 seconds for the next page...")
    # sleep(randint(1,3))

print("Finished!")

# request.add_header('host', '[TARGET HOSTNAME]')
# request.add_header('Sec-Ch-Ua', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"96\", \"Google Chrome\";v=\"96\"')
# request.add_header('Sec-Ch-Ua-Mobile', '?0')
# request.add_header('Sec-Ch-Ua-Platform', "\"Windows\"")
# request.add_header('Upgrade-Insecure-Requests', '1')
# request.add_header('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36')
# request.add_header('Referer', 'https://www.google.com/')
# request.add_header('Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9')
# request.add_header('Sec-Fetch-Site', 'cross-site')
# request.add_header('Sec-Fetch-Mode', 'navigate')
# request.add_header('Sec-Fetch-User', '?1')
# request.add_header('Sec-Fetch-Dest', 'document')
# request.add_header('Accept-Language','en-US,en;q=0.9,fa;q=0.8')
# request.add_header('Dnt', '1')
# request.add_header('Sec-Gpc', '1')

# if imageno == 5:
#     print("Sleeping 1~2 seconds, image 5...")
#     sleep(randint(1,2))
# elif imageno == 10:
#     print("Sleeping 1~2 seconds, image 10...")
#     sleep(randint(1,2))
# elif imageno == 15:
#     print("Sleeping 1~2 seconds, image 15...")
#     sleep(randint(1,2))
# elif imageno == 20:
#     print("Sleeping 1~2 seconds, image 20...")
#     sleep(randint(1,2))

# if imageno == 7:
#     print("Sleeping 1~2 seconds, image 7...")
#     sleep(randint(1,2))
# elif imageno == 14:
#     print("Sleeping 1~2 seconds, image 14...")
#     sleep(randint(1,2))
# elif imageno == 21:
#     print("Sleeping 1~2 seconds, image 21...")
#     sleep(randint(1,2))

# if itemno == 7:
#     print("Sleeping 1~2 seconds, item 7...")
#     sleep(randint(1,2))
# elif itemno == 14:
#     print("Sleeping 1~2 seconds, item 14...")
#     sleep(randint(1,2))
# elif itemno == 21:
#     print("Sleeping 1~2 seconds, item 21...")
#     sleep(randint(1,2))
# elif itemno == 28:
#     print("Sleeping 1~2 seconds, item 28...")
#     sleep(randint(1,2))
# elif itemno == 35:
#     print("Sleeping 1~2 seconds, item 35...")
#     sleep(randint(1,2))

# if itemno == 10:
#     print("Sleeping 1~2 seconds, item 10...")
#     sleep(randint(1,2))
# elif itemno == 20:
#     print("Sleeping 1~2 seconds, item 20...")
#     sleep(randint(1,2))
# elif itemno == 30:
#     print("Sleeping 1~2 seconds, item 30...")
#     sleep(randint(1,2))


# if itemno == 15:
#     print("Sleeping 1~2 seconds, item 15...")
#     sleep(randint(1,2))
# elif itemno == 30:
#     print("Sleeping 1~2 seconds, item 30...")
#     sleep(randint(1,2))
```

You can see some commented codes, the reason is at first I wanted my robot behavior to simulate a real user so I added all the necessary HTTP headers that a browser uses for web requests, I also used a randomized timer between 1~2 and 1~3 to simulate randomness in my request times to avoid being blocked by the server but then I tested and watched that I need neither of these because the target server didn't really care or check if my HTTP requests were really weird! :)) But I still kept the "User-Agent" and "Referer" headers because they are important. So I ran this python code and it was very fast, I called one of my friends and we did it together and split the pages between ourselves and we were able to download all of 12000 images in around 40 minutes, and we did some improvements to our strategy and started from a specific range that was more likely to contain the codes so we were able to get 2 codes in two rounds of this competition, and each round was about 4 hours but we found each code within 18 minutes after the start time of each round!!! It was very fun to find sum total of around 1500$ in around 35 minutes! We were very happy but when we entered the codes, they didn't work! Then we realized it was a fake and rigged competition!!! :))) There were many other clues that showed they are not gonna pay anyone anything, so at the end we were very mad & won't participate in any competition from this specific service but really enjoyed the time pressure, the teamwork and also the python code that we developed. :)
Also notice that the code can be improved with concurrent requests to have less delays and... but It was still more that enough to get its job done.

### Update
As an exercise just for fun and to see how much I can improve the speed of this process, I'll write a new robot with the following improvements:
1. Faster Downloading and Crawling libraries.
2. Using Concurrency as much as I can below rate-limiting threshold if there is any.
3. Using Computer Vision and Template Matching to detect the discount code images automatically and super fast and to automate to whole process.

#### Resources
Beautiful Treasure Picture: [https://antialiasfactory.deviantart.com](https://antialiasfactory.deviantart.com)
