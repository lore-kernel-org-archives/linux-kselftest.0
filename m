Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB78D3B6BFA
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 02:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095038; cv=none; b=AKsE0FGO0bDGfNN71bKIH3dmYGcWINMiW+eXbm33Onp1v4vDhYSslWZPN3dh6QBWYLpgDjSomvgAZs0pZFCbl52G+BOXu5YyIW8PLH39GDTClISSA8tI3NQ5O9vT8M+rYXNrIg9/nUlvJY1gK/3+/cwCUYXdwdAVO523ZTpN//A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095038; c=relaxed/simple;
	bh=yS5726x5t8pnV7c+W6X/yFuC965jvDlPCyqtMvcSBBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mg5WPxr1j7q8eoEbbnyCZA5VnC++Xlr/FNKivqeBxbrbaCIlVPZivL1vvlSkCst4HUwdXks5D4xW/4USsBzBe8635eBd1bZQNMu+4z+OAN/AK6YyRAPIZtQf95aZKfc8HsdAkbfjT6gnad8/Uq5aW8Ncxs8pbOfqktnvUh/CRYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grZl+aTd; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grZl+aTd"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc4ae08cca6so52617a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095036; x=1789699836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtD8lzpYXi5mMb12J8/kWQaCmxdz2twCbPBl5zopPpE=;
        b=grZl+aTdBswe56BN0SaWk0tnjC5qCf+F1As1HJHkzDIUWt738Lj+F3kaA0pA/PJO6j
         KKNPX6NQDxl6FuA/piFumU2ugCWJmYMTS79vFIluo7RaIQ2YQN2G8kNFcw59GUGn/cAu
         9Q1WDEuAuBDF8Ir92oDEDGedlMlU3wnN8m+bfhnB+k2iXCbzEpju8CUGxs4igwYLUYvL
         lx06Q/dP+HLBVGSrmGgdyWKIQDi4n2bRiHVRcpjJCeVar5dWtm5PJb4ueKD/CzD1Vb+E
         E8A38w/yBMArLtwwTtPL3slCI21YbjJkMfXNTwF0zOG2nZR3wMnkvzyQTSc6b4ZQib8m
         OuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095036; x=1789699836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtD8lzpYXi5mMb12J8/kWQaCmxdz2twCbPBl5zopPpE=;
        b=WG3qpZL8W1FUc/ADNkDAcKcXP+N5UGOxc2Aun7hE/dRZ5AReHaPGv4cGkflBIqbiAb
         ux2qIy4zkgs8mxNpoUFqfvvC1WOGJKHYX/6/VN7CRk9EfRkDqDUcAyGSa8HGMaKLku3o
         ieXmD+GG5YPR+HQwZnckqTr39+Io6O3/d6DNB64l2w4XD5TI4OR8JlQXK6ing7ch0auN
         4MgosiHzrO9yM+IaLHZzfOELAU4ARt0eW8IaWv+KnqLTnxVaymgo7U4lZma6UAPeJoHm
         tKEXsyCCW1W+5oA+Se6ZlQ7TpWDMcHIZtelkUXIgVokNhtxv31P8ffQcGTPcDGrOnufO
         Uvfg==
X-Forwarded-Encrypted: i=1; AKwUvBxokFZStapXK93c1ONg+GS2+ye5Iq5JX6idtLbH6WL4KqYFcG4xRTxrQvvX8zwI0rGlEJMabOLlZR9ZkQ6SKzE=@vger.kernel.org
X-Gm-Message-State: AFuF++m16N+FerBcEo7V7KrP0Ax+k/f2q42n2g6l4JzEdN32SP8UhwYf
	hJro99xzCUedAHylHgenm2zoeijo1NZzphPygJModd9tVOLoMwEDVXYR
X-Gm-Gg: AYBFou1+3uTTdrv1utWRBsuRyr01xuKmS8gVTvJKHxSuUWcFu+tLpOrABIFMbKrMZ9u
	nZmxQ6G/hH3Q6ii9LwwCSc1thh1Qn5VaNbPc8ZZNrOAV0O2fVD0mkhO0GMKbZ0CZy9FQJcfrxdK
	9drCpNHx0F+REcNvrwVyHrH5s8EvtxijD+36cu5K0BV31MwkzG/py4yaShp6Q95YmRwEDrG/NEp
	W7PJ/mQ2Gc/F7Jdwu0myGlBKZIwKxnbaivwtq2dEaZXP+BCMb7o627OziOBKXNGVM8i71PMW1Ec
	Cf3bfM7qXx4xhKtT8r5CnFA4j6EHbwimxMNQTxjy3zKcLih+zLnoTldy8FnsSrKGZyGixXuraN/
	uzU48uUUe3VHI11gqoRpKLszFYETb3Ii48jH+2/KdExmDBt7lwhcTzo+dqMyrwVm8Cnc5gRxiRD
	G044EycN+59/Qw2uBsuYfigKYhVZ7F2Vr2hrfGhMluANFdlWi81NtaWpxytC1DcZvK
X-Received: by 2002:a05:6a00:c586:20b0:86b:b308:b926 with SMTP id d2e1a72fcca58-86bb3183845mr37838b3a.14.1789095036160;
        Thu, 10 Sep 2026 19:50:36 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b28ec45b2sm378270b3a.23.2026.09.10.19.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:50:35 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	bpf@vger.kernel.org
Cc: memxor@gmail.com,
	void@manifault.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2] selftests/bpf: Exercise double release in cpumask failure test
Date: Fri, 11 Sep 2026 10:50:29 +0800
Message-ID: <20260911025029.190453-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

create_cpumask() can return NULL, but test_alloc_double_release does
not check its result before releasing it. The expected NULL-pointer
diagnostic allows the test to pass when the first release is rejected,
without checking the second release at all. Removing the second call
still produces the same expected rejection.

Return when creation fails and expect the release-ownership diagnostic.
This makes the verifier accept the first release and reject the second
use of the invalidated reference.

Fixes: 7b6abcfa15cd ("selftests/bpf: Add selftest suite for cpumask kfuncs")
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
Changes in v2:
- Rebase onto current bpf/master; the test logic is unchanged.
- Keep validation details outside the commit description.

Validation: all 36 cpumask subtests passed, including
test_alloc_double_release, in an x86-64 KVM guest running the rebuilt
bpf/master kernel (Linux 7.3.0-rc2), with LLVM 20-built selftests.
There were no skips or failures.

The v1 CI PR expired after repeated "Patch is empty" reports without
conflicting hunks. This patch applies cleanly to the current tree and is
sent in a new thread with git format-patch and git send-email.

v1: https://lore.kernel.org/r/20260906143934.848632-1-hi@tychen.cc

 tools/testing/selftests/bpf/progs/cpumask_failure.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/cpumask_failure.c b/tools/testing/selftests/bpf/progs/cpumask_failure.c
index 4628feb53d86..e98493bd5758 100644
--- a/tools/testing/selftests/bpf/progs/cpumask_failure.c
+++ b/tools/testing/selftests/bpf/progs/cpumask_failure.c
@@ -45,12 +45,14 @@ int BPF_PROG(test_alloc_no_release, struct task_struct *task, u64 clone_flags)
 }
 
 SEC("tp_btf/task_newtask")
-__failure __msg("NULL pointer passed to trusted R1")
+__failure __msg("release kfunc bpf_cpumask_release expects referenced PTR_TO_BTF_ID passed to R1")
 int BPF_PROG(test_alloc_double_release, struct task_struct *task, u64 clone_flags)
 {
 	struct bpf_cpumask *cpumask;
 
 	cpumask = create_cpumask();
+	if (!cpumask)
+		return 0;
 
 	/* cpumask is released twice. */
 	bpf_cpumask_release(cpumask);

base-commit: 15071f2a1263e82150c77eeb1e94dbfc31950a8e
-- 
2.55.0

