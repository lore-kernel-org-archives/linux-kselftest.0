From: shuah@kernel.org (Shuah Khan)
Date: Fri, 7 Sep 2018 12:53:50 -0600
Subject: [PATCH 1/2] Fix cg_read_strcmp()
In-Reply-To: <86worxmabx.fsf@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180907164924.13789-1-jgkamat@fb.com>
 <20180907164924.13789-2-jgkamat@fb.com>
 <bed84882-b194-7e45-0db6-08b02bc672d5@kernel.org> <86worxmabx.fsf@fb.com>
Message-ID: <d7c24fda-484d-85ae-50db-3c3639366be2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180907185350.iM4tlSL0nRMC9rKTvJMbCvQN10tK1SBJQchlVzO9jhU@z>

On 09/07/2018 12:28 PM, Jay Kamat wrote:
> 
> Shuah Khan writes:
> 
>> On 09/07/2018 10:49 AM, jgkamat@fb.com wrote:
>>> From: Jay Kamat <jgkamat at fb.com>
>>>
>>> Fix a couple issues with cg_read_strcmp(), to improve correctness of
>>> cgroup tests
>>> - Fix cg_read_strcmp() always returning 0 for empty "needle" strings
>>> - Fix a memory leak in cg_read_strcmp()
>>>
>>> Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")
>>>
>>> Signed-off-by: Jay Kamat <jgkamat at fb.com>
>>> ---
>>>  tools/testing/selftests/cgroup/cgroup_util.c | 17 ++++++++++++++---
>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
>>> index 1e9e3c470561..8b644ea39725 100644
>>> --- a/tools/testing/selftests/cgroup/cgroup_util.c
>>> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
>>> @@ -89,17 +89,28 @@ int cg_read(const char *cgroup, const char *control, char *buf, size_t len)
>>>  int cg_read_strcmp(const char *cgroup, const char *control,
>>>  		   const char *expected)
>>>  {
>>> -	size_t size = strlen(expected) + 1;
>>> +	size_t size;
>>>  	char *buf;
>>> +	int ret;
>>> +
>>> +	/* Handle the case of comparing against empty string */
>>> +	if (!expected)
>>> +		size = 32;
>>
>> This doesn't look right. I would think expected shouldn't be null?
>> It gets used below.
>>
>>> +	else
>>> +		size = strlen(expected) + 1;
>>>
>>>  	buf = malloc(size);
>>>  	if (!buf)
>>>  		return -1;
>>>
>>> -	if (cg_read(cgroup, control, buf, size))
>>> +	if (cg_read(cgroup, control, buf, size)) {
>>> +		free(buf);
>>>  		return -1;
>>> +	}
>>>
>>> -	return strcmp(expected, buf);
>>> +	ret = strcmp(expected, buf);
>>
>> If expected is null, what's the point in running the test?
>> Is  empty "needle" string a valid test scenario?
> 
> There are a couple places where an empty "needle" string is used currently:
> 
> - cg_test_proc_killed (newly added in the next patch): Verify cgroup.procs is
>   empty (there are no processes running)
> - test_memcg_oom_events: Verify cgroup.procs is empty

Yes I see the empty neede string usage now.
> 
> Previously, when passing in an empty needle string, this function would always
> return 0, as the size allocated (1) would not be enough to read any data in
> 'cg_read', and strcmp would compare two null strings.

Thanks for explaining this. Yes this fix is good. This would be good information
to add to the change log.

Could you please add this to the change log and send v2. I will pull these in for
the next rc.

thanks,
-- Shuah
