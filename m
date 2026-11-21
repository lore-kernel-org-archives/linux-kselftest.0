Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795230851;
	b=r7Ug1yCaon9sf+PfBgGbY+IQerbch+C9ptmtF+pKveo29C2kNh09cqRCBjqxw+H7jJ9X
	 6nLBfLk7ZDS3VFS2+Y52SjT9LvpDQt3ZEjqYCMdP8RaQcZqDb4OaqIj9dQCwFV+gwbmNb
	 pXKHVOlUf/Xs1zf8IDFs3JAf6ezGyCDVteCqSyPifwvvHzZ6m/A32nKP2rWAfk9q2tuq4
	 8SC1zgj95xOGufI6/DQ7Rr4pp28YbCsFKfJU6fp2D4bLFjDX/LVHxKX5rl+rCM3vCXHfY
	 cMhfa0hFs6y8Hc3msc19cURPXb30xxfhTBaoqGbcWpWN0PmZL6f7DmBZiBG2h1zzd6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795230851;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=w/twyn5fL4Un2evBmHGKFGo65M7JVmRl736VHcYrZPU=;
	b=TH7RVVqnR6PsvcLghIVjHPz8D6NiQQQ5VtUi1kidzR58zkF8RXZKiqMvP748AnMIFbIq
	 yyCLFBIup3SLKGmVp/ijg+iL46g4stVebpNuD0aoXLrVHmtduXpbnobbzhx+ZF4IcI1V1
	 K6VcetHvPto5q5ZBpwfU3niynGfcnLf/LzqhNqkZJrsAN1tZ3hYsIgCQ1tv7aiMmDwBmI
	 IKIQ701sqSyRN2tiePT4J4fn+ucfeQh6mK5yYfLs0c/rwu3nBcFbJSaD37LkU+rNKn7qf
	 iICjWwyXK0fhoPYhFdQUjwQvdzv5RMzUeqKhpWxbXl+yka2HLn7cH/IMkx0bW7hdWPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KZBrqnmM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA7A606A68C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 03:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA7A606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KZBrqnmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795230847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w/twyn5fL4Un2evBmHGKFGo65M7JVmRl736VHcYrZPU=;
	b=KZBrqnmMG4Zk8eIzOsc1WsfR18pGvC0SgDVScrlD0XLI/L75y3drunnmp6rqTQKzYaKSk8
	HvIxQkoPgp2nerm9HvfDIZ6Sq+04fb4veD1UTzsE80S06Brsv65wYRGHWxxRrUsOue77kD
	+ng+YQa0Vh+wAIAGL1BgKNpFJt+CBZA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-MXA2E3_bPqS-dh1paShKgQ-1; Sat,
 21 Nov 2026 03:14:05 +0000
X-MC-Unique: MXA2E3_bPqS-dh1paShKgQ-1
X-Mimecast-MFC-AGG-ID: MXA2E3_bPqS-dh1paShKgQ_1795230842
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56AD0195608B;
	Sat, 21 Nov 2026 03:14:01 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 517701956087;
	Sat, 21 Nov 2026 03:13:56 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ridong Chen <ridong.chen@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next 0/3] Skip boot CPU or don't allow it from being used in isolcpus and isolated partitions
Date: Fri, 20 Nov 2026 22:13:26 -0500
Message-ID: <20261121031329.240177-1-longman@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

It is reported that having CPU 0 being domain isolated can cause
problems in the some kernel subystems which don't take into account
that the boot CPU (CPU 0) may not be a HK_TYPE_DOMAIN housekeeping CPU.
As a result, it makes sense to just disallow CPU 0 from being used
in the isolcpus=domain boot parameter as well as in cpuset isolated
partitions instead of trying to fix the problems when they show up.

The first patch fixes the inconsistency problems between
tick_nohz_full_mask and HK_TYPE_KERNEL_NOISE cpumask.

The second patch removes the boot CPU from the isolcpus=domain parameter
if set.

The third patch disallows isolated partitions from being created if CPU 0
is specified in its effective exclusive cpumask.

Waiman Long (3):
  tick/sched: Make tick_nohz_full_mask and HK_TYPE_KERNEL_NOISE cpumask
    consistent
  sched/isolation: Forbid the boot CPU from being isolated
  cgroup/cpuset: Disallow CPU 0 from being used in isolated partition

 Documentation/admin-guide/cgroup-v2.rst       |  1 +
 .../admin-guide/kernel-parameters.txt         |  7 +--
 include/linux/sched/isolation.h               |  2 +
 kernel/cgroup/cpuset-internal.h               |  1 +
 kernel/cgroup/cpuset.c                        |  6 +++
 kernel/sched/isolation.c                      | 31 ++++++++++---
 kernel/time/tick-sched.c                      |  8 +++-
 .../selftests/cgroup/test_cpuset_prs.sh       | 43 ++++++++++++-------
 8 files changed, 74 insertions(+), 25 deletions(-)

-- 
2.56.1

