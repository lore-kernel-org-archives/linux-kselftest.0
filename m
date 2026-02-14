Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA0279336
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771043811; cv=none; b=q163QtX17x4WpVPXDJHKsTWRFhSh84tqYwEEg41aoLMRsthbQfJGidXWiCluLqxo0BQet2uUP9hXMI/bfhPOvxSj/S1MlsTy6hO1zCGufOwMFty1fxRjfqt7KspYyQqwUBwKmZHXMcRWvvxl667IkA8CcVhDwJw6CSh5SQCH6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771043811; c=relaxed/simple;
	bh=0Ut/Yd2xFzBBknyWQqwazN3LxjtJIbDOmzRkADmWq9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cP/d4ojYJSB8c4844p4NqsXI6BIOaGFc3ad/bxrzR44szXGbNgKKi+QS/FxMpQP0IFw8Ya/0LQIOBs8p8iR3jKqefmbF5hH2wwgX5pPEFk/fm+9LZFCI9QkQiLwrus/DDsOKVY+BkpH9VXM6ME3UZr8qfCzS3QRTSGqmmVowDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+/QCuMA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+/QCuMA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352e3d18fa7so823467a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 20:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771043809; x=1771648609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxayVJFfRrkf5xz/bcJOQ8q9k4PoLRBwxedlXN2B8nI=;
        b=W+/QCuMAgFk9YazxBDhqo4VqvXT7mS1tP++xH3gilwDIV7dRJVc6X9ZJsU4jlhwGBK
         qv9uZxBUexlGvYAFktWM+tbbSO7ORK7syIMw1BDLfGo2yM6fbBvnEkstbOHe2RF+r4uj
         9Avzfy6yHNX2QjtttmYsSJTzAynYFy6wfMjE/3v9IKm+djstcX51QIzv11s8k1MyG18T
         hAstp/0KfL0KTa2vfFazDk9r9XOcT/1dGXr88DdNHWMALuy7PGXO/7/Ay8BLXWT9ESvL
         w6hZ6D2rvmFihCVOGUBxZ+mJIH2YIrq2rAL1963x0u30AtOXXLu43JbjNgLViJdIXnqf
         34Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771043809; x=1771648609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxayVJFfRrkf5xz/bcJOQ8q9k4PoLRBwxedlXN2B8nI=;
        b=eBATU1y9TzDvgE+6k7aovWG06ixK50Y8wfewLj2Du8g3Nu64lMDjd0gE7jfFUMVuMO
         fheugh8gndKsCXuGh56rYnuUOIVe+xOrX5Ki2QXF91GX2LLA2N4MWpDPUStau3QGXYO+
         StpphwvDJGepqDcqJ0t41VIPJP036i8DosRDkbAr3llJalCUgKz8NtPlMlHAHKr7LWMl
         qLy0Rlw6j9EypvuL6a/7AmzWQ4IFSe1VEw4aRpAhD1/+4ehUohKXHo4/ER6TZ7Ol8ViP
         hrhy9LOzrq7AOuWdyHnAoTKyi8Zf/nUEOtHwingRhZaQFB9zlk+NMvOHHpjyNZQipzm9
         1aBw==
X-Forwarded-Encrypted: i=1; AJvYcCVMfJ1/03ONW+/vnY2xHP/kFiMb9vGf1xmbNboBu2sWrCP+Qv53trkkRkRxNuWG95JcM8Y+Y4m8K9unsj87ako=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP8WLX3Thp62uMb33SEuQ16BGr5t6dYzO9wKhi0Dewq7H6qvOs
	dPdHLrf6uCV6hfgJ6dkX+bjzMqtxy2ipefcn1Lx0as8R8MZGmRWwKPO3
X-Gm-Gg: AZuq6aK5WFtdzCHubtGwR5zn+BTGQRp+PQxBBijsvAVLISE1OxxFjsj8uE8ksyS98AY
	twbItTbCRpJqMTWhbS0TG8zQ6H4GAf20FS8enxIERms+joyNZoRuvIEhFXs9A6MFXIXeM8LvX1q
	qTfYfgi2OKjbycLlFNkg0OT8OtT3d96404yW6lcGPNBqWr/1BcZp3etIUWT2DsOrpW+grDA5qOA
	lqKpKRNC2BvaXE7lb/QRiIitfeh6WSbMcfAP/NHL/wruZR4w95L3mQ/fJdS7QAsWxWIYK70z79u
	Zy7BfkeiPa6wNyfFTvyIPTADn8Wypa9IxAHGb9X+/WUiiq3PVTXSxsRnM04rbq3jiYHIL+5sdLz
	Jzhmdifv4XX1L8nqkXHgJHLEDs0/jXJHLCglBi0TP87fTtWeqTMhl19mdF1tysASUHAzjyav/uq
	4PSxn7sfRxwxTCQ5UIk0aBlANW9jQuSfgisXLh/whAjDPDJe7LHtH0
X-Received: by 2002:a17:90b:134d:b0:356:2b1c:f629 with SMTP id 98e67ed59e1d1-356aad3caf5mr3372625a91.22.1771043808772;
        Fri, 13 Feb 2026 20:36:48 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e53936sm13519815a91.1.2026.02.13.20.36.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Feb 2026 20:36:48 -0800 (PST)
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
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v7 1/5] bpf: allow calling bpf_kptr_xchg while holding a lock
Date: Sat, 14 Feb 2026 12:36:26 +0800
Message-ID: <20260214043630.38644-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214043630.38644-1-pilgrimtao@gmail.com>
References: <20260214043630.38644-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

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

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/verifier.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index edf5342b982f..2927a4622ff8 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -21044,7 +21044,8 @@ static int do_check_insn(struct bpf_verifier_env *env, bool *do_print_state)
 
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

