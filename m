Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2410127CCF0
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 03:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769915782; cv=none; b=igg5pRISHGaGJLe30q2bSiJWrVwnPKENo9U/cdrICU+dC+SkjKukX9gmesnE+gfcck+GjegRhuzAdSEpioivhhSuKhSgySLYWsji9Lenht2U7cIcE3QDiCuonfAIIMe3KDjR4AnXL0fUur1E+XZcPbSmDHjTeSc/R4jQfL457hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769915782; c=relaxed/simple;
	bh=uUL3+hIqzzN4FF56+RZlxBho1NEz93n03uZmaBVx188=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpwhvAFjpguPurarZIBiRd3ZPEhW72gNS8LZ06R50g/MzZIxM1wnZNCJfpjx8WQlT/1MtsuSBjBFXIoLUsVFxwvywwmhrA5oyWqhpb1CTLXuuMcaXWIRnVJDH//d3qjloBDs2QcNqHiA4kbe0Phs2VQpzOLUwju8M8Aac0YqlpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5ht4EZm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5ht4EZm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-823081bb15fso1749471b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 19:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769915781; x=1770520581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=Y5ht4EZmA54Ut68q0sA1S71vHaQkGq7ry7LSRa8y/SHeaE2e3V+xe9KtzutxZJfD+F
         czxucIw7KK0Ug50P3KK7aX7+DAu7GzKSRk+3+LN1KezFB4NTtZSde7TUVEgw5TmhORn5
         IE9LkaTqwwiX1w+0aQRRkwxTEZXN/qKATkDymLG0YGc7uX8o7GTSqvRG45XQFW4snjoI
         l69qrbNhOqDijRiBk01dfyNn83HHjQoT3b02RmwDbRtAvk8/Sm6HBHiGe4iheGXV9iZg
         rIKAGft9ivhgfBXpJrosp+t5Px8LvvmQb/M2S34KTThwx5+ZQBqT8O5A9exSmMClAUCh
         xk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769915781; x=1770520581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=bq9hE7zMSkHbF0gNukYo8et/pYVf80/qqyWspi5LtaJ+/YKa8DWITJ+yYfcAyiihiW
         WFS92n1gLBFwmemlLZXuvzUsx6woNlLroceFe9Zqrh06sAfp0gaQ8NFQOBSbY7PGWTrb
         NVs01fyNsGl1mefd/nFsmLGsMgZdKfxiVfxkIHc7liHNzWQcgOOPvK5rMl10XBz9I1nr
         yWzoXpV2gAEhJLlvldWvG7a7dsfbObPkfNu0a3YR+v4a7m5OvuUya48DREh1AUt3vefP
         D611okxRUxZr7ydD5LMXPm/mJZm3etnOJNtJI2O/ytLmH0TbPa1stvgxb+/dv81/kEtp
         uo8g==
X-Forwarded-Encrypted: i=1; AJvYcCU4s2+kiWgeIQfgFRtKqU4OxDHud7p7ltwWoRdWn8lql4wg7ng+PFW9KB74akOxqDQOc4ApUipWwuntXwz+5J4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLuJTOjb2gOHCqPGB6qNpG1FihzORJrGbumPB96V7UsFO26fL
	ByLvKeUNmSsxRIHyU5VQNrrlzZ9ltjIU60D7qW1SyTb6eC/TRis3Ntm2
X-Gm-Gg: AZuq6aJHU4r1hRzsNtjXRbaDbq9KKHPgaeqCK1LrjSBU+VpcA9oHaMvnGjVhKDMyKcA
	mbKTmOiRNj1HRIOnHZwenEhGuWx36rhm2+/Cra0rH49IdAVZJTIFuk8bmXdHu57aipJipX+qaiu
	s/qJz7hNUsQPeZidXkKEmISVENfGvWEeBPt/ClO86L8/Ed0w0tUug4T8Qa2ktGtVUzUZprpqy0M
	ll9W/0Cf0dWe9HDcYOvxgmfmV1LJzWXm/m7JgvLwaNQGUCN/TzF5TceKiCq6DiL+bK6G9f0TJDe
	jT0DLBNF0WqUzFOogEkhS9o4oOEcIFsZLcDSgyMnpwlU6AA3qgc2G0nwuWFcHlAE/U5lT0M6o8I
	b5aMkZCHhe7uejyyxSg4rYCndyRjktvcUvxY1YUzmlOmRLfqKbOkv/DBeoqgM+SS9JOdHw3ZwJO
	LWsHSC7bZ8FnNVuVaE8U6X3Verv1pNXSordP+s/s0v/g==
X-Received: by 2002:a05:6a00:12d9:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-823aa6ec46cmr7512905b3a.33.1769915780635;
        Sat, 31 Jan 2026 19:16:20 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b2bdsm11810818b3a.30.2026.01.31.19.16.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Jan 2026 19:16:20 -0800 (PST)
From: chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	yangfeng@kylinos.cn
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH v2 1/3] bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
Date: Sun,  1 Feb 2026 11:16:05 +0800
Message-ID: <20260201031607.32940-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260201031607.32940-1-pilgrimtao@gmail.com>
References: <20260201031607.32940-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao <chengkaitao@kylinos.cn>

For the following scenario:
struct tree_node {
    struct bpf_rb_node node;
    struct request __kptr *req;
    u64 key;
};
struct bpf_rb_root tree_root __contains(tree_node, node);
struct bpf_spin_lock tree_lock;

If we need to traverse all nodes in the rbtree, retrieve the __kptr
pointer from each node, and read kernel data from the referenced
object, using bpf_kptr_xchg appears unavoidable.

This patch skips the BPF verifier checks for bpf_kptr_xchg when
called while holding a lock.

Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
---
 kernel/bpf/verifier.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 3135643d5695..05a6a6606b6c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20387,7 +20387,8 @@ static int do_check_insn(struct bpf_verifier_env *env, bool *do_print_state)
 
 			if (env->cur_state->active_locks) {
 				if ((insn->src_reg == BPF_REG_0 &&
-				     insn->imm != BPF_FUNC_spin_unlock) ||
+				     insn->imm != BPF_FUNC_spin_unlock &&
+				     insn->imm != BPF_FUNC_kptr_xchg) ||
 				    (insn->src_reg == BPF_PSEUDO_KFUNC_CALL &&
 				     (insn->off != 0 || !kfunc_spin_allowed(insn->imm)))) {
 					verbose(env,
-- 
2.50.1 (Apple Git-155)

