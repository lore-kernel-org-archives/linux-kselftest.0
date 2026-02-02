Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D10333A029
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770022875; cv=none; b=E38teJvAAZjLNX4y3C5yxRrCx4PjE7cbSkgy6M62ci3tTfWZvu3Fh7s/c7ZsNPVATqAo3VKDvjChn6rCCh+ILX8lIe2P+K2aNA4frz5WBzCrqdD1qB86YQYJ7UankgHLOaEOMRJDB0KkKFb0PM4Q+xEmDixLJug98EEloRTCrBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770022875; c=relaxed/simple;
	bh=uUL3+hIqzzN4FF56+RZlxBho1NEz93n03uZmaBVx188=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yh68JVQX5DpE5QH05S5xD/r5soS230rPOAxhD8C/1mU8qic48RO+dKTf3KGgmpsIhOVAQJqA3lDmvz3CHtax2opoR5huMZ0JHKpU6+eJoc6e5NIwLi/UBCWFeDPgb1TBF+VZa70bd1gRiWK6QtSiotEFTlcY+63qX6OcXoFzpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGcnQ+CV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGcnQ+CV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so1620095a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 01:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770022873; x=1770627673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=RGcnQ+CVutx+QZWU96DSzT7lgWeiAhn+WbSBXYeHLNvrKrHfMphkQCFyU/+bg/AJcd
         kHB1M8QnrlgPFpYo2vMcYNyJWAHokuaWhlMa53ayWoMORQcDIUQUKmk/46pJIFnARZQw
         tTlrX8HtW0RbNzkGkvtkmaC0NO88epNkJBzBTRnMI1oVkugN5PCtluzU7WDF1NISHnc6
         7pyPxvSYQWjAACp13DUvt6jXbk9x3FniVfHsIRzkuYe++kAxyiNGPajfSkRjLyrpO6Cp
         4ysk7R1NpUyERQcD6VDSiJV5z04SQdJebhN9b5+3766rclKAOfcy0tPmmZtIjY/jgj9b
         qEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022873; x=1770627673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32rXQW4BVZZQ4FbVA0RQJRaOaveBTs70Lc0Lq+KuBq8=;
        b=nvsD5uRihbHkrtS6mH/ijsvDSnjyB5Bv9gfVyryiMOx4uX2dcL2WG+S2kODzWkqSJ3
         9AU8HQOEJA6jEbn57FYKDYfS7iUUDKKIUQafcbErCOhlWymyh3Gj4xSJBNdrf6qsJv8L
         zIut7cTjWsgf2JwGaYUB6YL46XRqzFNp0Xi/jg2pwQphfozsQ+Sx3pn276qlAmkkQ4rV
         2w8spK7+RzQPDh6x8MW13ZGkDRzjD06++P1J/tEhnCTnb50AekUctTE8aLlEf73Bh3uP
         c2oyuE9exJlkzno+xgtv5vuIDQofj223AafSVvplVtvrAntYOMFjAFWwVXjtwfJRnqn8
         xh8A==
X-Forwarded-Encrypted: i=1; AJvYcCU7gJ7JeaxrF5Ixj0q6PKAD284N6/8+GZtLAKZTMI9OV4zGcRFz7FbynMWhRbB8jRy496jyocKA6W5E4cfozJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iztDqUrw7fGbV8HGOfytCAHpNwfo347yXEmLLCNdfplp9PdT
	NGJYx5DvNKJLZi9e/sjd8oaMHpPCvv06HlXI1JUV+rrNSOvyafcjqOtc
X-Gm-Gg: AZuq6aKlhkUJWQuKHLLiu0KEfLNNwhapRyL750EjHYQJkQ13N26h5a04tOBoFjzHqQc
	CmAtAIVHwiLldOFSSpH08wirbjUuA9APCg4KLmmOS3UE9xUs3vtvC/yvtN71NEjdDx3q2ugA99O
	4afL8VEO7dx2lTX258OQiIANKQacQXXM7iWNlIxL1mJJg6UNTBNgIW1ofQBWNGpDUtKy6ufxRKb
	21expu/qnDKb7GkRJjiZdFlrTZNIjV8ArLtO2HtgkDy0GCDecsfoq8z+NZLkiqEtUXF6kYIRTsr
	dLxYMUq3QB3BiLs53b35Xe833PFa44qlhTDj6SeCIXhGVgB9uUPO2FJAwQmoqkgukNPCudUtprk
	RDdSEX08n/xmSSpH5qhzlUALia6PPiMYyhoaZZzYL0AUHYvRgVH0Jk5iP6mXjR00+1kKSOCb9PB
	CYvB7PnKaaW0gVd6VndX2vZDYgCAyw9AdegepjMfWGjg==
X-Received: by 2002:a17:903:2b04:b0:2a7:62d6:d049 with SMTP id d9443c01a7336-2a8d7eb55c4mr94604105ad.8.1770022873338;
        Mon, 02 Feb 2026 01:01:13 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414f1esm139167635ad.24.2026.02.02.01.01.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Feb 2026 01:01:12 -0800 (PST)
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
Subject: [PATCH v4 1/3] bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
Date: Mon,  2 Feb 2026 17:00:49 +0800
Message-ID: <20260202090051.87802-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202090051.87802-1-pilgrimtao@gmail.com>
References: <20260202090051.87802-1-pilgrimtao@gmail.com>
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

