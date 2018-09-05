From: shuah@kernel.org (Shuah Khan)
Date: Wed, 5 Sep 2018 08:43:14 -0600
Subject: [PATCH 1/2] Fix cg_read_strcmp()
In-Reply-To: <20180905010827.27743-2-jgkamat@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
 <20180905010827.27743-2-jgkamat@fb.com>
Message-ID: <50897170-ca93-47be-2f99-d9e9ba0dd111@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180905144314.gKHKIw825X7kMp46872XqBcqyJn3fxQdNTyzxE54w6k@z>

Hi Jay,

Thanks for the patch. Couple of comments below.

On 09/04/2018 07:08 PM, jgkamat@fb.com wrote:
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
>  tools/testing/selftests/cgroup/cgroup_util.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
> index 1e9e3c470561..4aadf38bcd5d 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
> @@ -91,15 +91,24 @@ int cg_read_strcmp(const char *cgroup, const char *control,
>  {
>  	size_t size = strlen(expected) + 1;
>  	char *buf;
> +	int ret;
> +
> +	/* Handle the case of comparing against empty string */
> +	if (size == 1)
> +		size = 32;

Why not test for !expected and avoid strlen(expected) all together?

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
> +	free(buf);
> +	return ret;
>  }
>  
>  int cg_read_strstr(const char *cgroup, const char *control, const char *needle)
> 

thanks,
-- Shuah
