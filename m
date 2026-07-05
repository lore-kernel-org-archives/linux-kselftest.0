Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCAA18BBAE;
	Sun,  5 Jul 2026 20:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783284502; cv=none; b=qMYOw6uWA6t5ZkwDvHRcBCvtMQHLLsgIrgP1R912YaPJp9Y+K7cYj3mYHr+tPpxD+9YRuxgwDBgEXD+8oQQL7y8R7c12R5QfUFjacg0icWNrJpkrU/qabSdFDPPWTeB4Wzv8RnOdZ+ElJhBScNu4G6VUl6ap2e8oCMMmqPGQQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783284502; c=relaxed/simple;
	bh=VtpLc/+EJwl7cvpisYHaQsi+9fOMmLGNXZLAwgHhtUw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qaYDJB8p0qnGfQxqsiii5L3B8JSeLUZGVQULGtANwtXheKxrnv1hjYR2I2Ga0WPhv9hdeCSJu431U6zIM4CtH4UTqu5lsfVm4cgVwz1D9+mAJZJekmPXeD8a1ISRUd9GXdcuN9NIwPmncQD0OI8WlRHX+6jqeFkDfnIAoIAgXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aYuX+2ZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aYuX+2ZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D7F1F000E9;
	Sun,  5 Jul 2026 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783284500;
	bh=qqf23XiVeF7E6IoPTpK7HKahKDWobW5oehZgHKt5vFE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aYuX+2ZOPOZFALiltW8zNgEUGECOVLI+5MHUXK+ZduK/0uGZivRyZ38HaaZ+em3Sj
	 B2I81V9AabL9RkcM1CmYlg2XcIBpVBOugSvAhT/rdlVbw3rn5r7hdtKymbTJK0GUPD
	 zzRcW76UEZfHhXOb6lU3Y0wlp7ZY8ps7B3MjOb8c=
Date: Sun, 5 Jul 2026 13:48:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, jhubbard@nvidia.com, joey.gouly@arm.com,
 keith.lucas@oracle.com, kevin.brodsky@arm.com, usama.anjum@collabora.com,
 yury.khrustalev@arm.com, zwisler@google.com, hongfu.li@linux.dev
Subject: Re: [PATCH v9 0/5] selftests/mm: refactor pkey helpers and fix mmap
 error handling
Message-Id: <20260705134819.871dbf41d2b06681f0facf12@linux-foundation.org>
In-Reply-To: <20260702062332.911786-1-lihongfu@kylinos.cn>
References: <20260702062332.911786-1-lihongfu@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Jul 2026 14:23:27 +0800 Hongfu Li <lihongfu@kylinos.cn> wrote:

> The main changes in this series are to refactor shared tracing and assertion
> helpers into a common file, unify both pkey selftests on pkey_assert() and
> per-test tracing for consistent diagnostics, and add missing mmap() return
> checks with MAP_FAILED used throughout for readability and consistency.

Updated, thanks.

AI review might have found a pre-existing thing:
	https://sashiko.dev/#/patchset/20260702062332.911786-1-lihongfu@kylinos.cn

> v9:
> - In patch 1/5, define test_nr, iteration_nr and dprint_in_signal in
>   pkey_util.c and remove them from protection_keys.c and
>   pkey_sighandler_tests.c.
> - In patch 1/5, cat_into_file() used the wrong argument in the open()
>   failure message; print file instead of str. Update the commit message
>   accordingly.
> - In patch 2/5, align clone_raw() continuation lines to the opening parenthesis.
> - In patch 5/5, set errno from pthread_create() return value before
>   pkey_assert(0) on thread creation failure.
> - Add Acked-by, Reviewed-by and Tested-by tags to each patch.

Here's how v9 altered mm.git:

 tools/testing/selftests/mm/pkey_sighandler_tests.c |   38 +++++------
 tools/testing/selftests/mm/pkey_util.c             |    6 +
 tools/testing/selftests/mm/protection_keys.c       |    4 -
 3 files changed, 25 insertions(+), 23 deletions(-)

--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c~b
+++ a/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -35,10 +35,6 @@ static pthread_mutex_t mutex = PTHREAD_M
 static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
 static siginfo_t siginfo = {0};
 
-int iteration_nr = 1;
-int test_nr;
-int dprint_in_signal;
-
 /*
  * We need to use inline assembly instead of glibc's syscall because glibc's
  * syscall will attempt to access the PLT in order to call a library function
@@ -225,7 +221,10 @@ static void test_sigsegv_handler_with_pk
 	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
 
 	ret = pthread_create(&thr, &attr, thread_segv_with_pkey0_disabled, NULL);
-	pkey_assert(ret == 0);
+	if (ret) {
+		errno = ret;
+		pkey_assert(0);
+	}
 
 	pthread_mutex_lock(&mutex);
 	while (siginfo.si_signo == 0)
@@ -265,7 +264,10 @@ static void test_sigsegv_handler_cannot_
 	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
 
 	ret = pthread_create(&thr, &attr, thread_segv_pkuerr_stack, NULL);
-	pkey_assert(ret == 0);
+	if (ret) {
+		errno = ret;
+		pkey_assert(0);
+	}
 
 	pthread_mutex_lock(&mutex);
 	while (siginfo.si_signo == 0)
@@ -327,12 +329,12 @@ static void test_sigsegv_handler_with_di
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
-			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
-			     CLONE_DETACHED,
-			     stack + STACK_SIZE,
-			     &parent_pid,
-			     &child_pid);
+			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
+			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
+			CLONE_DETACHED,
+			stack + STACK_SIZE,
+			&parent_pid,
+			&child_pid);
 
 	if (ret < 0) {
 		errno = -ret;
@@ -501,12 +503,12 @@ static void test_pkru_sigreturn(void)
 
 	/* Use clone to avoid newer glibcs using rseq on new threads */
 	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
-			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
-			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
-			     CLONE_DETACHED,
-			     stack + STACK_SIZE,
-			     &parent_pid,
-			     &child_pid);
+			CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
+			CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
+			CLONE_DETACHED,
+			stack + STACK_SIZE,
+			&parent_pid,
+			&child_pid);
 
 	if (ret < 0) {
 		errno = -ret;
--- a/tools/testing/selftests/mm/pkey_util.c~b
+++ a/tools/testing/selftests/mm/pkey_util.c
@@ -8,6 +8,10 @@
 
 #include "pkey-helpers.h"
 
+int iteration_nr = 1;
+int test_nr;
+int dprint_in_signal;
+
 #if CONTROL_TRACING > 0
 static void cat_into_file(char *str, char *file)
 {
@@ -20,7 +24,7 @@ static void cat_into_file(char *str, cha
 	 * pkey_assert()
 	 */
 	if (fd < 0) {
-		fprintf(stderr, "error opening '%s'\n", str);
+		fprintf(stderr, "error opening '%s'\n", file);
 		perror("error: ");
 		exit(__LINE__);
 	}
--- a/tools/testing/selftests/mm/protection_keys.c~b
+++ a/tools/testing/selftests/mm/protection_keys.c
@@ -49,11 +49,7 @@
 #include "hugepage_settings.h"
 #include "pkey-helpers.h"
 
-int iteration_nr = 1;
-int test_nr;
-
 u64 shadow_pkey_reg;
-int dprint_in_signal;
 
 noinline int read_ptr(int *ptr)
 {
_

