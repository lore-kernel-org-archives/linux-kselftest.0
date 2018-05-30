From: bhole_prashant_q7@lab.ntt.co.jp (Prashant Bhole)
Date: Wed, 30 May 2018 14:31:25 +0900
Subject: [PATCH bpf v2 0/5] fix test_sockmap
In-Reply-To: <f477f42d-f3fb-6138-b0af-589d049790a0@gmail.com>
References: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
 <dd755be4-a298-a037-b32a-b506f45f4d8f@gmail.com>
 <95bb9c9a-25ed-4b10-a181-987a61e0a24c@lab.ntt.co.jp>
 <f477f42d-f3fb-6138-b0af-589d049790a0@gmail.com>
Message-ID: <63246322-3040-ab66-1075-f94ae607ee92@lab.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180530053125.yYx10CrV_T7Ytzf4hHS89EihuYJ_WqeYt76SAJ_5-Io@z>



On 5/30/2018 2:12 PM, John Fastabend wrote:
> On 05/29/2018 05:44 PM, Prashant Bhole wrote:
>>
>>
>> On 5/30/2018 12:48 AM, John Fastabend wrote:
>>> On 05/27/2018 09:37 PM, Prashant Bhole wrote:
>>>> This series fixes error handling, timeout and data verification in
>>>> test_sockmap. Previously it was not able to detect failure/timeout in
>>>> RX/TX thread because error was not notified to the main thread.
>>>>
>>>> Also slightly improved test output by printing parameter values (cork,
>>>> apply, start, end) so that parameters for all tests are displayed.
>>>>
>>>> Prashant Bhole (5):
>>>>     selftests/bpf: test_sockmap, check test failure
>>>>     selftests/bpf: test_sockmap, join cgroup in selftest mode
>>>>     selftests/bpf: test_sockmap, fix test timeout
>>>>     selftests/bpf: test_sockmap, fix data verification
>>>>     selftests/bpf: test_sockmap, print additional test options
>>>>
>>>>    tools/testing/selftests/bpf/test_sockmap.c | 76 +++++++++++++++++-----
>>>>    1 file changed, 58 insertions(+), 18 deletions(-)
>>>>
>>>
>>> After first patch "check test failure" how do we handle the case
>>> where test is known to cause timeouts because we are specifically testing
>>> these cases. This is the 'cork' parameter we discussed in the last
>>> series. It looks like with this series the test may still throw an
>>> error?
>>
>> Sorry. In your comment in last series, did you mean to skip error
>> checking only for all cork tests (for now)?
>>
>> -Prashant
>>
> 
> Hi, After this is applied are any errors returned from test_sockmap?
> When I read the first patch it looked like timeouts from the cork
> tests may result in errors "FAILED" tests. If this is the case then
> yes we need skip error checking on all tests or just the corked
> tests.

Yes errors returned after applying this series. I will skip error 
checking on just corked tests.

-Prashant

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
