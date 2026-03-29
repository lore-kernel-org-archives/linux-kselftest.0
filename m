Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED22375F96
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774793128; cv=none; b=mgzrrkFdy4zEZcxI5k8wVQwLkhEt98OLMoXT6eIhRscoYaXIlntYAa/5g1gMsP8uf9YJQgV+ioZBCD3laO0D94OkJTpuaSFPnybNukA/Slmitx6Qk4n6BbFHtmmwBwzevjXHwq1aF0fYQMfw9BpLmw7X6KIlJ5bOD+7ambyxGE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774793128; c=relaxed/simple;
	bh=4gRW1+mtRMcdZfAHAzXm2KNnewoZoCSS46EQVHhhBP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JakvVMMNWPI+wpwOm7ExVu1EfubEEQEK/5wL54PLkVjWkuOFoSdlnh/tsqSbQ1x7nKubn2vwQV/w5Khf4ribaauBtyeb7sKVIJ4maqrOThs3H10YnbHbpi+YD0NBVB/IezeT3UU10OxtT/Ygsn2eOgis8bKvEXlXyaMZUdg7S/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsqBWlf/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsqBWlf/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2327222a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774793125; x=1775397925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi9szT9Syd9CFHAlHUGFYC/MCx4DDJNTxIJ9cbtZIrc=;
        b=CsqBWlf/TJjr0wVtBvbWZ5At3LF6/QmJjR6a0TOMhtQJ8zyKgqZkYjYyo3KXw/MQEH
         Nyn0nyOn22yAfoXAcFAkJ2RkmNn0kwQQX7JMUn9KSlJJ7qx9lp/lIyneRS6pj5kotAlH
         fKu6gqiqPCTLFy+UL9/8lZbSs3D0wGu4toU0d6NCBt2TtXkIHYhfur1/td5GguN+vz3l
         1twyGiIzGzO6qEbPsS3M3XtIK1XQHGNpDrutVJGTNC4ugHHJLtrY5E4KId2HV8cb7uNh
         +etHvajuyQBZELZFTq4l+cz3PgHQqJKDEKP69aVRbc/bvXxVqp/15bkBmV0G4yKQxbQ6
         kZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774793125; x=1775397925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mi9szT9Syd9CFHAlHUGFYC/MCx4DDJNTxIJ9cbtZIrc=;
        b=LDpMDPpLeOAJhKeeeLg4zwHAsjWP07b1OuALTMeRrCRkxR2yEFD0WRnhM4QGwoBxog
         LxjbwJZau4ES9tQx3CrwmLcH4o7Xiq/APlAD2erHKOW3LLo9UUjT1DfW9YBvsgAzBkkL
         H9v5Fu4JGu+la9fqnZt139E7SUjIxhJ0a5lnCQvtjRNh47a0F3Wf5kqo8D1GsdJ8zcD0
         FR4WeU4p1UUMMiI3y08iZOK3qX2kA4CA0m6zcqovZiFRdG+9lbVquK0QfBDO2GX3BJyv
         pDTXPpDesliPtxo7mlN0S89JaHYC/9XV2/y2VVIjkFdrvlsYNijHMsomnwZngEvAXZkX
         HfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPGsH0Y1dLsGIJppldmNJvyw+f6tR8sioYz4LHLwQy5pEdDKdpjIEpNOVOqbJVowDU7FSw9ASNe1UMwKxo7v8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1fIwIbRxKKMGle6LRHdkVsn9oXovvay3tjPfCjK4uleuTZNSQ
	4sFpPqvhDcSLgD6/rSoa0HpULUsjLwyxp6XV4fXrO0fcDXdHf7+UuRvv
X-Gm-Gg: ATEYQzz4bofDxIm616OQSSvakWHQ5oKA+wP63thKLXaGYcKin5ittk0B7ik3ZbM7bay
	MbYzQbOCgghR07wIqyV+lSapkJJm/mq9AKXRMX69x8BEwUF93FcL0k4wkJKV1HiGqu9pFqsKBl9
	Kih0q5sVtt8EOuEAd4a8DBEANbRk4edzxcxirRNxHXDOzzp75vaukgS0W7B8OKg4ARZF9Mi0JjM
	SB2UC6DhQpnkTrRh2IzFLoTk1s7wvHhDwBrcnwmYZX2Uah26lk1l1irEe8dhzKGwD2W9JwSOMIv
	Xk0JmkGGpG4qSjypwV3WRbXzQ8znfpnMAEgOm4zZ48tAb6PECfanlY/ipwV/2+U/jWoN0T722GD
	NCXB9CFDlj1ALarK/qXbNkYD6ScQTcxenpZtrhpKsknkIKZW1dW6TIMLYVj8QVpmTZTuxyYkWNC
	1HIPJ5cEvaP72zXCY9aJugvtsDoNUcYf0q5+mKPZXMeMBRceo22l31Tx3MdKmRGenf
X-Received: by 2002:a17:90a:1048:b0:35d:93ff:2854 with SMTP id 98e67ed59e1d1-35d93ff2b0amr3089975a91.8.1774793125137;
        Sun, 29 Mar 2026 07:05:25 -0700 (PDT)
Received: from localhost.localdomain ([113.218.252.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950bd630sm4417454a91.16.2026.03.29.07.05.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 07:05:24 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v9 1/9] bpf: refactor kfunc checks using table-driven approach in verifier
Date: Sun, 29 Mar 2026 22:04:58 +0800
Message-ID: <20260329140506.9595-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260329140506.9595-1-pilgrimtao@gmail.com>
References: <20260329140506.9595-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Replace per-kfunc btf_id chains check with btf_id_in_kfunc_table() and
static kfunc tables for easier maintenance.

Prepare for future extensions to the bpf_list API family.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/verifier.c | 261 +++++++++++++++++++++++-------------------
 1 file changed, 144 insertions(+), 117 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 4fbacd2149cd..f2d9863bb290 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -544,9 +544,6 @@ static bool is_async_callback_calling_kfunc(u32 btf_id);
 static bool is_callback_calling_kfunc(u32 btf_id);
 static bool is_bpf_throw_kfunc(struct bpf_insn *insn);
 
-static bool is_bpf_wq_set_callback_kfunc(u32 btf_id);
-static bool is_task_work_add_kfunc(u32 func_id);
-
 static bool is_sync_callback_calling_function(enum bpf_func_id func_id)
 {
 	return func_id == BPF_FUNC_for_each_map_elem ||
@@ -586,7 +583,7 @@ static bool is_async_cb_sleepable(struct bpf_verifier_env *env, struct bpf_insn
 
 	/* bpf_wq and bpf_task_work callbacks are always sleepable. */
 	if (bpf_pseudo_kfunc_call(insn) && insn->off == 0 &&
-	    (is_bpf_wq_set_callback_kfunc(insn->imm) || is_task_work_add_kfunc(insn->imm)))
+	    is_async_callback_calling_kfunc(insn->imm))
 		return true;
 
 	verifier_bug(env, "unhandled async callback in is_async_cb_sleepable");
@@ -11203,31 +11200,6 @@ static int set_task_work_schedule_callback_state(struct bpf_verifier_env *env,
 	return 0;
 }
 
-static bool is_rbtree_lock_required_kfunc(u32 btf_id);
-
-/* Are we currently verifying the callback for a rbtree helper that must
- * be called with lock held? If so, no need to complain about unreleased
- * lock
- */
-static bool in_rbtree_lock_required_cb(struct bpf_verifier_env *env)
-{
-	struct bpf_verifier_state *state = env->cur_state;
-	struct bpf_insn *insn = env->prog->insnsi;
-	struct bpf_func_state *callee;
-	int kfunc_btf_id;
-
-	if (!state->curframe)
-		return false;
-
-	callee = state->frame[state->curframe];
-
-	if (!callee->in_callback_fn)
-		return false;
-
-	kfunc_btf_id = insn[callee->callsite].imm;
-	return is_rbtree_lock_required_kfunc(kfunc_btf_id);
-}
-
 static bool retval_range_within(struct bpf_retval_range range, const struct bpf_reg_state *reg)
 {
 	if (range.return_32bit)
@@ -12639,11 +12611,103 @@ BTF_ID(func, bpf_session_is_return)
 BTF_ID(func, bpf_stream_vprintk)
 BTF_ID(func, bpf_stream_print_stack)
 
-static bool is_task_work_add_kfunc(u32 func_id)
-{
-	return func_id == special_kfunc_list[KF_bpf_task_work_schedule_signal] ||
-	       func_id == special_kfunc_list[KF_bpf_task_work_schedule_resume];
-}
+/* Kfunc family related to list. */
+static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
+	KF_bpf_list_push_front_impl,
+	KF_bpf_list_push_back_impl,
+	KF_bpf_list_pop_front,
+	KF_bpf_list_pop_back,
+	KF_bpf_list_front,
+	KF_bpf_list_back,
+};
+
+/* Kfuncs that take a list node argument (bpf_list_node *). */
+static const enum special_kfunc_type bpf_list_node_api_kfuncs[] = {
+	KF_bpf_list_push_front_impl,
+	KF_bpf_list_push_back_impl,
+};
+
+/* Kfuncs that take an rbtree node argument (bpf_rb_node *). */
+static const enum special_kfunc_type bpf_rbtree_node_api_kfuncs[] = {
+	KF_bpf_rbtree_remove,
+	KF_bpf_rbtree_add_impl,
+	KF_bpf_rbtree_left,
+	KF_bpf_rbtree_right,
+};
+
+/* Kfunc family related to rbtree. */
+static const enum special_kfunc_type bpf_rbtree_api_kfuncs[] = {
+	KF_bpf_rbtree_add_impl,
+	KF_bpf_rbtree_remove,
+	KF_bpf_rbtree_first,
+	KF_bpf_rbtree_root,
+	KF_bpf_rbtree_left,
+	KF_bpf_rbtree_right,
+};
+
+/* Kfunc family related to spin_lock. */
+static const enum special_kfunc_type bpf_res_spin_lock_api_kfuncs[] = {
+	KF_bpf_res_spin_lock,
+	KF_bpf_res_spin_unlock,
+	KF_bpf_res_spin_lock_irqsave,
+	KF_bpf_res_spin_unlock_irqrestore,
+};
+
+/* Kfunc family related to iter_num. */
+static const enum special_kfunc_type bpf_iter_num_api_kfuncs[] = {
+	KF_bpf_iter_num_new,
+	KF_bpf_iter_num_next,
+	KF_bpf_iter_num_destroy,
+};
+
+/* Kfunc family related to arena. */
+static const enum special_kfunc_type bpf_arena_api_kfuncs[] = {
+	KF_bpf_arena_alloc_pages,
+	KF_bpf_arena_free_pages,
+	KF_bpf_arena_reserve_pages,
+};
+
+/* Kfunc family related to stream. */
+static const enum special_kfunc_type bpf_stream_api_kfuncs[] = {
+	KF_bpf_stream_vprintk,
+	KF_bpf_stream_print_stack,
+};
+
+/* Kfuncs that must be called when inserting a node in list/rbtree. */
+static const enum special_kfunc_type bpf_collection_insert_kfuncs[] = {
+	KF_bpf_list_push_front_impl,
+	KF_bpf_list_push_back_impl,
+	KF_bpf_rbtree_add_impl,
+};
+
+/* KF_ACQUIRE kfuncs whose vmlinux BTF return type is void* */
+static const enum special_kfunc_type bpf_obj_acquire_ptr_kfuncs[] = {
+	KF_bpf_obj_new_impl,
+	KF_bpf_percpu_obj_new_impl,
+	KF_bpf_refcount_acquire_impl,
+};
+
+/* Kfunc family related to task_work. */
+static const enum special_kfunc_type bpf_task_work_api_kfuncs[] = {
+	KF_bpf_task_work_schedule_signal,
+	KF_bpf_task_work_schedule_resume,
+};
+
+/* __kfuncs must be an array identifier (not a pointer), for ARRAY_SIZE. */
+#define btf_id_in_kfunc_table(__btf_id, __kfuncs)				\
+	({									\
+		u32 ___id = (__btf_id);						\
+		unsigned int ___i;						\
+		bool ___found = false;						\
+										\
+		for (___i = 0; ___i < ARRAY_SIZE(__kfuncs); ___i++) {		\
+			if (___id == special_kfunc_list[(__kfuncs)[___i]]) {	\
+				___found = true;				\
+				break;						\
+			}							\
+		}								\
+		___found;							\
+	})
 
 static bool is_kfunc_ret_null(struct bpf_kfunc_call_arg_meta *meta)
 {
@@ -12680,6 +12744,29 @@ static bool is_kfunc_pkt_changing(struct bpf_kfunc_call_arg_meta *meta)
 	return meta->func_id == special_kfunc_list[KF_bpf_xdp_pull_data];
 }
 
+/* Are we currently verifying the callback for a rbtree helper that must
+ * be called with lock held? If so, no need to complain about unreleased
+ * lock
+ */
+static bool in_rbtree_lock_required_cb(struct bpf_verifier_env *env)
+{
+	struct bpf_verifier_state *state = env->cur_state;
+	struct bpf_insn *insn = env->prog->insnsi;
+	struct bpf_func_state *callee;
+	int kfunc_btf_id;
+
+	if (!state->curframe)
+		return false;
+
+	callee = state->frame[state->curframe];
+
+	if (!callee->in_callback_fn)
+		return false;
+
+	kfunc_btf_id = insn[callee->callsite].imm;
+	return btf_id_in_kfunc_table(kfunc_btf_id, bpf_rbtree_api_kfuncs);
+}
+
 static enum kfunc_ptr_arg_type
 get_kfunc_ptr_arg_type(struct bpf_verifier_env *env,
 		       struct bpf_kfunc_call_arg_meta *meta,
@@ -13036,65 +13123,20 @@ static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_
 	return 0;
 }
 
-static bool is_bpf_list_api_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_back];
-}
-
-static bool is_bpf_rbtree_api_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_rbtree_add_impl] ||
-	       btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
-	       btf_id == special_kfunc_list[KF_bpf_rbtree_first] ||
-	       btf_id == special_kfunc_list[KF_bpf_rbtree_root] ||
-	       btf_id == special_kfunc_list[KF_bpf_rbtree_left] ||
-	       btf_id == special_kfunc_list[KF_bpf_rbtree_right];
-}
-
-static bool is_bpf_iter_num_api_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_iter_num_new] ||
-	       btf_id == special_kfunc_list[KF_bpf_iter_num_next] ||
-	       btf_id == special_kfunc_list[KF_bpf_iter_num_destroy];
-}
-
 static bool is_bpf_graph_api_kfunc(u32 btf_id)
 {
-	return is_bpf_list_api_kfunc(btf_id) || is_bpf_rbtree_api_kfunc(btf_id) ||
+	return btf_id_in_kfunc_table(btf_id, bpf_list_api_kfuncs) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_rbtree_api_kfuncs) ||
 	       btf_id == special_kfunc_list[KF_bpf_refcount_acquire_impl];
 }
 
-static bool is_bpf_res_spin_lock_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
-	       btf_id == special_kfunc_list[KF_bpf_res_spin_unlock] ||
-	       btf_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave] ||
-	       btf_id == special_kfunc_list[KF_bpf_res_spin_unlock_irqrestore];
-}
-
-static bool is_bpf_arena_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_arena_alloc_pages] ||
-	       btf_id == special_kfunc_list[KF_bpf_arena_free_pages] ||
-	       btf_id == special_kfunc_list[KF_bpf_arena_reserve_pages];
-}
-
-static bool is_bpf_stream_kfunc(u32 btf_id)
-{
-	return btf_id == special_kfunc_list[KF_bpf_stream_vprintk] ||
-	       btf_id == special_kfunc_list[KF_bpf_stream_print_stack];
-}
-
 static bool kfunc_spin_allowed(u32 btf_id)
 {
-	return is_bpf_graph_api_kfunc(btf_id) || is_bpf_iter_num_api_kfunc(btf_id) ||
-	       is_bpf_res_spin_lock_kfunc(btf_id) || is_bpf_arena_kfunc(btf_id) ||
-	       is_bpf_stream_kfunc(btf_id);
+	return is_bpf_graph_api_kfunc(btf_id) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_iter_num_api_kfuncs) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_res_spin_lock_api_kfuncs) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_arena_api_kfuncs) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_stream_api_kfuncs);
 }
 
 static bool is_sync_callback_calling_kfunc(u32 btf_id)
@@ -13102,12 +13144,6 @@ static bool is_sync_callback_calling_kfunc(u32 btf_id)
 	return btf_id == special_kfunc_list[KF_bpf_rbtree_add_impl];
 }
 
-static bool is_async_callback_calling_kfunc(u32 btf_id)
-{
-	return is_bpf_wq_set_callback_kfunc(btf_id) ||
-	       is_task_work_add_kfunc(btf_id);
-}
-
 static bool is_bpf_throw_kfunc(struct bpf_insn *insn)
 {
 	return bpf_pseudo_kfunc_call(insn) && insn->off == 0 &&
@@ -13119,15 +13155,16 @@ static bool is_bpf_wq_set_callback_kfunc(u32 btf_id)
 	return btf_id == special_kfunc_list[KF_bpf_wq_set_callback];
 }
 
-static bool is_callback_calling_kfunc(u32 btf_id)
+static bool is_async_callback_calling_kfunc(u32 btf_id)
 {
-	return is_sync_callback_calling_kfunc(btf_id) ||
-	       is_async_callback_calling_kfunc(btf_id);
+	return is_bpf_wq_set_callback_kfunc(btf_id) ||
+	       btf_id_in_kfunc_table(btf_id, bpf_task_work_api_kfuncs);
 }
 
-static bool is_rbtree_lock_required_kfunc(u32 btf_id)
+static bool is_callback_calling_kfunc(u32 btf_id)
 {
-	return is_bpf_rbtree_api_kfunc(btf_id);
+	return is_sync_callback_calling_kfunc(btf_id) ||
+	       is_async_callback_calling_kfunc(btf_id);
 }
 
 static bool check_kfunc_is_graph_root_api(struct bpf_verifier_env *env,
@@ -13138,10 +13175,10 @@ static bool check_kfunc_is_graph_root_api(struct bpf_verifier_env *env,
 
 	switch (head_field_type) {
 	case BPF_LIST_HEAD:
-		ret = is_bpf_list_api_kfunc(kfunc_btf_id);
+		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_list_api_kfuncs);
 		break;
 	case BPF_RB_ROOT:
-		ret = is_bpf_rbtree_api_kfunc(kfunc_btf_id);
+		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_rbtree_api_kfuncs);
 		break;
 	default:
 		verbose(env, "verifier internal error: unexpected graph root argument type %s\n",
@@ -13163,14 +13200,10 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 
 	switch (node_field_type) {
 	case BPF_LIST_NODE:
-		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
+		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_list_node_api_kfuncs);
 		break;
 	case BPF_RB_NODE:
-		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_add_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_left] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_right]);
+		ret = btf_id_in_kfunc_table(kfunc_btf_id, bpf_rbtree_node_api_kfuncs);
 		break;
 	default:
 		verbose(env, "verifier internal error: unexpected graph node argument type %s\n",
@@ -13878,7 +13911,7 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 				return -EINVAL;
 			}
 
-			if (!is_bpf_res_spin_lock_kfunc(meta->func_id))
+			if (!btf_id_in_kfunc_table(meta->func_id, bpf_res_spin_lock_api_kfuncs))
 				return -EFAULT;
 			if (meta->func_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
 			    meta->func_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave])
@@ -14215,7 +14248,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		}
 	}
 
-	if (is_task_work_add_kfunc(meta.func_id)) {
+	if (btf_id_in_kfunc_table(meta.func_id, bpf_task_work_api_kfuncs)) {
 		err = push_callback_call(env, insn, insn_idx, meta.subprogno,
 					 set_task_work_schedule_callback_state);
 		if (err) {
@@ -14304,9 +14337,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 			return err;
 	}
 
-	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
-	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
+	if (btf_id_in_kfunc_table(meta.func_id, bpf_collection_insert_kfuncs)) {
 		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
 		insn_aux->insert_off = regs[BPF_REG_2].var_off.value;
 		insn_aux->kptr_struct_meta = btf_find_struct_meta(meta.arg_btf, meta.arg_btf_id);
@@ -14354,11 +14385,9 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 	t = btf_type_skip_modifiers(desc_btf, meta.func_proto->type, NULL);
 
 	if (is_kfunc_acquire(&meta) && !btf_type_is_struct_ptr(meta.btf, t)) {
-		/* Only exception is bpf_obj_new_impl */
+		/* Only exception is bpf_obj_acquire_ptr_kfuncs */
 		if (meta.btf != btf_vmlinux ||
-		    (meta.func_id != special_kfunc_list[KF_bpf_obj_new_impl] &&
-		     meta.func_id != special_kfunc_list[KF_bpf_percpu_obj_new_impl] &&
-		     meta.func_id != special_kfunc_list[KF_bpf_refcount_acquire_impl])) {
+		    !btf_id_in_kfunc_table(meta.func_id, bpf_obj_acquire_ptr_kfuncs)) {
 			verbose(env, "acquire kernel function does not return PTR_TO_BTF_ID\n");
 			return -EINVAL;
 		}
@@ -23316,9 +23345,7 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		insn_buf[1] = addr[1];
 		insn_buf[2] = *insn;
 		*cnt = 3;
-	} else if (desc->func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
-		   desc->func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-		   desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
+	} else if (btf_id_in_kfunc_table(desc->func_id, bpf_collection_insert_kfuncs)) {
 		struct btf_struct_meta *kptr_struct_meta = env->insn_aux_data[insn_idx].kptr_struct_meta;
 		int struct_meta_reg = BPF_REG_3;
 		int node_offset_reg = BPF_REG_4;
-- 
2.50.1 (Apple Git-155)

