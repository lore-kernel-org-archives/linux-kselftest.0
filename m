From: sboyd at kernel.org (Stephen Boyd)
Date: Fri, 15 Feb 2019 12:54:47 -0800
Subject: [RFC v4 10/17] kunit: test: add test managed resource tests
In-Reply-To: <20190214213729.21702-11-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-11-brendanhiggins@google.com>
Message-ID: <155026408761.115909.17855438744578437385@swboyd.mtv.corp.google.com>

Quoting Brendan Higgins (2019-02-14 13:37:22)
> diff --git a/kunit/test-test.c b/kunit/test-test.c
> index 0b4ad6690310d..bb34431398526 100644
> --- a/kunit/test-test.c
> +++ b/kunit/test-test.c
[...]
> +
> +#define KUNIT_RESOURCE_NUM 5
> +static void kunit_resource_test_cleanup_resources(struct kunit *test)
> +{
> +       int i;
> +       struct kunit_test_resource_context *ctx = test->priv;
> +       struct kunit_resource *resources[KUNIT_RESOURCE_NUM];
> +
> +       for (i = 0; i < KUNIT_RESOURCE_NUM; i++) {

Nitpick: This could use ARRAY_SIZE(resources) and then the #define could
be dropped.

> +               resources[i] = kunit_alloc_resource(&ctx->test,
> +                                                   fake_resource_init,
> +                                                   fake_resource_free,
> +                                                   ctx);
> +       }
> +
> +       kunit_cleanup(&ctx->test);
> +
> +       KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
> +}
> +
[...]
> +
> +static struct kunit_case kunit_resource_test_cases[] = {

Can these arrays be const?

> +       KUNIT_CASE(kunit_resource_test_init_resources),
> +       KUNIT_CASE(kunit_resource_test_alloc_resource),
> +       KUNIT_CASE(kunit_resource_test_free_resource),
> +       KUNIT_CASE(kunit_resource_test_cleanup_resources),
> +       {},
> +};
