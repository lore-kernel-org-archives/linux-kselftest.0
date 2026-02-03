Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF529A32D;
	Tue,  3 Feb 2026 22:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158923; cv=none; b=a8X60JhHSR6c8CAFg4f0kT+dPm1JoTpN35d2tZOJJS+yedwa8GFEboAuGXuxUzN0aea7+7T6Bx6HqOFDAjMyoNJSwh6xsVActO4vIowqRcA9YofwyZIOJgI8jfK7OX1IZKRnCFO3XN/OdqoelLqgYhAB03eDjBGL36N8ttEjaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158923; c=relaxed/simple;
	bh=WFjaVDHmRk+LjauJvyhq3cgqCLhDZ9egNvtvsH4sOcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C4YsAhzsnxnECpbwNx3/jP27DcneETsYBpUqBXgxLor/Waaleg4vBhGukAtGqUB0LmvytnRjKZQlqsUh1JkqreWQufirSQPVdVzrvSbBcpXUi7CyfNH+qJEthR8+1viTHEsT5Rt7+pUmr0vPf0jmcaJhESzEZgcBNmO4xXOoIII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYDwwASY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYDwwASY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEE9C2BC86;
	Tue,  3 Feb 2026 22:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770158923;
	bh=WFjaVDHmRk+LjauJvyhq3cgqCLhDZ9egNvtvsH4sOcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iYDwwASY+00dQLiwtMvqDsnOkpaTHjtNzGZK5Sv9vG+/ge4h0SbTx7xWM1A2z1kvs
	 tUtEaKBdf/0FjMeIzjf1eKi3+d/svjNoCzHMg1sEVI7C9nQoayAf4RD3koGj+MC5oK
	 sdM/EA3QMfGIvs+yKWy6YiXpCDyjznnNOMqSSEa8q4Jn4uFOzLpL7UaBjvDm0MPzUC
	 w3QfK2oF5J9eqcmj+2U969gTL5qML8pdmCGmC132W427FhHOVay42uJZTV9MW4JEaB
	 MrAzx9wWx1/KDSHWXGaYffuEIRQ+/m1RY7ag3kLqbsJ771gl+Mw94Fyve4uH9bVmg5
	 X8YaFA7gUno0Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
 kernel-team@android.com, licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
 wakel@google.com, ywen.chen@foxmail.com
Subject: Re: [PATCH v4] selftests/futex: fix the failed futex_requeue test
 issue
In-Reply-To: <tencent_204540DCC2E303AEB6E77679C05F5C5D3808@qq.com>
References: <tencent_204540DCC2E303AEB6E77679C05F5C5D3808@qq.com>
Date: Tue, 03 Feb 2026 23:48:39 +0100
Message-ID: <874inx30l4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 18:24, Yuwen Chen wrote:
>  #include "futextest.h"
> +#include "futex_thread.h"
>  #include "kselftest_harness.h"
>  
> -#define timeout_ns  30000000
> -#define WAKE_WAIT_US 10000
> +#define FUTEX_WAIT_TIMEOUT_S	3 /* 3s */

Please remove this horrible tail comment and make the define self
explaining:

#define FUTEX_WAIT_TIMEOUT_SECS	3

Does not need a redundant comment, right?

> +#define WAIT_THREAD_DELAY_US	(10000 * 100) /* 1s */

Clearly there is not a more convoluted way to express microseconds per
second. Also WAIT_THREAD_DELAY_US is a gross misnomer.

#include <vdso/time64.h>

#define WAIT_THREAD_CREATE_TIMEOUT_USECS		(USECS_PER_SEC)

Is too comprehensible, right?

Aside of that why does this need to be a per source constant. With the
wchan readout this can be the same for any thread creation, no?

> +	ASSERT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));
> +	futex_wait_for_thread(&waiter, WAIT_THREAD_DELAY_US);

Q:  Why does this need two different functions?
A:  Because ignoring the return value of the wait function is a great idea

>  	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
>  	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
> +
> +	futex_thread_destroy(&waiter);
>  }
>  
>  TEST(requeue_multiple)
>  {
>  	volatile futex_t _f1 = 0;
>  	volatile futex_t f2 = 0;
> -	pthread_t waiter[10];
> -	int i;
> +	struct futex_thread waiter[10];

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

And please read the rest of the document as well.

>  	f1 = &_f1;
>  
> @@ -61,13 +62,17 @@ TEST(requeue_multiple)
>  	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
>  	 * At futex_wake, wake INT_MAX (should be exactly 7).
>  	 */
> -	for (i = 0; i < 10; i++)
> -		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
> +	for (int i = 0; i < 10; i++)
> +		ASSERT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
>  
> -	usleep(WAKE_WAIT_US);
> +	for (int i = 0; i < 10; i++)
> +		futex_wait_for_thread(&waiter[i], WAIT_THREAD_DELAY_US / 10);

Again. What's the point of this split and why is the timeout here different?

It really does not matter at all whether the thread creation waits for
each thread separately or not and "optimizing" the timeout value here is
just pointless. This is a test suite and it does not matter whether the
failure case is detected after 3 seconds or 0.3 seconds. It should not
happen at all.

>  	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
>  	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));
> +++ b/tools/testing/selftests/futex/include/futex_thread.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * library for futex tests
> + *
> + * Copyright 2026 Meizu Ltd.

I'm impressed about you slapping your company copyright on something I
almost verbatim provided to you without any form of appropriate
attribution. You might talk to your company lawyers about that.

> + */
> +#ifndef _FUTEX_THREAD_H
> +#define _FUTEX_THREAD_H
> +#include <stdio.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#define WAIT_THREAD_RETRIES 100
> +
> +struct futex_thread {
> +	pthread_t thread;
> +	pthread_barrier_t barrier;
> +	pid_t tid;
> +	void *(*threadfn)(void *);
> +	void *arg;
> +};

I provided you a perfectly formatted data structure and you
converted it into something unreadable.

> +
> +static int __wait_for_thread(FILE *fp, int timeout_us)

Remove this pointless timeout argument.

> +{
> +	char buf[80] = "";
> +
> +	for (int i = 0; i < WAIT_THREAD_RETRIES; i++) {
> +		if (!fgets(buf, sizeof(buf), fp))
> +			return -EIO;
> +		if (!strncmp(buf, "futex", 5))
> +			return 0;
> +		usleep(timeout_us / WAIT_THREAD_RETRIES);

And use a constant. The good case is determined by observing "futex" in
the wait channel. The bad case is irrelevant.

> +		rewind(fp);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static void *__futex_thread_fn(void *arg)
> +{
> +	struct futex_thread *t = arg;
> +
> +	t->tid = gettid();
> +	pthread_barrier_wait(&t->barrier);
> +	return t->threadfn(t->arg);
> +}
> +
> +/**
> + * futex_wait_for_thread - Wait for the child thread to sleep in the futex context
> + * @t:          Threads for testing.

Threads? How many of them. And what is this testing?

@t is a pointer to a data structure which the caller provides, but is
opaque to the caller in the same way as the pthread_t * argument of
pthread_create() is opaque to the caller.

> + * @timeout_us: Optional timeout for operation

Timeout is optional? Optional means 0 is valid, which results in a divide
by zero exception. This timeout argument is not required at all.

> + */
> +static inline int futex_wait_for_thread(struct futex_thread *t, int timeout_us)

Why "inline"? The compiler is clever enough to inline it and there is no
need for multiple instances of that when there is more than one place
using this.

> +{
> +	char fname[80];
> +	FILE *fp;
> +	int res;
> +
> +	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
> +	fp = fopen(fname, "r");
> +	if (!fp)
> +		return -EIO;
> +	res = __wait_for_thread(fp, timeout_us);
> +	fclose(fp);
> +	return res;
> +}
> +
> +/**
> + * futex_waitv - Create thread for testing.
> + * @t:        Data used for returning from the thread

@t is a pointer to a caller provided struct and has nothing to do with
the returning from the thread.

> + * @threadfn: The new thread starts execution by invoking threadfn()
> + * @arg:      arg is passed as the sole argument of threadfn()
> + */
> +static inline int futex_thread_create(struct futex_thread *t, void *(*threadfn)(void *), void *arg)

s/inline//

> +{
> +	int ret;
> +
> +	pthread_barrier_init(&t->barrier, NULL, 2);
> +	t->tid = 0;
> +	t->threadfn = threadfn;
> +	t->arg = arg;
> +
> +	ret = pthread_create(&t->thread, NULL, __futex_thread_fn, t);
> +	if (ret)
> +		return ret;
> +
> +	pthread_barrier_wait(&t->barrier);
> +	return 0;

This wants to be

	 return futex_wait_for_thread(t->tid);
> +}
> +
> +/**
> + * futex_waitv - Destroy thread.
> + * @t: Threads for testing.

How many threads are you testing for what?

This is about destroying the threads.

> + */
> +static inline void futex_thread_destroy(struct futex_thread *t)

This wants an 'void **retval' argument, which has to be set to NULL if
the caller is not interested in the return value;

> +{
> +	pthread_join(t->thread, NULL);

And this becomes:

	pthread_join(t->thread, retval);

Otherwise the

> +	return t->threadfn(t->arg);

in futex_thread_fn() is completely pointless.

If you want to make it flexible for checking the return value then make
it correct. Otherwise remove the '*' from the threadfn definition and
return NULL in futex_thread_fn().

Also this needs to be split into pieces:

   1) Provide the header file with the new functionality

   2) Convert futex tests over to it (one patch per test)

Thanks,

        tglx
