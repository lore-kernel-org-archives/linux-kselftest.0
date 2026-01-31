Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187A1F4611
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769894597; cv=none; b=jsvxyowpbrqmD23HPyc9AuQ7iOo47LG8NVtDedqqI5CmZuWY3G8u6WWGw5cl/c3hYsnEN7TbavpUkIsqNf0qQHHKLzqeOTbzH+CFybuzqPX3zLEur1k7jpGJuqclJTcZu3i484/HdoC85nIjnl8noZMJLiww2Pxuimte0jEnXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769894597; c=relaxed/simple;
	bh=yk+OXR9L4i6oNnyet7Fky0oQpBsHN6QNIP5cz+Gox5c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZQ0MKjtJ/SuLyn8BIC/sCeTiynrVxUy6gV0OpWPvUmu+CQGS2qJgVnSZVJDb8FKFcJycB2/1d1cfzMy+A3hTagFGapFR4EHuxDB1dM2S6ptSO96A0Ie96dx4PbeRhaFXxVsU1lB0P55vw2QYwQ5MN+cBxiCOpvvsPVvJVpHxTlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Dyr41ocT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Dyr41ocT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1DFC4CEF1;
	Sat, 31 Jan 2026 21:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769894596;
	bh=yk+OXR9L4i6oNnyet7Fky0oQpBsHN6QNIP5cz+Gox5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dyr41ocThER91xAM8uRAgDmQJGfqqqBXNIESHg/Ucb2uujcRy3I4TorCFcH/t2zRp
	 6Wc0ZxJQoYrpHSPXrIW6ZkAGnLHwW0nyFLnHNQ+w9EIaxXPuN15560BLgOkvj4hCMQ
	 b6GOSp+JzFQk4NCRDIYUJ4VWAYgpPNprXj7oJ3tI=
Date: Sat, 31 Jan 2026 13:23:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Aristeu Rozanski <aris@redhat.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, liuye
 <liuye@kylinos.cn>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH] selftests/memfd: use IPC semaphore instead of
 SIGSTOP/SIGCONT
Message-Id: <20260131132315.62b0b029dc1dd03febe97481@linux-foundation.org>
In-Reply-To: <7888ed77-da89-41b2-a73e-09038b7c9285@work>
References: <7888ed77-da89-41b2-a73e-09038b7c9285@work>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jan 2026 17:17:48 -0500 Aristeu Rozanski <aris@redhat.com> wrote:

> In order to synchronize new processes to test inheritance of
> memfd_noexec sysctl, memfd_test sets up the sysctl with a value before
> creating the new process. The new process then sends itself a SIGSTOP
> in order to wait for the parent to flip the sysctl value and send a
> SIGCONT signal.
> 
> This would work as intended if it wasn't the fact that the new process
> is being created with CLONE_NEWPID, which creates a new PID namespace and
> the new process has PID 1 in this namespace. There're restrictions on
> sending signals to PID 1 and, although it's relaxed for other than root
> PID namespace, it's biting us here. In this specific case the SIGSTOP sent
> by the new process is ignored (no error to kill() is returned) and it never
> stops its execution. This is usually not noticiable as the parent usually
> manages to set the new sysctl value before the child has a chance to run
> and the test succeeds. But if you run the test in a loop, it eventually
> reproduces:
> 
> 	while [ 1 ]; do ./memfd_test >log 2>&1 || break; done; cat log
> 
> So this patch replaces the SIGSTOP/SIGCONT synchronization with IPC
> semaphore.
> 
> Fixes: 6469b66e3f5a3 (selftests: improve vm.memfd_noexec sysctl tests, 2023-08-14)

Thanks.  Could you please resend this sometime, with a
cc:linux-mm@kvack.org and also cc'ing the 6469b66e3f5a3 author Aleksa
Sarai <cyphar@cyphar.com>?

> +union semun {
> +	int val;
> +	struct semid_ds *buf;
> +	unsigned short int *array;
> +	struct seminfo *__buf;
> +};
> +
> +/*
> + * we use semaphores on nested wait tasks due the use of CLONE_NEWPID: the
> + * children will be PID 1 and can't send SIGSTOP to itself due special

s/children/child/, or s/itself/themselves/


