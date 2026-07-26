Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0AC37419B
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063411; cv=none; b=n6vzVL9GrlF+9yChJW/HWpkjsbT5QgPqpNLm36E/IwD6UVP0tkumIQjVx71+If3KqA3bo8eIcVg8Yj6IIbzJwUmwlG6wk14VcqahlU8SnXMPXUt0t4A1Ytk572POgiSTShtILtbrxQ3hY+naHuGCNwLp7W/vOHcUvCJdnFck7WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063411; c=relaxed/simple;
	bh=qsqc/l2RryQSAHWzcvmAp9NMndtk8Now670864hGYe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgMtIROB9mr4lyrwqTHuqoyC2FAtffP1mW2QNUWzwA+Y2kbtJVnEtXOWWNh7yRaEKdn6w9E6QgVPo96vhqanVciwMiuvGLDgJRsKt7I4WcU3+Z1yAAmYn6iAfGZBph3d3OGBINNAg2Qcm44tNvV5//7RnTmU5J7vJffPukksVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGr9BDCZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGr9BDCZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38101f85591so2535849a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063409; x=1785668209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IowqVsVdtNzRJldRPu5bExQR120Cy8p5ka39+y0OVCY=;
        b=QGr9BDCZXvPQyvpS5uM9+xq5GzwZ+DaKxDZ2t5ED3Q81h2lKQmyUCMFI7rc6ohOC8F
         lgpMbR0rMyzGhz6tZvzgIthdu+JYI8oJt7VDw/ckH3DDQi5oEQS4gbkv5YPuAuJfOXjw
         LBR/SxU34yj3M6Fe0Ge3twoRjuDNzKzlhmw9YgKaA1uk7R080AQL50h1i9KarQHo866l
         3uchbcW13QAaV7zb2WnYMaMJYZMCHhWLGKMXdyQ96NLOnlCQTd0N/wEbmC2xl2QDc2k3
         SW5rC84iESGGkLVvMvLUeYwbttndl08USleAcTP3oxOBW96gNx+nBF0IHtm1bzPzyEa3
         4EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063409; x=1785668209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IowqVsVdtNzRJldRPu5bExQR120Cy8p5ka39+y0OVCY=;
        b=RIuFC5KcgCChIf1novVreJxCcUe7NOZyOmMv/szEcIHxaOdBRj0aNBphpSD88meKjN
         wg/qb1hwE6H7iRMvtNl7Sz3heIpVpvmC4JOl7MH4q8QEZJQWr4/2fU371LHwsu4oCZ1t
         YKuV2Tfk5mVC37OKn8zwCqVa6VFDaYjZ1ljhrGC2VRheJSfchFArWOVbG4n/WfcGooLz
         YYWsLfwG9wkfxVd1GuUUmEYln+cJZBXY4AsmhtDG+APc1bwNcDmu9RCW3HKbGo0/xUq9
         bueB1EMu+C0LCVIk2vEaGv0zVj4XGv5iJk9Kv380cdN1yyROGfB2FtpAMSuToF/Cy3HH
         6mfg==
X-Forwarded-Encrypted: i=1; AHgh+RrJsHl1Vhe2gtXMAbc7i+fsKLWXeUd84VJs4zTy/KEgoLcOO5E/kwKVFwxUCe3jKBjKytki6imgajQZ5OiFqCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqctzl4NSmctVWMp1ISpQ8Szw5+x5sSqOC2nxpxo7MSS1qRXif
	EbVw1HYJeSOBbhgcSZxxK+W7JXBqnW2lUeS3T8vQLgguA5THAhye1D74
X-Gm-Gg: AR+sD11emmZzodVuYPu7aoChaI22vJoOvs8EtJ7r8Q93ilBkqjR6C3zNB5pgYGE7fQB
	OczRNKdtkmO5IJPoIcDJHQPxxZ8NXDX8f3/7fERG8Rt/uikXRWNgNjmUQlS/53lzqddHt8ahjPS
	tkQxbx5SaESE5sIPEtioUiL3VISK5ZSoMeCPOfg1u0NY5Cs+gZRaoiKMiHuxRvuYjAAU1/qxWuR
	EIyNaSUHwgxBxfaHN0DSdNpfRgHl/ftWoY2MPfCpkznfIsm3s5IGEcLQ9tOrrmyP/qUq+YqUJWU
	i2Rv210f4Z75lW+HwbUqqB2Sed5seZDcpAGSNIt4zo5q5DDuFO2QsFHkJ/rLCczM9ThBQx6pj3k
	LPvhrZb/DeUKWgVKBfnyBu4YbtcVbEVA6RmvbpBeiD/l+vYl2Hae6JVoD/rYupg8zRAa6fVFy2g
	lZFEihCeSIpqJa86eKEGf/AHMiLTGJh40X3IOeNJGCH9G4mfY=
X-Received: by 2002:a17:90b:58e3:b0:37f:d265:18d2 with SMTP id 98e67ed59e1d1-38f2a958ecemr3247866a91.7.1785063408848;
        Sun, 26 Jul 2026 03:56:48 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f04175c1asm3645559a91.12.2026.07.26.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:56:48 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] tls: don't over-fill the plaintext sk_msg ring in tls_sw_sendmsg_splice()
Date: Sun, 26 Jul 2026 19:55:55 +0900
Message-ID: <20260726105556.2719227-2-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726105556.2719227-1-ppoo1220@gmail.com>
References: <20260726105556.2719227-1-ppoo1220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tls_sw_sendmsg_splice() appends pages to the open record's plaintext
sk_msg ring with sk_msg_page_add(), which performs no fullness check of
its own, and the loop only tests sk_msg_full() at the bottom of its
do-while.

If the ring is already full when the function is entered, the first
sk_msg_page_add() writes the reserved slot and sk_msg_iter_next() wraps
sg.end around to sg.start.  sk_msg_iter_dist() then returns 0, so
sk_msg_full() reports the ring as empty, the loop keeps running, and each
further add overwrites a live entry without putting its page reference
while sg.size keeps growing.  sg.size is then larger than the data
reachable by walking the logical [sg.start, sg.end) ring.

tls_push_record() marks the end of the scatterlist at the logical last
entry but passes the inflated msg_pl->sg.size to tls_do_encryption() as
cryptlen, so the AEAD scatterwalk runs past the end-marked entry and
dereferences the NULL returned by sg_next():

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  CPU: 1 UID: 1000 PID: 204 Comm: exploit Not tainted 7.2.0-rc4+ #1 PREEMPTLAZY
  RIP: 0010:memcpy_from_scatterwalk+0x32/0xc0
  Call Trace:
   <TASK>
   skcipher_walk_next+0x1d1/0x2c0
   gcm_encrypt_aesni_avx+0x1e9/0x220
   bpf_exec_tx_verdict+0x3bb/0x860
   tls_sw_sendmsg+0xa1a/0xca0
   __sys_sendto+0x1da/0x1f0
   do_syscall_64+0xdc/0x520
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

An unprivileged user can reach this on a plain loopback TCP socket with
the "tls" ULP attached.  A full but unpushed plaintext ring survives
across a syscall through the copy path: sk_msg_clone() returns 0 rather
than -ENOSPC for the frag that makes the ring exactly full, because its
guard is "if (i == src->sg.end && len)" and len reaches 0 as that frag is
added, so full_record is never set and MSG_MORE keeps eor clear.  Since
record_room is a byte count, a frag-exhausted ring that holds only a few
hundred bytes still admits the next splice(), which then re-enters
tls_sw_sendmsg_splice() on a full ring.

The caller already handles a ring that becomes full during the splice by
testing sk_msg_full() afterwards and setting full_record to push the
record, so the loop condition only needs to be evaluated before the first
sk_msg_page_add() rather than after it.  Turn the do-while into a while
loop: when the ring is full on entry the function returns without adding
anything, the caller pushes the record, and the next iteration of the
caller's loop starts from a fresh, empty ring.

Cc: stable@vger.kernel.org
Fixes: fe1e81d4f73b ("tls/sw: Support MSG_SPLICE_PAGES")
Signed-off-by: Chanyoung Park <ppoo1220@gmail.com>
---
 net/tls/tls_sw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d4afc90fd79..0c413d05bb1 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -738,7 +738,7 @@ static int tls_sw_sendmsg_splice(struct sock *sk, struct msghdr *msg,
 {
 	struct page *page = NULL, **pages = &page;
 
-	do {
+	while (try_to_copy && !sk_msg_full(msg_pl)) {
 		ssize_t part;
 		size_t off;
 
@@ -758,7 +758,7 @@ static int tls_sw_sendmsg_splice(struct sock *sk, struct msghdr *msg,
 		sk_mem_charge(sk, part);
 		*copied += part;
 		try_to_copy -= part;
-	} while (try_to_copy && !sk_msg_full(msg_pl));
+	}
 
 	return 0;
 }
-- 
2.43.0

