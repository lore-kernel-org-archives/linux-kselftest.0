Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABA3C1D57;
	Sun, 13 Sep 2026 06:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789281360; cv=none; b=tYNS1wI5W1/RF6J257gn6c4GTLsIGNeEPTP66zuXPqqFTirlbJqzH5UiB8wLoA8XYTf9hTJ599qvvEsstY34FdLnBgry9rxm7h+ltWN9b8KKUpQBrew7fmrOBxMNQKFm+IUudVqKRwJuhjl+gQ7luUBrekipNRUH+9CFyFRH8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789281360; c=relaxed/simple;
	bh=PAzSOwqMicxOelTOyej5FMCzcHDikvr5NmFT0NXeKH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0vmLx2FzMev7itQsZ5QZX+mMAG/oDEpiyxz0B/QHz+P8VzM4Nc2902qgYn09w2gljkBXFWsYPDXLt9pvTwkuaNozEfouIpjgOIqIL04duF3gbEgYUSjJGQR0DUb9jGb1KNA95eF9L32mx9dvlZ5CJvczs9DFjvjv4PFKaw0Qbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NyI5zfy3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NyI5zfy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ln
	TaIobcjFmWCdhJ9j5PZkw4orvgaPyBu31P3FMw5Eg=; b=NyI5zfy3mO2sTaXLbN
	hxdiC9RQ6cRc/PA9R6TYalXNxEuxZlhuDNW6fq6IhOK/RlyFE5iPfQHO4kcCZPze
	OJGYccnjzvytIhng8kTsQD/cAH+BT4bVOuc+kI4RtHzVm3m3GXSa1ngCcyWsBeUy
	xBNwY1/ZGTLLoRIhArGNibjuM=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3_zT_Q6Zq3b5+AQ--.48944S2;
	Sun, 13 Sep 2026 14:34:40 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	shuah@kernel.org,
	chris.hyser@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sh_def@163.com
Subject: [PATCH v1 0/2] sched/core: Handle unavailable pointer hash in PR_SCHED_CORE_GET
Date: Sun, 13 Sep 2026 15:34:37 +0900
Message-ID: <20260913063439.1513107-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_zT_Q6Zq3b5+AQ--.48944S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7Ar47Gw4DCr4kuw4UJwb_yoW8Wr4xpF
	Z3Wa98KrWkKFW8Krs3Xw48tF1rur4fCF1UJr1rWF93Aw4rtrWjvw1IkFy2gF1xCrWvv3yY
	kr12va909rWDAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQJ57UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QBVtGqmRABu0QAA3-

PR_SCHED_CORE_GET converts the internal core scheduling cookie to an
opaque userspace value with ptr_to_hashval().

When the pointer hash key is not initialized yet, ptr_to_hashval()
returns -EBUSY without storing a hash. PR_SCHED_CORE_GET currently
ignores this error and returns the zero-initialized id instead. Since
cookie 0 denotes the default core scheduling cookie, this reports
incorrect state to userspace.

Propagate the hashing error and make the scheduler selftest retry the
transient EBUSY. Do not wait for RNG initialization in
PR_SCHED_CORE_GET; ptr_to_hashval() already reports an unavailable
pointer hash key as -EBUSY, so propagate that condition through the
prctl interface.

Testing on x86_64 QEMU reproduced the bug during an entropy-starved
early boot:

  Before:
    CREATE ret=0 errno=0 (Success)
    GET ret=0 errno=0 (Success) cookie=0x0000000000000000

  After patch 1:
    CREATE ret=0 errno=0 (Success)
    GET ret=-1 errno=16 (Device or resource busy)

The unfixed cs_prctl_test failed seven cookie assertions in the same
setup. With normal random initialization, the fixed kernel and updated
selftest completed successfully:

    SUCCESS !!!
    TEST_RESULT=PASS

Hui Su (2):
  sched/core: Propagate pointer hash errors from PR_SCHED_CORE_GET
  selftests/sched: Retry PR_SCHED_CORE_GET on EBUSY

 kernel/sched/core_sched.c                     |  5 ++--
 tools/testing/selftests/sched/cs_prctl_test.c | 27 ++++++++++++++-----
 2 files changed, 23 insertions(+), 9 deletions(-)


base-commit: cba2348ab114391f5b1a00fa65c5b739f13f0563
-- 
2.55.0

