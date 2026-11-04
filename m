Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811413;
	b=NVGV1Oufpvd+OUhCgY2SJWcnbuopWYYZw6ZCV83yCejwyqCs6BZ2WexHBKf0y754BFFk
	 1UlyGAe25FiOjTxEPMZC0OtbqIdTK3m01ZLekn+oimp56FPFSiV/I7T6pj9aqtsb/GLZx
	 3A6wn7EzuS9wTe2CAq2Ej7gIFaxwASIFpmTmzMduBNpxIXBqp/UORzm+tyKjbLOYECtcN
	 KFivyHNWc9mx3UCMBWoxGSy7WP0dqHQu/zNHU6wo3Z4qrsHbFBT1YDUZ6o7X5obYLO6gX
	 ca9AFmZ06oGwSkv8c9SKK81VuTGemmjVpFco28UtLK7PkmuC4aXOW6xfZad34siLzrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
	b=FXbdYMH/n4+sLHaxVJmMj9W2EAFrn9a3T9e94vgJy5xgSP+TjIN9oW8AAbT4fDfKwRZy
	 Onr/BnNlU74IqeVLIw3HslUULtxMl6DcpS7se/zv48JBFhUyfrex+fK/R2qxVfC90pHG2
	 vYAN74gCo3XerRv8GhIm3S0TMspo99Bex63qJ1+6KdropZjdD2YBHjBe9y9a9R6UEzH79
	 xvNN4usl32EtguV9ouj6RLRubAJIs5R9WvEqCiVtuDaKTJflsxhmncqMofRPP6VXcBbJf
	 EGzvkHTnLzekwh58jzX2udjaZDcdbuGw7VnXiRvaEUw1fqMEw32WU5TcCtg1buVLxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566D606D817
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D566D606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCP9s8Vr
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36d6765756fso734510eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811412; x=1794416212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=kCP9s8VrCg/13i0ZvqMzZuUmktyH+GlFZ2KrzEozRxYNjxwtUFfqQ4YcRch8Qeyk6u
         Hyn0u3av8Oq/ekitd88yUopP0KS5X3nfx5bJN9XLDCihsS9/B+LmIOjoIg8kMGHp55AA
         itpmpYPOnoIXeErCCDxkUnG9ddysA9lPc9P+UN27efB2O7duIM4/z/uptdK27yKrupJl
         wGzjO2kl3X2ToG59tSS1CSXqYjRi2kMx/7bC8MIgy1Ghv4RO4R5aSoIy5zr5UcYM7Z0f
         APMXkid8qQKM47Pb5yXyT1eLecZbbRtPU2rV+l7kFLzHqUXv5g7AxolJjZR1ODawytlm
         oxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811412; x=1794416212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=HPEeUkfGcLsUsWuMT3dKm9WKHCAI1zXyi++8GaXWSiP8Cn4ZmNno+vavhbjqY+ldAR
         Ou6f8TeX3KPySjHu5DUsC/f3J6v1eKisbTp1uSgR8vTpClN8HQRTpqAtTZiMvWUPyZyR
         6IXt/PTzCJjpez/gDZwlHjlZjztHTUmHtT1q5rLHlmP9fS7J+zLSzX8HsFPWGCidfsXH
         oJKW5cDXAFCjuEIsCrmiApgk2Do8Lm3idxIGeSIdCfIYbpR+Ia3ZNqcraAf2FymaK6dc
         KAehypvf5N2ej/OwUjlSrmEnya0T6cTS5e1NBYordvnMS0iWzTyPWMetHzlGYnm4PEFa
         edQw==
X-Forwarded-Encrypted: i=1; AKwUvBxdUH2j9QFdFXolvjKdj0E8rLdt3HUePh4Gt6YtR0RyHdrQmefY2h5OFuIBG1aWbAbas9yt5oyLgY4aqocvKyA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OLIPg6aXyRH5TqhZfJ0TIcIDDJRJvfrcfVb4N4eroJ18CGnZT
	JE6ETzb7fik7u8D8c1M1ge51rQtXZR63JFe77ZFJlLyKjbKK81f3yYnV
X-Gm-Gg: AYBFou3PaCIS9MDQhmmbcUoo4Cit4TbVA6VYGn7EBKlSYVxOUN1WsLPxqoutmMKl+Yi
	MfZXhfzKc2wliGHfHUb9Pyyf85+2EWHjt17peEp3i14NtkZM7y2MgqU31Rg+Fm8ELZB4QfN1Y9V
	v38VxV2B87yXeupQbaVaNSNBo68uQTOkApCQ1mLf6gUsKaiT7WNq5hhsdp2RTuWcCrhyxl64PgA
	qYRCgw5ip/NbtNmJIlY1D86wGJp2+ua7QtJ+J02iCu2axOqiIZXNkIddby9L7hcTK5fsfuKFI2F
	Knp78zMP64AUnKSOnb3C9zOPJk1pFFG/992jwiinAfiiKzFMNJRE9k+3fDz9X0O4r+gIB4CLw2b
	FZu5PzAM/j7sPJxngKZ9sYFPU3JkXWNiDIVcdLA6wpK/aOnG0/snGJyrS7loDP5fL7ExPmjR1K7
	miz0fMV24KfjzI1IfvBE/W/HQ2fau62k+X4k/tYWWCCVL7IdRdsqUM1SY4UzkgSYh3cBRfdYjE8
	Ng9OwxaBOyqFVac7QLevnb40ABkVI+5aGieisbaB8vw+eDQP2nF9XpaqF8GDyLCaB5nW8SGYC+w
	h5RLz0wzouLxNCvLqUOgleYHKY+rG46ihK+cKD0=
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr23827711eec.30.1793811411412;
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
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
Subject: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
Date: Thu,  5 Nov 2026 00:54:28 +0800
Message-ID: <20261104165504.2430480-11-kunwu.chan@gmail.com>
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

Add CPU128 and CPU256 configs for hazptr-stack torture testing.
These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

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

