Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2291A6834;
	Mon,  3 Aug 2026 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789427; cv=none; b=ht5d6GQ7SaMX4azOAKVp7Mb4sTIg8PqQGsIPNTN0z4n3MLVrUZEqONIwbtPzqZJjJmdT2ZzNIDHhbp75+PtExx/QbE56x33FHO1bqGHUkueaAGa6WazYjihqmHrGhelPvV1I0cIj4N44Ax3k8VDcrEoyTIVLtoVuoaGQSmP5A8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789427; c=relaxed/simple;
	bh=qe9HqxSH8weKOsQz7xdpPCbb8t8nXaijblupLCe0aIE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VvOVOgviM+QmBEWVSVs0K8fL+6QEzzJCxPg/SIjiIoK8tAgKWhF5r/LbFrtT/3gajd0nqyxNyI/niN0gwgNtBT7qBXjkqdNhUA2xO/NFhJfEudNphkf0kiAXou/1fp4Ocq43BpohuoLj+l9Z8nDfVhKOevJOLP7qy/tJcC0n620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aSycqoDt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aSycqoDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398101F000E9;
	Mon,  3 Aug 2026 20:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785789425;
	bh=iMh3w0+qZ5zyF1rAJ4Uge+BoFOIwwL+v8MTv/OMlkA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aSycqoDt6Ue8FrORd2jndpWs5JR2y9E38MOlxJbLqzuBP0LLm+CqDEFA7zddxwnSB
	 FUa7DmInwFD8s7DXlsiwPvgYtFE9HvED2XSjma7QxAcYt7BDOpH/1ivJsLozSQ26Db
	 9VzrFuQQxj08IyZWAhqNe1D55W6xpSzvmxYtHzyY=
Date: Mon, 3 Aug 2026 13:37:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Chris Gellermann <christian.gellermann@codasip.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-kernel@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH 2/2] selftests/membarrier: Skip unpermitted membarrier
 command test if preregistered by libc
Message-Id: <20260803133704.8802e73e1a212364e64f67ee@linux-foundation.org>
In-Reply-To: <20260803124900.3328789-3-christian.gellermann@codasip.com>
References: <20260803124900.3328789-1-christian.gellermann@codasip.com>
	<20260803124900.3328789-3-christian.gellermann@codasip.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Aug 2026 14:49:00 +0200 Chris Gellermann <christian.gellermann@codasip.com> wrote:

> On thread creation, Musl registers the private expedited memory barrier,
> see pthread_create [1]. Thus, invoking the barrier command will no
> longer be rejected by the kernel with EPERM. The test checking this will
> fail. Check if the memory barrier command has been registered and skip
> the test in this case.
> 

Who the heck maintains sched/membarrier?

Short answer: everybody I've ever met.  All are cheerfully cc'ed.

Perhaps finer-tuned answer: Peter.

> --- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
> +++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
> @@ -113,6 +113,16 @@ static int test_membarrier_private_expedited_fail(void)
>  	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
>  	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure";
>  
> +	/*
> +	 * Some C libraries, like Musl, register the private expedited barrier
> +	 * command when creating a thread. Expecting an EPERM on an unregistered
> +	 * command will therefore no longer work. Skip the test in this case.
> +	 */
> +	if (MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED & membarrier_get_registrations()) {
> +		ksft_test_result_skip("%s test: Command already registered\n", test_name);
> +		return 0;
> +	}

AI review
(https://sashiko.dev/#/patchset/20260803124900.3328789-1-christian.gellermann@codasip.com)
thinks that membarrier_get_registrations() can return -1 on old
kernels, so we should check for that before testing for
MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED.

Seems nonsensical to me - membarrier_get_registrations() doesn't do that.

And policy (my policy, at least) is that selftests test the kernel
they're shipped with and anyone who tries to run them against any older
or newer kernel is all out of luck.


That being said, and stepping back a bit, is this test testing
something which we would test?  If pass/fail depends upon deepest
details of the chosen libc flavour then perhaps the whole test was
ill-conceived.  wdyt?


