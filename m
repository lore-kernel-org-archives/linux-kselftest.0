From: shuah at kernel.org (Shuah Khan)
Date: Wed, 25 Apr 2018 09:30:51 -0600
Subject: [PATCH] selftests:firmware: fixes a call to a wrong function name
In-Reply-To: <20180425152657.GA5139@kroah.com>
References: <20180423141022.5019-1-ahiliation@yahoo.co.in>
 <CAGXu5jL0FKq=_fESYT78_LPOVYQ4MsPHQ6u_RgFBJa4fzNN3rQ@mail.gmail.com>
 <20180425152657.GA5139@kroah.com>
Message-ID: <ad2a60e7-d8a1-fe6b-e3c4-bdb71060245e@kernel.org>

On 04/25/2018 09:26 AM, Greg KH wrote:
> On Mon, Apr 23, 2018 at 09:39:02AM -0700, Kees Cook wrote:
>> On Mon, Apr 23, 2018 at 7:10 AM, Jeffrin Jose T <ahiliation at yahoo.co.in> wrote:
>>>  This is a patch to the tools/testing/selftests/firmware/fw_run_tests.sh
>>>  file which fixes a bug which calls to a wrong function name,which in turn
>>>  blocks the execution of certain tests.
>>>
>>> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
>>>
>>> ---
>>>  tools/testing/selftests/firmware/fw_run_tests.sh | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/firmware/fw_run_tests.sh b/tools/testing/selftests/firmware/fw_run_tests.sh
>>> index 06d638e9dc62..cffdd4eb0a57 100755
>>> --- a/tools/testing/selftests/firmware/fw_run_tests.sh
>>> +++ b/tools/testing/selftests/firmware/fw_run_tests.sh
>>> @@ -66,5 +66,5 @@ if [ -f $FW_FORCE_SYSFS_FALLBACK ]; then
>>>         run_test_config_0003
>>>  else
>>>         echo "Running basic kernel configuration, working with your config"
>>> -       run_test
>>> +       run_tests
>>>  fi
>>
>> I find it confusing that run_tests() uses $1 and $2 but later ignores
>> them unless -f $FW_FORCE_SYSFS_FALLBACK, which is checked at both the
>> top level and in proc_set_*_fallback()... I'd expected the test to
>> happen only in run_tests() and have it removed from from
>> proc_set_*_fallback().
>>
>> Regardless, the above patch is correct to run the tests. :)
> 
> Thanks, I'll go queue this up.
> 
> greg k-h
> 

Thanks. This probably has dependency on firmware tree.

Acked-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
