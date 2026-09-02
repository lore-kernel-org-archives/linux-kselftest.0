Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C99442393
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344799; cv=none; b=QBg1nObQXuDL9DyEdrUqhtMabr0Hzi0o9OUaHPU7s7x+oM7WBdgqPrai93wg326Crnrleea6b/PPcBqObuFdYZmWWM/tsGLXn8kK7GtVItGCQPWgO3nb8pI4zGjI3PI46mBh5v7EXHVjUoo4wIpGr7lrWlg4HihvekbpE16mS2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344799; c=relaxed/simple;
	bh=ozjvIvUOcuwBj9pLnU9tq8iGZAyk8kJZnCt29NmdDpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s93/NSE91vSDVfgD8rMtcQWDQV7yUIFqKmHjgsgHDjzA88y+7LiR0qT1vQ6UVqBKIo4ffoKrGzkQgxt8m5SEeAgVK5YHytlI1uwopYRyRrJAhjhFK1+sRHL7gttqD02cLHmSuXDPFut1mEhNHzsd1C4J5IPBpvF9eb7zNgAC9YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eYkspwWq; arc=none smtp.client-ip=95.215.58.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eYkspwWq"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ozjvIvUOcuwBj9pLnU9tq8iGZAyk8kJZnCt29NmdDpg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788344795; v=1; x=1788949595;
 b=eYkspwWqOW4JBB/adHyzePuKUD25BpUqes+iGfQPVBoPzmIkT7Rl600vOhxi2UMb9SDgeGkP
 uU2RPkYOUXqkXqNKfQaeCykkCfvhir1QlLtBVjYQY+wzCzMO0sVWhR6nfUK3V5hdzjn4ZLWm/H7
 JsTgTG7hxzDVd3TidpMFVLhs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52c2f6c04a87ca4d;
	Wed, 02 Sep 2026 10:26:25 +0000
X-Mizu-Trace-ID: 52c2f6c04a87ca4d
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: cgroups@vger.kernel.org,
	longman@redhat.com,
	ridong.chen@linux.dev
Cc: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>
Subject: [PATCH v3 0/7] cgroup/cpuset: Fix partition type transitions
Date: Wed,  2 Sep 2026 18:26:08 +0800
Message-ID: <20260902102615.79189-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several partition type-change and validation paths use effective_xcpus,
which also includes CPUs assigned to valid child partitions. As a result,
changing a parent between root and isolated can alter a child's isolation
accounting or fail housekeeping validation because of CPUs the parent does
not own.

A proposed parent CPU mask needs different treatment for children which
would become invalid under that mask. Their CPUs return to the parent and
must participate in housekeeping validation. Otherwise a parent can pass
validation with a boot-isolated CPU hidden behind a child which is about
to become invalid.

There are two related failure paths. Returning the last housekeeping CPU
from a root child to an isolated parent must invalidate the appropriate
isolated ancestor. Also, a root/isolated type change which fails
housekeeping validation must release the partition's CPUs instead of
leaving them unavailable to the owner of the invalidated subtree.

Factor out the child partition validity checks and reuse them when
computing the CPUs owned directly by a partition under a proposed
configuration. Use the directly owned CPUs for root/isolated type-change
accounting and housekeeping validation, handle the last-housekeeping-CPU
return case, and run the normal partition-disable path after a failed
type-change validation. Add focused selftests for each case.

This is based on cgroup/for-7.3-fixes (3f4b7d1a49c5 "selftests/cgroup:
test clone3() into a previously killed cgroup").

Testing:

- Ran tools/testing/selftests/cgroup/test_cpuset_prs.sh with
  isolcpus=domain,15; all applicable tests passed.
- Ran the housekeeping CPU-return tests with
  nohz_full=1-14 isolcpus=domain,15; both cases passed.

Changes in v3:

- factor the child partition validity rules into a preparatory patch and
  reuse them for trial ownership calculation;
- during trial validation, subtract only children which remain valid under
  the proposed parent CPU mask, covering both PERR_INVCPUS and PERR_NOCPUS;
- keep cs->effective_xcpus as the default isolation-accounting mask and
  use the directly owned mask only for a successful root/isolated type
  change;
- use an isolated child for the boot-isolated trial-validation tests, as a
  root child containing that CPU fails immediately with PERR_HKEEPING;
- make the isolated-ancestor walk safe when it reaches the top cpuset and
  clarify the member-transition handling;
- clean up nested housekeeping-return test cgroups on failure.

Link: https://lore.kernel.org/all/20260828095643.13395-1-guopeng.zhang@linux.dev/

Changes in v2:

- split the type-transition fixes from the original series;
- merge the child-owned accounting and validation changes;
- validate trial CPU masks against CPUs owned directly by the partition;
- handle a root child returning the last housekeeping CPU, including
  nested isolated ancestors;
- use the common partition-disable path after type-change validation
  failure;
- initialize boot-isolated CPU data during selftest setup;
- split the accounting, child-owned validation and housekeeping-return
  tests.

Link: https://lore.kernel.org/all/20260820124202.517160-1-guopeng.zhang@linux.dev/

Guopeng Zhang (7):
  cgroup/cpuset: Factor out child partition validation
  cgroup/cpuset: Account for child CPU ownership in partition changes
  selftests/cgroup: Add tests for type-change isolation accounting
  selftests/cgroup: Test child CPU ownership in partition changes
  selftests/cgroup: Add tests for housekeeping CPU return to isolated
    parents
  cgroup/cpuset: Release CPUs when type-change validation fails
  selftests/cgroup: Add CPU release tests for type-change validation
    failures

 kernel/cgroup/cpuset.c                        | 182 +++++++-
 .../selftests/cgroup/test_cpuset_prs.sh       | 430 +++++++++++++++++-
 2 files changed, 588 insertions(+), 24 deletions(-)


base-commit: 3f4b7d1a49c5c826f3be9b684313eea5b83ac232
-- 
2.43.0
