Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A214E509EFA
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961122; cv=none; b=U8PO+GJ1WnnxgYOlbxyIiITsEo1ZeXiFYWOeVcGCWvjZwE6XFKrZAWus2jJhunfUJP4Egn5Gn1VvBTDsy2aVblIbTfTbqaljHyb1VMqg+e/imcaSnZyT8Ppfog8ijBupar93Q7cpz357/eaHIQJyxjckyBk8u7O2Me37X9P8H5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961122; c=relaxed/simple;
	bh=c7ckEYnsoc8lY6bepSRx0MX3kspdeIxVPo6r8T3T7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKg9r9Rr7a9a17Q5G3kB3yqLgqbbYOWnFHD0VmMPKwnFPyE7sJ+oBwRgus0aO8KIfuwp5uGHf/6nw1tanbo3vhkbiPjhnQi/hjkWj1LG5cGCwsOynQZxI7MxEWZ6vjTbqqN2lNfGZ1PwCzFP5x88poXpQsskDRnaDRQx0aM89cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et5jNYEn; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et5jNYEn"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so3172887a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961105; x=1791565905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=et5jNYEnRjFgMtTgxmbQKLyPtRY6+zKJzAnn+F/zA7U5sJ/MODnWgoIGviLqzly2o3
         IccUsYTT7Jf0u5LsoSlm/gL/LX6zgMD4ZaN+YW1wFLq2m05UwrWCJzpqLywP8+51ieoH
         sKuHC73BiU+9GzZGD39y1cCmxIcBxlpJp8DDpp/Ot5lDGHGnzgSAjZ3FZ+lVIvrPfgVh
         +inTzZggE/DtWmkS5J0mez4GQC1kWVsqpppwu3kztgArWRkh6bZDmwz151sAHiI1dFGZ
         RyjjvDKG2iJIlf2V7z+ITXU8Yeaf8BtfbjsAEOC5zQbQSCqSoKviRefuWBB3VYIeaTpv
         UP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961105; x=1791565905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=zoASYNdO/RsnAT6uYXWROI/dFQvT5VVYoPyC/w2yVnKhO41i5HOWhuav6m5griCNkN
         R4XTI1k/bbZl0mFThjM4YmCFbe/HeCYemEsv1ZZEPuWuoM/IYIdjvfxSvX7ZZWYdMQtf
         DkEL1d7nCbsEbJuk4WaLytMgoPMrQ1amPqJjcDpc44nsucaCZeD0IMb8vutAMEjuWeI7
         /TIe24IITFGybUHpwo2p9rEgJkw3loPSpg/jl9jamNeM8QA/JOdKYkoA8AinyiB/9Rzf
         CR3xd7RrpQGd5T7EKgKKgYEHJtAb66NePDJHEzB8owWe/+mVgLgwL4oiiDkqNnWMPPGJ
         2m2w==
X-Forwarded-Encrypted: i=1; AKwUvBzN6DrCxWnlMHgB/T2/q/0QzeNj48H7//IePWXxgyKR/iSAgmTbIIaBmI7lHwo2eTWIeqxO4pL5V1UUtDnHQZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQuFy4soW/6WJDl9v05goARUT9dMz7krS/83C3DonpVZj0Ee3A
	jSNWHrU8LZim+HJpzsAXcqf93DMF4vL+Ct8mOXQXe8Q4usv5uMQRh/u2
X-Gm-Gg: AYBFou0Rdfqk+LMBRUXxGy5uRQYhmmnCvOPrfMwASSr/sQHEGjIwE6WEVK85fKmZu8T
	zoX1v+DM8KEkd3AjN+wv3Rh2lyNPzdRu9aGcuT7a6jhxL7lISFd9sBaOZG/qDK1QdA6qORVH5iA
	na9aQe67ixVeD9aDooNMpn45EHkPzU4C83wVHhSpDas9No1FJoiQaHaTS7+TnOwYusSk1w6Ena1
	gDGMEZ83ZHZjlhsadngkzj+07YU1d66AHN45nTMOMgHXD4NBXt9G3Fm8lb9IfUrqIkXE3dkSu3A
	zguSyEzxtrET9X/fb+7gq0UpH5h7nBOERMT+fM5Ykh17U5LnRdiAljAtHc5rfLmcK0qqoXHWqLJ
	XprmUXxqlWLrsw2fNDD3+NFvWhpPoMWjVCM1LTaDkhqk4FkqkJqGWyHttw5zZXJDJtQYC93gnZR
	s6k8Qhydp7i1nHJY9aaM8xzRKw6UpHQlzSeCyjRfJkHnQ3GbCua4XhIatYnpOo8JlCu0QwbGUuw
	AM5lowdZyqQ1tFgKzix9zhFUjHD
X-Received: by 2002:a17:90b:3d84:b0:3a6:c7e8:1e3f with SMTP id 98e67ed59e1d1-3a6ce34d7edmr3083622a91.3.1790961104965;
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 14/15] hazptrtorture: add 128- and 256-CPU configs
Date: Sat,  3 Oct 2026 01:08:46 +0800
Message-ID: <20261002170847.3653663-15-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPU128 and CPU256 configs for hazptr-stack torture testing.

These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 1826be30c066..90ef09b0e654 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -4,3 +4,5 @@ READERS0
 READERS4
 SLOWPATH
 LOCKDEP
+CPU128
+CPU256
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

