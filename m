From: shuah@kernel.org (Shuah Khan)
Date: Wed, 5 Sep 2018 10:49:05 -0600
Subject: [PATCH] sysctl: kselftests: add test_core to .gitignore
In-Reply-To: <78c85cee-7af9-75fc-14c7-6565a7080008@windriver.com>
References: <1536115175-10864-1-git-send-email-Lei.Yang@windriver.com>
 <78c85cee-7af9-75fc-14c7-6565a7080008@windriver.com>
Message-ID: <2adb1f15-24dd-5744-a091-343d4617801e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180905164905.p-MTGXn-t84KUCBSvMTK9ljSoqvL1CXCJvgS4vgbiaU@z>

On 09/04/2018 09:08 PM, lei yang wrote:
> sorry, the title should be :"cgroup: kselftests: add test_core to .gitignore"
> 
> Lei
> 
> 
> 
> On 2018年09月05日 10:39, Lei Yang wrote:
>> Update .gitignore files.
>>
>> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
>> ---
>>   tools/testing/selftests/cgroup/.gitignore | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
>> index 95eb3a5..adacda5 100644
>> --- a/tools/testing/selftests/cgroup/.gitignore
>> +++ b/tools/testing/selftests/cgroup/.gitignore
>> @@ -1 +1,2 @@
>>   test_memcontrol
>> +test_core
> 
> 

Please resend with the correct summary.

thanks,
-- Shuah
