From: shuah@kernel.org (Shuah Khan)
Date: Fri, 15 Jun 2018 10:38:24 -0600
Subject: [PATCH] selftests: sparc64: delete RUN_TESTS and EMIT_TESTS
 overrides
In-Reply-To: <8eb11b0a-3284-c580-6ae5-f0204ce5c5bf@oracle.com>
References: <20180612232403.28031-1-shuah@kernel.org>
 <8eb11b0a-3284-c580-6ae5-f0204ce5c5bf@oracle.com>
Message-ID: <ec9901c2-504a-5505-b6c3-7e18ee30e26c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180615163824.adpD1p8iIouAbCVp0b0cOU8g82OQiWrcZSenK3BukB8@z>

On 06/13/2018 11:18 AM, Tom Hromatka wrote:
> Thanks for the clean up, Shuah.  Looks good to me.
> 
> Tom
> 
> 
> 
> On 06/12/2018 05:24 PM, Shuah Khan (Samsung OSG) wrote:
>> Delete RUN_TESTS and EMIT_TESTS overrides and use common defines in
>> lib.mk. Common defines work just fine and there is no need to define
>> custom overrides.
>>
>> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> 
> Reviewed-by: Tom Hromatka <tom.hromatka at oracle.com>
> 
> 

get_maintainers didn't include your name for this patch. Would you like to
take this fix through sparc tree? This is cleanup fix would be good candidate
for 4.18-rc2

If so, please let me know if you would like me to resend the patch
with Tom's Reviewed-by tag.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
