Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560672;
	b=tRSY2Wz6WElPFbipk9LFHOm2iy8D25PxKVIoyMaxJfqJgf6/4ZXcKkjSDRIz+AckFlWy
	 LinIBpW7GHGmesdUKss0/FLHvaFVgYNIQa02MhvpQi3mIFQoJlfQRJ3neBEKm5skhch8b
	 cFZjtk/H3Omo9QSmU6DhbD1OkfZG+7OPScNktjjFzAH9BotsEZigq5KyIVa4Itt9HkIZf
	 lHsn6hPfBtBsTREcxjsdsv3LntL7GnihU5TnCA/8DXskuXNvXOJLRSI5Gs9zgkxJgwiGK
	 OFrhc4QwnxfmzoMt8exsT7xZavB7RfyuUhSTXIf6WsrqlKFuk9+YAtQRhRzyfOSQRJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
	b=heC6Mv8gcO5F/JCuZA/SMgiasl9itxBBb2p56gT+HCiO//HXqaU2z96idEyl2LUCbobd
	 X1y4t8pPOWV2hQyLUAB3fSE3HPvNE4cvhKZ+MjEEuqfnfVvIsda2GCMg468pr+ciFbBKl
	 /trME56+Bx15ahmEIvCXcnA3EcxDaVY5Ir3eQDhtFKQqymoI7Fl+ApQN3IrUqsUQ4FFX4
	 DZGRfDpbdI3yDyq824QRzwbt7z0UDTQ9MwoJ6GyvG8ROP5W5U+mDe0hnDDv6z3SWkEzid
	 W3V3vC9V0kqHb81tHmStcE0rlZWjQwlfBBsv780dpaO6pf5luGJz26lpBgFXR30guWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3128606A692
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3128606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso47504655e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560670; x=1796165470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=c7CCnyK8URyZ9d10mCgzJpitaKd/+AjqVzwHrg5k51Vx9aWB+J/Ux9cNLFtfPYcnbQ
         Gid+Ipfb+j/Wp5m2fAgCoGN6OPnVS+N3Ft7w1GeZ/zICiIMte/cRknVcxiuoMMQ4dpqE
         i1iDRNZsV9jVs5BbJJaq1mcTuZ/3K1jGXIe+v2agmaiFiDCGhTNqRzKRr14MkTdTBJ3r
         l+n5Ip1fcds/4evknI73/99/exlvJiOV1O/GfJQ+MqsQ09CkSO51OmKGyXW21k7EOw2Q
         j6T8Zk29kZaV9y591HUMDnQUD+jJDdry9jfzSW8SLM6LrNHQDnZ9gweXI3h4YPJMpzKv
         a/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560670; x=1796165470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=menQgiQyDGCe5kEBqA6XmNgNNcIsPjK06VX9v20jR6Bt/5A7E0jQMSTU8fgYxifAgq
         P9GTcQIRYU4Bgevd0KeMcu63G7kmgOukzhCRTc6Y8xUH+pXCnjatQAo/LTWEprunrrOo
         BgYFqzMaZfrgw3a/ZLAtnbwJAXgAQqvBv+WzU70651qQ5mg3DKZygwOs0aewWze5osh/
         ivXTH8/FfChXPUyut/19QiewcZ/stnKoykgaVPAU5C+bJFuyLC4W2yGk/TxJpN5NnLos
         XQlONyqxIZGG+Oq0uOskehUy1nAAX/4XpuM9FyBePsYyOW1h+vf3gjJdzfG760WcSJw5
         RpMQ==
X-Forwarded-Encrypted: i=1; AL+hErFajVIcqIp3pobzNKSRnPD3dN6IPZz95hPJSvxKlSGAAiiOgxU/i7t88pTCrQHS68/H0m5BkA1O+K69bJWAUkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ikgqglhgJkIU/s+5mKHqM+HB4EgWxtLMQ5e0H2/de+/Pf5Ij3
	H6jo9TxMX7jKE8hqHV4UGb51+QPAlqNKylGVNtbTNfqdKEzHd20lF8Y=
X-Gm-Gg: AZFdTZcI8xk0IEkbkidiJHqRWh2bjtZy+U5FV1q5uNZUrP4hbkuzAuIdd9GV2vTDd+5
	kxqPYlw7HjoK1zu4G3pewgmBgF5dcp/sw7p6+RHwzeVfEfoJE3iBvxnlkS1CSyvgStzujKP9c4h
	1lGTndql39uAILo5V/PLLJ72fRKKEr8QdMV61PR6jxUTdXBCNZaAsBf5rmLeQjsptnHAr8Sbah6
	ygLVHYbWVMRM2btwYV/gPpBavnUuRT97gLlduZRVKKewudzwE5YGv84n5wadCKY7Wyeb8iuHmlW
	JoqUjTMGiGH8UjWP1PAS2DqAzyLwWOIxi1/GaSGgjjvXskz0eeYftMqfjFRlSQhjsFKaZG1nPdJ
	ejb9D+nlmCQ3eaHXBuCUbdnpGtGx1m6R4+lnz3m51vI+4KclMC/VMVda9fdBzCFfitg8ipNvb6o
	GGNjc+ZIVvALTQafcBAyo7tCsTO2NL9EpYbY+rXzg6mUd4ujTb6KnP8YZtZvLTS2jbWtvaPmK2M
	PhezVABGXlVNkbxzqIOojGVzO59cAcIHYeyi0IbkOVgLt+4pYSgQuK87oHadMZ3QsY/Jpfe2zxe
	XyxKo9YgJNKXZt6t9XK6SJT7nw5WCcOoVwrrxhs1Is1UoFo0AETzAXrUYqxRQdOgPmeludV1zIS
	s7NhfIdF7BRoDSQ2fXto+hRDIoX/brX50TofuhzWK6+uzh+yPKJkYYmh4G4+E2yan7l2M+kGkU2
	qgup1Oa7sNjFmvefA4Nj1srsbYumrKlnwq
X-Received: by 2002:a05:600c:8b11:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb8881d194mr335283135e9.27.1795560670058;
        Tue, 24 Nov 2026 14:51:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:09 -0800 (PST)
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
Subject: [PATCH bpf-next v2 3/4] bpf: Align devmap values to 8 bytes
Date: Tue, 24 Nov 2026 23:50:54 +0100
Message-ID: <20261124225055.87344-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
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
emits LDAR for it, which raises an alignment fault on a misaligned
address. FEAT_LSE2 does not change that, because Linux does not set
SCTLR_EL1.nAA. The fault is not fixed up.

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
 kernel/bpf/devmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..0ef24e3f9 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,10 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* Returned to BPF programs as the map value, which the verifier
+	 * assumes to be 8-byte aligned.
+	 */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

