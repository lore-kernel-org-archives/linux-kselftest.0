Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361196;
	b=oHWoG6Ua5Y2RTIiA78ignAqaE+aSyoKN8rXAJsPSVv9rbz9ojzzPlx/vHVLN4jSY9io3
	 pA9WChrTC/2lZDyYn2QWU1WRZDiLHC5rVf6UInu57bng0GLQJzn86knjxkuXFXcQfXFPo
	 woQ0cZLMpI/+vm3YVmNEg1gCxDljVLqeii4wAQWc/4CZQlM8U/qizP/s4S5Je/LajBdD3
	 RLTz4R6MZfBcjM4PM/M7jpQx2QjxmUyXNANkaKfV2/md+Cz8YJJNglwKtMZK8rlaLPIIM
	 cefvTHGz8qa5Xv6h0tS/TsmtBoe7qYsi7UjM4lU2hbtyMIJ9jEnK3qyOL87x4XMFN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
	b=Pds2agFPXQcu9M3cBlTKEK0FEMVXeogXfbFKWJqbBn4GUq+kAFHMpA/80tFTMGfx8uG8
	 gz4T4Y9kK3x2fp+irOu/RMmNIo1wGtV0V5uOano8ZLX8+AswDmvlxrwhLosmBePJLvzZG
	 h8sl7k+aDgjiqC+qknQeqyQ47Q3PkJvcww1spoACvQU7/kKH8+xPSe0lW+XrnNNkZpxNA
	 iXNC/PA7L5m1+V8j3T8dgbupmt9hDRPabFAABdHL1Y7FOOdaCpiu+Ar1P1eoliZA36kMc
	 2fH/SBTs8ryMau/OTJxw3jc9quys/2ZDl+ciTVIAOoZlJ0XFar0jR4osNrVfmUhMXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RI/MK7K+";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36332606A32D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36332606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RI/MK7K+
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso751363c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361195; x=1793965995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
        b=RI/MK7K+fVA+qCXVBxa379mqnjirEnm3l6A/b7x1T1+jyHpmAO31rKMcbfZfdWrhh8
         HnVuYJ2PZ1DzLxOObEMchGIbnBAGbfl2m3WNDe8993EbxfCh4Tb6/U41B27bh+aU/Ymv
         Ah/6+7zXJixz91W05I4ZoUe9sEyBqgEDG+rmMTyKfzZqzxeWNvOixWKslgk4+jvBrujy
         R1jm1A7HWWAJc4EZpI75G696hz6fsk0FfBGV3syfi1edJ3yvGy6GBMjdGboedLE2SfOE
         in5t2prwW4yPCrb3f3yXIznOg8o3BkxZF/mS61+ZQ+zWqqKS/65LY2MutedgfdJP3iyf
         E5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361195; x=1793965995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RaPea1Qjt8hsmpjEa8tMwhSJ3KypYa/1YHVOL45aDk=;
        b=ThplO9NZLF0YbOX7GM3isZFzIK4Yqml9DA4cZJom0qrxCKVLsVmPR+xTlXSzW1n4mB
         hirSkNmGsAKPHE2EaKBSjqNtKlfkSrU8BmyYbOszKFMJWABEY+R3N2DtKZFuCukKUjT2
         5tCNz9e89sj9EvRDt3AR7rG59+TEsb/S+UtRkB+mGtRlNEj7OXADqw4pqYEQ2SucJXel
         d5NgX9vU++/jJoICG2yPGAnF0G/cvADDwYsbrZ6aVKVk3xAIy0oSGuhSYMTZ2QQrHQtk
         lx0ghGksqs8H8ShasYTgoxcDeBsnMt0sE9908GjmcIhLzNUiSgwE3sArQed9kh6POk0u
         OYrw==
X-Forwarded-Encrypted: i=1; AKwUvBzgbbBrZnjAs7QO5RpUiLjZVWnMBTi/reNLhRx5odl0GtOug/EeZiW5KRlAnn7skmIOLBvR0NcSx4B4zjh2HCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNto+JlNt6r8YTd3OKmB2XdZekiFL9QwjexnQJyo8fKq+VOF6j
	EjOcooj73TvwEcrPosR/zAAZBqjQS7hLqxOjPI6Qv9w12DjmdFkQrRO/
X-Gm-Gg: AYBFou3LwvBsADYbyTUYnIOrbKnzKZSgvM5i49uxjSBzHcED1E/xgtxN1zrIp+kWryr
	I3DZh0Nfz97NIC6D15y4E0c6VloCLq2iDG0yzqTpXF1QWiudxG4uoliQlxkRQG/xXFxiqldGlgM
	QjuSLAbMbKMvl4qiU0U1cMtnbi4icauJ8cZ03TdusY6bsar5GEVSc7Qph7MxETtxo30ox/27oGc
	2XUgtAUbBK7XDv61q3bCXDjebdtHeUUz7lsBMd7r3bQPp16br1r/ugYJ6t20RQJuqVrZwXSAVGH
	6GpDn1sIZ+UwgO/jtaMGBYlHBB8p1RHwBpb94AqJf+wAErHfzT69zT4C1z3yVrAxZL83UuuPFvh
	ya1TMFkBzf3DfRJIit/675Hb0eWA66LRKSWF5vbEqmf6XnJ58grB0QAScnsz2CckGCJs9auDioI
	RYFwaK8z6Dq8m0TxTpImlnUWyYrM6oZHnGOydIOA//bduFdwB1IJ6U4NnM5mhMhMgmYc0RPccg6
	TeEUvKoCTXHXtDTopjAh4m2/t6xYwNTFfBuaQv5o//V3fcpkucmC8yDK88wW/TGtyfI+6YCCNI7
	F+ALysRBSPvpmhbwDAO9hIKW
X-Received: by 2002:a05:701b:4549:20b0:14a:51c8:ea06 with SMTP id a92af1059eb24-1ac5d69f695mr2698743c88.29.1793361195245;
        Fri, 30 Oct 2026 04:53:15 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:14 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:58 -0400
Subject: [PATCH bpf-next v2 13/22] bpf: Allow inserting in front of a
 queued patch
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-13-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_convert_ctx_accesses() inserts the store of the context pointer
for the epilogue in front of the first instruction, and then the
prologue in front of it as well.

bpf_patch_list_insert() only takes an instruction that has no patch
queued yet, so the second insertion is refused.

Put insns inserted in front of a queued patch in front of all of it,
and move the patch down behind them the same way as a single
instruction.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/core.c   | 27 +++++++++++++++------------
 kernel/bpf/fixups.c |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 6e356e16613b3..0447e3b4cfa48 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -746,24 +746,27 @@ int __bpf_patch_list_del(struct bpf_patch_list *pl, const struct bpf_prog *prog,
  * Queue 'insns[0..cnt)' to go in front of insn 'off'. Jumps to 'off',
  * instruction arrays and poke descriptors still name the insn at 'off', while
  * subprogs, line info, function pointers and calls that start at 'off' start
- * at the first inserted insn.
+ * at the first inserted insn. Inserting in front of a queued patch puts the
+ * insns in front of it.
  */
 int __bpf_patch_list_insert(struct bpf_patch_list *pl, const struct bpf_prog *prog,
 			    u32 off, const struct bpf_insn *insns, u32 cnt)
 {
-	struct bpf_insn_patch *p;
+	struct bpf_insn_patch *p = pl->cnt ? &pl->patches[pl->cnt - 1] : NULL;
 	int err;
 
-	err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, 1);
-	if (err)
-		return err;
-	p = &pl->patches[pl->cnt++];
-	p->off = off;
-	p->len = 1;
-	p->target = 0;
-	p->start = pl->insn_cnt;
-	p->orig = prog->insnsi[off];
-	pl->insns[pl->insn_cnt++] = p->orig;
+	if (!p || off != p->off) {
+		err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, 1);
+		if (err)
+			return err;
+		p = &pl->patches[pl->cnt++];
+		p->off = off;
+		p->len = 1;
+		p->target = 0;
+		p->start = pl->insn_cnt;
+		p->orig = prog->insnsi[off];
+		pl->insns[pl->insn_cnt++] = p->orig;
+	}
 
 	err = patch_list_reserve_insns(pl, cnt);
 	if (err)
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index bb4fd75a70624..6d99de1be2581 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -429,7 +429,7 @@ int bpf_patch_list_insert(struct bpf_verifier_env *env, u32 off,
 		return -EINTR;
 
 	if (verifier_bug_if(!cnt || off >= env->prog->len ||
-			    (p && off <= p->off),
+			    (p && (off < p->off || (off == p->off && !p->len))),
 			    env, "insns inserted at %u out of order", off))
 		return -EFAULT;
 

-- 
2.43.0

