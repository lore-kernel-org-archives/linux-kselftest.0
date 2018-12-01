From: mcgrof at kernel.org (Luis Chamberlain)
Date: Fri, 30 Nov 2018 19:02:15 -0800
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <20181128193636.254378-2-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
Message-ID: <20181201030215.GJ28501@garbanzo.do-not-panic.com>

On Wed, Nov 28, 2018 at 11:36:18AM -0800, Brendan Higgins wrote:
> +int kunit_run_tests(struct kunit_module *module)
> +{
> +	bool all_passed = true, success;
> +	struct kunit_case *test_case;
> +	struct kunit test;
> +	int ret;
> +
> +	ret = kunit_init_test(&test, module->name);
> +	if (ret)
> +		return ret;
> +
> +	for (test_case = module->test_cases; test_case->run_case; test_case++) {
> +		success = kunit_run_case(&test, module, test_case);

We are running test cases serially, why not address testing
asynchronously, this way tests can also be paralellized when possible,
therefore decreasing test time even further.

Would that mess up the printing/log stuff somehow?

  Luis
