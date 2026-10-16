Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386740DB40;
	Fri, 16 Oct 2026 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188887; cv=none; b=lxdMWadVcOgqmqf8JubLhKAK+Akv/kEk47Yjgk488wPuDYMKAp/ocrK2s1ordAd7J/IgSXekrVqG3ork5NHxT7q5tIs3ehBOUnxxu2UbrZK7wTHj+EIn9cVtCMI/WMvZwD/cmsFckYJz+CHdnWT1E9Xhy29QHrjv4Xf9MQ160e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188887; c=relaxed/simple;
	bh=GlfaZrhjRMJoZXpJ6aUlP+HK0rW7SzN6kBLR37a2muo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSxV+X/P1Bjm7brf+lUFPcWAHXA6JppUSRqx1YqQDz2Aup8c3KG6Kf07Xf/NpKtuGEzmG9Ad5am++Bcffg4/jyCMrmj9NPyUn/L9uH4gEuud8PceS4jPpXFh0uxe5Iw4EHOpjt/9Og+fXw4jHMqLBhVMcaaiWfE4n5LMWXBZruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=MVzLS1Hh; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="MVzLS1Hh"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xHpC7-00CsiV-4B; Fri, 16 Oct 2026 23:10:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=7fB4HS5CFNPuAXVtZFnvnrOpGuT35l2PpF7b2uAh5ws=; b=MVzLS1HhzypwqLQLZdUXdngGBq
	rxiAbrJIczXQYLXM2f8RZ3xwbt/OZYUAvNQTlG3HvM3g6u/GdII7YI/ZTUrI97YfRdtRD8uAxSM08
	U/oqkPcTx/gOHlCDDWDB2KZRNxFkf/GQVS0TjUeKvWZNqF9v3mqH2CMyX8EptRDpnwn1Rg4jS0Z+7
	2eUQ7b7nYcSqYPI59hcs7P6OLT7oUqeyBFc593pt0iPIzo9LwI/vM66GCDA5v5xuxXVgf4XTynjsv
	Top7oHHsCj0DejojKuHMgjDsCbO2Rikr00oIsfixSIewiChfMYKL7q5U0wtzoVhQYD6niAzptHtlb
	Q7h90Klw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xHpC1-0003aK-K3; Fri, 16 Oct 2026 23:10:21 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xHpBo-00G3o2-KQ;
	Fri, 16 Oct 2026 23:10:08 +0200
From: Michal Luczaj <mhal@rbox.co>
Date: Fri, 16 Oct 2026 23:09:14 +0200
Subject: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context sockmap
 updates to iter/sockmap
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co>
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co>
In-Reply-To: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Lorenz Bauer <lmb@cloudflare.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michal Luczaj <mhal@rbox.co>, 
 Sashiko <sashiko-bot@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>
X-Mailer: b4 0.15.2

Among iterators, allow only iter/sockmap to update sockmaps and sockhashes.
Previously, any BPF_TRACE_ITER program could perform these updates, which
caused locking issues in specific scenarios [1][2][3]. This tightening is
part of the broader effort to lock down the BPF API [4].

env->prog->type check covers the BPF_PROG_TYPE_EXT case. Without it, a
non-sockmap iterator, e.g. iter/unix, could call a function named
bpf_iter_sockmap() that has been freplace'd with sockmap-update logic, and
still pass the check.

[1]: commit 4d328dd69538 ("bpf, sockmap: Fix af_unix iter deadlock")
[2]: commit 64c2f93fc325 ("bpf, sockmap: Take state lock for af_unix iter")
[3]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
[4]: https://msgid.link/akRZ_e7DJh2aP-2i@john-p8

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 kernel/bpf/verifier.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ddfa0c6d2755..c63abb13ec6d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -10331,6 +10331,7 @@ static bool may_update_sockmap(struct bpf_verifier_env *env, int func_id)
 {
 	enum bpf_attach_type eatype = env->prog->expected_attach_type;
 	enum bpf_prog_type type = resolve_prog_type(env->prog);
+	const char *afname = env->prog->aux->attach_func_name;
 
 	if (func_id != BPF_FUNC_map_update_elem &&
 	    func_id != BPF_FUNC_map_delete_elem)
@@ -10341,7 +10342,12 @@ static bool may_update_sockmap(struct bpf_verifier_env *env, int func_id)
 	 */
 	switch (type) {
 	case BPF_PROG_TYPE_TRACING:
-		if (eatype == BPF_TRACE_ITER)
+		/* iter/sockmap only; type check rejects a freplace of any
+		 * iterator's bpf_iter_sockmap() subprog.
+		 */
+		if (eatype == BPF_TRACE_ITER &&
+		    env->prog->type == BPF_PROG_TYPE_TRACING &&
+		    !strcmp(afname + strlen(BPF_ITER_FUNC_PREFIX), "sockmap"))
 			return true;
 		break;
 	case BPF_PROG_TYPE_SOCK_OPS:

-- 
2.56.0

