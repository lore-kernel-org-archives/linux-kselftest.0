From: shuah@kernel.org (Shuah Khan)
Date: Wed, 26 Sep 2018 15:37:34 -0600
Subject: [V3 PATCH 0/2] selftests: watchdog: Add get/set/pre timeout
In-Reply-To: <1537996989-13092-1-git-send-email-jerry.hoemann@hpe.com>
References: <1537996989-13092-1-git-send-email-jerry.hoemann@hpe.com>
Message-ID: <6f3a8fe3-1ec4-ed8b-99a2-1dba7553c1fc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180926213734._d3gwL6up3UX87kiaW_RbcufCgzjUMzLN6ndn4a5n04@z>

On 09/26/2018 03:23 PM, Jerry Hoemann wrote:
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
> Change v3
> 1) Printf says errno, but prints the string version of the error.
>    Make the printf consistent.
> 2) As above error was cut/paste from prior printf in application
>    add new patch 1 to fix the existing printf first.
> 
> Jerry Hoemann (2):
>   selftests: watchdog: Fix error message.
>   selftests: watchdog: Add gettimeout and get|set pretimeout
> 
>  tools/testing/selftests/watchdog/watchdog-test.c | 41 +++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 

Thanks for the patches. Applied to linux-kselftest next for 4.20-rc1

btw -for future reference, the convention is [PATCH v3] not [V3 PATCH]

thanks,
-- Shuah
