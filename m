From: john.fastabend@gmail.com (John Fastabend)
Date: Fri, 1 Jun 2018 07:03:07 -0700
Subject: [PATCH bpf v3 3/5] selftests/bpf: test_sockmap, fix test timeout
In-Reply-To: <634dc36e-f299-631d-f501-d12453fa0b98@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>
 <20180530192942.4ahcaxupbhfkopl4@ast-mbp.dhcp.thefacebook.com>
 <df1d9ec2-783a-09f4-29d7-544d20d74465@gmail.com>
 <634dc36e-f299-631d-f501-d12453fa0b98@lab.ntt.co.jp>
Message-ID: <f69d6775-b56f-2b47-21ce-51f9ef30d797@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180601140307.rUqVtOtMmruS0jnT3Qhb70gNMRNP5seSENusyLfBmjk@z>

On 05/30/2018 09:13 PM, Prashant Bhole wrote:
> 
> 
> On 5/31/2018 4:59 AM, John Fastabend wrote:
>> On 05/30/2018 12:29 PM, Alexei Starovoitov wrote:
>>> On Wed, May 30, 2018@02:56:09PM +0900, Prashant Bhole wrote:
>>>> In order to reduce runtime of tests, recently timout for select() call
>>>> was reduced from 1sec to 10usec. This was causing many tests failures.
>>>> It was caught with failure handling commits in this series.
>>>>
>>>> Restoring the timeout from 10usec to 1sec
>>>>
>>>> Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
>>>> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
>>>> ---
>>>>   tools/testing/selftests/bpf/test_sockmap.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/bpf/test_sockmap.c
>>>> b/tools/testing/selftests/bpf/test_sockmap.c
>>>> index 64f9e25c451f..9d01f5c2abe2 100644
>>>> --- a/tools/testing/selftests/bpf/test_sockmap.c
>>>> +++ b/tools/testing/selftests/bpf/test_sockmap.c
>>>> @@ -345,8 +345,8 @@ static int msg_loop(int fd, int iov_count, int
>>>> iov_length, int cnt,
>>>>           if (err < 0)
>>>>               perror("recv start time: ");
>>>>           while (s->bytes_recvd < total_bytes) {
>>>> -            timeout.tv_sec = 0;
>>>> -            timeout.tv_usec = 10;
>>>> +            timeout.tv_sec = 1;
>>>> +            timeout.tv_usec = 0;
>>>
>>> I've applied the set, but had to revert it, since it takes too long.
>>>
>>> real    1m40.124s
>>> user    0m0.375s
>>> sys    0m14.521s
>>>
>>
>> Dang, I thought it would be a bit longer but not minutes.
>>
>>> Myself and Daniel run the test semi-manually when we apply patches.>
>>> Adding 2 extra minutes of wait time is unnecessary.
>>
>> Yep.
>>
>>> Especially since most of it is idle time.
>>> Please find a way to fix tests differently.
>>> btw I don't see any failures today. Not sure what is being fixed
>>> by incresing a timeout.
>>>
>>
>> Calling these fixes is a bit much, they are primarily improvements.
>>
>> The background is, when I originally wrote the tests my goal was to
>> exercise the kernel code paths. Because of this I didn't really care if
>> the tests actually sent/recv all bytes in the test. (I have long
>> running tests using netperf/wrk/apached/etc. for that) But, the manual
>> tests do have an option to verify the data if specified. The 'verify'
>> option is a bit fragile in that with the right tests (e.g. drop)
>> or the certain options (e.g. cork) it can fail which is expected.
>>
>> What Prashant added was support to actually verify the data correctly.
>> And also fix a few cgroup handling and some pretty printing as well.
>> He noticed the low timeout causing issue in these cases though so
>> increased it.
>>
>> @Prashant, how about increasing this less dramatically because now
>> all cork tests are going to stall for 1s unless perfectly aligned.
>> How about 100us? Or even better we can conditionally set it based
>> on if tx_cork is set. If tx_cork is set use 1us otherwise use 200us
>> or something. (1s is really to high in any cases for lo)
>>
>> Also capturing some of the above in the cover letter would help
>> folks understand the context a bit better.
>>
> 
> I did trial and error for timeout values. Currently 1000us for corked
> tests and 1 sec for other tests works fine. I observed broken-pipe error
> at tx side when timeout was < 1000us.
> 
> Also tests with apply=1 and higher number of iterations were taking
> time, so reducing iterations reduces the test run time drastically.
> 

Yep, sending 1B at a time is slow.

> real    0m12.968s
> user    0m0.219s
> sys     0m14.337s
> 
> Also I will try to explain background in the cover letter of next series.
> 
Seems more reasonable to me now. Thanks.

> -Prashant
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
