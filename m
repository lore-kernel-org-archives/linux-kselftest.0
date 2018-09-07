From: jgkamat at fb.com (Jay Kamat)
Date: Fri, 7 Sep 2018 11:28:59 -0700
Subject: [PATCH 1/2] Fix cg_read_strcmp()
In-Reply-To: <bed84882-b194-7e45-0db6-08b02bc672d5@kernel.org>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180907164924.13789-1-jgkamat@fb.com>
 <20180907164924.13789-2-jgkamat@fb.com>
 <bed84882-b194-7e45-0db6-08b02bc672d5@kernel.org>
Message-ID: <86worxmabx.fsf@fb.com>


Shuah Khan writes:

> On 09/07/2018 10:49 AM, jgkamat at fb.com wrote:
>> From: Jay Kamat <jgkamat at fb.com>
>>
>> Fix a couple issues with cg_read_strcmp(), to improve correctness of
>> cgroup tests
>> - Fix cg_read_strcmp() always returning 0 for empty "needle" strings
>> - Fix a memory leak in cg_read_strcmp()
>>
>> Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")
>>
>> Signed-off-by: Jay Kamat <jgkamat at fb.com>
>> ---
>>  tools/testing/selftests/cgroup/cgroup_util.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
>> index 1e9e3c470561..8b644ea39725 100644
>> --- a/tools/testing/selftests/cgroup/cgroup_util.c
>> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
>> @@ -89,17 +89,28 @@ int cg_read(const char *cgroup, const char *control, char *buf, size_t len)
>>  int cg_read_strcmp(const char *cgroup, const char *control,
>>  		   const char *expected)
>>  {
>> -	size_t size = strlen(expected) + 1;
>> +	size_t size;
>>  	char *buf;
>> +	int ret;
>> +
>> +	/* Handle the case of comparing against empty string */
>> +	if (!expected)
>> +		size = 32;
>
> This doesn't look right. I would think expected shouldn't be null?
> It gets used below.
>
>> +	else
>> +		size = strlen(expected) + 1;
>>
>>  	buf = malloc(size);
>>  	if (!buf)
>>  		return -1;
>>
>> -	if (cg_read(cgroup, control, buf, size))
>> +	if (cg_read(cgroup, control, buf, size)) {
>> +		free(buf);
>>  		return -1;
>> +	}
>>
>> -	return strcmp(expected, buf);
>> +	ret = strcmp(expected, buf);
>
> If expected is null, what's the point in running the test?
> Is  empty "needle" string a valid test scenario?

There are a couple places where an empty "needle" string is used currently:

- cg_test_proc_killed (newly added in the next patch): Verify cgroup.procs is
  empty (there are no processes running)
- test_memcg_oom_events: Verify cgroup.procs is empty

Previously, when passing in an empty needle string, this function would always
return 0, as the size allocated (1) would not be enough to read any data in
'cg_read', and strcmp would compare two null strings.

>
>> +	free(buf);
>> +	return ret;
>>  }
>>
>>  int cg_read_strstr(const char *cgroup, const char *control, const char *needle)
>>
>
> thanks,
> -- Shuah

I could definitely remove the unneeded strcmp in the null 'expected' case, but
I am worried it would feel a bit too hacky or add too much duplication.

Would something like this be the best solution? If you had something else in
mind (or if I'm misunderstanding something), please let me know, and I'll
update the patchset!

	size_t size;
	char *buf;
	int ret;

	/* Handle the case of comparing against empty string */
	if (!expected)
		size = 32;
	else
		size = strlen(expected) + 1;

	buf = malloc(size);
	if (!buf)
		return -1;

	if (cg_read(cgroup, control, buf, size)) {
		free(buf);
		return -1;
	}

	if (!expected)
		ret = !buf;
	else
		ret = strcmp(expected, buf);
	free(buf);
	return ret;

Thanks,
-Jay
