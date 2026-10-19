Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602D3603E0
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376896; cv=none; b=Lsctloi1FZIIlRYihVZLHFvQXic5imtgwBy9aIFYy2UzGtua5BLCXQK/1hX04nMgERsoLM2RuPl5gM+F+snDlOWH+p1gNNxb58ra9if+ytCaBJvCFcH5SKt12MTX2tCmMfL/X6RyH/467dYt7fv3fpKXSnk7PaYSKRJf2fD3Fw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376896; c=relaxed/simple;
	bh=3XSf9chaA+ozefXuaV00eQC/bg5sI+xA8Fm8deSEVzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uDbtgbDo8PHaFswr8MUYvqyEGCdqYZrdVV4O9Q3t2uiV5DorUItmMrz+U1gI/zgTuSS2S2uf5pLyFSPCw2t4fkNlZ1a3/w3g3dqmL7dgP7k1UYyi5A8xX06BoDduWeReppp8XRQ6orgZJpYmRMXGnK/iMYBAJE4nawQtopVAB+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg1Tahtm; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg1Tahtm"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so3892049c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792376894; x=1792981694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLo9V/mpqjYTdUPk4iREOdkhous+iAAtbqZWyi3QZl0=;
        b=mg1Tahtm1vU6ATOvhFpqxxGLYs2yLLVw71I+Kx7pe7mVXqspu+Bfb7MuM3VkUiwrng
         t08QYnQHg2Sm64agBGLCPu20G/ky+tHQgKPnC1q5AvTdLMiYGsnb69WzU4Bu1KYgeNrm
         yP8qKSW+RkzJUkME6KPlGXMc7LbH8N8KgjoP0flBbHz17YduZKAqmBtyZxa/rRyDznOF
         KEVycD2nzMSJaWssSB0l9uot9CM7FyFTJewp8+jjkjtcHKYJONGBpUOumFKzJvnMAwGS
         /5nAQTgU/wk0p+WONQcfhzAGA2KcXKKrTiGBqYKrqLYDhQBCWf4XgRgukTDdKQ3Urjei
         DC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376894; x=1792981694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLo9V/mpqjYTdUPk4iREOdkhous+iAAtbqZWyi3QZl0=;
        b=z1xuve1445RA0QEAu/h3u6kvJfFijNShV6NuMJlMZErDaaLEBAU5sdZqyD76piqQTa
         yStzROUUDl1NXsuLExvOZAqxU+gexi/nmBhC7/uSjXEFandG+uVUqIsbyqLkn/3PjT2c
         t5vO7jjdNhWZZ/7rMG+0UnjP4kjCoBzYz8ZhBdRbOxal83RPJ5B+CPdje/9y4+Q1sQUt
         7RSgX9oDxxEIehG94BPJ2tehLisjvnNAP/lnAZ4z2TOs3hndI1MLOsbgQK+qMTSnfs0P
         zzsvhlJH7ktP6oBGiZcV2AH/rngUmZTo+Nzzpl85KUArQ9KRsXLdR0WygL4JMOMXmLZM
         amOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+zwBjaDKNjXy7kJ0cYRs3SkOGTtmzHhKOuZrqNYCBmSYpPuTeH7eGyTY5X7iA1KSMxTkAM//SKWfOPrQS7nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7UCa05KkqkLsAxBRxElnwf3iia24tCzFXlW3vd6VHH0R0Jkha
	24zGFN5N9q7Oaolm/IQkqt/+nEB8YdwAatfnLTNiUGGsNXwfEFjwm3QF
X-Gm-Gg: AYBFou1mDpq/YpZ9dw9HMShStnFxesr17l/iPgCTN7/osBI0wEVgQgWjDI1uj/qeMTd
	WkISZsv2tkDh+I8NwnXw75AMrBNGwStnMW0tSSy7bMA6LhH8P8IHJ7Sl5d2xlAc4jJQLnrDic9a
	DUCs0lLGElCuBPYHKjuOymiLkcFqqLgQiVrZh0GOtBd1UA5Vl7T09kGUGIRelftJwqDkUT4dMdf
	2N4DDo8ksOi5u+5WZ2LBNSkjWK8JAhsawLdkJ+6EwQVGSMJCL5S4a16S3Myu5bnFtHI3fi2yugZ
	lX0wiwXb7hr9wLwZtNzr9bQQzIm/d7S7Gxo+ltTKVU7yXhzCtqH9uPKMcSGsD1o/+heE7rmwgDP
	+5p7wU1hC7u041nRyoGIAemM/ujqmv4fakrXc/9L+KGL/1r0t2zsgr4pM7oBPOMwYioofvpJbQQ
	valB1x03B+NViIlZvvpU0q42/w3lHtFc9fM2oU9t19dNfip1PTPaba9C1FykFRVLB9mw==
X-Received: by 2002:a05:701a:ca05:b0:17e:6de6:6a1a with SMTP id a92af1059eb24-18511ad9debmr10180916c88.8.1792376893915;
        Sun, 18 Oct 2026 19:28:13 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm28341876c88.0.2026.10.18.19.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:28:13 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 10:27:56 +0800
Subject: [PATCH bpf-next v5 2/4] bpf: Dissociate struct_ops progs before
 the grace period of the map
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-2-77b2e181e5cc@gmail.com>
References: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
In-Reply-To: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
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
under RCU. For a struct_ops map, bpf_map_put() waits for an RCU grace
period before it calls bpf_struct_ops_map_free(), which clears the
association and then frees the trampoline and the kdata right away.

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

Dissociate the progs in map_free_pre_rcu(), so that the grace period of
bpf_map_put() follows it, and make that an RCU tasks trace grace period
for every struct_ops map. It then also waits for the progs that read
the association under RCU tasks trace, e.g. from a bpf_wq callback or a
sleepable prog, as a tasks trace grace period implies an RCU one.
Stop setting free_after_rcu_gp, which bpf_map_put() no longer reads for
a struct_ops map, and update the comment of free_after_mult_rcu_gp in
struct bpf_struct_ops, which now only picks the grace period of a cgroup
prog array.

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
 include/linux/bpf.h         |  8 +++++---
 kernel/bpf/bpf_struct_ops.c | 10 ++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 2a51acd34f9a9..3b63fb6942808 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2212,9 +2212,11 @@ struct btf_member;
  *                           and its progs. It is unnecessary if the @unreg
  *                           has waited for the correct rcu gp or the @unreg
  *                           has ensured all struct_ops prog has finished running.
- * @free_after_mult_rcu_gp: Same as @free_after_tasks_rcu_gp but waiting for
- *                          both tasks_trace_rcu and regular rcu grace period.
- *                          It is usually needed if the struct_ops has sleepable prog.
+ * @free_after_mult_rcu_gp: Set to true if the cgroup prog array of this
+ *                          struct_ops needs a tasks_trace_rcu gp, besides a
+ *                          regular rcu gp, before it is freed. It is usually
+ *                          needed if the struct_ops has sleepable prog. A
+ *                          struct_ops map always waits for both.
  */
 struct bpf_struct_ops {
 	const struct bpf_verifier_ops *verifier_ops;
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index a1ae30b145a03..7c5cd6086e273 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -1030,6 +1030,7 @@ static void bpf_struct_ops_map_free_pre_rcu(struct bpf_map *map)
 	struct bpf_struct_ops_map *st_map = (struct bpf_struct_ops_map *)map;
 
 	bpf_struct_ops_map_del_ksyms(st_map);
+	bpf_struct_ops_map_dissoc_progs(st_map);
 }
 
 static void bpf_struct_ops_map_free(struct bpf_map *map)
@@ -1045,8 +1046,6 @@ static void bpf_struct_ops_map_free(struct bpf_map *map)
 	if (btf_is_module(st_map->btf))
 		module_put(st_map->st_ops_desc->st_ops->owner);
 
-	bpf_struct_ops_map_dissoc_progs(st_map);
-
 	if (tasks_rcu && IS_ENABLED(CONFIG_TASKS_RCU))
 		synchronize_rcu_tasks();
 
@@ -1162,8 +1161,11 @@ static struct bpf_map *bpf_struct_ops_map_alloc(union bpf_attr *attr)
 
 	mutex_init(&st_map->lock);
 	bpf_map_init_from_attr(map, attr);
-	map->free_after_mult_rcu_gp = st_ops_desc->st_ops->free_after_mult_rcu_gp;
-	map->free_after_rcu_gp = true;
+	/*
+	 * A prog dissociated in map_free_pre_rcu() may still run the struct_ops
+	 * from a bpf_wq callback or a sleepable prog, under RCU tasks trace.
+	 */
+	map->free_after_mult_rcu_gp = true;
 
 	return map;
 

-- 
2.43.0

