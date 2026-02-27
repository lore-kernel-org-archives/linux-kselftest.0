Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2173A1D1F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193878; cv=none; b=TGKuVDU1M3Ggqr0of/4eq3Z4qLhuyHosRvTsZyOAu/ENuziNyBnlULcYgj8CshjBIL7Nx+6zl7v5mSDnsPvnJVkxARl8ga2lPPWUKL1QVPI9efXedMd0Uy/13MRc/ae01nKC0LWEMGMKOklbzX25/y19+lttjPnaSWmrGiq83Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193878; c=relaxed/simple;
	bh=sMIdZ78QaHftHn0hpBEuM/jsOd+QcF1aKsiqLqIFio0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax8OJs/BunJNaoYmnQD43r5qiHcSBZWAmA0swnlXFBIifjY9l/XtpIcKJRNxg9VOPKvHiZM3j87hjt82hRwDF7kcgOdDlVI4TbfRy6FKV41Efp/1Zy4iJYs3J10L7odV5ptIxV+JiZUqZDPtIZ2MRdMBxzTO1MJRGTOr040Gzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hVUALbzj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hVUALbzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772193876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plHy0cfLp1i+DSy8czN2+D8yLtODRm8EVyinDnEIuz8=;
	b=hVUALbzjp/OgzmNGDdmMdK/ZSkDr1NE0mJEDZgbr2C7t6Jcq98FDg0uBiE74PxPQ2mi+Ov
	XpZBeoSzQk0Z4HEUzatMIxYagEg186AC/gG8BNAYY/4a89sibbS+ZXgJ1mZ3aMgidwnfUF
	vXujv3lVbGoxbAqlusD9t4E89rtFKtg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-lo8R8uNsO2KZP-PjRD9s0g-1; Fri,
 27 Feb 2026 07:04:32 -0500
X-MC-Unique: lo8R8uNsO2KZP-PjRD9s0g-1
X-Mimecast-MFC-AGG-ID: lo8R8uNsO2KZP-PjRD9s0g_1772193869
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 319AD1956050;
	Fri, 27 Feb 2026 12:04:29 +0000 (UTC)
Received: from fedora (unknown [10.44.32.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A3EF51956056;
	Fri, 27 Feb 2026 12:04:22 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 27 Feb 2026 13:04:28 +0100 (CET)
Date: Fri, 27 Feb 2026 13:04:20 +0100
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
Subject: [PATCH 2/2] pid: document the PIDNS_ADDING checks in alloc_pid() and
 copy_process()
Message-ID: <aaGIRElc78U4Er42@redhat.com>
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

Both copy_process() and alloc_pid() do the same PIDNS_ADDING check.
The reasons for these checks, and the fact that both are necessary,
are not immediately obvious. Add the comments.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/fork.c | 6 +++++-
 kernel/pid.c  | 5 +++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 544fe1b43d88..7cfa8addc080 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2392,7 +2392,11 @@ __latent_entropy struct task_struct *copy_process(
 
 	rseq_fork(p, clone_flags);
 
-	/* Don't start children in a dying pid namespace */
+	/*
+	 * If zap_pid_ns_processes() was called after alloc_pid(), the new
+	 * child missed SIGKILL.  If current is not in the same namespace,
+	 * we can't rely on fatal_signal_pending() below.
+	 */
 	if (unlikely(!(ns_of_pid(pid)->pid_allocated & PIDNS_ADDING))) {
 		retval = -ENOMEM;
 		goto bad_fork_core_free;
diff --git a/kernel/pid.c b/kernel/pid.c
index 1a0d2ac1f4a9..082a3c4a053f 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -317,6 +317,11 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *arg_set_tid,
 	 *
 	 * This can't be done earlier because we need to preserve other
 	 * error conditions.
+	 *
+	 * We need this even if copy_process() does the same check. If two
+	 * or more tasks from parent namespace try to inject a child into a
+	 * dead namespace, one of free_pid() calls from the copy_process()
+	 * error path may try to wakeup the possibly freed ns->child_reaper.
 	 */
 	retval = -ENOMEM;
 	if (unlikely(!(ns->pid_allocated & PIDNS_ADDING)))
-- 
2.52.0


