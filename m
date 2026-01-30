Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EB433858F
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769787797; cv=none; b=bAbWfl5sevhc/TXm7HcwQNl+D/eEIWl4Gm9BftsCwh1BMFeK7zlfjtQvTM2PKABTwfWp3CXyngkUS6mb+6KbtNa1SjigSMp49FIMjFzxOy2xyJZo9h14vXwzFWIYGeShbDKWxafDkg6z7N9cRoHHXg8d2Oo0MLusWJ8m8O/aOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769787797; c=relaxed/simple;
	bh=SsFmLSHb5J0NAZ23lFisSmeBgg/BtjqNTQyLl+86f48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kApjTwOaCEo5VaOUaX7fDeES7jufYcAp6Z9HY8Rb2+3h+MGv3BwZh+KOMhZ3NZACiYWAUKkkNuwdQbyo53oKO1wywfEffuh/RrfAEgiN4gBP1F1fk66HCEEnOrp4uzSgsFeRutY1hY5S4j2ljuAMn7pRLYRW4CyewPoBDezW40g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHkJpFw4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHkJpFw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769787795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyKTkxtjGkkJponhc08CCVmlm33pThZT+VVBZCTwDCU=;
	b=YHkJpFw4NGL47Xdt5n4Cw5htSbizBEiNtw38TosH8hRdGONL78GvP1g8ASsmW7bkaUTl+t
	qVAxX7eEOea4GcsvODi69St3yAxbbgk5Xmc4GYvrC8TvPOkNU+InpU5QXzSk+XiFip/y51
	SilUD4aRs5vKWnNPEv2eWpxfxgTclf0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-dZiaz88dNVmGDxjgHBSjTA-1; Fri,
 30 Jan 2026 10:43:11 -0500
X-MC-Unique: dZiaz88dNVmGDxjgHBSjTA-1
X-Mimecast-MFC-AGG-ID: dZiaz88dNVmGDxjgHBSjTA_1769787789
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09C031954204;
	Fri, 30 Jan 2026 15:43:09 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.81.137])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9A001180009E;
	Fri, 30 Jan 2026 15:43:05 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Chen Ridong <chenridong@huaweicloud.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH/for-next v2 0/2] cgroup/cpuset: Fix partition related locking issues
Date: Fri, 30 Jan 2026 10:42:52 -0500
Message-ID: <20260130154254.1422113-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

 v2:
  - Change patch 1 to use workqueue instead of task run as it is a
    per-cpu kthread that performs the cpuset shutdown and bringup work.
  - Simplify and streamline some of the code.

After booting the latest cgroup for-next debug kernel with the latest
cgroup changes as well as Federic's "cpuset/isolation: Honour kthreads
preferred affinity" patch series [1] merged on top and running the
test-cpuset-prs.sh test, a circular locking dependency lockdep splat
was reported. See patch 2 for details.

The following changes are made to resolve this locking problem.
 1) Deferring calling housekeeping_update() from CPU hotplug to workqueue
 2) Release cpus_read_lock before calling housekeeping_update()

With these changes, the cpuset test ran to completion with no failure
and no lockdep splat.

[1] https://lore.kernel.org/lkml/20260125224541.50226-1-frederic@kernel.org/

Waiman Long (2):
  cgroup/cpuset: Defer housekeeping_update() call from CPU hotplug to
    workqueue
  cgroup/cpuset: Introduce a new top level cpuset_top_mutex

 kernel/cgroup/cpuset.c                        | 124 ++++++++++++++----
 kernel/sched/isolation.c                      |   4 +-
 kernel/time/timer_migration.c                 |   3 +-
 .../selftests/cgroup/test_cpuset_prs.sh       |  13 +-
 4 files changed, 107 insertions(+), 37 deletions(-)

-- 
2.52.0

