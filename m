Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722240;
	b=gbF1xqY42ruht8AtzCFQSdmqO7Y2qjzg+b9nLzr6bir+BZdcztKQIQNloQfnXi5MsEEt
	 TH8JgIrnMsJVbL0g3Ko60XgUHT/17uwbC1kOanJHuof3gmfaXlIWGeepLDUYrkIAEkb5e
	 M3qmbcukP7cvVK94266Yi2aGiqVO8V2khUDl7c0nIIT3hsExXae634DAjaw+ztvi2l3bu
	 bvJXfuOfPbZhnHmdIKp+JDLw2KUZCqzGAaeTcsRaNZV1JS0zrCxgzsZTRIZKVsR6l6jQX
	 7ta2uQ1xw3U0HlL0kCy6DRtyHtrKkeezQrtNpp4d4b3O0LD+cdRm+kWAbguvdafYYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
	b=Jx5v3Lmm7buMFVnl82UvbWl8LyKYpN8VRyjATAoPlsGTThi7OL2fWUUV/LewYUA9vjqc
	 BtYRDO0wJx8yjFobGsmu7kx87KF6UMTGm4SW7PFb2qYIv2rR0f6NkZaKEDlwDfkmzJztQ
	 tpvScpKNNqR+lSWnKLLxbmb+khxB5PkFt+yccKAy+e+za/RG3r5RNVboIAlQF3Ew3qdfi
	 wKwndIcWGzMuJJKqQ2MOvi0Nx2mZSo4ZVSb3/V7Y+rWT+0srwifXdPNn//MAYwG1VStMr
	 aw3pMD05mpsIrqT4KN9fJhefL5PkL4KwivNS8bgs/hauQ2Veg+1CfVuw8YcGx0/AqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/RCqXQS";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E36C606A333
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 19:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E36C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/RCqXQS
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4653525f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 11:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722238; x=1796327038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=D/RCqXQS4UeN6v20Z+VlBVJK/ZZX/cCGhIw/ilwIJBaJwk1qthCZOB7Hg/2I7i+4b3
         gXFQ4bI37t5xPPDFsxIZCp3undzL8liJl1dhk9x26M+SkiFQiV+7Vrud1K9saTD8x0sH
         UQMiTIPG1dCkfQb0PxR6z9D5p8o7O1YzP64p0tMKDD4z4PSjcjwQijNF5MccAC+MyA1q
         gLfW5lTkUooix1E3K7bTU9lw8/aq1xp6zPR8L2TbturBUIa7a3UOJhiI/2hrCU8Srmvz
         xoxkVJVoMSNteiXv1w98CN7QNYMr+TYloJe8vE9eCeJR5FzLV7xl1p9CdamhuhxKADyZ
         bRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722238; x=1796327038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=bj9Wf5qy4xMtoOAFEuccvmYLZplrUwXG445eiSkk+k4h15Va6o4ZMVLtvpPEcx9TAA
         yWNktAz2E0GlckPpG5vvYAizh0Tom15/jN0UmUzL3249C8EHyUP8ifRWmQuiB3bcxUKg
         lXwyC1fHybBkWcqtE5nNQkhEgVHmhneZeCJwidhaEbG0hE68ht8qId41WfGZkW1D/gsw
         4E4nNbSaDj0pEpPmTI9ZjmRKoVT04qRNST1aHrKSPDQjz02fhyaMkC3DeeRQuaFvFrKt
         5D+aMl4E/cd2jQMtTOShROiuD8yBYUM4QzY3laZ56Rd6v8fpT7KbgK7tzPVkRoyjeyBC
         4mhA==
X-Forwarded-Encrypted: i=1; AL+hErEY1iQEPJqPifQempEYrg7uskTUWNW5Mn0mW/JPK24VT+WCyUEBDl8gFe/v1F3KHRtyP8IC38oei5cWrd8qTu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nsNHSUBG1lRxJkLG63VTaSQtKNvVSZOFcXwXo3RdGECqzCtAV
	2ZNqB+jHxLxKPfnzqj0hT4CH5b6TXODXwYqJJOaRN1veHq2TpgdmMYQ=
X-Gm-Gg: AZFdTZdoyM070oOEHadpUoxx2pMskoJplCl99Ok5ZvmlFvlK0Mo5Bv52qd2uZ9ENwGF
	7siDYM20ffcdJ9K5HiwpmOj1zQX1iRq6KT0vs9GyPYTR7V+zii4psfysY4FOW6PLck+w+0QIaqU
	eA/Ny3640WtTt0NK6oaDGdct2Si/kxiohhrdQHPZa3noGiPVRW6pGr7kDxT/ANi14fzYREnDGoQ
	3z+oGkqWEM4qx9r/MDs9neADvnAWjSZR2pX2xPvEJDFp+bPatag9uP5fFSidBbGfaL+70akLuW/
	PCvwaNcyCb5WI0r2z5PLoMOZgPwgaPZZBdjODU1TB0johgDbsPgFIbkfMU2QW9matEsnVdsRtNP
	HPzaDJ8PWu/DOXKdSvpC+utcx9bcuDptboQ/jLqSOY/tsitaRaZ8IVq2F4u/VmFDT/RIUaAZ4QZ
	XNsV5LjzogfWGxJfkGhbH7KK7jvxT2ooUxwKc98DKaKbXizhQlxReOYWpfZ4RSMXpNrNdRNRQT0
	jjkQWABC+JeJT++3I/BpzlTPd/Me4ftdE82wuAk6TjYZicjkcnVQR60CBNCsOTgbfqUkDNEJegP
	Bnc+4Zos6nzXtryfwA1WdTVvYGWGCVV5bnOu+GCjY8jPxUiZ9gZaOI6Y8iK42XO5QlQUgSq51ZA
	nKOtxA3DhuT/oIkmNQ5duYHzk5iFhQPM6tcdr0y77z0mAcWdN4qNHv9FUtrIYMANZSjW7Febb+F
	mWQnQb9uP42qOtjtNfFb0kwzJBGm26x95t
X-Received: by 2002:a05:6000:25c2:b0:4a6:7781:b064 with SMTP id ffacd0b85a97d-4abb51457e8mr54433934f8f.31.1795722237966;
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 3/4] bpf: Align devmap values to 8 bytes
Date: Thu, 26 Nov 2026 20:43:46 +0100
Message-ID: <20261126194347.42466-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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

dev_map_lookup_elem() and dev_map_hash_lookup_elem() return &obj->val
as the map value. In struct bpf_dtab_netdev, val follows
"unsigned int idx" and is at offset 52 on 64-bit and 28 on 32-bit
architectures, so it is only 4-byte aligned.

devmap is read-only for BPF programs, but the verifier assumes that map
values are 8-byte aligned and accepts a 64-bit load-acquire at offset 0
of a struct bpf_devmap_val value on 64-bit architectures. The arm64 JIT
emits LDAR for it, which raises an alignment fault on CPUs without
FEAT_LSE2. The fault is not fixed up.

Mark val as __aligned(8). On 64-bit it moves to offset 56 and the size
of struct bpf_dtab_netdev stays 64 bytes. On 32-bit the verifier
rejects 64-bit load-acquire, so the misaligned value is harmless there.
Aligning it anyway keeps all map values 8-byte aligned and grows the
struct from 36 to 40 bytes. Entries are allocated with kmalloc, which
provides at least 8-byte alignment.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Fixes: 880442305a39 ("bpf: Introduce load-acquire and store-release instructions")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/devmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..c92aa81e4 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,8 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* The verifier assumes that map values are 8-byte aligned */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

