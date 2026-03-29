Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725EB37A4BA
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774793158; cv=none; b=SOPXTI2Nh7m/6g4mraOYpQpPNYwZ+s2hBE7o8r5QpXr7Nab5AV3JWY72wTD59g/Rp4t9oIUg3sWca+LicYk6KNI9EsqBcX8NAW7AoENQUyVLj0EQWWAeWPdnc3cbymZ7i0s6I3IxHfruRiT3wMAFwWJdYqFqT86z8Isp7jdwVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774793158; c=relaxed/simple;
	bh=YKd6ls40YDD26tsO07ifajw47M3k7vqF3qVCfUoibiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAU/UGlE97yYgSbX1Gb/1XoM6sgcRAzmNjmqaoFvuSEGBPMC1koHW8lbzbj3BBZtb6TzA114fuLcJdXFYtRQJeQzqCQWKQ/9yMm3AkIRgQMo+6XwDCUT7G9d3lAAvW+B7dZT9aIi3a0cSoAgAamN+DrY/sGaGs1ylrsNQyB2v1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBq6pgx3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBq6pgx3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c1a131946so2170097a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774793157; x=1775397957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOBfBfgSL8HGIwmMW7fxQx1ON8sALgbRfX0R/Gl6Mv8=;
        b=sBq6pgx3PG0f8brRpkuOjZdmjwU1Ur5Zd/zylQQWUrp4GLwpGDZSdZ9v/atBi6CaSj
         /NJjGvN07f7h5qsp/G6EvqFFlkS8Y90Td1TdLs6xgOIjdMhTX4q1V5Ah4YVWhOLWqBf/
         4Ah+W27HjSRKENOYjHcw2f+h7tsWkTkTNNxVZj5yzh7iRcTsZEdCzZomY+GFVhyhNGel
         mb1kcO33rMxS3I6QMQQtT32CdmOzrFEcxZ3Rb75k+xgUbxj4gzfSerV9IqGP6gp7HK8F
         WQ2GnUyVdVmM2EeuABRC43QmzsUvJ2olxkP/QMKzMFFYhSvp2INrAFOoYt8Npxc7fxoa
         bXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774793157; x=1775397957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eOBfBfgSL8HGIwmMW7fxQx1ON8sALgbRfX0R/Gl6Mv8=;
        b=BB+G4xd4kmOB1ECfN1wxeNWCpn/kc5VKU8fzZgVpf8E6CJn9/O05Kt/Vy5/DhyyWj+
         nl8WXou4FeEa3hOkS07cCXuBq4cELAba1wuQrI+yfzMKn8MUhi/hoeKdAYXfMZjk7Xxw
         dnFFyUTKSOmyHYgh5Fu+mxh5n9oSYzLQWZas5hDl8n13bJEPQrEH7b4v7H81atLVpLMy
         SJyRrVHWNsZfKozgIL+Mn0tzGFWT+kqtFdRRwO18uyX8GKeR5SekmcX7GtsPz2ZS25MM
         oLyMuu0M5OEyAOAI3eCkKCTCXu4QVoXMwSawtSFFimt3Q0D9BQtY1jEW9bqvuRuA3Mwo
         hf6A==
X-Forwarded-Encrypted: i=1; AJvYcCWY27pgjB6JAf73eFFmDHVgQzzNi9haxE57GZDeFcGKgHB3DFDzQkvtjuvcO0oCsZtySZxiGEhgTmmo5FF+yMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHlyMk8Li2XK3coUpKaZEwEp2dd13I49lGL7XN22x3PiOdj9YV
	B08wVgNpLcCyMRK5UoIC3V3sIhby2q7BcI1PGGii32WcFW9cUUAbZkQ8
X-Gm-Gg: ATEYQzx6buYDxPdIENdnowt2HFa2C2YKL7F3kVSVJ3Vg75XUvY8EuBjwIEeAwazqIGE
	SA+VYRT5S+T5EAQKQEnO01Fh2RxwU86Fjvust0gSSnVtwYaB+BK6CLs7I1Awvb4dxwJ/EgZ39Sr
	tvQTwUSYE1CDSM5Ip310sEv9zGNC72dD6RkOZSihPPrFq4ekLtcdw0UZoH5Pb/NxvDy4fZyuh+T
	XbQRBRAENQJ6yFPfHLXjvx8TP/MBX0qyaB24Xz18RYda4TNFwIW55Ka/jmwMGM3oFcFk7REb5bB
	7fyTbe1Iq4AcFJZEepco6b6pFcLyMh74V1eL9VAx8QG17YTqDE0HYMQor0x9+Zs1lPrRFmOK5f0
	eomqLwXyus0RNyCxwccDVK6d4eVMuMKND+zYVDmxqh6JHuFoPLLFAqSW+zOWru/yRV0LIxB55yU
	eWXBlHz2px4Ex04/9sRcCFljuwpvS4RKGJ0RWlNtJTeJRPChznfbSwBw==
X-Received: by 2002:a17:90b:4c4f:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35da5595e3bmr893075a91.6.1774793156865;
        Sun, 29 Mar 2026 07:05:56 -0700 (PDT)
Received: from localhost.localdomain ([113.218.252.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950bd630sm4417454a91.16.2026.03.29.07.05.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 07:05:56 -0700 (PDT)
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
Subject: [PATCH bpf-next v9 6/9] bpf: Add bpf_list_add_impl to insert node after a given list node
Date: Sun, 29 Mar 2026 22:05:03 +0800
Message-ID: <20260329140506.9595-7-pilgrimtao@gmail.com>
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

Add a new kfunc bpf_list_add_impl(head, new, prev, meta, off) that
inserts 'new' after 'prev' in the BPF linked list. Both must be in
the same list; 'prev' must already be in the list. The new node must
be an owning reference (e.g. from bpf_obj_new); the kfunc consumes
that reference and the node becomes non-owning once inserted.

We have added an additional parameter bpf_list_head *head to
bpf_list_add_impl, as the verifier requires the head parameter to
check whether the lock is being held.

Returns 0 on success, -EINVAL if 'prev' is not in a list or 'new'
is already in a list (or duplicate insertion). On failure, the
kernel drops the passed-in node.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c  | 14 ++++++++++++++
 kernel/bpf/verifier.c | 12 ++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 669e380746a6..68c83a009275 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2447,6 +2447,19 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
 	return __bpf_list_add(n, head, &h->prev, meta ? meta->record : NULL, off);
 }
 
+__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
+				  struct bpf_list_node *new,
+				  struct bpf_list_node *prev,
+				  void *meta__ign, u64 off)
+{
+	struct bpf_list_node_kern *n = (void *)new, *p = (void *)prev;
+	struct btf_struct_meta *meta = meta__ign;
+	struct list_head *prev_ptr = &p->list_head;
+
+	return __bpf_list_add(n, head, &prev_ptr,
+			      meta ? meta->record : NULL, off);
+}
+
 static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
 					    struct list_head *n)
 {
@@ -4585,6 +4598,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_add_impl)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ae8d1f2e32de..69dcf0105973 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12478,6 +12478,7 @@ enum special_kfunc_type {
 	KF_bpf_refcount_acquire_impl,
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
 	KF_bpf_list_del,
@@ -12539,6 +12540,7 @@ BTF_ID(func, bpf_obj_drop_impl)
 BTF_ID(func, bpf_refcount_acquire_impl)
 BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
+BTF_ID(func, bpf_list_add_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
 BTF_ID(func, bpf_list_del)
@@ -12617,6 +12619,7 @@ BTF_ID(func, bpf_stream_print_stack)
 static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
 	KF_bpf_list_del,
@@ -12628,6 +12631,7 @@ static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 static const enum special_kfunc_type bpf_list_node_api_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_del,
 };
 
@@ -12681,6 +12685,7 @@ static const enum special_kfunc_type bpf_stream_api_kfuncs[] = {
 static const enum special_kfunc_type bpf_collection_insert_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_rbtree_add_impl,
 };
 
@@ -23354,8 +23359,11 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		int struct_meta_reg = BPF_REG_3;
 		int node_offset_reg = BPF_REG_4;
 
-		/* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs */
-		if (desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
+		/* list/rbtree_add_impl have an extra arg (prev/less),
+		 * so args-to-fixup are in different regs.
+		 */
+		if (desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
+		    desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 			struct_meta_reg = BPF_REG_4;
 			node_offset_reg = BPF_REG_5;
 		}
-- 
2.50.1 (Apple Git-155)

