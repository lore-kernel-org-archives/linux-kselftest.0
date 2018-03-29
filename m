From: shuah@kernel.org (Shuah Khan)
Date: Thu, 29 Mar 2018 11:54:28 -0600
Subject: [PATCH] selftests/ftrace: fix spelling mistake: "tiggers" ->
 "triggers"
In-Reply-To: <48be730c-2a15-d3ad-d1aa-7d57fe7db6ca@canonical.com>
References: <20180329172431.8171-1-colin.king@canonical.com>
 <20180329133102.6061ba66@gandalf.local.home>
 <48be730c-2a15-d3ad-d1aa-7d57fe7db6ca@canonical.com>
Message-ID: <56713d51-0954-e7a8-cf7a-7a6bfedf58f3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180329175428.J7xOhQLnC9QaFghDSK-7fjHvqPF4jTNpjOA2PM6Dm2o@z>

On 03/29/2018 11:47 AM, Colin Ian King wrote:
> On 29/03/18 18:31, Steven Rostedt wrote:
>> On Thu, 29 Mar 2018 18:24:31 +0100
>> Colin King <colin.king@canonical.com> wrote:
>>
>>> From: Colin Ian King <colin.king at canonical.com>
>>>
>>> Trivial fix to spelling mistake in message text
>>>
>>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>>> ---
>>>  tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>>> index c5ef8b9d02b3..1b8faf4c318c 100644
>>> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>>> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-multihist.tc
>>> @@ -35,7 +35,7 @@ do_reset
>>>  
>>>  reset_trigger
>>>  
>>> -echo "Test histogram multiple tiggers"
>>
>> Oh Pooh! (/me wonders who gets that)
> 
> Just a smackerel of folk.
> 
>

 
t-i-double-guh-er! that spells tigger!

I will pick this up with your Ack Steve, unless you want include
it in your pull request.

Acked-by: Shuah Khan <shuahkh at osg.samsung.com>

thanks,
-- Shuah

thanks,
-- Shuah


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
