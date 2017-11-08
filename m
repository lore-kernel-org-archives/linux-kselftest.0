From: shuah@kernel.org (Shuah Khan)
Date: Wed, 8 Nov 2017 09:28:56 -0700
Subject: [Linux-kselftest-mirror] [PATCH 0/2] selftests: firmware: skip
 testing unsupported features
In-Reply-To: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
References: <1510141660-31612-1-git-send-email-amit.pundir@linaro.org>
Message-ID: <8efc1470-f525-4c29-6b02-4049121339ad@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171108162856.c-bIjSradwwMQZA-YK93uN37r_y9JVcscz8BAXzXNaQ@z>

On 11/08/2017 04:47 AM, Amit Pundir wrote:
> Hi,
> 
> At Linaro we run mainline/linux-next selftests on LTS releases and
> run into few test failures due to kernel mismatch or missing upstream
> functionality in older kernels. Discussed at length here:
> https://lkml.org/lkml/2017/6/15/652
> 
> This patch series is an attempt to modify selftest firmware test scripts.
> The proposed changes skip/ignore testing the upstream functionality
> missing in the older kernel releases.
> 
> Regards,
> Amit Pundir
> 
> 
> Amit Pundir (2):
>   selftests: firmware: skip unsupported async loading tests
>   selftests: firmware: skip unsupported custom firmware fallback tests
> 
>  tools/testing/selftests/firmware/fw_fallback.sh   | 38 ++++++++++++++++-------
>  tools/testing/selftests/firmware/fw_filesystem.sh | 34 ++++++++++++--------
>  2 files changed, 47 insertions(+), 25 deletions(-)
> 

Thanks for the patches. I have couple of minor comments on the patches.
Please see the individual responses to the patches.

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
