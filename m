Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA29366056
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027283; cv=none; b=ZP6rcxRVTJIAf5He3ahFirsxc1kJBwmZsUa6Q1CMnQEou81AFdb/yWK7jJZUEJWNmejgAW64Qi1Mc5GFokZ0Q0Lp0cZNEPTSRXc/piaxLIg6niQlyTmxohr4yUSdQi74mqm+63NPxRuj5mJjzKQQ+8+I2DIqFEGdad1JffzmZyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027283; c=relaxed/simple;
	bh=kRJsrOOhJwypsGQeh0t77eM4spvDtzgMI09Db6pLmhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIYd2T3rD1vRsrR73ML40EbR7qS49lr0FtzY9xYcjQpacpcrAwos4zM+BTr2BeTE4+1x0RELMkVTj0bH2dJwjO23SlcVD+PZLOoeTb7Mo55BaCPXDBhIEsWYHI556sVZVxR9ekkQ5At8HaJFByN6reaevP3BQKcjCtNcU9hWGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EQjH692r; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EQjH692r"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso55572385e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 00:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775027280; x=1775632080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq5bYodbB5WenNka0ORppBTIQzpNw7WJ1K+vBmPhvzs=;
        b=EQjH692rxDyuj82HitC6JMRIM8afQoQVXKNYxJDD6C0Va0sd+pqIPjXjeuD0JoKpHv
         NzGiDAhiYcSuWtRHaAVnCRM2y28Qag1RBr/GDcTX9e40CIS/LFKkicSU0PylzK3YIZsI
         355x+Ea4wjYpXoA/n0QObzpx5X2Zj/czaGqbxEZYacpilHLiQ6A7tk1D5WWJhaOAz8xN
         BDxWzxQDAv/NUA6bx9da35S/oFIGuJGM1QsS9/NMf405reLbOV6EY+kVtCnjmJ4u8S+1
         zgbp5KPEjEC5FYBRS3yLqkofPh7s5kGHhyCKNwPtXN4GvqhZPdFaIgMgxte9RRx3srU2
         PfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775027280; x=1775632080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jq5bYodbB5WenNka0ORppBTIQzpNw7WJ1K+vBmPhvzs=;
        b=kzir410zzUkEZK/bhnnUITxSKBYdWN/eCPjKGkrIqLrN0OBWSY4fQIElX8dCI48/Yq
         nSkH42crTXsDwgHKx4W0OhkEh5mQCd2XGzlCimGcY+iFExjvnhUsY7PbQmsmjnn99LQC
         eqUKdAiNDp3mtstgPRdH4EEvO/hbMQziB96Z3AcQzRXp2j39jRXDeN+uFZY1AMR7svCf
         5BY+YCE3ktsrHpDFpJfem69oNjU8KamRuTT0Ijq9Cqu4ieU/1U4e5PALIavWiJ8f0URT
         jwCrF9z66qAjEMns6aRpLGfl+Eqj2kYEIG3c1+eWpKhhPFXZpyiOmfQZLt9TSeU4m/h5
         duzw==
X-Forwarded-Encrypted: i=1; AJvYcCW7MBgyaWnQ1uBEiWKDscJ+o03bR6LFCX+6cJ8fUinToauRH/kCEqjr+2U61p59L2RF0gaT6UU/+bXiPTLWfDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UuHZNkK0NeVaw9GGA1w7BIQEQsqTHHKDXYb6F5LpClTROEBO
	xcqQfa6kl0Mb734cWnK8c/30wpiEX5aL7qAJoHQKWVrP4YIiCkhLianiWwE/4wugFQw=
X-Gm-Gg: ATEYQzwBdr2FMUxovPJ40ihMReVc23MAbPXMQUYHx/FcBxJNfOA1M3rk5R+dsp6tTky
	FQW2xG+pJM1mgiozY9mZoQzTSJnrVgrxmlvdlny3fixvxMpJcw1xlUIlxWwf9qu9XpR1BBK1N1H
	ciPfDQR8x2nTgPLHLQORo8Fq2RYhGxqQFuKFLGlaJYjMegmExH5tkk0Woy0ebzZnDeW0w9dcVev
	CCX9r4jFvGeuCXLfbHRe99DMphhyMmv1p9YlH81nW5Liije5KFCYtOWF9dfr4/cClH7y9in6JCT
	ye3e7/CGIZdLfEU1sh5wARyH287DDGDxOKB+rudKDLV596fxuumoMrNQuknWq/qSxSUOuq3bb/e
	XuBcGOZFNS5fy1khqbYjPRXmpgqymHLvor5d8knfLR/jyp+ut1+f7lAUlTatt8TfMGZY4Nad3zG
	GHGluL+Ws/jOBC8WoPNK3ABiQjA/Z3QbGKfeaKZ0B1QKnI8j5Ekppxs37l
X-Received: by 2002:a05:600c:4e4b:b0:485:439b:683f with SMTP id 5b1f17b1804b1-48883595da7mr42337065e9.20.1775027279770;
        Wed, 01 Apr 2026 00:07:59 -0700 (PDT)
Received: from f16.suse.cz ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a887e3sm15355778e0c.18.2026.04.01.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:07:59 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v6 1/3] libbpf: use direct error codes for kprobe/uprobe attach
Date: Wed,  1 Apr 2026 16:05:02 +0900
Message-ID: <20260401070738.122709-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401070738.122709-1-hoyeon.lee@suse.com>
References: <20260401070738.122709-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf_event_open_probe() and perf_event_{k,u}probe_open_legacy() helpers
are returning negative error codes directly on failure. This commit
changes bpf_program__attach_{k,u}probe_opts() to use those return
values directly instead of reading -errno again.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/lib/bpf/libbpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 9ea41f40dc82..536c19c14d21 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -11835,7 +11835,7 @@ bpf_program__attach_kprobe_opts(const struct bpf_program *prog,
 						    offset, -1 /* pid */);
 	}
 	if (pfd < 0) {
-		err = -errno;
+		err = pfd;
 		pr_warn("prog '%s': failed to create %s '%s+0x%zx' perf event: %s\n",
 			prog->name, retprobe ? "kretprobe" : "kprobe",
 			func_name, offset,
@@ -12825,7 +12825,7 @@ bpf_program__attach_uprobe_opts(const struct bpf_program *prog, pid_t pid,
 						    binary_path, func_offset, pid);
 	}
 	if (pfd < 0) {
-		err = -errno;
+		err = pfd;
 		pr_warn("prog '%s': failed to create %s '%s:0x%zx' perf event: %s\n",
 			prog->name, retprobe ? "uretprobe" : "uprobe",
 			binary_path, func_offset,
-- 
2.52.0

