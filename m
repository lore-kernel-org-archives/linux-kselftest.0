Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72A3EF0A6;
	Tue, 28 Apr 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373887; cv=none; b=rEWxxi4gmtKrSom5PA9jRbkusjp5y8UgMAcZhAvFWJ6T2HGK6lxTDxwuHTo4mrPZDN5wsnkM+FSEUNpZ67RWIU7tGj0S2vc86jILcdZ6LpYDj3UdodhxPw6EcgyzGx4DrmMrnyZQatg/4OYSjNWon3QUyrNr3ZnQgyrKU1uzbFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373887; c=relaxed/simple;
	bh=YcnVTaFiHfxAZQF+T7Fm8d8IlNJCEMm44gI7rSAIcGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQfXPekCBS0w8DcJi8Xg4W48XiFUV1WTQEYq1re6pHWCPVaqcR1Ex4t6cEG9s1s92KwqRPS5AsO0VuHIyE6+xPgyrW0QIZ5mStdwaMEZerMDF3M0VkakVlN/ZZgX3ectPCRiwyRmqYEEERuxosGgTey0OL9BIAwGr/AOqwwVPic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aZY41MXp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jrV4+ivP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aZY41MXp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jrV4+ivP"
Date: Tue, 28 Apr 2026 12:58:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777373883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62dJee3HRDFCG1TfzjzRIb/txpz8mCnzwkHnKEObrBE=;
	b=aZY41MXp28fy+uUsxUxZqt8WB0DLBI1zOAaYBEvzJuG8f3NFbuobpVIqLyWvItgaTPlSWm
	jiedf+tdwCHMia84shK5tdOaWsReYuEKyxNDP59fLnm5dTAgY5JW3vRXbX75/67j9CbKgx
	Cg2Md5Pnku6pPkmbg9uNDmJ0n+Sq5IzYDdjh7k3YSr3OGgfe1/F1JKCr8391IVY9yweuZA
	BmfUvYy85+3qH0gwS3QAAFM2GH5++OMb017FJwWaxsn23iFoJdTS/QLt2maqgYrIFz8GzA
	g5N3Jlm75njFsLHEYWK+1FN3rjTIaRNcvnaFpfv3VJqkcLj7xKRgmOw1N2pugw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777373883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62dJee3HRDFCG1TfzjzRIb/txpz8mCnzwkHnKEObrBE=;
	b=jrV4+ivPcfib6D3jjU1OjBV7QLODO+aN1l6wK4zTxqyptsAyTCCmHy0Ttjgxv0GkMn8vLT
	YTW53kevGj3ibUAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
	colin.i.king@gmail.com, dave@stgolabs.net, dvhart@infradead.org,
	edliaw@google.com, justinstitt@google.com, kernel-team@android.com,
	licayy@foxmail.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
	peterz@infradead.org, shuah@kernel.org, tglx@kernel.org,
	usama.anjum@collabora.com, wakel@google.com
Subject: Re: [RESEND PATCH v3] selftests/futex: fix the failed futex_requeue
 test issue
Message-ID: <20260428105801.dwKmqgaQ@linutronix.de>
References: <tencent_FC5FB35D2545AFDCA6E377AE4DE75C79AF08@qq.com>
 <tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tencent_1BF14BBF2BBF088E3B609CC155EC7C206F05@qq.com>

On 2026-04-27 18:18:38 [+0800], Yuwen Chen wrote:
> This test item has extremely high requirements for timing and can only
> pass the test under specific conditions. The following situations will
> lead to test failure:
>=20
>     MainThread                  Thread1
>         =E2=94=82
>   pthread_create-------------------=E2=94=90
>         =E2=94=82                          =E2=94=82
>  futex_cmp_requeue                 =E2=94=82
>         =E2=94=82                     futex_wait
>         =E2=94=82                          =E2=94=82
>=20
> If the child thread is not waiting in the futex_wait function when the
> main thread reaches the futex_cmp_requeue function, the test will fail.
>=20
> This patch avoids this problem by checking whether the child thread is

This patch.

> in a sleeping state in the main thread.

The pthread_barrier you introduced is not enough?
You also increase the wait-timeout to 3s and parse the wait function.
You could describe what the expectation here is. I would assume that the
barrier on its own should be enough. But the barrier and the state
parsing is a bit much. This makes me curious what is so special on your
side that it does not work as-is. Is this some big-little case where the
big creates the thread and does requeue while the littke is supposed to
do futex_wait but falls behind?

> Fixes: 7cb5dd8e2c8c ("selftests: futex: Add futex compare requeue test")
> Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
> Co-developed-by: Edward Liaw <edliaw@google.com>
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
> v1->v2:
>     1. Fix the issue of abnormal use of fscanf in the get_thread_state fu=
nction
>     2. Add timeout logic
>=20
> v2->v3: https://lore.kernel.org/all/tencent_B9DBF2ECBE56BAB68BDAB949C6935=
D01CE09@qq.com/
>     1. Use /proc/[pid]/wchan instead of /proc/[pid]/stat to check if a pr=
ocess has entered the sleep state
>     2. Refactor part of the logic to facilitate code reuse.
>=20
>  .../futex/functional/futex_requeue.c          | 91 ++++++++++++++++---
>  1 file changed, 77 insertions(+), 14 deletions(-)
>=20
> diff --git a/tools/testing/selftests/futex/functional/futex_requeue.c b/t=
ools/testing/selftests/futex/functional/futex_requeue.c
> index dcf0d5f2f3122..7163e827691e4 100644
> --- a/tools/testing/selftests/futex/functional/futex_requeue.c
> +++ b/tools/testing/selftests/futex/functional/futex_requeue.c
> @@ -11,8 +11,9 @@
>  #include "futextest.h"
>  #include "kselftest_harness.h"
> =20
> -#define timeout_ns  30000000
> -#define WAKE_WAIT_US 10000
> +#define FUTEX_WAIT_TIMEOUT_S	3 /* 3s */
> +#define WAIT_THREAD_RETRIES	100
> +#define WAIT_THREAD_DELAY_US	(10000 * 100) /* 1s */
> =20
>  volatile futex_t *f1;
> =20
> @@ -20,8 +21,8 @@ void *waiterfn(void *arg)
>  {
>  	struct timespec to;
> =20
> -	to.tv_sec =3D 0;
> -	to.tv_nsec =3D timeout_ns;
> +	to.tv_sec =3D FUTEX_WAIT_TIMEOUT_S;
> +	to.tv_nsec =3D 0;
> =20
>  	if (futex_wait(f1, *f1, &to, 0))
>  		printf("waiter failed errno %d\n", errno);
> @@ -29,20 +30,83 @@ void *waiterfn(void *arg)
>  	return NULL;
>  }
> =20
> +struct futex_thread {
> +	pthread_t thread;
> +	pthread_barrier_t barrier;
> +	pid_t tid;
> +	void *(*threadfn)(void *);
> +	void *arg;
> +};
> +
> +static int wait_for_thread(FILE *fp, int timeout_us)
> +{
> +	char buf[80] =3D "";
> +
> +	for (int i =3D 0; i < WAIT_THREAD_RETRIES; i++) {
> +		if (!fgets(buf, sizeof(buf), fp))
> +			return -EIO;
> +		if (!strncmp(buf, "futex", 5))
> +			return 0;
> +		usleep(timeout_us / WAIT_THREAD_RETRIES);
> +		rewind(fp);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +int futex_wait_for_thread(struct futex_thread *t, int timeout_us)
> +{
> +	char fname[80];
> +	FILE *fp;
> +	int res;
> +
> +	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
> +	fp =3D fopen(fname, "r");
> +	if (!fp)
> +		return -EIO;
> +	res =3D wait_for_thread(fp, timeout_us);
> +	fclose(fp);
> +	return res;
> +}
> +
> +static void *futex_thread_fn(void *arg)
> +{
> +	struct futex_thread *t =3D arg;
> +
> +	t->tid =3D gettid();
> +	pthread_barrier_wait(&t->barrier);
> +	return t->threadfn(t->arg);
> +}
> +
> +int futex_thread_create(struct futex_thread *t, void *(*threadfn)(void *=
), void *arg)
> +{
> +	int ret;
> +
> +	pthread_barrier_init(&t->barrier, NULL, 2);
> +	t->tid =3D 0;
> +	t->threadfn =3D threadfn;
> +	t->arg =3D arg;
> +
> +	ret =3D pthread_create(&t->thread, NULL, futex_thread_fn, t);
> +	if (ret)
> +		return ret;
> +
> +	pthread_barrier_wait(&t->barrier);
> +	return 0;
> +}
> +
>  TEST(requeue_single)
>  {
>  	volatile futex_t _f1 =3D 0;
>  	volatile futex_t f2 =3D 0;
> -	pthread_t waiter[10];
> +	struct futex_thread waiter;
> =20
>  	f1 =3D &_f1;
> =20
>  	/*
>  	 * Requeue a waiter from f1 to f2, and wake f2.
>  	 */
> -	ASSERT_EQ(0, pthread_create(&waiter[0], NULL, waiterfn, NULL));
> -
> -	usleep(WAKE_WAIT_US);
> +	EXPECT_EQ(0, futex_thread_create(&waiter, waiterfn, NULL));

Why this ASSERT_EQ -> EXPECT_EQ ?

> +	futex_wait_for_thread(&waiter, WAIT_THREAD_DELAY_US);
> =20
>  	EXPECT_EQ(1, futex_cmp_requeue(f1, 0, &f2, 0, 1, 0));
>  	EXPECT_EQ(1, futex_wake(&f2, 1, 0));
> @@ -52,8 +116,7 @@ TEST(requeue_multiple)
>  {
>  	volatile futex_t _f1 =3D 0;
>  	volatile futex_t f2 =3D 0;
> -	pthread_t waiter[10];
> -	int i;
> +	struct futex_thread waiter[10];

Couldn't that `i# remain where it was and that waiter moved as per Xmas
notation?

> =20
>  	f1 =3D &_f1;
> =20
> @@ -61,10 +124,10 @@ TEST(requeue_multiple)
>  	 * Create 10 waiters at f1. At futex_requeue, wake 3 and requeue 7.
>  	 * At futex_wake, wake INT_MAX (should be exactly 7).
>  	 */
> -	for (i =3D 0; i < 10; i++)
> -		ASSERT_EQ(0, pthread_create(&waiter[i], NULL, waiterfn, NULL));
> -
> -	usleep(WAKE_WAIT_US);
> +	for (int i =3D 0; i < 10; i++) {
> +		EXPECT_EQ(0, futex_thread_create(&waiter[i], waiterfn, NULL));
> +		futex_wait_for_thread(&waiter[i], WAIT_THREAD_DELAY_US / 10);
> +	}
> =20
>  	EXPECT_EQ(10, futex_cmp_requeue(f1, 0, &f2, 3, 7, 0));
>  	EXPECT_EQ(7, futex_wake(&f2, INT_MAX, 0));

Sebastian
