Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C9415E97
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518952; cv=none; b=HCGWRYVxUmX4sPliBOpCD8unwEoUMFzTm7TzV23jUjsn5yRpWi58Kbeq/HsTijiqLoqBCr7QEtuhlTqB2/LLd1p+n+nTUzuWncHnNg889+xJXcG3OGNXeb9lBrW/VB1Kp7WhSODUKapUOY4d/0vEUpvRD9CHzF27BFP/ISnYhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518952; c=relaxed/simple;
	bh=dZ8/xKkTAFkHi86Z6ZuDxvGdLye8g4djv43rb0NZrDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVMjMHn9udf5Xz31t1HVG8LswNO6etZl4O10oHhJO7ktTX1aiGZpqGRt8dI4tYjFlxDJIMoTP5B+n0O2Vln7XYVaM+DndLIvMTQQzIpWXy41vPCS4V0WiMfZrcL8m6EtFO0TVQzVVfmoxmgs27e9Yq/2RJa3ReVje4ctXtamao4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBIk1urY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBIk1urY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a7bced39cfso33515495ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518952; x=1771123752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUvK02mPR1NAypKry79/XuiDmQeUURl3TvGI0OGIX0Y=;
        b=NBIk1urYaOJ0Lssvt3oF2j+IRAm/+RCTyUujXkbslhQ7FMxSwbKv87C7VKVqdy8fwb
         43Mw9NQ2yHC5ntlMX+7u/tSlEejPP2keejSoaO3BCKTdQfAPN6SThepVHyIr091c90/C
         6Q0kgvLEnvbY0pagLvVHbV9f5adXT8X5LT8ieTzXVDTILLh98v7EfKy+/oE4dNGqB0X9
         AtEqGA5AZyItAGbd719ZtctnPiniGqUEQ7MIPGLkKX3B56Dmt+AUSq1SGbuunnRm+zIi
         9rXGTiiCreQ0OwhA1KZvKIQaAK9h/x0907d6E3ndOpGSLSVtOGchsH90HmvOz+incc33
         88Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518952; x=1771123752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XUvK02mPR1NAypKry79/XuiDmQeUURl3TvGI0OGIX0Y=;
        b=ZUM0jmcrgUZmmUNhKde8eNH/Lgyowg7GLASkc5W6ikh6o3bGKoCgll/JeWd+R+sBGO
         7EJ5Jp+d3SdbxSRKspb6QFkzW94w/ADmz8wTodptvR/X7zx5drlbyHb+IDOnsisFaG7r
         tWBFTFSFWAAStHXk9kcbHMQpHeFahP7iDpZUoF99MLTDsQt5yM5NnQSGAdWUZiQO9VFa
         yqfwhOsIG5TPDBS7kI8i+4Hgzm4l2LwaZW0PvqRbD5wGW+REiFahOIVD2KUgwCSqIQr2
         e5Dp4lmN/I+Bq3yrbQnN0I7L62BIeYjo7z7i4AZgfiH221vu6/WTQ9Cq1/08G3VqtIRa
         GTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVljDR+MuhoB2G+YaliR9xzGPVTqfFA0X+EyCIrDI/aIj3RBVlIZeMoGAWDYcLPywbbawgt+SEzSX7k+ndD+hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXg68cYxQsaPvIQxZUMW/2cvXe9uP3cjIEFdVHm86qpFMfx79o
	NI+1gFbMQ2s2Z6+Pt8G224+fWYeYcfXYZXYx57Oj0bA/ED9zw3QTgbdk
X-Gm-Gg: AZuq6aK14Hp3855UZlDfWOnc3B2LturA1lQP0exhWwFxDKMpuD1ZwvjiKooycgRRfhg
	QxbzX5QMfCHM+UOhL1BOAJYZhn6LOUw5yt18epwOCYm8K5bMkH1gPYKPs8mmy3qCitEyJ21jE/j
	xulunTmJM96HgDsAfYfqQefbEUkvOP3T2Xl0INojAb98IXM8gIf5LHjqW3TAkZ54EWqGVyrqt+3
	K3cEa6K60yhzK9Nc3DYNRWtkQuUBCTjKQLBtRJaD2P31ka0sx5WxPUpA6InGqGMQBi2cwxLL51X
	YuFG68o3kczK6ey5GVsLs5TC0hN8aRqiygrR/KaIFRStlMqUHv01df/qXc9PU32TtmDUWNOccMd
	AEW388LqOf+EhYiXHqOxIaTiyi3/jdE/spD2uGsjl6GAjKI2P7hYF+08it2FLR8mwxkJzy9t9wW
	slPffOo7g5jA3VTNCZ1tFPSqfk4xBPieFi19BFSeYO
X-Received: by 2002:a17:902:e5c3:b0:2aa:daf9:697e with SMTP id d9443c01a7336-2aadaf9706bmr12330795ad.48.1770518952131;
        Sat, 07 Feb 2026 18:49:12 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9f5esm67194715ad.51.2026.02.07.18.49.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 18:49:11 -0800 (PST)
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
Subject: [PATCH v6 1/5] bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
Date: Sun,  8 Feb 2026 10:48:42 +0800
Message-ID: <20260208024846.18653-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260208024846.18653-1-pilgrimtao@gmail.com>
References: <20260208024846.18653-1-pilgrimtao@gmail.com>
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

