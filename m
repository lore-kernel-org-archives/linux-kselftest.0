Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5E328B67
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193839; cv=none; b=W6f9Bq6yQUdBIC7qGASqJR4VpU1AaPlPKjJ5+ieKEknMdQ8H64Ww9mj5SI23ib+0y5wTLe9YqqSkhDs2oFhyLv3qgUr/CRIxw7SfXq+WEPUq+33NanndcsEkK7alQFVRzuyDERJ9IgHRQ+CKoHDmp+BxdIXhUMM2Pk52OZWZF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193839; c=relaxed/simple;
	bh=hk+HgeaWC2H+1pqbZ0fdQK7UyFkAMAOtkoqO9ns0pmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q36/pNrXEmtkd+LfewHtsClDkRHphNucDIC43ZS59Y+Fuf85dGjNIgcp85XylkrGs9aLaSVOCTiiGtEfCLL7NFYpnbp1c5eZHY4xZuQ27I3cQy4lTqY1rmcumdji4GUwwMem1TdZy7Mzhnhnv1c0HFLUX1eEEXIbH9NIzHMK0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWqVg79D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWqVg79D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772193837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SzJWcWsW4AQY0Ow0DI3RPlgohp0HYyfHWeugLHPcRG8=;
	b=CWqVg79DNxp3Hv16Gc2RH+zg/i8H1vE6m5jNUDWNjh2i89TRQAiTuNwsntTj0p406vFrMt
	sqzelfLFSpYtemp+5D+K8lkiJaQs6Pcm6klnEMzHvfcQJv8/kEZTi/pdvOTeEIa5x0zp+A
	e0xUmnPpFtsDlRxLqh3Lp3e6GgQ8dDs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-DPs_LF9INQm7yzIXJqq6_A-1; Fri,
 27 Feb 2026 07:03:54 -0500
X-MC-Unique: DPs_LF9INQm7yzIXJqq6_A-1
X-Mimecast-MFC-AGG-ID: DPs_LF9INQm7yzIXJqq6_A_1772193831
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AA1A180034D;
	Fri, 27 Feb 2026 12:03:51 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6CEDE1956053;
	Fri, 27 Feb 2026 12:03:43 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 27 Feb 2026 13:03:50 +0100 (CET)
Date: Fri, 27 Feb 2026 13:03:41 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>,
	Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: [PATCH 1/2] pid: make sub-init creation retryable
Message-ID: <aaGIHa7vGdwhEc_D@redhat.com>
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com>
 <aaGHu3ixbw9Y7kFj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaGHu3ixbw9Y7kFj@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Currently we allow only one attempt to create init in a new namespace.
If the first fork() fails after alloc_pid() succeeds, free_pid() clears
PIDNS_ADDING and thus disables further PID allocations.

Nowadays this looks like an unnecessary limitation. The original reason
to handle "case PIDNS_ADDING" in free_pid() is gone, most probably after
commit 69879c01a0c3 ("proc: Remove the now unnecessary internal mount of
proc").

Change free_pid() to keep ns->pid_allocated == PIDNS_ADDING, and change
alloc_pid() to reset the cursor early, right after taking pidmap_lock.

Test-case:

	#define _GNU_SOURCE
	#include <linux/sched.h>
	#include <sys/syscall.h>
	#include <sys/wait.h>
	#include <assert.h>
	#include <sched.h>
	#include <errno.h>

	int main(void)
	{
		struct clone_args args = {
			.exit_signal = SIGCHLD,
			.flags	= CLONE_PIDFD,
			.pidfd	= 0,
		};
		unsigned long pidfd;
		int pid;

		assert(unshare(CLONE_NEWPID) == 0);

		pid = syscall(__NR_clone3, &args, sizeof(args));
		assert(pid == -1 && errno == EFAULT);

		args.pidfd = (unsigned long)&pidfd;
		pid = syscall(__NR_clone3, &args, sizeof(args));
		if (pid)
			assert(pid > 0 && wait(NULL) == pid);
		else
			assert(getpid() == 1);

		return 0;
	}

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/pid.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index ebf013f35cb3..1a0d2ac1f4a9 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -131,9 +131,8 @@ void free_pid(struct pid *pid)
 			wake_up_process(ns->child_reaper);
 			break;
 		case PIDNS_ADDING:
-			/* Handle a fork failure of the first process */
-			WARN_ON(ns->child_reaper);
-			ns->pid_allocated = 0;
+			/* Only possible if the 1st fork fails */
+			WARN_ON(READ_ONCE(ns->child_reaper));
 			break;
 		}
 
@@ -230,6 +229,10 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 	retried_preload = false;
 	idr_preload(GFP_KERNEL);
 	spin_lock(&pidmap_lock);
+	/* For the case when the previous attempt to create init failed */
+	if (ns->pid_allocated == PIDNS_ADDING)
+		idr_set_cursor(&ns->idr, 0);
+
 	for (tmp = ns, i = ns->level; i >= 0;) {
 		int tid = set_tid[ns->level - i];
 
@@ -341,10 +344,6 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 		idr_remove(&upid->ns->idr, upid->nr);
 	}
 
-	/* On failure to allocate the first pid, reset the state */
-	if (ns->pid_allocated == PIDNS_ADDING)
-		idr_set_cursor(&ns->idr, 0);
-
 	spin_unlock(&pidmap_lock);
 	idr_preload_end();
 
-- 
2.52.0


