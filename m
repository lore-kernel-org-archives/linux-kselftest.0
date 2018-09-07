From: shuah@kernel.org (Shuah Khan)
Date: Fri, 7 Sep 2018 11:06:36 -0600
Subject: [PATCH 1/2] Fix cg_read_strcmp()
In-Reply-To: <20180907164924.13789-2-jgkamat@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180907164924.13789-1-jgkamat@fb.com>
 <20180907164924.13789-2-jgkamat@fb.com>
Message-ID: <bed84882-b194-7e45-0db6-08b02bc672d5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180907170636.mpxZNzE2X_nzx5-lpAyjg5w7L9kJHeGfQWQ488udP_w@z>

On 09/07/2018 10:49 AM, jgkamat@fb.com wrote:
> From: Jay Kamat <jgkamat at fb.com>
> 
> Fix a couple issues with cg_read_strcmp(), to improve correctness of
> cgroup tests
> - Fix cg_read_strcmp() always returning 0 for empty "needle" strings
> - Fix a memory leak in cg_read_strcmp()
> 
> Fixes: 84092dbcf901 ("selftests: cgroup: add memory controller self-tests")
> 
> Signed-off-by: Jay Kamat <jgkamat at fb.com>
> ---
>  tools/testing/selftests/cgroup/cgroup_util.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
> index 1e9e3c470561..8b644ea39725 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
> @@ -89,17 +89,28 @@ int cg_read(const char *cgroup, const char *control, char *buf, size_t len)
>  int cg_read_strcmp(const char *cgroup, const char *control,
>  		   const char *expected)
>  {
> -	size_t size = strlen(expected) + 1;
> +	size_t size;
>  	char *buf;
> +	int ret;
> +
> +	/* Handle the case of comparing against empty string */
> +	if (!expected)
> +		size = 32;

This doesn't look right. I would think expected shouldn't be null?
It gets used below.

> +	else
> +		size = strlen(expected) + 1;
>  
>  	buf = malloc(size);
>  	if (!buf)
>  		return -1;
>  
> -	if (cg_read(cgroup, control, buf, size))
> +	if (cg_read(cgroup, control, buf, size)) {
> +		free(buf);
>  		return -1;
> +	}
>  
> -	return strcmp(expected, buf);
> +	ret = strcmp(expected, buf);

If expected is null, what's the point in running the test?
Is  empty "needle" string a valid test scenario?

> +	free(buf);
> +	return ret;
>  }
>  
>  int cg_read_strstr(const char *cgroup, const char *control, const char *needle)
> 

thanks,
-- Shuah
