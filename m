From: sboyd at kernel.org (Stephen Boyd)
Date: Thu, 16 May 2019 17:38:46 -0700
Subject: [PATCH v4 02/18] kunit: test: add test resource management API
In-Reply-To: <20190514221711.248228-3-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-3-brendanhiggins@google.com>
Message-ID: <20190517003847.0962F2082E@mail.kernel.org>

Quoting Brendan Higgins (2019-05-14 15:16:55)
> diff --git a/kunit/test.c b/kunit/test.c
> index 86f65ba2bcf92..a15e6f8c41582 100644
> --- a/kunit/test.c
> +++ b/kunit/test.c
[..]
> +
> +void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
> +{
> +       struct kunit_kmalloc_params params;
> +       struct kunit_resource *res;
> +
> +       params.size = size;
> +       params.gfp = gfp;
> +
> +       res = kunit_alloc_resource(test,
> +                                  kunit_kmalloc_init,
> +                                  kunit_kmalloc_free,
> +                                  &params);
> +
> +       if (res)
> +               return res->allocation;
> +       else
> +               return NULL;

Can be written as

	if (res)
		return ....
	return 

and some static analysis tools prefer this.

> +}
> +
> +void kunit_cleanup(struct kunit *test)
> +{
> +       struct kunit_resource *resource, *resource_safe;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&test->lock, flags);

Ah ok, test->lock is protecting everything now? Does it need to be a
spinlock, or can it be a mutex?

> +       list_for_each_entry_safe(resource,
> +                                resource_safe,
> +                                &test->resources,
> +                                node) {
> +               kunit_free_resource(test, resource);
> +       }
> +       spin_unlock_irqrestore(&test->lock, flags);
> +}
> +
