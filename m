From: mingo at kernel.org (Ingo Molnar)
Date: Mon, 11 Feb 2019 09:49:16 +0100
Subject: [PATCH 2/2] selftests/x86/fsgsbase: Default to trying to run the
 test repeatedly
In-Reply-To: <20190203134017.9375-3-broonie@kernel.org>
References: <20190203134017.9375-1-broonie@kernel.org>
 <20190203134017.9375-3-broonie@kernel.org>
Message-ID: <20190211084916.GB62722@gmail.com>


* Mark Brown <broonie at kernel.org> wrote:

> In automated testing it has been found that on many systems the fsgsbase
> test fails intermittently.  This was reported and discussed a while
> back:
> 
>     https://lore.kernel.org/lkml/20180126153631.ha7yc33fj5uhitjo at xps/
> 
> with the analysis concluding that this is a hardware issue affecting a
> subset of systems but no fix has been merged as yet.  As well as the
> actual problem found by testing the intermittent test failure is causing
> issues for the people doing the automated testing due to the noise.
> 
> In order to make the testing stable modify the test program to iterate
> through the test repeatedly, choosing 5000 iterations based on prior
> reports and local testing.  This unfortunately greatly increases the
> execution time for the selftests when things succeed which isn't great,
> in my local tests on a range of systems it pushes the execution time up
> to approximately a minute when no failures are encountered.
> 
> Reported-by: Dan Rue <dan.rue at linaro.org>
> Signed-off-by: Mark Brown <broonie at kernel.org>
> ---
>  tools/testing/selftests/x86/fsgsbase.c | 27 +++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
> index 6cda6daa1f8c..83410749ff1f 100644
> --- a/tools/testing/selftests/x86/fsgsbase.c
> +++ b/tools/testing/selftests/x86/fsgsbase.c
> @@ -379,7 +379,7 @@ static void test_unexpected_base(void)
>  	}
>  }
>  
> -int main()
> +int test()
>  {
>  	pthread_t thread;
>  
> @@ -437,3 +437,28 @@ int main()
>  
>  	return nerrs == 0 ? 0 : 1;
>  }
> +
> +int main()
> +{
> +	int tries = 5000;
> +	int i;
> +
> +	if (tries > 1)
> +		quiet = true;
> +
> +	for (i = 0; i < tries; i++) {
> +		if (test() != 0)
> +			break;
> +	}
> +
> +	if (quiet) {
> +		if (nerrs) {
> +			printf("[FAIL] %d errors detected in %d tries\n",
> +				nerrs, i + 1);
> +		} else {
> +			printf("[PASS] %d runs succeeded\n", i);
> +		}
> +	}
> +
> +	return nerrs == 0 ? 0 : 1;
> +}

So this isn't very user-friendly either, previously it would run a 
testcase and immediately provide output.

Now it's just starting and 'hanging':

  galatea:~/linux/linux/tools/testing/selftests/x86> ./fsgsbase_64 

I got bored and Ctrl-C-ed it after ~30 seconds.

How long is this supposed to run, and why isn't the user informed?

Also, testcases should really be short, so I think a better approach 
would be to thread the test-case and start an instance on every CPU. That 
should also excercise SMP bugs, if any.

Thanks,

	Ingo
