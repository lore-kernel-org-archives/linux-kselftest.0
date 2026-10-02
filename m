Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBE64FDE70
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961108; cv=none; b=DqXyXvdZhHP4erYIT/iq3p9uwL2Bz1NhQQ3fo0I7uOF6O7Lxld71wn/onUpRmkRxaZ/vd5ZrMQG32gGLoKDZxqzHEEBQupClwQ+TmgO12PsDrNWzwpu5dBoGf20t+fqck6bm9gJex9kxCpGbvaK9TzOXiYKADVDwdX37+QYvL2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961108; c=relaxed/simple;
	bh=ikRDPvJS94ZCR7PUsAAuEp28RxgBvB/t5DdR/IX8Lk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJ/asMYUL3USgOY/ih4gmEFkdZa3h0hn2lgR+RNG9ODvHL/pcdqUh3L8skI/5wtTu5A1gEMXpiOGCJSoEZhIwpGHnXNJ7X9nXTAsS7RrMOO3a3icMUelRvP5bAX1MT5qjNpFnclnfYjL8NlSYMVg+E5PoG71YS1/c7M18dPEGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLj9+rNA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLj9+rNA"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso111980a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961095; x=1791565895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=GLj9+rNA0k6Ks5TDBh4975HRkTZNF0soWoVxnoHAdRJ05DSNaSZhFuyrr1mWL0PzcY
         8vhNsb1dD5OzKyazj/+EdUiHe17qdN5H66B3dHO/4o6o2Kv3hVAL4U4OnoBw10M0H/Xk
         tHb+aXKaLOrLBsh1DCEwasUMaIIspJmx51O4//vP22yW3S1hi5WAnp2PIYq2oNVOHTfM
         qHcTaCxxO+anU6ImT1SRiXVuiaXfbvziw7nvYQZXPRtqCOHWXDaApqk2bPkgEsfpM/h7
         cfIMmpR3UWTQslM8DCwOvSti/3H8B6l3/Sm5CH5yQ6PMSgkA0rsgWtmn5InzWa4qiNfO
         vudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961095; x=1791565895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=2Tv1aT6b7cTGCbPr1ND3ZDbnz2dMj3GWRsdn221pVQkWz9AdZbYwOJMvEPMOuryuVN
         LaaSAqc3ZTs4vNJVX5uRfEZV8cQLFJz6gOYucMAPHaZXtShrp8K0EKD1Mk4Y8ztPR1ko
         YslhFPOYRO78UT9o7p8zc0AmIFOEiGJyVQaj57R3N+OiHlgduJGmPJPfl6tsIN4Git8y
         1d5jmnOeZwQdsdc4z+B4u9uC1IKXS99zMuLb5ZFpY6hBMlcrhpBf4Y6grFcYeiqjSENw
         0qYl0m9uL+X5TUPYVWxkAiSBkjmhyPGLI5L8CfTFy/Cc86DpitB/WdRV6HHGHsI2NJOo
         ygAA==
X-Forwarded-Encrypted: i=1; AKwUvBzlPkimLK18/e47VqCZHJLnA79C/3aUsVi0nLvHDqrsU3t94pmh+Rk/dc11a3UKkXSc3zfpn2AzoccUPUJKzL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2IGAhTT0z4O51/u+dt2acLjzA24EfEJyR1KG8aOGF/9AYU5c8
	NW/HyTLC0qaGh5dnsv9cz+P0QOCUQdxUYKYTJXnw1GUPaDhitx2rTiKu
X-Gm-Gg: AYBFou35a8n5S6MgSjQV2Kgcr6cJdB5+uFKaAmkKzI+5PjY/mVdC3g3rBT8qp/OA3qG
	EtV2WbCWc1eu2lVKA3Ye0YVVIa2AhUjWjeI/HfVZjCnoQvEElt0lptMhu867GvMhh+p28gTx8rM
	9JQ77iOEGFUofnuvweJCr6/4C3PBiKVklj3Os77Z65DDMzWkfoLNGaXlzMf9FoHoV8mWpggMffm
	M/x1D/gKmIZ55ml5NL+2eHMUhCc/FNDUkFkotgM8NCX/G5TDVE1LBMn4CaCPAMEBA2WA8UnqA5C
	y8Ey/Mmvo6tQmbsdnDZU8BOw02z9LNagh91UhlH1y5Ft0v1S0UTu6ttJGJSB9UMV6zvbCqjjjG5
	AE5C20T/ZUPjeOGLx70YmGMJKyyA6ZTFdHKFNvXJwGxtgVGuZDBGlZLr3z3HcjNch6hDfyLBfy5
	UOLJV0XT4fNk6RlEqkBPCWgOlPqK/KyTAQ0eMWyyk+VW4tJHfBxSuiU6eiqKeT6g2PCE5IlUC+Y
	i7WU9kF4eLiKQD64padSHBShFPS
X-Received: by 2002:a17:90b:2ec3:b0:3a6:fec5:c184 with SMTP id 98e67ed59e1d1-3a6fec5d190mr1028380a91.7.1790961094328;
        Fri, 02 Oct 2026 10:11:34 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:32 -0700 (PDT)
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
Subject: [PATCH RFC v2 13/15] hazptrtorture: add READERS4 and READERS0 torture configs
Date: Sat,  3 Oct 2026 01:08:45 +0800
Message-ID: <20261002170847.3653663-14-kunwu.chan@gmail.com>
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

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 5 files changed, 38 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 380b8402ccc9..1826be30c066 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -1,4 +1,6 @@
 NOPREEMPT
 PREEMPT
+READERS0
+READERS4
 SLOWPATH
 LOCKDEP
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

