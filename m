Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6F37B032;
	Sun, 13 Sep 2026 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308713; cv=none; b=mpA+pELk7/ZL4dbVj9l69Y0zl1fWbPbIBNMyDHZ7hiOi9ZIBkbGtMIyAqRXewF+NVr50VCxAa2axaZ1Jv+xdE+As6r9/zNQQiXu8k4HNOy1bJl+WzJJvPsLxsFTb3ekvvztbS2KV64/d/NdgQ2vns3U+8H+HT1DvaTqkXk7DNiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308713; c=relaxed/simple;
	bh=bu6Rg4YrHsSRCyWKswA27ChvB4JUjj0FSNNhXejMwUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EKIPbejkLDO2WI6jM+Y1nx5pg9HkIT/kdU4DN7cI3cu6mYDHC2RDUAB/OaKSRGtQQ0Us1FDRc608wxz2OSpbxZBIaXnCRtuMI1tYYp2cT020kgOhMiRDZuHFxm4YctJ1MslBeyOgjxNgYQWPz9OATopOn/tdDlnU0uv9mW4zkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ou5bgNqT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ou5bgNqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=xP
	trID/RTdS+PtkN66L01jdWtKExkIpdFh9HL97GbN0=; b=Ou5bgNqTHh/SiGEGyX
	5u7LtYqGtTzukHBAdERlcpbBcw5ir+2jKQGxaBdvOGfHGJTMhhJSZeMqmoScflLl
	YFS/D6XL2HkDfFQBUuHIgoNde6PxrIZt1yGXEMuC5vKe7U33NhRT/iil/ZO51ixF
	HpznYK/kRKI4+pq7wR0UqIS/Y=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnz43grqZqRCm2AQ--.65115S2;
	Sun, 13 Sep 2026 22:10:41 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2 0/2] sched/core: Handle unavailable pointer hash in PR_SCHED_CORE_GET
Date: Sun, 13 Sep 2026 23:10:38 +0900
Message-ID: <20260913141040.2338964-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnz43grqZqRCm2AQ--.65115S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7Ar47Gw4DCr4kuw4UJwb_yoW8tw4xpF
	Z3W398Kr4kKF1rGws7Jw4UXryrurs3CF4UWr4UJry7Aw4YvrW0vw1IkFW2qF1UCFWvqw4Y
	kry2va9I9a4qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piCPfPUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQIoh2qmruJIlwAA3z

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

Testing on x86_64:

  - An entropy-starved early-boot QEMU reproducer observed on the
    unfixed kernel:

        CREATE ret=0 errno=0 (Success)
        GET ret=0 errno=0 (Success) cookie=0x0000000000000000

    With patch 1, the same probe returned:

        GET ret=-1 errno=16 (Device or resource busy)

  - The selftest built successfully with:

        make -C tools/testing/selftests/sched -j12

  - With PR_SCHED_CORE_GET fault-injected to return EBUSY, the v1
    selftest continued evaluating cookie assertions using the error
    sentinel and finished with 5 failures. The v2 selftest instead
    aborted without evaluating cookie assertions after the failed GET.

  - The v2 selftest passed with normal random initialization:
    SUCCESS !!!

Changes since v1:
- Patch 1 is unchanged.
- Keep the PR_SCHED_CORE_GET status separate from the returned cookie.
- Abort after an unrecoverable or timed-out GET instead of comparing an
  error sentinel as a valid cookie.
- Return cookie values directly from the fatal error helper to keep the
  selftest comparisons compact.
- Avoid sleeping after the final retry.
- Rebased onto 2f0c1cf72f46.

v1: https://lore.kernel.org/all/20260913063439.1513107-1-sh_def@163.com/

Hui Su (2):
  sched/core: Propagate pointer hash errors from PR_SCHED_CORE_GET
  selftests/sched: Retry PR_SCHED_CORE_GET on EBUSY

 kernel/sched/core_sched.c                     |  5 +-
 tools/testing/selftests/sched/cs_prctl_test.c | 93 +++++++++++++------
 2 files changed, 66 insertions(+), 32 deletions(-)


base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
-- 
2.55.0

