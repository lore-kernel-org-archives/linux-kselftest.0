Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6B3CA48E
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612812; cv=none; b=axAsINkM9i4r/iqcYAVmehwj/vt2zzVeV+tSus3Pt9/tzkwq9IIIGEmzA55L76JzoknatYLVGJYER3zWXwb/gVQnvZ2wYTwV3/0EfLzNrcmQUP2YfTFyxgK4ioQ2GUsL6GxrhAl+syuqerUsxOKCD16jAzCC2xQnffvTNBEj7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612812; c=relaxed/simple;
	bh=m3InTaoANG+L423r5EivxyCbPu7Am9oQdtZV/WKkVyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkp/yrYqovh1wSQJK8vRzXYzYRaST9Wt1/nZtVf5S2GxSN9tqeaNgYHW5fODON5gDClscJwnAZQrKwrcxr9JNw0ChlS+XSWj+hkRZ5agNDLrP5kLw86PrqJU4w3n2q3RsZG9rLnZOP1yQX2FPkcSCMU/onuYJJWE8HNb0MBV5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oze2RWoK; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oze2RWoK"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-356b1e20700so708145eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 23:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612810; x=1792217610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6lBab7Auhx2XolfkiJiMNv6dYx1RUGdI1l2wEohDRE=;
        b=oze2RWoKXELfyl9/SXwdW3inNK9s1kKceJphoZTO0bfZbKIzs1PzuH+Ueikt1ecWb1
         PBO/qs8vkcFrJmqfH9d7cfmzqm1vREDx8C2IyTDH/+gPo6yHfe3Svk/w2sLYKh/Q9ZNz
         nBzefLvo1iRy9L42k2PMxhAOC1dMM1AKK8tsq1clTE+eDIARiVYn8zJiAEpAcjyNGwDP
         vrU59YAwgUseDPOFPSQl3KIBssXkdqujuOCnsxP18vuCF7E25s/r5c2+MgxY1t74fU0R
         FvgUETy5lnmGnhA7l+TNjsGFq7tXD1I+mSirQBCQuzFq9hJyJqrk5Ygh7h5C2YX/XOR8
         /QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612810; x=1792217610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6lBab7Auhx2XolfkiJiMNv6dYx1RUGdI1l2wEohDRE=;
        b=zp/jiuQIDj+jQbHVhaH3cMhGBg+zUtu8Sk6fqKLCZvv/4a+SF31YKKOnI8law4HyZZ
         S/H3LeBvmF/o0sVwY1ehqWAA3venb3+RxYlH7Lwrpok9SXm2HHJRIW4D86bK7C+AZva8
         nMqXyvUohEsddYbAVOqyqetyDrDsOJFy/16kDHt7BODpTWZz8YYDw+s3TbYIIoqhtMzr
         f7fqv1kNGWoyQHIMP849ftunbcJzrvv4uw3KHuqeWEpmy5ZKez7BARZBJtbzW10RtJRg
         LaMK3ileYB7mdfm1fnYzktiPzzXiCBp2wxOCI8RRmrZ9U4bMgtDqlA8riEQit2kiANPJ
         Q0fg==
X-Forwarded-Encrypted: i=1; AKwUvBwaOqrIs5ydTb4QuZo83iZrxOm+5Uphfm81QmsXIkXTiWuWUmI+mWcGdLFrZ6jTLCDckZ/r74ycT3RWI2Id+To=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnzmtSbyoMBamB5swmqxy97b8bxqh0+8LhiW4rB4WLVR9Be+7w
	Bx0MLi/t/L32hxM6Iiut1c+3gDHP+7z1mp12smTUw8v8MaRL5GOiHcY4
X-Gm-Gg: AYBFou0ZwT752Tx/6MsIh876wnKCpFNWE/9aX3Y4i++KUOMxhTJU6+TPHMfoLeo/azM
	LwHljd2/lPX6qUjiCK1g4JFpdL3i0h3jkrOdbrySHRwv2jkgTQJx0njaKSD3tRi/0ceh9t4bOns
	wpyA78n9/v/aEFmVCnUb4pKU0kd7EOhX8aY19JE4BHyY2vrT0MsojybGiKFOrVMzZx3zlzutSCA
	lq9C7Db7+Ne+FmfI8Q2DLz8831Fs0eXIXx3qrs6s+s2lOBrwckxxscWVrHniPZWLCWdgOK6ErfD
	of82MwayjHkQZncIsrh7tAx9y3dtsdSRQKOGnIXs2vfeSuLJTFGvgDspoYrNi4BgZjt3x6wpqJV
	ROvaxbXertLpCA2R5ncc1mzQM9snX88omNBco4oAF2CSJNCtNbS1PRq98q0QjeF45KRVS+nKeaF
	6c34EMiPdGr9GRrq7ucssUlIL6BWhUsK+iMc/Fudu+15Jdreu0k+9S5fwLIG8qMqvUWZJIx0u4s
	veA
X-Received: by 2002:a05:701b:42c9:10b0:14c:c588:ac21 with SMTP id a92af1059eb24-16a5b97b4bamr5017821c88.9.1791612809916;
        Fri, 09 Oct 2026 23:13:29 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a5866477sm10558036c88.22.2026.10.09.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:13:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 10 Oct 2026 14:13:18 +0800
Subject: [PATCH bpf-next v2 1/3] bpf: Defer freeing a struct_ops map until
 its progs are done
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-1-d7a43896dbf1@gmail.com>
References: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
In-Reply-To: <20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

A struct_ops prog is associated with its map without a reference on the
map, and finds the struct_ops through bpf_prog_get_assoc_struct_ops()
under RCU until bpf_struct_ops_map_free() clears the association. For a
struct_ops map, bpf_map_put() waits for an RCU grace period before it
calls bpf_struct_ops_map_free(), which clears the association and then
frees the trampoline and the kdata right away.

Nothing waits for a prog that reads the association after that grace
period started and before the association is cleared. A timer callback
of a struct_ops prog that calls test_1 of bpf_testmod's multi_st_ops
through the association while the map is freed returns into the freed
trampoline, whose image is filled with int3. RAX holds MAP_MAGIC (1234),
which test_1 has just returned:

  Oops: int3: 0000 [#1] SMP KASAN NOPTI
  CPU: 2 UID: 0 PID: 31 Comm: ksoftirqd/2 ...
  RIP: 0010:0xffffffffc043114d
  Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <cc> cc cc cc
  RAX: 00000000000004d2 ...
  Call Trace:
   bpf_prog_ec591f4f9d13f364_timer_cb+0x96/0x1e2
   bpf_timer_cb+0x15d/0x240
   __hrtimer_run_queues+0x264/0x5a0
   hrtimer_run_softirq+0x1a7/0x3b0
   handle_softirqs+0x18c/0x5b0

Free the map after a grace period that starts once the association is
cleared, a tasks trace one if the progs of the map may sleep. Clearing
the association before the grace period of bpf_map_put() doesn't work,
as it takes a mutex while bpf_map_put() may run in softirq, e.g. from
bpf_struct_ops_put() of a tcp congestion control.

The st_ops_assoc_in_timer_free subtest of test_progs reproduces it. Its
timer callback keeps calling test_1 through the association while the
map is freed, and test_1 spins in bpf_loop() when called from there:

  $ cd tools/testing/selftests/bpf
  $ make test_progs
  $ ./test_progs -t struct_ops_assoc/st_ops_assoc_in_timer_free

On kernels of the same bpf-next commit with KASAN enabled, x86_64 VM
with 32 vCPUs, before and after this patch:

            before                     after
  outcome   Oops (int3) on run 1       100 of 100 runs passed, no Oops

Fixes: 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period optional")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/bpf_struct_ops.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 1178acd72296e..cd082339589b3 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -42,6 +42,9 @@ struct bpf_struct_ops_map {
 	void *image_pages[MAX_TRAMP_IMAGE_PAGES];
 	/* The owner moduler's btf. */
 	struct btf *btf;
+	/* free the map once the progs that used it have finished */
+	struct rcu_head free_rcu;
+	struct work_struct free_work;
 	/* uvalue->data stores the kernel struct
 	 * (e.g. tcp_congestion_ops) that is more useful
 	 * to userspace than the kvalue.  For example,
@@ -1032,6 +1035,23 @@ static void bpf_struct_ops_map_free_pre_rcu(struct bpf_map *map)
 	bpf_struct_ops_map_del_ksyms(st_map);
 }
 
+static void bpf_struct_ops_map_free_deferred(struct work_struct *work)
+{
+	struct bpf_struct_ops_map *st_map;
+
+	st_map = container_of(work, struct bpf_struct_ops_map, free_work);
+	__bpf_struct_ops_map_free(&st_map->map);
+}
+
+static void bpf_struct_ops_map_free_rcu_gp(struct rcu_head *rcu)
+{
+	struct bpf_struct_ops_map *st_map;
+
+	st_map = container_of(rcu, struct bpf_struct_ops_map, free_rcu);
+	INIT_WORK(&st_map->free_work, bpf_struct_ops_map_free_deferred);
+	queue_work(system_dfl_wq, &st_map->free_work);
+}
+
 static void bpf_struct_ops_map_free(struct bpf_map *map)
 {
 	struct bpf_struct_ops_map *st_map = (struct bpf_struct_ops_map *)map;
@@ -1050,7 +1070,15 @@ static void bpf_struct_ops_map_free(struct bpf_map *map)
 	if (tasks_rcu && IS_ENABLED(CONFIG_TASKS_RCU))
 		synchronize_rcu_tasks();
 
-	__bpf_struct_ops_map_free(map);
+	/*
+	 * A prog may have read the association before it was cleared above,
+	 * e.g. from a timer callback, and may still be running the struct_ops.
+	 * Free the map only after a grace period that waits for such a prog.
+	 */
+	if (map->free_after_mult_rcu_gp)
+		call_rcu_tasks_trace(&st_map->free_rcu, bpf_struct_ops_map_free_rcu_gp);
+	else
+		call_rcu(&st_map->free_rcu, bpf_struct_ops_map_free_rcu_gp);
 }
 
 static int bpf_struct_ops_map_alloc_check(union bpf_attr *attr)

-- 
2.43.0

