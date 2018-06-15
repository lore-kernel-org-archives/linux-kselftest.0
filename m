From: shuah at kernel.org (Shuah Khan)
Date: Fri, 15 Jun 2018 10:24:25 -0600
Subject: [PATCH v2] selftests: sync: add config fragment for testing sync
 framework
In-Reply-To: <20180614095708.27645-1-anders.roxell@linaro.org>
References: <20180614095708.27645-1-anders.roxell@linaro.org>
Message-ID: <296328b2-73c7-c7c2-8416-7983438e8e62@kernel.org>

On 06/14/2018 03:57 AM, Anders Roxell wrote:
> From: Fathi Boudra <fathi.boudra at linaro.org>
> 
> Unless the software synchronization objects (CONFIG_SW_SYNC) is enabled,
> the sync test will be skipped:
> 
> TAP version 13
> 1..0 # Skipped: Sync framework not supported by kernel
> 
> Add a config fragment file to be able to run "make kselftest-merge" to
> enable relevant configuration required in order to run the sync test.
> 
> Signed-off-by: Fathi Boudra <fathi.boudra at linaro.org>
> Link: https://lkml.org/lkml/2017/5/5/14
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---

Thanks. Applied to linux-kselftest next for 4.18-rc2 fixes update

thanks,
-- Shuah
 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
