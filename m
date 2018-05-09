From: jeffrin@rajagiritech.edu.in (Jeffrin Thalakkottoor)
Date: Thu, 10 May 2018 00:14:40 +0530
Subject: [PATCH] selftests: intel_pstate: Fix a condition which does not
 notify user that root permission is useful
In-Reply-To: <a16db020-045d-a5ba-9106-5f4b4e4920a4@linaro.org>
References: <20180509173819.8017-1-ahiliation@yahoo.co.in>
 <a16db020-045d-a5ba-9106-5f4b4e4920a4@linaro.org>
Message-ID:
 <CAG=yYwnZdkJWeA=XhH4q-kfq3+QXrV+BNqgHtS0b9Td=W8fpiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180509184440.Z8W0MidEU18ALwpByKrBtlApnrtVfpvuEn1J0mgoXXs@z>

thanks. i will work on...

On Wed, May 9, 2018@11:54 PM, Daniel Díaz <daniel.diaz@linaro.org> wrote:
> Hello!
>
>
> On 05/09/2018 12:38 PM, Jeffrin Jose T wrote:
>> aperf program uses /dev/cpu which is normally a root only
>> access area. so in that case to successfully run thet test,
>> root permissions are required.This patch is in the file run.sh.
>>
>> Signed-off-by: Jeffrin Jose T <jeffrin at rajagiritech.edu.in>
>> ---
>>  tools/testing/selftests/intel_pstate/run.sh | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/tools/testing/selftests/intel_pstate/run.sh b/tools/testing/selftests/intel_pstate/run.sh
>> index 23a2e4e9880e..05d35392dcfd 100755
>> --- a/tools/testing/selftests/intel_pstate/run.sh
>> +++ b/tools/testing/selftests/intel_pstate/run.sh
>> @@ -31,6 +31,14 @@
>>
>>  EVALUATE_ONLY=0
>>
>> +uid=$(id -u)
>> +if [ $uid -ne 0 ]; then
>> +    echo     "-----------------------"
>> +    echo $msg please run this as root >&2
>> +    echo     "-----------------------"
>> +    exit 0
>> +fi
>> +
>
> Other tests simply use $UID. See:
>   cpufreq/main.sh
>   cpu-hotplug/cpu-on-off-test.sh
>   efivarfs/efivarfs.sh
>   gpio/gpio-mockup.sh
>   memory-hotplug/mem-on-off-test.sh
>
> This doesn't take into account the conditions for EVALUATE_ONLY: When
> it's set non-zero, neither aperf nor cpupower run at all.
>
> While this is under review, you might want to base your change on
> Shuah's patch for skipping:
>
> https://lists.linaro.org/pipermail/linux-kselftest-mirror/2018-May/001074.html
>
>
>>  if ! uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ | grep -q x86; then
>>       echo "$0 # Skipped: Test can only run on x86 architectures."
>>       exit 0
>
> I'd leave this check at the forefront, as this "hurdle" is
> insurmountable in other architectures, whereas becoming root is attainable.
>
> Thanks and greetings!
>
> Daniel Díaz
> daniel.diaz at linaro.org



-- 
software engineer
rajagiri school of engineering and technology
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
