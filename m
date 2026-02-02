Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371B2DF144
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011921; cv=none; b=mj/1Xy4ZJB2sDtQ6XPvQOSNGku+dY5DzahZ5+sjgAXeduD+TQdy52VNNyNMT/V2QbXs756JU5jLAHrtgu46mfRJ0aHoeS+BUnp8FKdXUuqL4ctZLMxx036wSVRb3TGsN3hQBJL+axoF7iZI92KTiVJsR+CzC9qnVxpn+Z3+tRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011921; c=relaxed/simple;
	bh=uUL3+hIqzzN4FF56+RZlxBho1NEz93n03uZmaBVx188=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlCEMmqvnozymNGmj360uYTySLR8NfbkdkyeTg0KvI6gqjtzzYov4jSKoUj4UOMXmXWE41vk1VjxNv7qp7IKQI59HrD4Zizuw8LebyLXlmM5plb8g/op6RczBqoLFzArti2HKsRheZpBVIJgTmZQTwR71NqKTHgxiD3Pb7iH7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfyqaqaz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfyqaqaz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a102494058so22778905ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 21:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770011920; x=1770616720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=Zfyqaqaz4Mx2MA20CZsGw4ppd1SZgf4inyGhFsQKWnbn2i1y0AHD7oeB8+F0PaBVCu
         UZb99d0Xy4wCCcd1Iqu6ro4lJnQwEk0p3O89TrjSsDvQYeG8TYIj9AqYO+Z5NCv4WWU1
         5B9qTUNfKkGELUm3ZDfAOS2ml4eMTX1HXXcgBQ+q7mV4vTx0OXRp/gX6REPGDYLhkOcX
         9Sdn+vaIxi4prkZoH2roAueM8bI1nwldYwfmT2ab3M7QBl28o596dz52bt8F/CLK2A5r
         Q66OTJtPHyPMnkzrEXo4SeQsbJf55o+sg1hg35uOmMiojavebauwGLS8ETDRWrsiWOlR
         9MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770011920; x=1770616720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=EjxRUfBqhA4BE9smQHLu4nYHOom4LjFHF/guZXjWCZwlXRMcc1N3Hbh2gSP6BnwocA
         VGtaIu5a7wrXNh/ygfEEKgouU9NUxVM0V4JuZBLxSXUl+4oRC6/nLophlri5DZdXmcW8
         DukBA7BUmTQqMyWcdkmFQqRNpOQoDktZA3nkeFHA3uhK+vEJ68xZzsx+nRvkKAwyLzQC
         R/DMUnXM0awvFFbA0iOnMeOl8rzcLdDb5ZwZAGTbiX82ksv37yI8dqs43EGpVXoUj8xV
         38ILWmx01d1l4WuVe/2JYX1c2wXBfhTkYGSc8Z/3nPaj8J5qOwsIajREUG9dawIYg1Fd
         i3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXCnEYlc8vn2KbnxcXrIBrhhXDgrkceQ4n9FlesWQGINL6qtpt4VvvFrn41IK9CP+yCIGPepiQQC0bGt9PUqs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZW1wlGtt7yWNY6W6gnymBV9mPMgMJJWfD2IQqUY4SMX64iAC8
	+caN93/vXvnlDV71fFEdE1RrgGwzj1RfYJqlRMvTAlxITSMoa5p9k9k/
X-Gm-Gg: AZuq6aKrWHtVjzVuWApwA5HhNOwsViQVARAgtUNEVJTQSVti8XhDlMK+F+RVtKrVsJq
	nPQVpWq2wYq6HApDLWBf/SLoBS8VoZPe5djQedHlMouyDxnngthfI7f0jw9+VEQ0Bf9LD5hPYBY
	b87g6XCFChDZmNlSPqjQLN1kmoM/QKILPfxdT1QWXnE1ZdrlFpepYQYcrv9JNbqBzPJodlTwIA7
	rM+UwxLkP8jQnkk5OU0ZcpEP1lpG9UuaeLWJWXCeVw3FIoQu8TRFtvwD6YEm8ndEVY3Fnt0yVuw
	MBMkwchNjoYKfjG+auq6kBTWEAs85wBT+Prc/LzkNBMlATj6EmQEoMOZ8Vdr472SCYmVmhO8gAV
	QpOKosBdlyqFRYqgoR65GZuNHyuNR748D18nRtJ0wWX4i4NZZzRTOabv7f/yEjcS2ON3eK0wPod
	t2veIwoxuGy5BS7D82eg6O/63c5YPlWYrlykwwTuJcAQ==
X-Received: by 2002:a17:902:e749:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2a8bd4c6f2cmr147962965ad.14.1770011919560;
        Sun, 01 Feb 2026 21:58:39 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm139121185ad.30.2026.02.01.21.58.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Feb 2026 21:58:39 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
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
	yangfeng@kylinos.cn,
	alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH RESEND v3 1/3] bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
Date: Mon,  2 Feb 2026 13:58:16 +0800
Message-ID: <20260202055818.78231-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202055818.78231-1-pilgrimtao@gmail.com>
References: <20260202055818.78231-1-pilgrimtao@gmail.com>
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

