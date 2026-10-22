Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658927;
	b=Et2WBDwCh3TKR6/wlfXRIy7h/4TI2fAhdL7r7ZJoTPLm6EPX4xg6ojSB7f1uyrjGj8T7
	 V8koQU+2yk8oAkljA9ThGK2TrmKtLXR0PgbanLCi4wreph6SiTgKdeZlM9BJea28zwgIi
	 m7zvuRUQUVh8GPLPPzACBFWozDfnn17xGyM1trXKygcMRNxyzVxztNPG70Su7rK0ou5g7
	 q0hCiexxojvJQzoNlubS7LMcp9CJFbW5GTmBkolv3x/Zvq3vv1VTBEDdRLBo6/g6ym98k
	 p8vM0120qQMchwOwOaxR3IypxuivHu/suMjs8pNk/X6fKlhoitV8qobGHKY5aiFlNag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
	b=Bv2UZkM/t16jSKcwZaGze44HgFUkFlIE7LoQCb//growv3lREYKYGYIGNjwdpCSGkJzM
	 GSKTqXm5wXtyQND+/kNFll/UAOGiOPm4+UxX3Y23L8R+MTW1u3iYKm6a9irZNG///b2LC
	 s1M96PCeico/9EkQnu7s1cf3q5m0oxpn2bet0DJRx8Yr/7IyRHp+14sThGbFngFgKn5yI
	 6ikpR4GX5DxKkmrkFD9iWjDEtmdxoqd16yDZ4iLwoxvDB5+vpLE4/adfcgje1z+GggP3r
	 qPQXD24+yaiBGSpKa7zzqTxtBWnTjIJE5Cs0CV+kfe8Jwy1gCRzphaXs1zguwn8nLGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+yZc2Zk;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B00606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B00606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s+yZc2Zk
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2826810eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658926; x=1793263726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
        b=s+yZc2Zk0aUrpkm3TdzIZRhuwxBS+KXQWMJaTVdZLmm9gge2brv8foEli5l5DvxWsq
         zAUIPIg8H95314NepUq5Qxn38FNZJ7yzJ502v1xULuzxmrmZw8mxoURVTM4KojgiMPBR
         THZGayDJmvr42+O/abedsaHiBXzo9pnDhnLrvFPv9wGyEKA6BH9D1UIosIwdxaNUdzYU
         ZTGIDiYN08GmdSS/AJTB/S/GT8WgmmCJZkAf1EfNwyflgkG5LfJE6147lY2Drl9PcfmT
         +pTU5uGv8yxkftnGZWdImDJtAi6qLpE1qEUqRmzNGlp6ATJ3mbH9gESAcufytB5sJwAf
         Gw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658926; x=1793263726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ExUq/OiRoy6v0DOAUuIV4LjAOQa0JqbQKdInvj7hio=;
        b=K3owdpzpY5mFm1aywRclaqfaAStevMDQR2KdIxvyrfac+lyDnpneIGGgSubof5SZyt
         XcrYiUYiZpV/VR0LBp8mGCZVj/Y1slfr5zVHZ2LVqvyleQIeUW8jMqaufR24+6FQP5NW
         b85sEGyxNRtDKJMxue6NcRKGmWyeuIiNDM5sw9vfrFEZMH0BMO1q11a6iGCpYu5SW3KA
         42QDfUVc7dcYnR25wjAusNe/IYd4ZBXjJr2dI4aCP03kopZptTMwRMtGA8g88jLTR8mo
         CmLJpaZmIsMs9MHK8O0GjVp0P70lDiAfSviqDapcWxyos6tsHBoYtrFojOgvA4FLpLRa
         1o3w==
X-Forwarded-Encrypted: i=1; AKwUvBwonpMcO4WkX/2LtnPd3a+xkCHtdnKjzWHGoUYFD75VjrIEIAZbd289nU7l6LAurWLbsA/YLsWXKcoTzVlQrYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLULt8SYH9fqqsXsUamkoLZq/MlVG0dVSdTXUSH0DTfvKI539z
	PLzQx7c0CrZ+jQ9rVtQsclE1POn8Ps9mpkkNia2JbYvprMZTvfWc/Gn3
X-Gm-Gg: AYBFou0nB2Ou/ummOpzwTgPh8+N7ukEbomqVuhaM8rGg3n4xmiVzTZd3j8YQuRQmGzk
	nwjYfQPdSlgBl1eZlFihUcwcuk6+ixdAqy65iJF5XncTgPKQLXtnjPysESRSv5w+Wl+sQtdzUJH
	t6bTUcqxWElD/fZRAbjnW4SpaHPjQFsgucMa2j3UlZYAadzEcVpLS6MaR/PXkomQj/gfMkMsAa+
	ktC7fJq2hKPwjG0UHdtrVqKZoYRApomtDCgBA3ewAh3M8fTcoihQxvkM84Tp5INJ8J91nu8RBlR
	fwUi/z+g7Yqp/N8/vi1ezr4uJv8q9/RKNIr2ri1sbI12qmYxRaVxr54PdnqUijde3puZ2pOk5eO
	lyHJ3x6bXPTnNDxzjLoX+V1keI4XV44Dvugc9WJYVHGhJaLAG5/4qqh6SdrCSpBsy4OEkw3JO0/
	JOzmrE0QKMhHOLAigntns1WZHAuZnkM2ocheVKx5YHKjjcBqqQmnEa3/ENCDFBjG8Ibts9lNmVE
	Pd0UA1uLWEm4cNtvSX3AH2gTuQOMZDzxcD+wW2mQYtTHAtVdBI=
X-Received: by 2002:a05:693c:4006:b0:368:5750:9869 with SMTP id 5a478bee46e88-36857509b06mr3808591eec.8.1792658926069;
        Thu, 22 Oct 2026 01:48:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 22 Oct 2026 16:48:36 +0800
Subject: [PATCH bpf-next v6 1/4] bpf: Protect the struct_ops association
 with a spinlock
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
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-1-2c0f18e82582@gmail.com>
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_prog_assoc_struct_ops() and bpf_prog_disassoc_struct_ops() update
prog->aux->st_ops_assoc under st_ops_assoc_mutex, and the latter puts
the map of a non-struct_ops prog while holding it.

A struct_ops map is about to dissociate its progs from
map_free_pre_rcu(), which bpf_map_put() calls in whatever context drops
the last reference, including softirq, e.g. bpf_struct_ops_put() from
tcp_cleanup_congestion_control(). A mutex can't be taken there, and the
put of the last reference under the lock of one prog would take the
lock of other progs.

Replace the mutex with a spinlock taken with interrupts disabled, and
put the map after dropping it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 include/linux/bpf.h         |  2 +-
 kernel/bpf/bpf_struct_ops.c | 19 ++++++++++---------
 kernel/bpf/core.c           |  3 +--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 580f89c450b55..17b2a425e05eb 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1979,7 +1979,7 @@ struct bpf_prog_aux {
 		struct rcu_work rwork;
 	};
 	struct bpf_stream *stream[2];
-	struct mutex st_ops_assoc_mutex;
+	spinlock_t st_ops_assoc_lock; /* protects st_ops_assoc */
 	struct bpf_map __rcu *st_ops_assoc;
 };
 
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 1178acd72296e..a1ae30b145a03 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -1541,10 +1541,10 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 {
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	guard(spinlock_irqsave)(&prog->aux->st_ops_assoc_lock);
 
 	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
+						 lockdep_is_held(&prog->aux->st_ops_assoc_lock));
 	if (st_ops_assoc && st_ops_assoc == map)
 		return 0;
 
@@ -1569,19 +1569,20 @@ int bpf_prog_assoc_struct_ops(struct bpf_prog *prog, struct bpf_map *map)
 
 void bpf_prog_disassoc_struct_ops(struct bpf_prog *prog)
 {
+	struct bpf_prog_aux *aux = prog->aux;
 	struct bpf_map *st_ops_assoc;
 
-	guard(mutex)(&prog->aux->st_ops_assoc_mutex);
+	scoped_guard(spinlock_irqsave, &aux->st_ops_assoc_lock) {
+		st_ops_assoc = rcu_dereference_protected(aux->st_ops_assoc,
+							 lockdep_is_held(&aux->st_ops_assoc_lock));
+		if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
+			return;
 
-	st_ops_assoc = rcu_dereference_protected(prog->aux->st_ops_assoc,
-						 lockdep_is_held(&prog->aux->st_ops_assoc_mutex));
-	if (!st_ops_assoc || st_ops_assoc == BPF_PTR_POISON)
-		return;
+		RCU_INIT_POINTER(aux->st_ops_assoc, NULL);
+	}
 
 	if (prog->type != BPF_PROG_TYPE_STRUCT_OPS)
 		bpf_map_put(st_ops_assoc);
-
-	RCU_INIT_POINTER(prog->aux->st_ops_assoc, NULL);
 }
 
 /*
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 3030beb531d99..0a8ba603f44b4 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -141,7 +141,7 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned int size, gfp_t gfp_extra_flag
 	mutex_init(&fp->aux->used_maps_mutex);
 	mutex_init(&fp->aux->ext_mutex);
 	mutex_init(&fp->aux->dst_mutex);
-	mutex_init(&fp->aux->st_ops_assoc_mutex);
+	spin_lock_init(&fp->aux->st_ops_assoc_lock);
 
 	return fp;
 }
@@ -291,7 +291,6 @@ void __bpf_prog_free(struct bpf_prog *fp)
 #endif
 		mutex_destroy(&fp->aux->used_maps_mutex);
 		mutex_destroy(&fp->aux->dst_mutex);
-		mutex_destroy(&fp->aux->st_ops_assoc_mutex);
 		kfree(fp->aux->poke_tab);
 		kfree(fp->aux);
 	}

-- 
2.43.0

