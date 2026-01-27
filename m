Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0A4283FE3;
	Tue, 27 Jan 2026 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538635; cv=none; b=jhfhiURNWiu87YeJHZKEa4Ro2qLRH9EV6rilQI6IcqcnrWIDHBlhC7Oae98r183tMo484Socylp1y0SlTzB1rl93dh9K/UvsCUkeHOSX/JaBXg5oJUeaycK7DB+SWDN1W/oDoI1CqidkKkT9XSpd/tzLvvfTUbHMUtMoGI6i0I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538635; c=relaxed/simple;
	bh=NhFKMIwE1tnHwaTVKOEA3Ok7BsLQgzVzZoi+GknQz8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zb+KQTFx0V6M0BnhwtfRuvZ0EB0frIt1KktiHPVMPx1dXkdp/rBfmebMxuF2/uMD3W5daMYYwUTyEkRivzZlCpBmwroK8yvV+BpvSXGoda3ChwYkQExV6BtIlJwk1U2rum+y2qngAKoCYXLmJK5XNdZI2jYOAVhI7opERz426us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3JX48ta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3JX48ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D6CC116C6;
	Tue, 27 Jan 2026 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538635;
	bh=NhFKMIwE1tnHwaTVKOEA3Ok7BsLQgzVzZoi+GknQz8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T3JX48taqqUzmWML+iiFISBh7MHXWKhbXprrjyWwNXhd/0dALrLF/iJoJLbzOJNpg
	 SO4Pq065PkeIE3y7SuqpgtzCsj3hhWkuUq6XH2xwK9EnytOaIwnHnM723p90kimkd0
	 imsqDmmeytxCVyWrk6g3rGQNOSN4Vam/6rl1TpnN4BrlwkFbWUJ8f/xWE4pGVGKSuF
	 SJhaBJCu/QZxeVmxD1jgO0I6D2tYqFAHGdT/ic+5QuFc4th9YnQIHHllbZyiFlYNAc
	 7ULIInS14l1/Tt8Jb0Qpk4l/a8HG9/jloZ8Fw4y61Ddb6/UawJ2vUa/GNW4imLrYFp
	 g5+TL4kUa5mwQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>, akpm@linux-foundation.org,
 wakel@google.com
Cc: andrealmeid@igalia.com, bigeasy@linutronix.de, colin.i.king@gmail.com,
 dave@stgolabs.net, dvhart@infradead.org, edliaw@google.com,
 justinstitt@google.com, kernel-team@android.com, licayy@foxmail.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 luto@mit.edu, mingo@redhat.com, morbo@google.com, nathan@kernel.org,
 ndesaulniers@google.com, peterz@infradead.org, shuah@kernel.org,
 usama.anjum@collabora.com, Yuwen Chen <ywen.chen@foxmail.com>
Subject: Re: [PATCH v2] selftests/futex: fix the failed futex_requeue test
 issue
In-Reply-To: <tencent_B9DBF2ECBE56BAB68BDAB949C6935D01CE09@qq.com>
References: <tencent_B9DBF2ECBE56BAB68BDAB949C6935D01CE09@qq.com>
Date: Tue, 27 Jan 2026 19:30:31 +0100
Message-ID: <878qdic3i0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26 2026 at 17:33, Yuwen Chen wrote:
> This test item has extremely high requirements for timing and can only

Extremely high?

The main thread waits for 10000us aka. 10 seconds to allow the waiter
thread to reach futex_wait().

If anything is extreme then it's the 10 seconds wait, not the
requirements. Please write factual changelogs and not fairy tales.

> pass the test under specific conditions. The following situations will
> lead to test failure:
>
>     MainThread                  Thread1
>         =E2=94=82
>   pthread_create-------------------=E2=94=90
>         =E2=94=82                          =E2=94=82
>  futex_cmp_requeue                 =E2=94=82
>         =E2=94=82                     futex_wait
>         =E2=94=82                          =E2=94=82
>
> If the child thread is not waiting in the futex_wait function when the
> main thread reaches the futex_cmp_requeue function, the test will
> fail.

That's a known issue for all futex selftests when the test system is
under extreme load. That's why there is a gratious 10 seconds timeout,
which is annoyingly long already.

Also why is this special for the requeue_single test case?

It's exactly the same issue for all futex selftests including the multi
waiter one in the very same file, no?

> This patch avoids this problem by checking whether the child thread is
> in a sleeping state in the main thread.

# git grep 'This patch' Documentation/process

>  volatile futex_t *f1;
> +static pthread_barrier_t barrier;
>=20=20
>  void *waiterfn(void *arg)
>  {
>  	struct timespec to;
> +	atomic_int *tid =3D (atomic_int *)arg;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#coding-s=
tyle-notes

All over the place.

> -	to.tv_sec =3D 0;
> -	to.tv_nsec =3D timeout_ns;
> +	to.tv_sec =3D timeout_s;
> +	to.tv_nsec =3D 0;
> +
> +	atomic_store(tid, gettid());

Why do you need an atomic store here?

pthread_barrier_wait() is a full memory barrier already, no?

> +	pthread_barrier_wait(&barrier);
>=20=20
>  	if (futex_wait(f1, *f1, &to, 0))
>  		printf("waiter failed errno %d\n", errno);
> @@ -29,22 +35,52 @@ void *waiterfn(void *arg)
>  	return NULL;
>  }
>=20=20
> +static int get_thread_state(pid_t pid)
> +{
> +	FILE *fp;
> +	char buf[80], tag[80];
> +	char val =3D 0;
> +
> +	snprintf(buf, sizeof(buf), "/proc/%d/status", pid);
> +	fp =3D fopen(buf, "r");
> +	if (!fp)
> +		return -1;
> +
> +	while (fgets(buf, sizeof(buf), fp))

Lacks curly braces on the while...

> +		if (sscanf(buf, "%s %c", tag, &val) =3D=3D 2 && !strcmp(tag, "State:")=
) {
> +			fclose(fp);
> +			return val;
> +		}

What's wrong with reading /proc/$PID/wchan ?

It's equally unreliable as /proc/$PID/stat because both can return the
desired state _before_ the thread reaches the inner workings of the test
related sys_futex(... WAIT).

> +	fclose(fp);
> +	return -1;
> +}
> +


>  TEST(requeue_single)
>  {
>  	volatile futex_t _f1 =3D 0;
>  	volatile futex_t f2 =3D 0;
>  	pthread_t waiter[10];
> -	int res;
> +	atomic_int tid =3D 0;
> +	int res, state, retry =3D 100;
>=20=20
>  	f1 =3D &_f1;
> +	pthread_barrier_init(&barrier, NULL, 2);
>=20=20
>  	/*
>  	 * Requeue a waiter from f1 to f2, and wake f2.
>  	 */
> -	if (pthread_create(&waiter[0], NULL, waiterfn, NULL))
> +	if (pthread_create(&waiter[0], NULL, waiterfn, &tid))
>  		ksft_exit_fail_msg("pthread_create failed\n");
>=20=20
> -	usleep(WAKE_WAIT_US);
> +	pthread_barrier_wait(&barrier);
> +	pthread_barrier_destroy(&barrier);
> +	while ((state =3D get_thread_state(atomic_load(&tid))) !=3D 'S') {
> +		usleep(WAKE_WAIT_US / 100);
> +
> +		if (state < 0 || retry-- <=3D 0)
> +			break;
> +	}

That's a disgusting hack. Are you going to copy this stuff around into
_all_ futex selftests, which suffer from exactly the same problem?
Please grep for 'WAKE_WAIT_US' to see them all.

Something like the uncompiled below in a "library" C source which is
linked into every futex test case:

#define WAIT_THREAD_RETRIES		100
#define WAIT_THREAD_DELAY_US		100

static int wait_for_thread(FILE *fp)
{
	char buf[80];

	for (int i =3D 0; i < WAIT_THREAD_RETRIES; i++) {
		if (!fgets(buf, sizeof(buf), fp))
			return -EIO;
		if (!strncmp(buf, "futex", 5))
			return 0;
                usleep(WAIT_THREAD_DELAY_US);
		rewind(fp);
	}
	return -ETIMEDOUT;
}

int futex_wait_for_thread(pid_t tid)
{
	char fname[80];
	FILE *fp;
	int res;

	snprintf(fname, sizeof(fname), "/proc/%d/wchan", tid);
	fp =3D fopen(fname, "r");
	if (!fp)
        	return -EIO;
	res =3D wait_for_thread(fp);
	fclose(fp);
	return res;
}

No?

While at it create a helper mechanism which avoids copying the whole
pthread_create()/barrier() muck around to every single test case:

struct thread_data {
	pthread_t		thread;
	pthread_barrier_t	barrier;
	pid_t			tid;
	void			(*threadfn)(void *);
	void			*arg;
};

static void *futex_thread_fn(void *arg)
{
	struct thread_data *td =3D arg;

	td->tid =3D gettid();
	pthread_barrier_wait(&td->barrier);
	td->threadfn(td->arg);
	return NULL;
}

int futex_thread_create(struct thread_data *td, void (*threadfn)(void*), vo=
id *arg)
{
	int ret;

	pthread_barrier_init(&td->barrier, NULL, 2);
	td->tid =3D 0;
	td->threadfn =3D threadfn;
	td->arg =3D arg;

	ret =3D pthread_create(&td->thread, NULL, futex_thread_fn, td);
	if (ret)
		return ret;

	pthread_barrier_wait(&td->barrier);
	return futex_wait_for_thread(td->tid);
}

or something like that. That will at least fix all the futex muck and
w/o looking I'm sure that's something which other selftests might find
useful too.

The upside of such a change is that the futex selftests runtime will be
significantly lower because the hideous 10 seconds wait can be avoided,
which is an actual improvement and not a made up extreme requirement...

Thanks,

        tglx
