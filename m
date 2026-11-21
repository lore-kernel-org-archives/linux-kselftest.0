Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249734;
	b=072yeoB1r64IGRujipvILowb/bpJ2pLECWDfbtafOl/LHPYj4oegChc5vrNR3BffaTW/
	 ueMUiII5gg4hTZN8RykgrKI7us6TXhAhqTrvz0wj1+hevUA+cKsRrWscYjGKETaEZFl++
	 k/EgV1SLjYuxgEWsSfeeN5wLvx+3PG4DxSdUlLk0+BnGLk3YSsuXtNGuFbkFYLZXy4TKR
	 sgeW9Ek25bw8dbgqK9Ed+4nrVP2lt3QGe8FJe35ob3KcdYM0tkgzWZkOyhNZW8tkNspvQ
	 sUYprRfukckfGe6sJoDvANTBsfSX+SRRuxER9ZF8hYzi4UmSCaA0TRH2Ou3G4vl5TGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
	b=vETu+IgpJ7BIFNAVgiTwrVF2YHiQIaI/qLinBySEyG2BEhrAiekN4+Fl5/Fgm6HHxl34
	 aRjpl5fvPnCyM1rLDCNfakYIwZ+BVcKekeqwQhxd+LygnkoeEizidsqYNo97W0dSV2DfI
	 K+opCXjMLjynUWTenAha8+PrSrqHGL6m/aAS15nPnlmEvuI2jvtXSApswSDnaNCFdD6aF
	 8bhoYGXuJGlhLsTzMFuR9WDxx70kKgKdn3ccZO9BU0Ygqads1M11EJRDlgZSx/DQEzzNG
	 2s8je/rQWNSMOz2STqXrvKjBCUMsct+2oATKWkEHvUL/gK2w5VR4df3PLksxLqCVDNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWTvHv2M;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912ED606A330
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 08:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWTvHv2M
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso1310748f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795249733; x=1795854533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
        b=JWTvHv2MoSyG38P2ut6CGuOo+RMs6DecQiq+J9y9TQm+XNetpG7gWzCduF+1Dq+EcA
         Y3FOLIeetVe7r6I7AkfF3FK/laIIZPksmjpIosdGBa3KNHqZUb+OZKE+yM+md43V29w2
         sovrWZbaKaw9XEZHUAgcsp3KxNw5lz/6bbZZEGeXpRPcTr8OJMWGps9G3UBVpq/fZnXf
         Els2ob3iY6686NjEuUwxO4w+d3OEy5z9s2KtJHmHa57HDi3rGQggnI0NaEjh365jLsnZ
         V1namk7Gmdj0DXYajWjOCesPRxk5t7JckHbva5Y3AzE/T0AJmDsb7dApwqBH9cY66ciZ
         rdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795249733; x=1795854533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
        b=RMhB9niAwAmvTln+I2t9XIGYQbIdMzZQ79nB8/HjygUCHE/dOwEvUjUH0ayYTccY17
         3T+oPj+LaN++NiXEwiW+H00s2fYt9bAR6bwzcDnooa13kMK4ZDJgaMFjP/LevDPgFTab
         2I9vmuYD0OQ+wpHTzi+sP+3GHQOI7HHXmgR8WO76qbOZfZfEe8CDK91L/XnSCCi1ttW2
         yxYaeWLKBMFDG+qtwarXeuePTSKJLgMg56HB+caA+RnGzLqMFlng1ZVyy2UVXN3ptPgR
         lezki/isRn5Uhb5H366dlksju1Q7HGvWRWGavaZp4nE5OfaEAst3ZVaNwT2aSj3fMuId
         2g5Q==
X-Forwarded-Encrypted: i=1; AL+hErG9ubZI60l446TT95PSjD7lDwZt/T8fqFxRZEfWOBja9nD4D8PJ52Sb8DKGPoxGGisiHMasC8exPfmz6h2ghyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UclcrS98WXy0hvvOy8sSf/QpLQnLNy3DMf/l88yNy1vQ0oCNy
	W28UNSDE+D/7MKHHyWbfi2UKv5ixqwbau01Z64a3yXCHbfRx0K0AU1gg
X-Gm-Gg: AZFdTZdjvxnT9VpODotpGo4VN7A/x5O5Mk/GEg5wLg3fmci8KZmrJc1kgeSasLaw61+
	YGJ1NxrP9ymJY5DHFlYW7wocNqoEpCSO5XP+kMBVCkbk9FkGv3awdlsqDcO6zCZsfrJ99dgSKjD
	Z+aMM8aU/Z0w8g0NxKK0hz4frJWbqXzIqYAHK04UKVMrnj3px1gwNVupGvz0YPgSVTyzKA20lzt
	KssZYJGwmmz9BUYNNMUjB6ZeWujleGCF+u5l77Bf1345T9HMA7EJFeSRxNAF4plK1+VjzNy7H6Y
	sew8H1ZCWoLMPcJYNXEkA+XjjbvuzaUoxdj5hTDKJzEZQwa21dzSscOJl14FAbPkC8Y2kDPQVjc
	zmxGANLoX6E2FrpmoCQnXq4dHXD65Gjg3c0D7z8zK0Bl3L1mwcCTm4RMEC1UqYDAWgXKTDWoK1b
	HY4gqPegoZoGvJCow251k8jTKrGpTNl20Nm0Rj43yo4mU41G3Mf47v2zbx8NXIp1zq+eCEt8UFW
	h/lNwxS1oe4OmfvU/RdBzGsNtygf8FlOBBHUi9EJVCpRoE5na1x12401dpDzOS3bcnnKF9VgTNm
	LH0eMkOt64qUOOAUnRwIw5NHRMnCir8VhZDZ3BfJNiFTo9rjnAwHJesbTj8+ZVbZh8JgP9l85R9
	bdElfhblGW4DO1rZ0CxTga+59DxUOvq2WJoC9udAVCbfbZ5nJ1U9WhsAfVb/XrHHEx27RDcOKFQ
	U2hYez8lSSm0Tv/U0tZWTDdswdZiP/+z6l
X-Received: by 2002:a5d:59c9:0:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4abf5b0a975mr10806542f8f.33.1795249732684;
        Sat, 21 Nov 2026 00:28:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm10892378f8f.4.2026.11.21.00.28.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 00:28:52 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: bpf@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH bpf-next] selftests/bpf: Disable preemption around css_rstat_updated()
Date: Sat, 21 Nov 2026 09:28:43 +0100
Message-Id: <20261121082843.44614-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cgroup_hierarchical_stats triggers a lockdep warning in
__css_rstat_updated() on PREEMPT_RT. The counter runs at the
cgroup_attach_task tracepoint under spin_lock_irqsave() on
trace_cgroup_path_lock. On PREEMPT_RT this leaves preemption and
interrupts enabled. On non-RT it masks interrupts, satisfying the
assertion.

Disable preemption around css_rstat_updated() so the updater can queue
the update without being preempted.

Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
Link: https://lore.kernel.org/r/fmey2ektwdk7l5aktjz3xb24x3pk3lxy3gfld7reazal6xa6u2@tmryedehqhql/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Ran test_progs -t cgroup_hierarchical_stats on bpf-next 9867c61abbd4 in
x86-64 KVM guests with lockdep. The test passed on all eight boots.

  Boots with an rstat warning   Before   After
  PREEMPT_RT                       2/2     0/2
  PREEMPT (!RT)                    0/2     0/2

 tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
index 8fc38592a..d4babda81 100644
--- a/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
@@ -6,6 +6,7 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 #include <bpf/bpf_core_read.h>
+#include "bpf_experimental.h"
 
 char _license[] SEC("license") = "GPL";
 
@@ -76,7 +77,9 @@ int BPF_PROG(counter, struct cgroup *dst_cgrp, const char *path,
 	else if (create_percpu_attach_counter(cg_id, 1))
 		return 0;
 
+	bpf_preempt_disable();
 	css_rstat_updated(&dst_cgrp->self, bpf_get_smp_processor_id());
+	bpf_preempt_enable();
 	return 0;
 }
 

base-commit: 9867c61abbd44f7053a871566b3d982f62c6d8dc
-- 
2.43.0

