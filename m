From: shuah at kernel.org (Shuah Khan)
Date: Wed, 21 Mar 2018 10:48:07 -0600
Subject: [PATCH] selftests/seccomp: Allow get_metadata to XFAIL
In-Reply-To: <20180315171445.fv53cmgboucbf6m3@smitten>
References: <20180315165916.GA31072@beast>
 <20180315171445.fv53cmgboucbf6m3@smitten>
Message-ID: <f3877cd3-454c-46cb-60ad-5cb1251c9def@kernel.org>

On 03/15/2018 11:14 AM, Tycho Andersen wrote:
> On Thu, Mar 15, 2018 at 09:59:16AM -0700, Kees Cook wrote:
>> Since seccomp_get_metadata() depends on CHECKPOINT_RESTORE, XFAIL the
>> test if the ptrace reports it as missing.
>>
>> Signed-off-by: Kees Cook <keescook at chromium.org>
> 
> Acked-by: Tycho Andersen <tycho at tycho.ws>
> 
> Thanks, Kees.
> 

Thanks. Applied to linux-kselftest next for 4.17-rc1

thanks,
-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
