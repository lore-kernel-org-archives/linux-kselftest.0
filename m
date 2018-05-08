From: shuah@kernel.org (Shuah Khan)
Date: Tue, 8 May 2018 09:33:53 -0600
Subject: [PATCH] selftests: kvm: add .gitignore for generated files
In-Reply-To: <CADYN=9L-CBLjG=mtOOfzBC4EZt02idZKgnrj5bSvsfPVSFZpsg@mail.gmail.com>
References: <20180410134822.23990-1-anders.roxell@linaro.org>
 <CADYN=9L-CBLjG=mtOOfzBC4EZt02idZKgnrj5bSvsfPVSFZpsg@mail.gmail.com>
Message-ID: <4743ad90-6502-bf39-95bb-89759978784b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180508153353.MB_ObJUpf7pCZu48WUYrDyTIn2nM08UrkN1-orZDHgU@z>

On 05/08/2018 02:21 AM, Anders Roxell wrote:
> On 10 April 2018@15:48, Anders Roxell <anders.roxell@linaro.org> wrote:
>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>> ---
>>  tools/testing/selftests/kvm/.gitignore | 2 ++
>>  1 file changed, 2 insertions(+)
>>  create mode 100644 tools/testing/selftests/kvm/.gitignore
>>
>> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
>> new file mode 100644
>> index 000000000000..a546e052d19a
>> --- /dev/null
>> +++ b/tools/testing/selftests/kvm/.gitignore
>> @@ -0,0 +1,2 @@
>> +set_sregs_test
>> +sync_regs_test
>> --
>> 2.16.3
>>
> 
> ping.
> 

I plan to get this to inot 4.18-rc1.

thabks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
