From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 29 Nov 2018 19:28:02 -0800
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <20181128193636.254378-2-brendanhiggins@google.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
Message-ID: <20181130032802.GG18410@garbanzo.do-not-panic.com>

> +static void kunit_run_case_internal(struct kunit *test,
> +				    struct kunit_module *module,
> +				    struct kunit_case *test_case)
> +{
> +	int ret;
> +
> +	if (module->init) {
> +		ret = module->init(test);
> +		if (ret) {
> +			kunit_err(test, "failed to initialize: %d", ret);
> +			kunit_set_success(test, false);
> +			return;
> +		}
> +	}
> +
> +	test_case->run_case(test);
> +}

<-- snip -->

> +static bool kunit_run_case(struct kunit *test,
> +			   struct kunit_module *module,
> +			   struct kunit_case *test_case)
> +{
> +	kunit_set_success(test, true);
> +
> +	kunit_run_case_internal(test, module, test_case);
> +	kunit_run_case_cleanup(test, module, test_case);
> +
> +	return kunit_get_success(test);
> +}

So we are running the module->init() for each test case... is that
correct? Shouldn't the init run once? Also, typically init calls are
pegged with __init so we free them later. You seem to have skipped the
init annotations. Why?

  Luis
