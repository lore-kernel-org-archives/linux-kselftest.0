Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811405;
	b=dhajiqJ8aGSkplMP+X2xZ4oKKlpA1kQrJlbN92sFwpunGY1NiOCS4UCRhMj9O8IMzgeL
	 Dpw0zRkBbPUnJuxyw5HW+bUVGhgWHraMQsJxi5X6JDlxg8IGf7d3QLChS/pih6Fvnq/Im
	 eVPgystRuhLgQtgyYplfn57mditUX6iRxd+QdO7Sz4EwrFtfkmTy3W8mrh9DKFYDNbHRs
	 w6/6NkVl0ZVCNshbXUMu2xS3U/HOEquXaLUXFqRLIT3Ut+ISSyqPSVHd+AjTPLHqG7Ofu
	 VGW5SAGrnaKDGIlGYA+Ya538GHBc42AYYclbPN+9VnvoRfQaPZLOJfSkLshfR0mSSFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
	b=yeYAs0lTxtre2tfrHxRYAIHmI9NE4lAUWrZ52lyU0PE3jfSsfOHyxSWvOiAfxnKk3tyw
	 qpv16t794RiN+DPjXax27681ypRngYKZ+0k/Lq1ANQpXyCzIn4cnL8Jbnz95HZuNL6I4w
	 /yI3ZXpxJ2msM4AreiphORBlhM2CAhwRXYnLtefgN64Yzuojd8Wz9KawsZBhnt3P9DZ59
	 JDvsDyle7C8MkEdgEvzzsmZKL+SJvBlKZJklXS63MW6rmXidLmCtmOv94ykHrevAvwobF
	 auRvZDFpdqR84Z1FNAonBIP0KQEbYiW3liTwpWP0aCrKNK+lIPl/qjxDqIlR2KTNudQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A023606D803
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A023606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fE8WH1MK
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3550c917fd3so1341684eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811403; x=1794416203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=fE8WH1MKci4/tbOVBnJedYZrGTpUWQYU6L/1iUfnHKTUHhPapsG5ksuKHGAOT0+Bul
         d/z+dGRxCJ6aamcS0zzHgcwDJ4MdPZWqjDLr2gnttF6MZhzB2QHkR7BVrMWu+yuGWJGQ
         IxhmUZCVKxbCWS2ZDY2bXZq0SMCPMiZpxg7n3hu/lOfaAvfXIKTrbdcgrBS9ZfFUVPPU
         dce4azDrVK9nu70VUB9+o0C/rGPtu3O0JwvR2EbeLw1mVBViSDmD3QruVjqeIPbbKtma
         8ZQ/vQ4iY4whe4/9hwWcx6tOOnyEubAyxtgnmfbAuvrSlFsSucoq5Qgv+UgLhx9So5Da
         E1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811403; x=1794416203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=TiI8ilpufsUqP/Q8RwuOqf6/xne4Ie3D0Z9oNm6eTNBunzHWbrTITI0rh0YdFGs5rK
         3tvmBy9M/8N1gcQCKx0hmvSJESOiy5q0gY+JtlkltHz3is503pbH9XVTbkyfajlJxS0A
         CymGgTplZjkNeEp6AS7u2EL4IwP0nisx849PPgApet7krvpPyqrfyjfWVTSQSbrdqrzr
         VOQigdSH1Lsg/URT3RY4KUWn8VU4okXbhBRJoLt5bKEAkMNNBHP2rXFrJNBqG1kXUJmi
         USRH5oVXlmfuZA80zdtuN5rT1o/gMydrcKr0c5jJ6zDWKeqjep5uIdAIvDCgVE3oOYd1
         +NeA==
X-Forwarded-Encrypted: i=1; AKwUvBwU40U+s4zO+wJppEeVs8j/9CoOIgt5I8SIqrtpOi7LOg5STIpb3A9lrwiPHyCxHWbEVvkIkC1wMG0PUZkKHeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ny5eydENK1Zc07VFn1qx4sTDHijPfPryVsJp8ug3CuIE9YVnZ
	HHIQDi0j6o1OcXRrVhnwWiB6yX7Ny4OvZvMMSHaOULdjuo83yVldP4ZY
X-Gm-Gg: AYBFou33LWBC2flLVZ1J9MXJYUYU08Jwc3Z6GkcgxpSnjdvOa6u4lvc+bjbUcAFYRza
	jNewr8KEKK2TWVFSaH/PHPE6wBhYzpYxLnaOwc+PY0iwSh47lXCGFn90Eh2UzVG+Oot1buV8Rhd
	VZHlRftJDbtE86ushlvK14Jaob43SSEQL3nqSeLWYDHKcctjK5osuVOHwYdLzqzkt2L8VJK0HF7
	Q605wkPj8l2eDHkCT0Bhk9FAmUzuNyTIOCU0EJTDO2zMoEZrwyR8PUC75o/yX4K8ZfZQWgK2+m7
	gy/WhjnirUvlVX/E492Zsy2vPs/5NrytIyn9kEir4jz71cA6GNMu0Y5VlbdkN6RThUrO3A6KW9p
	g5Ozi8DaE+k46k1QTabIu3uBUub0dv3TLk/6BH3Sp8X84adUsIx2ThZYJbrmPEEuA8ge9LCPzGK
	KGzj/7Tf/Pg/eBJCztZJiPxZTPV8YjYd0+Y4/fqe11kFCHchIcH7JgyEkSGPbRnmUjvmHNdDuQw
	sVTZ3X5nS1lCDAQXsFA3xOOEFkRbsMqiEvDXTS7zJ0qO5FWuRrKWhFolNtt+A0Oy88OeKZA4wRV
	Y7M0HgzbSoUPWiITmnckJROm+Lz1YRcds+YTuEk=
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr24794481eec.17.1793811402488;
        Wed, 04 Nov 2026 08:56:42 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:41 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
Date: Thu,  5 Nov 2026 00:54:27 +0800
Message-ID: <20261104165504.2430480-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 4 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
new file mode 100644
index 000000000000..f5564c218902
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=0
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
new file mode 100644
index 000000000000..0d0df3f7dca4
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=4
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

