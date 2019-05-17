From: sboyd@kernel.org (Stephen Boyd)
Date: Thu, 16 May 2019 17:35:21 -0700
Subject: [PATCH v4 01/18] kunit: test: add KUnit test runner core
In-Reply-To: <20190514221711.248228-2-brendanhiggins@google.com>
References: <20190514221711.248228-1-brendanhiggins@google.com>
 <20190514221711.248228-2-brendanhiggins@google.com>
Message-ID: <20190517003522.A48A7206BF@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190517003521.2crqZ8BlZjtv6iHOD2KpY1lqY9xw7jVzaTeaqq1vDJw@z>

Quoting Brendan Higgins (2019-05-14 15:16:54)
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> new file mode 100644
> index 0000000000000..e682ea0e1f9a5
> --- /dev/null
> +++ b/include/kunit/test.h
> @@ -0,0 +1,162 @@
[..]
> +/**
> + * struct kunit - represents a running instance of a test.
> + * @priv: for user to store arbitrary data. Commonly used to pass data created
> + * in the init function (see &struct kunit_module).
> + *
> + * Used to store information about the current context under which the test is
> + * running. Most of this data is private and should only be accessed indirectly
> + * via public functions; the one exception is @priv which can be used by the
> + * test writer to store arbitrary data.
> + */
> +struct kunit {
> +       void *priv;
> +
> +       /* private: internal use only. */
> +       const char *name; /* Read only after initialization! */
> +       spinlock_t lock; /* Gaurds all mutable test state. */
> +       bool success; /* Protected by lock. */

Is this all the spinlock protects? Doesn't seem useful if it's just
protecting access to the variable being set or not because code that
reads it will have a stale view of the value.

> diff --git a/kunit/test.c b/kunit/test.c
> new file mode 100644
> index 0000000000000..86f65ba2bcf92
> --- /dev/null
> +++ b/kunit/test.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Base unit test (KUnit) API.
> + *
> + * Copyright (C) 2019, Google LLC.
> + * Author: Brendan Higgins <brendanhiggins at google.com>
> + */
> +
> +#include <linux/sched.h>
> +#include <linux/sched/debug.h>
> +#include <kunit/test.h>
> +
[...]
> +
> +size_t kunit_module_counter = 1;

static?
