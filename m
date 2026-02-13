Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A544E313546;
	Fri, 13 Feb 2026 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970998; cv=none; b=ly191xJJstH24QjzUtrx9PRQSzZw5k91h7RmjOYtEfzBa/TzmV1DDcKb0/h+bOj4+sJHuUIiUvNm2e8+Si2LUOb3ACNug1miE0kWBpy8hAaMMdFjbd/RvjpI3I7DmtAOa2ljbktj0eOVEwDGzf8bIUwPbKisZ0MB3azT9NRQMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970998; c=relaxed/simple;
	bh=RzMbGepYxG/eo4NLHxwWQzWRcqqBEMofawh3VLPpMNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q2gzM49nitY2Cc+Zz7+F0bh9AHvSudlM3sMeDtnFWGYih3xl4ScKewPBL/+hzuSWLmNdbcXmMfwTsCoNFnQDp1aKZ+NLkilubfBOsVltZKB3JMTGeyRoOv+OM0wZ4cCG4AJWm0+N+cDMt2aZWpinfakxxH5gVQ9gxkSoFoGJrt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LT7vMU7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LT7vMU7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0DFC116C6;
	Fri, 13 Feb 2026 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970998;
	bh=RzMbGepYxG/eo4NLHxwWQzWRcqqBEMofawh3VLPpMNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LT7vMU7YsVTaZoajUCQDDE5aJWBXaP6i+1SmZdMOP9LVMtLfIu6mUzTMGAgXe5JXl
	 UHkuoz11oOnRHzZcWn/FtuMjbS+rjKmDACe6lrGDsapTt7qhguDy8ZaCx+0PS7Xjln
	 WZXUD2v0fi0vYgLinS/UDRKFoG+Ka/QgAA2tvo1IkTB39ytAV2aA5KmKYd/s2aNsR5
	 ojonFRSJiFpeMsDkMh5yAOGiyK3WzjfaWQ+XbGWx9+ig2ZPoF5LASEWe8KAGEMMYqo
	 /qNgID0RLsbfyOiXUhbfDFYqtrCPeSCKn6aukalhJflVOGj42h5490vwKpPyMRFwPN
	 VPHy36h65yLHQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>, ywen.chen@foxmail.com
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
 kernel-team@android.com, licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
 wakel@google.com
Subject: Re: [PATCH v5 1/2] selftests/futex: implement the interfaces
 related to threads
In-Reply-To: <tencent_7C6BB90BA288915B621CD975E9FC368FF305@qq.com>
References: <tencent_35CFB8AE9D4BE7917D95763D15B972638C0A@qq.com>
 <tencent_7C6BB90BA288915B621CD975E9FC368FF305@qq.com>
Date: Fri, 13 Feb 2026 09:23:14 +0100
Message-ID: <87ldgx832l.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 05 2026 at 10:08, Yuwen Chen wrote:
> There are timing issues in the use of threads in some unit test cases
> for futex.

This is handwaving and contains zero technical information.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> A potentially good solution is to check whether the thread

Either it's a solution or not. 

> is in the sleep state after creating it.

> This patch adds a file named futex_thread.h, in which several thread

# git grep 'This patch' Documentation/process/

> related functions are implemented to facilitate the solution of this
> problem.
>
> Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> +#ifndef _FUTEX_THREAD_H
> +#define _FUTEX_THREAD_H
> +#include <stdio.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#define USEC_PER_SEC 1000000L

#include <linux/time64.h>

> +#define WAIT_THREAD_RETRIES 100
> +#define WAIT_THREAD_CREATE_TIMEOUT_USECS (USEC_PER_SEC)
> +
> +struct futex_thread {
> +	pthread_t		thread;
> +	pthread_barrier_t	barrier;
> +	pid_t			tid;
> +	int			(*threadfn)(void *arg);
> +	void			*arg;
> +	int			retval;
> +};
> +
> +static int __wait_for_thread(FILE *fp)
> +{
> +	char buf[80] = "";
> +
> +	for (int i = 0; i < WAIT_THREAD_RETRIES; i++) {
> +		if (!fgets(buf, sizeof(buf), fp))
> +			return -EIO;
> +		if (!strncmp(buf, "futex", 5))
> +			return 0;
> +		usleep(WAIT_THREAD_CREATE_TIMEOUT_USECS / WAIT_THREAD_RETRIES);

What's wrong with

#define WAIT_THREAD_DELAY	(USEC_PER_SEC / WAIT_THREAD_RETRIES)
...
                usleep(WAIT_THREAD_DELAY);

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
> +	t->retval = t->threadfn(t->arg);
> +	return NULL;
> +}
> +
> +/**
> + * futex_wait_for_thread - Wait for the child thread to sleep in the futex context
> + * @t: Thread handle.
> + */
> +static int futex_wait_for_thread(struct futex_thread *t)
> +{
> +	char fname[80];
> +	FILE *fp;
> +	int res;
> +
> +	snprintf(fname, sizeof(fname), "/proc/%d/wchan", t->tid);
> +	fp = fopen(fname, "r");
> +	if (!fp) {
> +		usleep(USEC_PER_SEC / 10);

What is this usleep for?

> +		return -EIO;
> +	}
> +
> +	res = __wait_for_thread(fp);
> +	if (res == -EIO)
> +		usleep(USEC_PER_SEC / 10);

Again. What's this usleep for?

If the file cannot be opened or fgets() fails then this fails hard.

> +	fclose(fp);
> +	return res;
> +}
> +
> +/**
> + * futex_thread_create - Create a new thread for testing.
> + * @t:        The handle of the newly created thread.
> + * @threadfn: The new thread starts execution by invoking threadfn
> + * @arg:      The parameters passed to threadfn.
> + */
> +static int futex_thread_create(struct futex_thread *t, int (*threadfn)(void *), void *arg)
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

Why aren't you waiting for the thread right here? There is absolutely no
point in doing that at the call site of futex_thread_create().

Thanks,

        tglx
