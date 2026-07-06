Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214838AC72;
	Mon,  6 Jul 2026 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380524; cv=none; b=nbp5PYMMXdJO3aG2Seh0RIE3kpB38utul1EXkDUwxgF/dWczNEKtDVbIkifG0Lm8h6wZnWUMkxe5fWQkC4/y0nZmWXy95UWqzHqF9jmTtEAfiemHbs5vDYY97jOryOX8PWxI0sk/WrcZKaLUBHRs+Ig/txSj0sbL6tmFEpSiuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380524; c=relaxed/simple;
	bh=3o/eio45gbUHRdIJCX0WTUc3bXczLNw42rKg+AmEzH8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JCmMV1eh395JIUd9R0ryS2KqET2los8mHO26WsFNvP3GRi4vhUgZAR0ynIo3EPHZyCzQRbWflbfTtJNADgCaZsXWH0q6ggzmg8hdh1QfXcd1Ti3FqWgFg8VJrJNUarM6nI1P2Cvdc91EKdGLXyZyFc2O3UBZpfMJJfux+RY3FIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eS79emPp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eS79emPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382911F000E9;
	Mon,  6 Jul 2026 23:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783380522;
	bh=xY2XDGZgy2/wx1N9DCqdj5OgFf0MPlcb4W5q9mk0jSM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eS79emPpoRWzK7gWR0/7petFLauhupa0yHOkTQqJxxfj6uoSowyN1sJlR9lkSzpFR
	 FmBcPFNIRQeR7iktkkcWn3bad9AhF+ptjDuUD5M5vdsm5rF1M63PL0l+4cgmg2VL3I
	 +ocuRwiPyyy5Anu9iCDjJLIFL6tUHqJsahR3B2fQ=
Date: Mon, 6 Jul 2026 16:28:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 jhubbard@nvidia.com, joey.gouly@arm.com, keith.lucas@oracle.com,
 kevin.brodsky@arm.com, usama.anjum@collabora.com, yury.khrustalev@arm.com,
 zwisler@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, hongfu.li@linux.dev
Subject: Re: [PATCH v10 0/6] selftests/mm: refactor pkey helpers and fix
 mmap error handling
Message-Id: <20260706162841.b34d9bc1ba1aaa4be4f6254e@linux-foundation.org>
In-Reply-To: <20260706081600.3570203-1-lihongfu@kylinos.cn>
References: <20260706081600.3570203-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Jul 2026 16:15:54 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and
> per-test tracing for consistent diagnostics, and add missing mmap() return
> checks with MAP_FAILED used throughout for readability and consistency.

Thanks, I've updated mm.git to this version.

> v10:
> - Add patch 6/6 to fix a pre-existing cleartid race: remove unused
>   settid/cleartid clone flags and wait for the clone child to exit in
>   the sigsegv test.

Below is how v10 altered mm.git.  As you mentioned, this is all from
the addition of [patch 6/6].

btw, I thought the official way to wait for a child thread to exit is
pthread_join()?  Why is that sched_yield() loop used?


 tools/testing/selftests/mm/pkey_sighandler_tests.c |   20 ++++++-----
 1 file changed, 12 insertions(+), 8 deletions(-)

--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c~b
+++ a/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -290,7 +290,6 @@ static void test_sigsegv_handler_with_di
 	static stack_t sigstack;
 	void *stack;
 	int pkey;
-	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
 	long ret;
@@ -330,11 +329,10 @@ static void test_sigsegv_handler_with_di
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			CLONE_DETACHED,
 			stack + STACK_SIZE,
-			&parent_pid,
-			&child_pid);
+			NULL,
+			NULL);
 
 	if (ret < 0) {
 		errno = -ret;
@@ -344,11 +342,19 @@ static void test_sigsegv_handler_with_di
 		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
 	}
 
+	child_pid = ret;
+
 	pthread_mutex_lock(&mutex);
 	while (siginfo.si_signo == 0)
 		pthread_cond_wait(&cond, &mutex);
 	pthread_mutex_unlock(&mutex);
 
+	/* Wait for child to exit before returning */
+	do {
+		sched_yield();
+		ret = syscall_raw(SYS_tkill, child_pid, 0, 0, 0, 0, 0);
+	} while (ret != -ESRCH && ret != -EINVAL);
+
 	ksft_test_result(siginfo.si_signo == SIGSEGV &&
 			 siginfo.si_code == SEGV_MAPERR &&
 			 siginfo.si_addr == NULL,
@@ -445,7 +451,6 @@ static void test_pkru_sigreturn(void)
 	static stack_t sigstack;
 	void *stack;
 	int pkey;
-	int parent_pid = 0;
 	int child_pid = 0;
 	u64 pkey_reg;
 	long ret;
@@ -504,11 +509,10 @@ static void test_pkru_sigreturn(void)
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
 			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
 			CLONE_DETACHED,
 			stack + STACK_SIZE,
-			&parent_pid,
-			&child_pid);
+			NULL,
+			NULL);
 
 	if (ret < 0) {
 		errno = -ret;
_

