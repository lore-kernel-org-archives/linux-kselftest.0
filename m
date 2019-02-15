From: sboyd@kernel.org (Stephen Boyd)
Date: Fri, 15 Feb 2019 13:01:50 -0800
Subject: [RFC v4 02/17] kunit: test: add test resource management API
In-Reply-To: <20190214213729.21702-3-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
 <20190214213729.21702-3-brendanhiggins@google.com>
Message-ID:
 <155026451067.115909.17082794837098610153@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190215210150.nh-ji2jtv0fSyzNx8h2jYKOrzDr2FCQGrbcVIAhLGMk@z>

Quoting Brendan Higgins (2019-02-14 13:37:14)
> @@ -104,6 +167,7 @@ struct kunit {
>         const char *name; /* Read only after initialization! */
>         spinlock_t lock; /* Gaurds all mutable test state. */
>         bool success; /* Protected by lock. */
> +       struct list_head resources; /* Protected by lock. */
>         void (*vprintk)(const struct kunit *test,
>                         const char *level,
>                         struct va_format *vaf);
> @@ -127,6 +191,51 @@ int kunit_run_tests(struct kunit_module *module);
>                 } \
>                 late_initcall(module_kunit_init##module)
>  
> +/**
> + * kunit_alloc_resource() - Allocates a *test managed resource*.
> + * @test: The test context object.
> + * @init: a user supplied function to initialize the resource.
> + * @free: a user supplied function to free the resource.
> + * @context: for the user to pass in arbitrary data.

Nitpick: "pass in arbitrary data to the init function"? Maybe that
provides some more clarity.

> + *
> + * Allocates a *test managed resource*, a resource which will automatically be
> + * cleaned up at the end of a test case. See &struct kunit_resource for an
> + * example.
> + */
