Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770343E49E4
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892620; cv=none; b=ZrP+tJLEIxOksFmIG3ZnO0MWPki9AHbgDVjQDi5xQZpR++ctW+BDX4AbP8+IEL3TlVv5HB4WfTsp5bOGYe1hc+Qi3oFZEs1nLtnW5m9ccRh+IMiXJiDB0lH3I7y+9PaVBpdaahTArJ2gQRehKReQgkpmHgFP+3FTf5BQQNrI2OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892620; c=relaxed/simple;
	bh=BPtM18ursKNOy4ucilPGWRHn7WZh8zR1nNWIOO2KsJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sy1yD96wjMmIkEZvV+VaX/eEtxR9VJsCEAGPr2kuiXK4wpAvn9C9/LZaJd3uzMqiY7Su0GL7FwQWVNJKwdIo/ZbiWRekfi9q3MOpMisxmQSKt7HQNH8ajwabvT7IVuiZidNTUQHc+TiP0pYa4yS9BXtR9Pl6Twfvun4NT/deAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ta3I91EC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta3I91EC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1799241a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789892618; x=1790497418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtlmCytX6T9+ZhYr2chqp/AaEE/WjpDVJlGq04GYbGk=;
        b=Ta3I91ECzxkN+mVmsUED2JoOD3eK03P1acMz+IOwqDNhHc5xigKzCRbamoFs1CSpEN
         5yj+l03mjeQXRN6vNDgHIviJ9KFFH+8tm1T1WgI5ysao0CCx1kkelAobp9M5qOiaojck
         oS53T1FWi1eReHXqc60XsJhpRgQoiuPjxo0048cmyqLc7e73Q04ub0Pne1Nc3dVks3hF
         mImdaRMyOTbscSbIKL5wrPL7t/ICbungnn1vfzwlPPu+EnvadaJAbZU/LV6JyjhcjQcX
         dhtDQiySjHa+RNy0cTteq46aCg7AyBIpktxgmIYCLIE0S+TSiQDcu2F4/AOX2SqfDMjX
         GNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892618; x=1790497418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtlmCytX6T9+ZhYr2chqp/AaEE/WjpDVJlGq04GYbGk=;
        b=c6cWDnP/AD7UTTaKo5QxAg22FTjpnFEqs0cSgeh9nM+afDpFBQX+Nv4f5gvFb3PQzc
         uRGTw9qlm9AuiLxWXRJDkEG/Qj/WRz7Zsn9rt2bBnT8C6UtjiC7naq0DaBC64pMnX2XI
         C/vZ5T9V9VsOA1MO0L89hJcQ9QzDNwdKkdGDpDKkLzHXlbD8lQedl0TyQonFSarAcxoS
         H8hSB0nIpNGFC2HX4Rg2o8Bhk47ZNpkGZDAFmehhnBAX/pOUT2tTKNxz79nD1tODbMBK
         vf3dprcGFDNYLbni3WF/lKagcgA92fuPTvnkzgARg6fGIrGmTsdEnww24XhvOe9MBYcw
         j/EA==
X-Forwarded-Encrypted: i=1; AKwUvBybIw3VM/OB7UK+4iIJHt+OmU4yt+D8YrxVbe6oqkxaPt6QJpWjW35Uwf7LH57UFNFN0XflsZQXgCGLKeKujhI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/eAuPpGyYsWyPKr+VgZ2n8cA2SBYWv7PYEnN5qwQzngzvgeiN
	U/a0rmhY9KQRD7gHxtbbk9+tcMTds1RZkRk9z8IQH6h9Qu5g/DKaPevD
X-Gm-Gg: AYBFou3Dzcc/Ipm4J+ZBay8exS54fLmlhgjgbkWZY/wEBy6rtnk1wWxx7HdrTAIw4HW
	HaI2EM/NF4SJmniQqA2CL5iupH/tE4QRcf5UQKM3n6ZifUkHddILQ/9n4LTCypz5ges9i4R5SRv
	6WL6iMPtlNV9MglWqPRWR2RNif/+ryh1Gc59yHdcceWTbW+D86C6rdicpd6ubn+nOA9vle43z/E
	KV4qDejPZq6YlsX2UtJ6IzrcR09Xfv8g+jL6imxAIGaWb4H9Hot86ypcNJqnuBfP5pCDQknBvql
	Buyaa135miYmjYYPTpMLmG6nk+S5zWL22Au1mJ24Yxo4LRqFEiW3WDe9bSigmii5YfBPQLkIWYT
	CEa+8NZJOgZEBrasSqbgLfEfDyCc9pnosH5JoP+W3qe3pG3rbEG/u5q6x2yBt3rNpD1KSoF723p
	Od1tCYIQlCbWeiZ/cn2NxwvzQMn/q6IC12vWEU/6Kg97s/AjzL57vLx+1nB8tf7MeP4nPCArScN
	MpK9ZOEpDBfv1/7r16Uj0j4zGbkZOOoo2NtllCbEtLheWiTnUi/tvAHTXvWJBrlymrTTVrYY50f
	yobfndwe9bs=
X-Received: by 2002:a17:90b:2e83:b0:39e:6a81:5a95 with SMTP id 98e67ed59e1d1-39e6a815e21mr7307420a91.41.1789892617708;
        Sun, 20 Sep 2026 01:23:37 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm5635853a91.1.2026.09.20.01.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:23:37 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <guopeng.zhang@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2 2/2] cgroup/cpuset: prevent local partition activation over remote partition and sibling xcpus conflict
Date: Sun, 20 Sep 2026 08:23:35 +0000
Message-ID: <20260920082335.257680-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920082335.257680-1-benquike@gmail.com>
References: <139d9231-4723-4365-9af7-8142e6581ede@linux.dev>
 <20260920082335.257680-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6da580ec656a ("cgroup/cpuset: Don't allow creation of local
partition over a remote one") added a check in update_prstate() to reject
creating a top-level local partition whose cs->exclusive_cpus intersects
subpartitions_cpus.

However, two paths still allow overlapping exclusive CPU ownership between
a top-level local partition and a remote partition or sibling:

1. If a top-level cgroup A1 has cpuset.cpus.exclusive set, is first set to
   "root" while cpuset.cpus is empty (becoming "root invalid"), has a
   child A1/A2 enabled as a remote partition on those exclusive CPUs, and
   then receives CPUs via A1/cpuset.cpus, update_cpumasks_hier() calls
   validate_partition() without going through update_prstate(). Because
   validate_partition() does not check trialcs->exclusive_cpus against
   subpartitions_cpus, A1 transitions from "root invalid" to a valid local
   partition over the existing remote partition A1/A2 and triggers:

     WARNING: kernel/cgroup/cpuset.c:1866 at update_parent_effective_cpumask+0x54a/0x8a0

2. In cpus_excl_conflict(), when a valid local partition A1 uses implicit
   exclusive CPUs (cpuset.cpus set without cpuset.cpus.exclusive, so
   sibling->exclusive_cpus is empty while sibling->effective_xcpus is
   populated), a sibling cgroup B1 can still set cpuset.cpus.exclusive on
   the same CPUs because cpus_excl_conflict() only checks
   sibling->exclusive_cpus.

Fix these issues by:
- Checking trialcs->exclusive_cpus against subpartitions_cpus in
  validate_partition() when !is_partition_valid(cs).
- Falling back to sibling->effective_xcpus in cpus_excl_conflict() when
  sibling->exclusive_cpus is empty.
- Adding regression test cases for both paths to
  tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 6da580ec656a ("cgroup/cpuset: Don't allow creation of local partition over a remote one")
Cc: stable@vger.kernel.org
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v2:
- Split from the remote_partition_enable() fix into patch 2/2.
- Check trialcs->exclusive_cpus (rather than effective_xcpus) in
  validate_partition() when !is_partition_valid(cs) so sibling local
  partitions with overlapping cpuset.cpus continue to share remaining
  available CPUs as expected by test_cpuset_prs.sh.
- Add regression tests to tools/testing/selftests/cgroup/test_cpuset_prs.sh.

 kernel/cgroup/cpuset.c                        | 9 ++++++++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7381fa8502e7..f46a51f07938 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -713,7 +713,10 @@ static inline bool cpus_excl_conflict(struct cpuset *trial, struct cpuset *sibli
 		return true;
 
 	/* Exclusive_cpus cannot intersect */
-	return cpumask_intersects(trial->exclusive_cpus, sibling->exclusive_cpus);
+	return cpumask_intersects(trial->exclusive_cpus,
+				  cpumask_empty(sibling->exclusive_cpus)
+				  ? sibling->effective_xcpus
+				  : sibling->exclusive_cpus);
 }
 
 static inline bool mems_excl_conflict(struct cpuset *cs1, struct cpuset *cs2)
@@ -2415,6 +2418,10 @@ static enum prs_errcode validate_partition(struct cpuset *cs, struct cpuset *tri
 	if (cpumask_empty(trialcs->effective_xcpus))
 		return PERR_INVCPUS;
 
+	if ((parent == &top_cpuset) && !is_partition_valid(cs) &&
+	    cpumask_intersects(trialcs->exclusive_cpus, subpartitions_cpus))
+		return PERR_REMOTE;
+
 	if (prstate_housekeeping_conflict(trialcs->partition_root_state,
 					  trialcs->effective_xcpus))
 		return PERR_HKEEPING;
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index b732078bf319..f62155cf6162 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -321,6 +321,8 @@ TEST_MATRIX=(
 	" C1-3:P2  X4:P2    .      .      .    X3:P2    .      .     0 A1:1-2|XA1:1-3|A2:3:XA2:3 A1:P2|A2:P2 1-3"
 	" C0-3:P2    .      .    C4-6   C0-4     .      .      .     0 A1:0-4|B1:5-6 A1:P2|B1:P0"
 	" C0-3:P2    .      .    C4-6 C0-4:C0-3  .      .      .     0 A1:0-3|B1:4-6 A1:P2|B1:P0 0-3"
+	" X1-3:P1 CX2-3:P2  .      .    C1-3     .      .      .     0 A1:1|A2:2-3|XA2:2-3 \
+								       A1:P-1|A2:P2 2-3"
 
 	# Local partition invalidation tests
 	" C0-3:X1-3:P2 C1-3:X2-3:P2 C2-3:X3:P2 \
@@ -443,6 +445,7 @@ TEST_MATRIX=(
 
 	# Changes to cpuset.cpus.exclusive that violate exclusivity rule is rejected
 	"   C0-3     .      .    C4-5   X0-3     .      .     X3-5   1 A1:0-3|B1:4-5"
+	"  C0-3:P1   .      .    C4-5     .      .      .     X3-5   1 A1:0-3|B1:4-5 A1:P1|B1:P0"
 
 	# cpuset.cpus.exclusive cannot be set to a superset of sibling's cpuset.cpus
 	"   C0-3     .      .    C4-5   X3-5     .      .      .     1 A1:0-3|B1:4-5"
-- 
2.49.0
