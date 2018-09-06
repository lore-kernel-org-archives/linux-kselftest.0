From: lei.yang at windriver.com (lei yang)
Date: Thu, 6 Sep 2018 13:48:02 +0800
Subject: [PATCH] sysctl: kselftests: use kernel module instead of built-in
In-Reply-To: <8aeffc5f-ed8c-b418-5db3-ef0299456002@kernel.org>
References: <1536114044-31236-1-git-send-email-Lei.Yang@windriver.com>
 <8aeffc5f-ed8c-b418-5db3-ef0299456002@kernel.org>
Message-ID: <9bbc49fe-5043-d03e-a359-215e71ed3a42@windriver.com>



On 2018年09月06日 00:47, Shuah Khan wrote:
> On 09/04/2018 08:20 PM, Lei Yang wrote:
>> It uses modprobe $TEST_DRIVER in sysctl.sh, so update
>> config to use "m" instead
>>
>> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
>> ---
>>   tools/testing/selftests/sysctl/config | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/sysctl/config b/tools/testing/selftests/sysctl/config
>> index 6ca1480..fc263ef 100644
>> --- a/tools/testing/selftests/sysctl/config
>> +++ b/tools/testing/selftests/sysctl/config
>> @@ -1 +1 @@
>> -CONFIG_TEST_SYSCTL=y
>> +CONFIG_TEST_SYSCTL=m
>>
> What happens if it is a built-in? Can you elaborate in the changelog
>
> On that note we might have other cases that do modprobe in scripts and
> run into the same issue you are trying to solve. :)

I double-checked again, found that it doesn't work on either with 
built-in or kernel module
if it's built-in, modprobe test_sysctl still return 0, so it doesn't 
matter it's a built-in or module.

but the problem is that test_modprobe check module load before modprobe 
execute , I'll sent a V2 patch to fix this and keep its build-in config 
untouched


if changes nothing

1) when  CONFIG_TEST_SYSCTL=y
root at intel-x86-64:/tmp/sysctl# ./sysctl.sh
Checking production write strict setting ... ok
./sysctl.sh: /sys/module/test_sysctl/ not present
You must have the following enabled in your kernel:
CONFIG_TEST_SYSCTL=y
root at intel-x86-64:/tmp/sysctl# zcat /proc/config.gz |grep TEST_SYS
CONFIG_TEST_SYSCTL=y



2) when CONFIG_TEST_SYSCTL=m
root at intel-x86-64:/tmp/sysctl# ./sysctl.sh
Checking production write strict setting ... ok
./sysctl.sh: /sys/module/test_sysctl/ not present
You must have the following enabled in your kernel:
CONFIG_TEST_SYSCTL=y
root at intel-x86-64:/tmp/sysctl# zcat /proc/config.gz |grep TEST_SYS
CONFIG_TEST_SYSCTL=m


Lei

> thanks,

> -- Shuah
