Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4086E366567
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 05:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401919; cv=none; b=bx3BZ9Lz8WzGNG9AVuoaHVoQ2JsoMRdiidqjx1JX0LfvBe0sSYhtxvLlQsBy0VbpNZ1XSlmfa3zOv20HAgFnDzKf4zpnFraoa7u9qzIbDm0eQv1TyNfDQNn9jUAUaIOWwwiQyFNl33bp5sHDJLB0JbsSTArRzU6nxiCN4IpquzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401919; c=relaxed/simple;
	bh=9RXKOWZdfkg5EyFwqm8qaMXGUne5S50EBQ/ThlsAPSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJT5z7oTzx3bl2cI+WCKyc6jvWJb7zodq49hYBcvYc4YrXEPgsfMaGQOvqfQnUGdQZuNK2Omdl7heCWTLqsvskQxuce9UVbNwJylPfSY0RFgo/MrKfbYe95isiZOzuA5v0kMHHbPSxRMgSemt4tGB7OzBRNYMzaKVdBS8486eiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbnMnVe5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbnMnVe5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so880592f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401916; x=1791006716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuKCG/8Yq7XE4kptDjfwqIDbhWjCk5cWtvEdVchH9Gg=;
        b=MbnMnVe5wQtZuWkfL2YrIkxta8viJ0lQkq3RhrcogMZ17MBJkZR/WpBv2lSE5rJZhx
         6j3Rxt7YceHCpjbQ+w55i22EJAzFxE14ONUyE7j8pjZ+eiSH1K6RE6cjec+XZBWTJ48M
         xt1iDZxnqZt7SCxUH8kNOBPzDD+K6jQ/IF7dIhmxqK7fkLDd5LNDJQd9aCtOC0gkFQ1x
         IibdhTAFLLgSPNuMh5U2FWw6UlM565yAvMBW87OIAOx7/jeA3HDKBcWJWw1RzbwR/scp
         IZnFgQwsGcWNQmjZ343s4qHQr7ZCQEuGioTPhzu9oldATgxt+ZeQA5LJDS4d7zuYq67b
         dWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401916; x=1791006716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuKCG/8Yq7XE4kptDjfwqIDbhWjCk5cWtvEdVchH9Gg=;
        b=Zj+4lx0UMR5GJtsT1j2g1cJpFm3pDVHKcKcq1I2siLTvZcyzFA4EL4chXI2xmbBlBC
         RO7WrAvhwWw2UHehTK1hX/S5xpNG31gYdaCeUxBLnLq/3aGACuffh+yVP3EwAKR1JcEe
         i1G/LB/KWZPJUadU5WL3jznYZPyaarYcVii3NrHE6qNqklaytFrIWYSZCmgs9R5PgIt1
         sH0nMUl6Pm7FWJVOmJntb7ZuKEX69aNCbZcMbKmqiLDBnG1shG57HEYjuJhwcOFQf/ds
         FQzgk++j7p0E54UA82+LIONqQDPulRAntymhKNWVmp//vqj0cDzqpLnh4rolCTQiqrx4
         mO9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsfoLi90aRqfiE7Dw/hRp6RVvdf+AhKF7pNkZKHYclA8BCPKDXnusAR2hhCny6jPLFyFB0LTL36AaHHGPbyzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++miVYmR2OFJpJlhttyNqFb2ReRGCOqofRJ/vMBxdpA6sRuZ6sUs
	cfkTVoBKl7z2/Qu3plpufKJTR45kQyie4KkjRgf3iuFCN6GhL6CB/80W
X-Gm-Gg: AYBFou14lKFE5bx67QGJqsBE6mNwSIBXE6YfmNr/27GkCX75ORIhOYqFkNECnStMVFd
	KQImz/otMiz3f/2Seu3htlylVlxJazPRtF7W7UtQ9+IR1occRBYc2i9QYlP+y1q+Sp247VZtN4g
	rF9V11M3J1ASs9uhLF1rlIy3wu7/X0DJueXHejkC9X5WAhn0sEgy7otyO/XpXQzqpEbuEkAl4ex
	oqzxVcJjGmxDFpRN3ibcGFCs/x9+Pb4DjCUlg2tPfPd9OJjYK60mWNo9pwIf1ukpHOq4N4wUwGc
	GRAQAvQCpyYfe/YmFjNaiQaFtsN9g0qiCf625eNFxZzml2pE1QAB1O/N6VEqd4eDmR25rxlnhQx
	tee1i97yWdwh4mpRoCuZcaywZ5lvD7ePOMCdeQlei5Bsmf5nZZpFEaDWsQrwMz1W8FKHCYNNuVe
	sWNlvLdeCqiphZK0N1mLRQNkZsfglaqZqSrfoE59uCiU7ECnU+9+y2xSZCzhgrHCpXF+QZ6agRh
	9pLjChL2SCBe8EEcy9Fbyoh91JuEFptzjv//2K/cC9i
X-Received: by 2002:a05:6000:2906:b0:487:ff1:6274 with SMTP id ffacd0b85a97d-488716b290cmr15769328f8f.7.1790401916378;
        Fri, 25 Sep 2026 22:51:56 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm12317560f8f.1.2026.09.25.22.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:51:55 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] selftests: cgroup: Report failed checks in test_memcontrol
Date: Sat, 26 Sep 2026 07:51:46 +0200
Message-ID: <20260926055152.1684-1-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_memcontrol fails intermittently, but most of its checks fail
silently, so a "not ok" line gives no indication of how far off the
measured value was. This series makes those failures print the observed
and expected values. It does not change any threshold or pass/fail
behaviour.

Patch 1 converts the terminal tolerance checks to values_close_report(),
as was done for test_cpu in commit 4cdde87d723a ("selftests: cgroup: Use
values_close_report in test_cpu"). values_close() is kept where it is a
loop or retry condition, where a mismatch is expected.

Patch 2 reports the "memory.current < 50M" check in
alloc_pagecache_50M_check(). Because test_memcg_high() calls the same
helper expecting it to fail, it gets a quiet variant. An alternative
would be to pass the flag through the currently unused void *arg of
the cg_run() callback; I am happy to switch to that if preferred.

With patch 1 applied, we observe at times failures like these:

  not ok 3 test_memcg_min
  [FAIL] actual=18722816 expected=30408704 | diff=11685888 | limit=7369725 | tolerance=15% | actual_error=23.78%

  not ok 4 test_memcg_low
  [FAIL] actual=20852736 expected=30408704 | diff=9555968 | limit=7689210 | tolerance=15% | actual_error=18.64%

  not ok 4 test_memcg_low
  [FAIL] actual=14364672 expected=22020096 | diff=7655424 | limit=7276940 | tolerance=20% | actual_error=21.04%

These are the child memory.current checks in test_memcg_protection()
(expected ~29M and ~21M). Their tolerances were already raised in commit
d2def68ae06a ("selftests: memcg: increase error tolerance of child
memory.current check in test_memcg_protection()"), and the values above
still fall outside them. In the first case the child is about 38% below
the expected 29M. This series only makes such failures visible; whether
the expectations or the tolerances should change is left for a separate
discussion.

Changes in v2:
- Patch 1: pass the measured value first in the alloc_anon_50M_check()
  values_close_report() call, so that a failure prints actual and
  expected the right way round (reported by Sashiko AI review).

v1: https://lore.kernel.org/all/20260926034923.31718-1-sebastian.chlad@suse.com/

Sebastian Chlad (2):
  selftests: cgroup: Use values_close_report in test_memcontrol
  selftests: cgroup: Report memory.current shortfall in
    alloc_pagecache_50M_check

 .../selftests/cgroup/test_memcontrol.c        | 50 +++++++++++++------
 1 file changed, 36 insertions(+), 14 deletions(-)

-- 
2.51.0

