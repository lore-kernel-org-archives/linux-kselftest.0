Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA603DE451
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 04:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224055; cv=none; b=R3+n+EmJy35wtseqmKhuGLZUhC3nifJwa+baG1w7V8R4kdCl82nn/KL25rx2LXRtqNXh12AN0CZIU2X3KQxmLE4RTgQFbi3ZHrhUDWoKD8JSznd7r2+eHfme2BOhSnAEQ+A83f/YtTLNZ7uKeUecc4euhGjn+TN9XmofdAJcRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224055; c=relaxed/simple;
	bh=5v3rwW0VMB65Wf4/KxRL1fhi+QlMnFCvape9Wi9fxHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/SYsCvEJtEGd3aAiSMIVE4J1fvFccVT9gB1YOHxD6nePevKnqmFT9it6zflFI2Dole/R1H17GGbE4BZtxAOMEaoeuqpdIpiDJ2M9YkJB6yF13TdjRvnA8DsL2HlvKr1iKZbwCsjwOUqK6aqzlnemLcF4vX/vujQrXCMu98hpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbjHaCDL; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbjHaCDL"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so12998715ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 21:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224053; x=1790828853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmCfWBBUHX8wsiWbQFUojJ9Xh6H9quRHIaEcLpqcKjE=;
        b=bbjHaCDLc63NGQZYjZh5QXSSu9P549e0Of0Q2UsUlLvR7Sq4Ftf0/WMwI6uavNgbmt
         gHGuAPq8NXWawX3fAuwTBOHwMvN2JG9PQzrR+v2sDnGaV3HfFBxKEMjNbFwR7UrkVlGH
         BcvLsAP0qxFXyjbkFttYOF05XxlCIMj7HNLI/lCRCegPgrZCQgjmGCxZ4iLtz5thsx54
         AAH9HcEuQ/TLzgjCeFxmKGUJlcRiiGMm1+s+iao+1Mxh/+ONpRLKbOI2C1nSlRWq3lgj
         3XNLKUxQNTMvCWBuNJw9SWYtqpSdGgPK7Bl7Z+xx9+r00sUDLKRJqYUWz8PvV15tuikn
         8ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224053; x=1790828853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FmCfWBBUHX8wsiWbQFUojJ9Xh6H9quRHIaEcLpqcKjE=;
        b=qvZdJHz02yKKeC/xMX4e/KNF/T9BhVdw2vpJ8Ipn4SSknTrrC5oU+6X0fIhHuqfnah
         mXhVb+ayFTdnZjE4cC1yeCn90zLvVIPcZygRkgZIkCYnrTnNC3HDEQEhsvifcCR4YnR8
         OuEtflwz1RzZWQCy0fdCDQMJhBkkNOPUMZa5rgsGkueZ7v43kfSCk3K+PhfsJyhcWEPv
         ziJWSGUzQHcBBHn9RychVNktnvhGs+GkzAZhE/7puqIA5+3ogKgTGSLXy4ViZi3oEGkG
         7rPj6mCaHvgnViOUtK1pm1bt65tTps71ADvy7AAv1HD9LqF5masmwRSBwH5279zzvPHR
         jcyg==
X-Forwarded-Encrypted: i=1; AKwUvByjZqpOi55zpOCA2Lqsqhkc+ZfciprZcY49xbjrE8MF0UuZEFp2wdj52YIwMOFv3/iQpnTfEtEzQJKllqyDDVg=@vger.kernel.org
X-Gm-Message-State: AFuF++na0t28qC8L66MkJCBN5PM89R3B/v+bcriO2a5XU2DTaQNwf8Qj
	2BLKPjUwF9hKP2S7L7iUEybOt1rJTBMhgNv1PFQxYft5IMEcIli/N6tq
X-Gm-Gg: AYBFou3FCBD3sFa+RrwvS0HZghMMhUh2Cq8El4J/yIMM+5z1N7vBY6Al3QFHqffl4VB
	FyZAJydSCf8tHNH6CnYFIDRRqEHV34bHWJ3msBpaKCTYGVpMsmOXoeJPGQtoEqTiyXN9QWb19aF
	KMwTYmXi+boJF5hoJnegViu54YYB5Fud5O0T6+evKq2D/Lr6aXC418tWYx/ypD21L8q183iiO1N
	D3CncWDQ8RuXCJyzY4UZCusGiT0qmyjrLOk0Er8mG+AbgwliBXWhnVbcJHWmRLNJyyKQr9TVd3N
	HQSiJut/YJp9u9SiAwZkQRJRCVtafpQ5XZbzSOaqlb5vR8nwkUR83mldzwyRgS2iZ/43fKvUsGs
	MffNvonbvDVXhPCvtfgC/y8twETwyBveyxhiexW/YnPeYbjT8p3ReUMEwxuUwpdTfmgbmu5GVMb
	GvCGUtLlRYxmd6NWr+VoCbrN3qpGUZcKCNUExkZxeuHMDzmgpSaYggn6c9P8aqWp3YKydicUh0L
	GeAaVtEIuXt/jr9M3/MjcGh/5oNVCDbH7+wTEXUsl0p6IIQ4Hn/VpKhxSsVmt6lVEPbqtv4rJB0
	q1yTHOuibA==
X-Received: by 2002:a17:903:46ce:b0:2dd:c100:a5e0 with SMTP id d9443c01a7336-2df7dd74fe5mr10195635ad.52.1790224052836;
        Wed, 23 Sep 2026 21:27:32 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4997sm19710685ad.27.2026.09.23.21.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:27:32 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Chen Ridong <chenridong@huawei.com>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] cgroup/cpuset: prevent activating local partition over remote one
Date: Thu, 24 Sep 2026 04:27:28 +0000
Message-ID: <20260924042729.1908863-3-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260924042729.1908863-1-benquike@gmail.com>
References: <20260924042729.1908863-1-benquike@gmail.com>
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

However, if a top-level cgroup A1 has a child A1/A2 enabled as a remote
partition on a subset of its exclusive CPUs (X2-3 on A1, CX2-3:P2 on
A1/A2), and A1 is then set to "root" (P1, becoming "root invalid" via
update_prstate() because its exclusive CPUs intersect subpartitions_cpus)
followed by expanding its CPUs to include additional non-remote CPUs
(CX1-3), update_cpumask() / update_exclusive_cpumask() calls
validate_partition() without going through update_prstate(). Because
validate_partition() does not check trialcs->exclusive_cpus against
subpartitions_cpus, A1 transitions from "root invalid" to a valid local
partition over the existing remote partition A1/A2 and triggers:

  WARNING: kernel/cgroup/cpuset.c:1943 at update_parent_effective_cpumask+0x189b/0x1fd0

Check trialcs->exclusive_cpus against subpartitions_cpus in
validate_partition() when !is_partition_valid(cs), and add a regression
test case to tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 6da580ec656a ("cgroup/cpuset: Don't allow creation of local partition over a remote one")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 kernel/cgroup/cpuset.c                            | 4 ++++
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7381fa8502e7..7c5b4a8f1f3a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2415,6 +2415,10 @@ static enum prs_errcode validate_partition(struct cpuset *cs, struct cpuset *tri
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
index b732078bf319..4a451350ad84 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -321,6 +321,8 @@ TEST_MATRIX=(
 	" C1-3:P2  X4:P2    .      .      .    X3:P2    .      .     0 A1:1-2|XA1:1-3|A2:3:XA2:3 A1:P2|A2:P2 1-3"
 	" C0-3:P2    .      .    C4-6   C0-4     .      .      .     0 A1:0-4|B1:5-6 A1:P2|B1:P0"
 	" C0-3:P2    .      .    C4-6 C0-4:C0-3  .      .      .     0 A1:0-3|B1:4-6 A1:P2|B1:P0 0-3"
+	"   X2-3  CX2-3:P2  .      .  P1:CX1-3   .      .      .     0 A1:1|A2:2-3|XA2:2-3 \
+								       A1:P-1|A2:P2 2-3"
 
 	# Local partition invalidation tests
 	" C0-3:X1-3:P2 C1-3:X2-3:P2 C2-3:X3:P2 \
-- 
2.49.0
