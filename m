Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622742;
	b=0V8hdz57SYEAYrpWJQ46ofgyOayreopRN7btKULExDN+jhlVtPFmv2JJZvwsGGD7hEPP
	 pJisDhiuq8su11W0OuqqwIvfRVVl+3uXsgrYZwtB/9nZa2GpNbR2JD7gujfL8PUDc7nIN
	 c5Ft5ARq49HIa1FB34KWXrmz/TqZZKIfchiMNdagWXrzg//IkdbpjRdKbIrP0YgXCVZN7
	 kAbAdT5KcKNcxUQTR4ETlyFgH5oUQH0/ux3f3rQgzHsE4ImcZNsrE0j02nPkKLiGcfIZs
	 NkXIjrp4xSW3ZawtXsKU+gzBdCTpU/uJX6LsIDr1gt1cs9bKSeHgb5ObfLszL2qQzPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kqe+LXyHbZNd2DifYRp5LCbdDXkt1yMBwCvDevw6riM=;
	b=e5V+/c5EG4L+UFHceI+5XgNGyAGh15OppBA8JSkjgs7AXHZYzo+wCNasOFEltq5aVYI6
	 T2t+VCXKqiRWI6n7jbxltMoZwVKVTfFSnWbGMA5Vht/iC6CPgATRGLZ6ERkhTVqgCt+2R
	 baBbNKf+RnsKBbMrWr1wklHVOozyVEAIUxIaTHeIVzS5HAdaxx5F2x1RiuWIv2s+IDMO+
	 hmdgTaJugi4n7SImESXIPtBD62aMRzrHgG7p3nP+V3dEL2gGr6t/bV+X5Q+PiwQmDrN0H
	 fqI65n4wlomGxYnYT4GGucCuXqlRuyhE5/sD3QbxxEAbFloDnm78B3fcFaOzGLNDggg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQ8qwhmO;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4E606A32E
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72A4E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQ8qwhmO
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso822568c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622741; x=1794227541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqe+LXyHbZNd2DifYRp5LCbdDXkt1yMBwCvDevw6riM=;
        b=qQ8qwhmOjvVw3NxAyTtnjTEdrS2eP/EsR8KQSskMSXBx+DGMIKnfYohOrc1ePhdiVn
         WZ19xRNBaQQqtyQxCAwsKXldt5GSiCR+uVXS6y3ISfH9mZD+rbeHKGt+CLH0lEJp1zdv
         R8f5ElFcDXulW/K7LYsZwCm/YnMwaDFYvxP7Nh/RlgmGCDq3xgqF1gTBpibmsc5E583Z
         auRqXYDNWMFVGb2lA/Su9toXoEKocSHRcOdwMNYKSHP4HNbFdkjSb4n1DgxM/pNiP9N9
         SZwCv66ItecoykQIC8yF6Z/Egq0ydCksMvx7bUUItvE2trHbszoS7hFexQt5P5yEfWpd
         hFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622741; x=1794227541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqe+LXyHbZNd2DifYRp5LCbdDXkt1yMBwCvDevw6riM=;
        b=L2MsDyuFv9aQi0YqIbQ/f57FEyMwzmiyIxx4QB4ogYAaol617pnvDHF7r5TzdaVWLo
         rouhQgsp4XSJ0OHra4cRZTCYUKu1EQPHcM99xgScBCqz0UajQGBx+QC13VowzY8fS2zE
         b6YUMT6IpHDxwBYhj1ltLfUvq0XAXR9XabUwyRLoXP4xBMRjJvkxy1RWQXJctIHOuk0S
         Q6QEVxAtiF7+AZtdpSd83wCpG1SpwAoH/IB0MHM4Og/KuiTxnOzU8xkBofDfNAcsf+d0
         lbTW6wvvY97+sIfyYJCf2qA9RNvqhlYXYBYb7krz21QRNK2p5h+7fO1VbgNmvFKBJ80G
         eerg==
X-Forwarded-Encrypted: i=1; AKwUvBy1CavGd11LsnfKqdUns1cbSz2asfiUbJjEw05FWqbauV5Z5aAGKlQh/Wk9wCA5LVlpbaHKP8TGHQwuy8dCBJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMXLV5wEniOfQzmJhMBahCbv/KMSxWGxyJQlC83HpC/NhoL5CR
	6S249Fh49FfaTkWh4HJIizkYUKlEeYgKSm/+APXQ24+HpE24LtezqLvz
X-Gm-Gg: AYBFou3sdHAHbxC9XSDDlbNwHmLqCcf3KYZiaESp5xM1DWSpGugsR+Ezlfkarwjj6XV
	vlwkRrq75OpXCOS1fyMqi7b1ItHYi+ngttoKXY2h6YGy57Dybn7Z7SXVfIp2JOu9YPR2bC8rtOi
	P/A39vi6CY4WEbTygBRQlRS2GC59wEjYU7fNS/IsmHlPmJQ0lDxn26eLcxCJxMWAiFCkVHw0J2y
	k6pG5XlOB/1TDyH5Xkxmg7ogRqsrnbmlzHYH8E8fmoUpVHI8Q1vDy+3xiyOM0IwBywOm2th4R/+
	NeiM1LUmUv79XGPz+AUqXMmB5aWr4Y0Y6kbkIXKOLC1Ef5PnKdYiRKNO0atrBVE04JWaJZHmFNC
	JRSgFLpMeNdcJVD/5kcJF7nHFxMbeMBzJzI47czT7Sq0XkwyIrsoEWaEgvGlgYgbkkbjZU8Hwrj
	Wlhy9QX+EmMe71Y6GhopGjDoIF/MQhG6XgV9mCwf1UiEa7unazTGCHly/fl7lFkAxMqpRttMjhe
	fnabpQqa2D+dtUZVO3qBMslvNsV1Eck3DJbhEOyblApkfakjnc9l+wPKvoSjNQ95nk+HFrFETlB
	bOiedZ55ANQaCx5tzzhmop7H
X-Received: by 2002:a05:7022:7f13:b0:144:eab0:9cbc with SMTP id a92af1059eb24-1ac5e8dea62mr13878426c88.37.1793622741463;
        Mon, 02 Nov 2026 04:32:21 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:21 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:32:11 -0500
Subject: [PATCH bpf-next 1/4] bpf: Document the aux data rules of patched
 instructions
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bpf-patch-list-followups-v1-1-ddc8ccf40f43@gmail.com>
References: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
In-Reply-To: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The aux data of a patch derives from the aux data of the insn that it
replaces: zext_dst is always recomputed, the new insns inherit the seen
count, and a memory accessing insn that is not a copy of the patched
one is marked for non-stack access.

patch_list_adj_aux() and the in-place path of bpf_patch_list_add()
implement these rules without a word about them. The comments that
explained them went away with adjust_insn_aux_data().

Add the comments back next to the code that implements the rules.

Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index ead78713e04f4..6d186a096634c 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -203,7 +203,11 @@ struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 
 		*insn = *patch;
 		env->insn_aux_data[off].zext_dst = bpf_insn_def32(env->prog, insn) >= 0;
-		/* a new insn may access memory, systematically mark it non-stack */
+		/*
+		 * A non-memory accessing insn could have been replaced by a
+		 * memory accessing insn, systematically mark it for non-stack
+		 * access.
+		 */
 		env->insn_aux_data[off].non_stack_access = bpf_is_mem_insn(insn);
 		return insn;
 	}
@@ -270,14 +274,21 @@ static void patch_list_adj_aux(struct bpf_prog *prog, struct bpf_insn_patch *p,
 	u32 i;
 
 	*last = *old;
+	/* Recompute zext_dst: the last insn of the patch need not be the patched one. */
 	last->zext_dst = bpf_insn_def32(prog, &patch[p->len - 1]) >= 0;
 	memset(slot, 0, sizeof(*slot) * (p->len - 1));
 
 	for (i = 0; i < p->len - 1; i++) {
+		/* Expand the seen count of the patched insn to the patch. */
 		slot[i].seen = last->seen;
 		/* messages name the insn of the original program */
 		slot[i].orig_idx = last->orig_idx;
 		slot[i].zext_dst = bpf_insn_def32(prog, &patch[i]) >= 0;
+		/*
+		 * A copy of the patched insn keeps its marking. Any other
+		 * memory accessing insn is new, systematically mark it for
+		 * non-stack access.
+		 */
 		if (i >= p->target && !memcmp(&patch[i], orig, sizeof(*orig))) {
 			slot[i].non_stack_access = last->non_stack_access;
 			last->non_stack_access = false;
@@ -286,6 +297,11 @@ static void patch_list_adj_aux(struct bpf_prog *prog, struct bpf_insn_patch *p,
 		}
 	}
 
+	/*
+	 * The last insn could be a newly generated BPF_ST/BPF_LDX/BPF_STX,
+	 * systematically mark it for non-stack access if it is not the patched
+	 * insn, otherwise keep the original marking.
+	 */
 	if (bpf_is_mem_insn(&patch[p->len - 1]) &&
 	    memcmp(&patch[p->len - 1], orig, sizeof(*orig)))
 		last->non_stack_access = true;

-- 
2.43.0

