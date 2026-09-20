Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83787445AD0
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928096; cv=none; b=uufPGa4UeGddbJYLpvvNj0fgqgB1oZA+4ZmRbpcnrIMlyCazJxpnLrXpNW6U86H2OP9HErKyRRnqIVPlyHJbnw3Gi629Pe6y8m2wcNHBkY7PmhUYUMUT3xnaTVFcp0cjHxaJQMdCminXpwfPac68L9PwxcvfWGmh221HdrM+eTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928096; c=relaxed/simple;
	bh=ljrqpukr3NP5yrDjkb+Jpb6Ys4RNZtVj2TiTWC404Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHSRWkifPQlAZZ/yBLowUFLD9VQpP5w1j0BAfS6IHCO3/UDIv+0f/N2mfctD5yJPmi0Qfi3Liw3RXoeK+xKe7J59owwoWtcOop40yeVerg1kGd00lrRxXheMgU+WiC8WSCD09VOJCdcJbLSDZrM+aQX7RW24uXIr1PpSYif+iWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0tG/0/1; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0tG/0/1"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so15364215ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789928093; x=1790532893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIGxyqhgDCJxQrUSlOVUsvnBCPzikecf8ZgHQx68EUQ=;
        b=s0tG/0/10XJx/mcuXgliPlt13qzin7Ife58BuWPaA8GnB7oHnfF2uQ0khztArpRVGN
         m/pvCDSQs2O3UygsCyyPCucGMYS6o6laGb/UmOyfNiuTHaFkriExNuCYT3bIm0PUyrO5
         CANDNEAzWsUaXAlceZn31C/hnzvGUF5cdrImyQXU8bQN9LsdHQGNI8arPKnfuD6sLmZw
         cJyRg8eEoPICrdsD1d9/R0mX7PhaFDXqupWQ5lBHoorOvj0GOrdGebydMvmqJdrKOA50
         M+mealyN4BAZYqkv6vKMrsHZJk7Fn8U6bxF//Ai+goL8YVSCO+KhyJGw/dt3KwGZPc8w
         5iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928093; x=1790532893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIGxyqhgDCJxQrUSlOVUsvnBCPzikecf8ZgHQx68EUQ=;
        b=w5wyNlLtvt8xSRYdxx6GoOL85WEe7MPpzRHcGStdKer1N6yET46xEuQMZR6qBHoiZW
         VY5GVXZq1nOggnMBkBaFBIX9ytbmHnodsoJYCjjionIwC26n8W3+f8q+l1h662omJ/J0
         hwtn5PfK8ekKSVi8b72fxXNql/fnoUL80PLvFDKiGQcBR7K5Jk06HDUDvleyn8MJYls+
         ZeOgdVREvmiirt6pvzz5I2WAwfOdEp43ZrIP38Sd7Smshztmny3//uraNOZnqYuen+1n
         4UFiDHr07Ztv7SJzUF3L/xaXq0m+8C585XiTX4gIe/clPKAQM2Wur8BCFGPdG+OI1JMA
         HQ2w==
X-Forwarded-Encrypted: i=1; AKwUvBwY5Zk2MTZrS8TqR1uubbjwuw2Ef1oN+3Lwrs9suEnCug1JnWM5RAn+OgWK57cC/goSzgAx4YDcKPPDxxbOX1k=@vger.kernel.org
X-Gm-Message-State: AFuF++mpCQkpPERSMNA7GkvxqLt2YvoSE9wkakhg6VMskiFdLw5cAib2
	JVKyGYAaHIZuKbPWN4P3lXDJMMQL/pYPLyTz+gcj6Fq/7OKAentDzlKj
X-Gm-Gg: AYBFou0HAfSpO5NKKrvlFRfAIKQnH2c/BDSe5djRnwqMSpnVIiNEqOlA2GQHUWoVuTv
	rtINXZdWB5UKPecKm5roh11eHDsf0uYCq45K13SfDcUOldVOW/y+42a3hFJjmwHdrXucKkRjzBz
	xYkxPLoCmpVsjeoduUj31wBaydm8KctdAJrze1US0N/+k0mvn3QrP308aoPLT89UKbOZylNb8th
	m5H8doe4J6f6fdxheq2BwmMf9w1eUhQNsjjv3hiDVXd5hOlbZsku8BsCGeyf134/IrCdRVM2bzg
	9+aYnwVCh5CFwtvEJmCS/4/Uo7RKYxcVO1/t3eiMkJlU/+EQqJhbkaq7qH+pdUkEFpv28iZZ0Ob
	7SYjcYUFAonAwTwp1DpzwE+NTw9fSoP9Qp7KgECROcrAOd8JmU4yeYILmBJs0ABF4EXVz0YkZf0
	mwsQl3c7Y3mYjBEa7urniQ9H6L53VYmgLq4dGA6g/+TYddUBtP/oy3VpMGkDHncidHPOkApB3Xy
	kAKyWyiqaPUqqHNV2wM1LixMWZDTR6jAJ472fxJRGVrOuAkuwDwhuC1DK8mz/mrYKjxA/HGnJGm
	jH29PGt4oA==
X-Received: by 2002:a17:903:1a26:b0:2dd:89b1:7fdb with SMTP id d9443c01a7336-2ddb1aeea09mr127586005ad.9.1789928092709;
        Sun, 20 Sep 2026 11:14:52 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179df35sm22087225ad.40.2026.09.20.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:14:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 3/3] cgroup/cpuset: check sibling effective_xcpus in cpus_excl_conflict()
Date: Sun, 20 Sep 2026 18:14:49 +0000
Message-ID: <20260920181449.3122336-3-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920181449.3122336-1-benquike@gmail.com>
References: <aa90bb73-c2af-4d13-8f2a-0435aa528058@linux.dev>
 <20260920181449.3122336-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cpus_excl_conflict(), when a valid local partition A1 uses implicit
exclusive CPUs (cpuset.cpus set without cpuset.cpus.exclusive, so
sibling->exclusive_cpus is empty while sibling->effective_xcpus is
populated), a sibling cgroup B1 can still set cpuset.cpus.exclusive on
the same CPUs because cpus_excl_conflict() only checks
sibling->exclusive_cpus.

Fall back to sibling->effective_xcpus in cpus_excl_conflict() when
sibling->exclusive_cpus is empty, and add a regression test case to
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Tested in QEMU on Linux 7.3.0-rc3 using
tools/testing/selftests/cgroup/test_cpuset_prs.sh.

Fixes: 2a3602030d80 ("cgroup/cpuset: Don't invalidate sibling partitions on cpuset.cpus conflict")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Split out from the validate_partition() fix into patch 3/3 and add the
  Fixes tag for commit 2a3602030d80, as pointed out by Guopeng Zhang.

 kernel/cgroup/cpuset.c                        | 5 ++++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 7c5b4a8f1f3a..f46a51f07938 100644
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
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index f4d1822d4e21..f62155cf6162 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -445,6 +445,7 @@ TEST_MATRIX=(
 
 	# Changes to cpuset.cpus.exclusive that violate exclusivity rule is rejected
 	"   C0-3     .      .    C4-5   X0-3     .      .     X3-5   1 A1:0-3|B1:4-5"
+	"  C0-3:P1   .      .    C4-5     .      .      .     X3-5   1 A1:0-3|B1:4-5 A1:P1|B1:P0"
 
 	# cpuset.cpus.exclusive cannot be set to a superset of sibling's cpuset.cpus
 	"   C0-3     .      .    C4-5   X3-5     .      .      .     1 A1:0-3|B1:4-5"
-- 
2.49.0
