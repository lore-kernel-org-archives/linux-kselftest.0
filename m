From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Mon, 6 Aug 2018 07:09:47 -0700
Subject: [PATCH v2 1/1] rseq/selftests: add __rseq_abi misalignment check
In-Reply-To: <patch.git-4d215e14e001.your-ad-here.call-01533561863-ext-2109@work.hours>
References: <cover.thread-5c3a1c.your-ad-here.call-01533555685-ext-8699@work.hours>
 <patch.git-4d215e14e001.your-ad-here.call-01533561863-ext-2109@work.hours>
Message-ID: <20180806140947.GO24813@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180806140947.i4hZXioHWyEXpyzFYeCDb3lXguyTb89C_MXWbXeEylo@z>

On Mon, Aug 06, 2018@03:27:23PM +0200, Vasily Gorbik wrote:
> The kernel rseq syscall expects that struct rseq is 32 bytes aligned and
> returns EINVAL otherwise. Even though __rseq_abi is declared as static
> and proper aligned attribute is present __rseq_abi is a part of thread
> local storage. It turns out that on some platforms TLS itself is not
> properly aligned (at least for threads created), which is a glibc nptl
> bug and should be eventually fixed and backported. But in a meanwhile
> add __rseq_abi misalignment check, which would detect this situation
> and skip rseq test with some user friendly message.
> 
> glibc bug: https://sourceware.org/bugzilla/show_bug.cgi?id=23403
> 
> Signed-off-by: Vasily Gorbik <gor at linux.ibm.com>

Acked-by: Paul E. McKenney <paulmck at linux.vnet.ibm.com>

> ---
>  tools/testing/selftests/rseq/rseq.c           | 20 +++++++++++++++++++
>  .../testing/selftests/rseq/run_param_test.sh  |  4 ++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
> index 4847e97ed049..3de7f0e7442e 100644
> --- a/tools/testing/selftests/rseq/rseq.c
> +++ b/tools/testing/selftests/rseq/rseq.c
> @@ -64,6 +64,24 @@ static int sys_rseq(volatile struct rseq *rseq_abi, uint32_t rseq_len,
>  	return syscall(__NR_rseq, rseq_abi, rseq_len, flags, sig);
>  }
> 
> +/*
> + * rseq syscall might fail on some platforms due to wrong alignment of TLS
> + * variables:
> + * https://sourceware.org/bugzilla/show_bug.cgi?id=23403
> + *
> + * check if glibc bug is present and skip the test in this case
> + */
> +static void assert_rseq_abi_aligned(void)
> +{
> +	if ((unsigned long)&__rseq_abi & (__alignof__(__rseq_abi) - 1)) {
> +		fputs("__rseq_abi is not properly aligned, which is a known\n"
> +		      "glibc nptl bug (https://sourceware.org/bugzilla/show_bug.cgi?id=23403).\n"
> +		      "You need a fixed version of glibc to run this test.\n",
> +		      stderr);
> +		exit(4); /* skip this test */
> +	}
> +}
> +
>  int rseq_register_current_thread(void)
>  {
>  	int rc, ret = 0;
> @@ -72,6 +90,7 @@ int rseq_register_current_thread(void)
>  	signal_off_save(&oldset);
>  	if (refcount++)
>  		goto end;
> +	assert_rseq_abi_aligned();
>  	rc = sys_rseq(&__rseq_abi, sizeof(struct rseq), 0, RSEQ_SIG);
>  	if (!rc) {
>  		assert(rseq_current_cpu_raw() >= 0);
> @@ -94,6 +113,7 @@ int rseq_unregister_current_thread(void)
>  	signal_off_save(&oldset);
>  	if (--refcount)
>  		goto end;
> +	assert_rseq_abi_aligned();
>  	rc = sys_rseq(&__rseq_abi, sizeof(struct rseq),
>  		      RSEQ_FLAG_UNREGISTER, RSEQ_SIG);
>  	if (!rc)
> diff --git a/tools/testing/selftests/rseq/run_param_test.sh b/tools/testing/selftests/rseq/run_param_test.sh
> index 3acd6d75ff9f..56caf5e3de3e 100755
> --- a/tools/testing/selftests/rseq/run_param_test.sh
> +++ b/tools/testing/selftests/rseq/run_param_test.sh
> @@ -34,9 +34,9 @@ function do_tests()
>  	local i=0
>  	while [ "$i" -lt "${#TEST_LIST[@]}" ]; do
>  		echo "Running test ${TEST_NAME[$i]}"
> -		./param_test ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
> +		./param_test ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit $?
>  		echo "Running compare-twice test ${TEST_NAME[$i]}"
> -		./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
> +		./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit $?
>  		let "i++"
>  	done
>  }
> -- 
> 2.18.0.13.gd42ae10

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
