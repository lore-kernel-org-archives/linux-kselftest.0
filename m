Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942398;
	b=lDLYjOHJZQpA0nWTGpjv1v5dRyUAO0yhPYLR2H3xGDkDEi25FvvW/1eDRpE0gyNa/q4y
	 jc/XoAiJn8IY5rhziDpp0rRCtqH9anPcvme/EgTIjhjfhlgAz/PCMDFFeMaE3PLATBYEZ
	 KYzqMjEMJqB2QlF1BuVZR7xV/LvFUoG+PefksJaGLbvCGTBdyxiB9HHhdCyNFvSIKNKRc
	 rrqjXafOApBeFxGqD2iJDmOmjNPXwCt1FZkd3CC9tqO8O3yrEGi5pFlLbQzLV+SXY72QT
	 4QLJcVAPCx0AeY/x/taOhgQ0lNG6rJGS0N3is2qjqtTKDov0+jSaIoFk6/3N+HDHYxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
	b=VXnUNYLGKQzhujs91pxlo9IWQ2UN+y1ryaOFEDAO3oyt0CCTAzShmuEw2MfYhXNYQLMm
	 dECFUO2wI2RjAKLJZDo7oH2isgRKB9/99TCI4kIyTf4LwM4apYRh0QZK+9axO4Y+AHAed
	 6qd4gfREL9t+1yMLhzlQwR0evXP4BRdiFIRBIGfOrPijBFyfxYW7tmyw7MoqAaUFrBNSP
	 0p3V/0C6xRPNIi5z/hTzxY+MNVzdYV4k1fYVObwGYsy1z8FfbBj126Hai59mFYxh/jU4i
	 0SNzi1gmRYwkeq23ouf2FVuV4ZNbhwuAbLsiJ63SJvU9J2WLvWNp1wjcwNdMsNmc6CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+Uq06TZ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087F1606A33E
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 05:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087F1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+Uq06TZ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d7791b00so1635195ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 21:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942397; x=1794547197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
        b=m+Uq06TZrgkYbYCHL9DYUhOfI7OXXGQ/XGe+HIg/Yl/9gU4OVMjrnifav3P7LJN6qS
         Ydh3IxNyIN8QcpJsKLREom6SnbM74H9Axejd87mVVSto6GLRKOgFSAtg7Q2L2yfBk6ca
         o+lC6IIyrOoopaPwo0khtwK6uvAoo54DsRs4MjNIoMx0l9bpE4GKfhIwovF/O8/qy44G
         /68V64cP57nl15tnsUw7pLcqxhNAT1e+UwpkVWEZqlez6ORks/NhMKoKfdKRtnRTTkzL
         vdQsphKoqpSkUQiv5Ox16IQajdouxkv+wRgVzwcCzlXvNKMPGzdxMuhIu2htsiGXqTSb
         C1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942397; x=1794547197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyFUIdytZZnZeMSTWUdvYVpPSUKrw8J/dYOPFJEp7Gg=;
        b=bz0mve7FavuzyHIhxp272Y8utxhxo74fX+1SYqylSQIR2z4Pm+i1LH4aOG0E+dcOpn
         WC1gDWlgrQrjgHzbv1y0PtMhGs47x2oIEi/i5pmNbe6DOp1/xberhzwmz3uZcYYwMi2h
         PF7+qv1kkIJoMmrWRDACxkEDDsL9e1DOnmhBcOSC5kry4UFBt7Fjl9CKy5a7HNpgE/3U
         HCHybcVUNy9BMwLi4xiAocdN9pj1VCHKCWHrOpAHa9FQVMz199YIC6BJQeVrtDvLTMPs
         4taWTesMZ90g6lM9PZWNHsKGrkBOYPsjEdbATUqnmar+ialfW7lY2nqjMgSCZ9vNudPJ
         Z6/A==
X-Forwarded-Encrypted: i=1; AKwUvBzpmku4eOa1RIOpU8jnyrlvbMhMBbAa2sYliOA/0szQhbkZsqvb3Kn7EZNdf9o22sIx4y0roq64YGN9pk8eKJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKWt/De11Lok3n/kc/NLrahOmYFYFEictQGNOHS9O/soZ2Iwj
	8zpDm1TT+831xGNXd1FUDA31RupEI8fnxQk6SXJoY2SQJ8bI3YpIYav3
X-Gm-Gg: AYBFou1VTuyigfXf9eeqQpvXHMi88agNFh563GK+0ynAcIScNjUWbcax6ArSzs86PHl
	UhsVVfxyf4zfaYkMSKnBYBl/BKRfkeu+gQDMmJoFvYZeC9aGjZ+KajjGrPiAyXEMOA+7+2gOSs6
	16H69MXycdFbxt8iahSPcZBYE2sb/vS1cm+H9hmnOjs/GC3XD5uxS76aIaQrYIC/3H5H+Y3p77j
	rht2gjQ7zTbkWPahpdOwn159vTfHpiA1lO4e7td3P4yG0ru8maBi7vAynFa8PJX0KVA55VoNot+
	TzjRdPEgH+MRWfN3u4E/dTtJBL66nGIQThMMFuHPDKEcSm3AdxrLablD0gy9x0BRYz22yA5fkCx
	i5H06QqtuUpkeahl7F3SS+7p7QqJWusZ0Vdn1/2LBrHsXGzk+eo2x1EV4h2NUTnZiOC/hsrSnGF
	zEZl7zbTtX/L5jtQ8ILOI8A8ioOs/znrbCawsA5rlsNLmtCsJMOqmyYMIoiCM910Y2KNSKI0J6x
	UeRVgdoljKprsRvcG41+4cm2WH13z6m25iiltOuUnRO4n5Gk0sJbgVDUMVdBj/dHSh8O7hp/XAw
	jVpIn11lEuZnZ0K1pUsSqInrHNYtZjEb8ieRu7U2eAGyUy4sGwGN3RhZzTYn1q8E35mD07+td/N
	PNjE5cWJYvYO0nLLAUPLwQDAenQSsR+bUVnYwObme9qIl6chyEj8TwbY70ouUPQeHaru1+nBz45
	B4WtIRkkBCX0ukRtWFPUagy2FaehAmIhUP6eWJVtFt
X-Received: by 2002:a17:902:e946:b0:2e9:4bf3:37a1 with SMTP id d9443c01a7336-2ed40dedf76mr21903265ad.63.1793942397302;
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:56 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 2/4] af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
Date: Fri,  6 Nov 2026 05:19:03 +0000
Message-ID: <20261106051905.218638-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
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

When queue_oob() enqueues an out-of-band skb carrying SCM_RIGHTS file
descriptors, it accounts the inflight descriptors in u->scm_stat.nr_fds
via scm_stat_add().

However, the paths that later free or skip an OOB skb do not call
scm_stat_del():

1. In manage_oob(), when !sock_flag(sk, SOCK_URGINLINE) and an unconsumed
   u->oob_skb is unlinked as unread_skb and dropped via
   kfree_skb_reason().
2. In manage_oob(), when a consumed OOB skb (read_skb) is unlinked and
   freed via consume_skb().
3. In unix_stream_recv_urg(), when a consecutive MSG_OOB read unlinks and
   frees a previously consumed OOB skb (read_skb).
4. In unix_stream_read_skb() (SOCKMAP), when skb == u->oob_skb, the skb
   is unlinked and dropped via kfree_skb_reason() before reaching
   unix_orphan_scm().

Because unix_destruct_scm() has no reference to the receiving socket when
passed descriptors are not AF_UNIX sockets, u->scm_stat.nr_fds (reported
as scm_fds in /proc/<pid>/fdinfo/<fd>) remains permanently elevated.

Call scm_stat_del() before freeing read_skb or unread_skb in
unix_stream_recv_urg(), manage_oob(), and unix_stream_read_skb().

Fixes: 2aab4b969002 ("af_unix: fix struct pid leaks in OOB support")
Fixes: 32ca245464e1 ("af_unix: Don't leave consecutive consumed OOB skbs.")
Fixes: 965dc93481d1 ("af_unix: Drop all SCM attributes for SOCKMAP.")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index bfaab7c6d720..44c0a81dd423 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2807,7 +2807,10 @@ static int unix_stream_recv_urg(struct unix_stream_read_state *state)
 
 	mutex_unlock(&u->iolock);
 
-	consume_skb(read_skb);
+	if (read_skb) {
+		scm_stat_del(sk, read_skb);
+		consume_skb(read_skb);
+	}
 
 	if (chunk < 0)
 		return -EFAULT;
@@ -2867,8 +2870,14 @@ static struct sk_buff *manage_oob(struct sk_buff *skb, struct sk_buff **last,
 unlock:
 	spin_unlock(&sk->sk_receive_queue.lock);
 
-	consume_skb(read_skb);
-	kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
+	if (read_skb) {
+		scm_stat_del(sk, read_skb);
+		consume_skb(read_skb);
+	}
+	if (unread_skb) {
+		scm_stat_del(sk, unread_skb);
+		kfree_skb_reason(unread_skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
+	}
 
 	return skb;
 }
@@ -2906,6 +2915,7 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 		spin_unlock(&queue->lock);
 		mutex_unlock(&u->iolock);
 
+		scm_stat_del(sk, skb);
 		kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
 		return -EAGAIN;
 	}
-- 
2.43.0

