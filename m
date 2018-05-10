From: shuah at kernel.org (Shuah Khan)
Date: Thu, 10 May 2018 11:27:31 -0600
Subject: [PATCH] selftests: kvm: update .gitignore with missing file
In-Reply-To: <62bdea19-17e2-82e9-c2bf-214f8219f7c6@kernel.org>
References: <20180423135725.3753-1-anders.roxell@linaro.org>
 <CADYN=9KPSYmrAA_N-J-OLvn2+B1_hU5KK24-Q1V66j3cCmkNTw@mail.gmail.com>
 <62bdea19-17e2-82e9-c2bf-214f8219f7c6@kernel.org>
Message-ID: <cb55d1fa-e5b2-5e3c-a74e-d60b3f9a2088@kernel.org>

On 05/08/2018 09:34 AM, Shuah Khan wrote:
> On 05/08/2018 02:22 AM, Anders Roxell wrote:
>> On 23 April 2018 at 15:57, Anders Roxell <anders.roxell at linaro.org> wrote:
>>> Fixes: d5edb7f8e7ab ("kvm: selftests: add vmx_tsc_adjust_test")
>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>> ---
>>>  tools/testing/selftests/kvm/.gitignore | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
>>> index a546e052d19a..63fc1ab9248f 100644
>>> --- a/tools/testing/selftests/kvm/.gitignore
>>> +++ b/tools/testing/selftests/kvm/.gitignore
>>> @@ -1,2 +1,3 @@
>>>  set_sregs_test
>>>  sync_regs_test
>>> +vmx_tsc_adjust_test
>>> --
>>> 2.17.0
>>>
>>
>> ping.
>>
> 
> I plan to get this into 4.18-rc1
> 
> thanks,
> -- Shuah
> 

Applied to linux-kselftest next for 4.18-rc1

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
