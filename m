From: colin.king at canonical.com (Colin Ian King)
Date: Thu, 29 Mar 2018 18:47:15 +0100
Subject: [PATCH] selftests/ftrace: fix spelling mistake: "tiggers" ->
 "triggers"
In-Reply-To: <20180329133102.6061ba66@gandalf.local.home>
References: <20180329172431.8171-1-colin.king@canonical.com>
 <20180329133102.6061ba66@gandalf.local.home>
Message-ID: <48be730c-2a15-d3ad-d1aa-7d57fe7db6ca@canonical.com>

On 29/03/18 18:31, Steven Rostedt wrote:
> On Thu, 29 Mar 2018 18:24:31 +0100
> Colin King <colin.king at canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king at canonical.com>
>>
>> Trivial fix to spelling mistake in message text
>>
>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>> ---
>>  tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>> index c5ef8b9d02b3..1b8faf4c318c 100644
>> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>> @@ -35,7 +35,7 @@ do_reset
>>  
>>  reset_trigger
>>  
>> -echo "Test histogram multiple tiggers"
> 
> Oh Pooh! (/me wonders who gets that)

Just a smackerel of folk.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
