From: davem@davemloft.net (David Miller)
Date: Tue, 22 May 2018 11:49:30 -0400 (EDT)
Subject: [PATCH] tc-testing: flush gact actions on test teardown
In-Reply-To: <11f03b6a-a8c4-e64c-7e2d-fb8218bc6320@kernel.org>
References: <1526660482-10424-1-git-send-email-vladbu@mellanox.com>
 <11f03b6a-a8c4-e64c-7e2d-fb8218bc6320@kernel.org>
Message-ID: <20180522.114930.689064251143958449.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180522154930.gptBosWsIIUADWP0e0vvbDBAKEOxFVOefFfGomcF_aU@z>

From: Shuah Khan <shuah@kernel.org>
Date: Tue, 22 May 2018 09:43:28 -0600

> On 05/18/2018 10:21 AM, Vlad Buslov wrote:
>> Test 6fb4 creates one mirred and one pipe action, but only flushes mirred
>> on teardown. Leaking pipe action causes failures in other tests.
>> 
>> Add additional teardown command to also flush gact actions.
>> 
>> Signed-off-by: Vlad Buslov <vladbu at mellanox.com>
>> ---
>>  tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json b/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
>> index 443c9b3..acb24f7 100644
>> --- a/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
>> +++ b/tools/testing/selftests/tc-testing/tc-tests/actions/mirred.json
>> @@ -44,7 +44,8 @@
>>          "matchPattern": "action order [0-9]*: mirred \\(Egress Redirect to device lo\\).*index 2 ref",
>>          "matchCount": "1",
>>          "teardown": [
>> -            "$TC actions flush action mirred"
>> +            "$TC actions flush action mirred",
>> +            "$TC actions flush action gact"
>>          ]
>>      },
>>      {
>> 
> 
> I can get this into 4.18-rc1 unless there is a reason for this to go
> through net tree.

Why wouldn't a networking testing bug fix go through my tree?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
