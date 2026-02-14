Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1326CE2B
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072859; cv=none; b=mO4kSRMgA1//Wm4x9Oi5LuT5kJ1jxCHa3tFq4s0Vn0jI0w5qDYnF8vMkbo4jw7/zM1tK/GUNmTqeiCJqgDtRYgO7MGjiRvAtG84ZlbaR5yYPSIt6J7TyVaYNwneWn1NDO0CjJ6eooDTmFprH8zg1MHtat0nxMyljuUCSEY15m4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072859; c=relaxed/simple;
	bh=0Ut/Yd2xFzBBknyWQqwazN3LxjtJIbDOmzRkADmWq9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUiFH865NslaU71A+OB9h6PIPWQZCyo0QSPOKq0NgRi7x7M2SG+BiAUnarpcG53Gj2t/rUM7S3Ibi2rFA30RqANJx6K54rvNGkl6m5+VWyV1a5Jh9mm4hIg73RQlUWRwfekwD/nODQc+cjZZLsgPrWDvk1mlmA4+F76+hF3hnGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGS6ldIa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGS6ldIa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82418b0178cso1048656b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072857; x=1771677657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxayVJFfRrkf5xz/bcJOQ8q9k4PoLRBwxedlXN2B8nI=;
        b=YGS6ldIaH3HUgjfUbozVr+n1fSt367nLyfwEJ6KQx3MTNAU2T5CQiTGyM9RdrC/g9t
         EEv2YcTTB13whz1OSIE0S4bcjhNxfqbhyNB8yUuxfSQhd1/fmPDVaI1MGhFZJ9mADfrT
         2qhohANm/hMyMQp5Mo3xkM8crTj5cSZBMBKlfuuz3RHZYF2It1g3c1cBwimYThj4+T92
         0lE8tRvrWqP1Ewe3T/H9Qa1p2b8kj3pibac6CUSzpPKFg8jQZnRclotn2c8OKeiPreQF
         0jSjfFN4gdM2CbiWFafazZYnZ8No39eFIXJ1Jd4DQgU/cq2Q4Yy6r+FRWv74iR4D7grX
         pNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072857; x=1771677657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxayVJFfRrkf5xz/bcJOQ8q9k4PoLRBwxedlXN2B8nI=;
        b=dOCAA9kH4/gy2Ivcp4RO1qyNTqboUfyU8FNtXuLWLPulkgrH55vYXtrIBfZce4ZsFo
         LHIRUgSmKB/KBVnpy8Um8JQ49TmlSIP7tW9jqKODd9Ahig5Trty6RwmcBLMpyceLhK9Q
         r8GC9XJIi0ReKTuxjXXJ8/RVq/6TUGtKinIE3WsfnfcIm9nrjruW/RogtZ6DPft2F25n
         d4KXENMPJt4T78z9LKq2BSTGSQOhEgEvY1vomhTYQK5K4uQ5vCG1HOeMM0OJIJpMhz+Z
         oLtU8nwe0lCmxIFOBcYl5PHW2YTqAY+xlKk1zFTRkJRtGrSWHZJ4AVsjlO8CSP7c7LZT
         01dA==
X-Forwarded-Encrypted: i=1; AJvYcCXbw+YpY1Dra6vKyvvt3Y6P97QfM/QiscpvV81IYYnoFPqhAi9IPZl5KWN8ueLiHBeG4fV3ShCaGfsqzCm9L2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yync+MvTAbpnbaeUptZRPuRRYc7V3UUv1tls3u9UCF2F9cuaN/E
	0USMUZ2UAZRuhcIN5jNeQF///LxQt8LP1Kvl6moLYoQVDVpmxyHw8Pb5
X-Gm-Gg: AZuq6aJpAGwstNWq2WWiQWgBwO/iwXUpQmQTbGKXkUlmXLJY+VCySYyTyezUL1Osabw
	qpPPAVSVqIjZkE97P4BWXv9SJcnlCvYbOA4g3Elolnai4xputDRld1XidT5nKfK1hYI15YbGWaM
	yXSxfQfL5IpicyWOMA/iGWVN/ioTRQHWg//b6NS0fzwV4NoYfo4Cn9mupwv4ajOGVdEDYf8VETg
	ld9dL7SbRaMFQ6KPU28E+QG67rC1b81g7dpMu2qnjRfGRlPB/8XOb13nen7CKoJb4d6SPorz6kO
	bK9LIo7SNBvfOqK93ZdwnuSUCCdS+m5gObv5s3AYB4f1jseKwHjA2ycWsqqBU0wa8rJjWcyid2s
	vHGp9YWBLS4yiB1IFCw0F/FPkJfSECQsYU0gRaRAuvCs2B1wdQFLBy3wywuFS8EUHXkvn3UmJUX
	cwPf4JwsfbgjkGliDp+2BZO6ITuvMDqWknGm5k0+3aYqQY62dNWIET
X-Received: by 2002:a05:6a21:7014:b0:387:5daf:b312 with SMTP id adf61e73a8af0-3946c797422mr4752317637.35.1771072857350;
        Sat, 14 Feb 2026 04:40:57 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2e40bsm7064497b3a.11.2026.02.14.04.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 04:40:57 -0800 (PST)
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
Subject: [PATCH RESEND v7 1/5] bpf: allow calling bpf_kptr_xchg while holding a lock
Date: Sat, 14 Feb 2026 20:40:38 +0800
Message-ID: <20260214124042.62229-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214124042.62229-1-pilgrimtao@gmail.com>
References: <20260214124042.62229-1-pilgrimtao@gmail.com>
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

