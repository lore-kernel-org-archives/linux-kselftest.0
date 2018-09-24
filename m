From: shuah at kernel.org (Shuah Khan)
Date: Mon, 24 Sep 2018 13:57:23 -0600
Subject: [V2 PATCH] selftests: watchdog: Add gettimeout and get|set
 pretimeout
In-Reply-To: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
References: <1537817767-78918-1-git-send-email-jerry.hoemann@hpe.com>
Message-ID: <0a77c148-bb45-74c6-438e-2eef7a9b917b@kernel.org>

On 09/24/2018 01:36 PM, Jerry Hoemann wrote:
> Add command line arguments to call ioctl WDIOC_GETTIMEOUT,
> WDIOC_GETPRETIMEOUT and WDIOC_SETPRETIMEOUT.
> 
> Changes  v2
> 1) Update usage to include argument
> 2) Update usage to give example.
> 3) Made printf of WDIOC_GETTIMEOUT distinct from WDIOC_SETTIMEOUT
> 4) Made WDIOC_GETTIMEOUT a "one shot"
> 5) Made printf of WDIOC_GETPRETIMEOUT disnct from WDIOC_SETPRETIMEOUT
> 6) Made WDIOC_GETPRETIMEOUT a "one shot"
> 
> 
> Jerry Hoemann (1):
>   selftests: watchdog: Add gettimeout and get|set pretimeout
> 
>  tools/testing/selftests/watchdog/watchdog-test.c | 33 +++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 


You are a bit too quick with your v2 :) I am just about to respond to the v1. Please
look at my comments on v1. You will have to do another revision anyway to address
my comments.

thanks,
-- Shuah
