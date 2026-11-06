Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942399;
	b=K666SXOAKX0VTl6Ykez5oeKMewUKAKdBrcyuUo74KJpfYv1mXMqtS21zfaj1n5xdh2dO
	 2o+0JFGA9hfDvWYVQK2pgvDlt403K9/YCvQWBQ4NdUryInTcRwo1r8mFm4J7McLA0Vs78
	 ABAyApWhriqqir3Mmw5Epcb8uU9y8tQ1kNI28Dhvy5thsGDvgPLki2HFtdBk47MxYss0s
	 fyoAFCsW8xfPocSusmM1gfKqMVMg/bwpOP9ZqKgIliAkUh9foITX6FVjhWlwR8XpcXY1G
	 1umA1FDUspSsIMp54b8eke86Gye59Vd+Uj7afaWEjYnnIkpvrJwS6HG5RcB8kV/NvoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
	b=Ml4tVTQRtLcth9GLv2W0EGdDNStvOrC+jR7SM3Rcj1KSiGwmeI7yao1U14oy6Lw+aXMN
	 GOpSlxQv7h3ebB+k2tKBy4Ygr7UJ/+DaLu2NoEaF1L/HZW6tYDVyeELvfVgew1xtyKyKN
	 ozXJu1nQ5aHgCVRg3DVgJD7sASZ0I0poTQwvy6wwGcw4CxuZEYq3+LI1xaiHdQqsKMNVy
	 gyN3J9kuujZYDdrRx9E3s9PA55ov5LOZcXQhJObbcwN44UmJjYvu3XOh1WEQx/36STvbu
	 lQpX3ZUMXYbxWo70JMIdsVkXuwXlgpuvPUVhJRJ50o3a39FYpWJKvS8xmoL2WjXCnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dN0//pmJ";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7728606D813
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 05:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7728606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dN0//pmJ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed3d8877e6so1209465ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 21:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942398; x=1794547198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
        b=dN0//pmJEAsF076fr7W5z5BEW5z1sCCCCExDgz3ojvuzceMpBTTCMJg3SFVrge2w5E
         QIlfFUTXmg1u1F9Rx8NJo6+w8LouBjqmsSq6w2BBpHOm4PZ5/7S5SFrCpJw3JaOHl+cm
         ebF1jrw5JlBru47P2yG894K7CYnr0KgBwzWvd7Zaflq3EfYhkPDzGAMgRLANXrLXwM0k
         okjGUDtEgBC9zBCtIpbdzFK+siB7Lsv2I1bhRzgkHdem/Zff187B4YIo76S4S4y2WQlz
         /OpY1tTt/UA8/TuJNZsxnOvjrxmNVLIwWDmdIK7h/3FYou/q0CfQlCKhc/6zcxfe2vXM
         LAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942398; x=1794547198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poLO/FYmmqcs1GTxITc1aAz5v4ON3pq6sok2GYQflVA=;
        b=wp8QMg6tFgklmJzpR0nCV98ehZOIKuiVuZLjldzzUlCyE2HAXmhGO4chH81Dh1tWlA
         +cHHA6nIp7J7BlGxae4TCy3i3lKNZ6vIkDUA2pgEdeRLS440Gm60hGrLbH50W908hDwg
         ino2Vd9eKeXZkjm+LE9eqFJDgBMdAUtsS+vNlNcQZAW8DskmrkxqOnhegbdeCEjYJbLI
         vUjICbeUI3CtWVJp3cOqzxZVSkDJzExw34CuvXeUtEkea2yILm8eX+PgiRCPMRqbb8oC
         nn5UNIlzH8fgLgCjUTPYJXOTXAclzYBf0SN/MY4dpxeijE4FRJFfFwNUDzMVLHrV3Sys
         dVLw==
X-Forwarded-Encrypted: i=1; AL+hErHCfJwNp3g39AS2fqafJxgmAZJwxRCgVp82sy4t9qK+MrH6hmIB9D8Si7L8Xncj8zP49ASoW391iFxIoL3Ce1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+mmBMoNGqdC0AkGm1FwsXOsUrTYz4KN18P6TtIf8AIy9xjo9A
	tHPNzka3GU8B9vDMNehKcw98SXYZuCUXnT61UhhFKuGhi7NEYxOb6zXf
X-Gm-Gg: AYBFou3/17wTH9pQkVUJaN21Imkxjst+asHuv6ojiiqZIZXtxYcEHdqDa1WCED6sfmf
	9kLW7fc6hhyA2gyGeigWwLKTxMJQuZfcVmrmc563lO3ZbeWc1P3tfR16ezoSzKb73G1NNyvgBUB
	AIV67hCilTX5/hURMDLw/LcIafUjZp1mgCS1j5RmQW1K0U986cTUQ7EAN/ovsPINhFQNXC+sXU4
	AUDmNwlfpIQIiY1HUfmxQKotHUNBdAgVMAAjZwWNPAV8+ISb5hVoCoyysUkXJtE82Al3itW26sh
	Cx8SwP+h1Yy+tUsbZHmFfSYKpDasBach8GP1RJyEq0qOqkOjZu341f2VVbZo8xmhUzf9hN/fTjb
	IXSpxzR/7z+GOZBog983kvgyiOCYEn49hPyye+knpqY/xPijUBM4JMii3iFXfwfYiL7EM8Q67E5
	3mGjsVxKjvNvTA3Sgx3olBlo+1N5ROfDKbnwHYWWHR2G3PMbbttjx2CHALDngXj75jSUfj3H4DY
	YXIa7pPt4AONA8AgKWCTbr8XDeeDRnb1ctHynSwyuGyKTsh2DqbdFM82QE4sK3slGtHjX0KyJf3
	Lkas6tu121ttn8V9fTxj/+/HvJbmEp9CrYepzP0kC6D7DaiBolvDqoazpv5VWv7U28vWtLtPUed
	T47vR+M+UZq1tvuImuSbCgFgAIuZ3r2AhlSwoFaZ4DkitYwkPBp0Fi5paRw7enhn3qxWML8m/VS
	DVp2Wqe7fmqG/idhoBsNInn+Pgph2TSjz/zXBimU3r
X-Received: by 2002:a17:903:1b67:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2ed40abb311mr24361185ad.18.1793942397995;
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:57 -0800 (PST)
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
Subject: [PATCH net 3/4] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Fri,  6 Nov 2026 05:19:04 +0000
Message-ID: <20261106051905.218638-4-sidchintamaneni@gmail.com>
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

When a connected SOCK_DGRAM socket disconnects (e.g. via connect() with
AF_UNSPEC), reconnects to a different peer, or observes a dead peer in
unix_dgram_sendmsg(), unix_dgram_disconnected() purges all unread
datagrams from sk->sk_receive_queue via skb_queue_purge_reason().

Because skb_queue_purge_reason() frees each skb without calling
scm_stat_del(sk, skb), any SCM_RIGHTS file descriptors attached to the
purged skbs remain permanently accounted in u->scm_stat.nr_fds (reported
as scm_fds in /proc/<pid>/fdinfo/<fd>) for the remaining lifetime of the
socket.

Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected()
and dequeue each skb in unix_dgram_disconnected() so scm_stat_del() is
called before kfree_skb_reason().

Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 net/unix/af_unix.c | 52 +++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 44c0a81dd423..47120d81aca2 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -609,6 +609,28 @@ static void unix_write_space(struct sock *sk)
 	rcu_read_unlock();
 }
 
+static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_add(fp->count, &u->scm_stat.nr_fds);
+		unix_add_edges(fp, u);
+	}
+}
+
+static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
+{
+	struct scm_fp_list *fp = UNIXCB(skb).fp;
+	struct unix_sock *u = unix_sk(sk);
+
+	if (unlikely(fp && fp->count)) {
+		atomic_sub(fp->count, &u->scm_stat.nr_fds);
+		unix_del_edges(fp);
+	}
+}
+
 /* When dgram socket disconnects (or changes its peer), we clear its receive
  * queue of packets arrived from previous peer. First, it allows to do
  * flow control based only on wmem_alloc; second, sk connected to peer
@@ -616,8 +638,12 @@ static void unix_write_space(struct sock *sk)
 static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
 {
 	if (!skb_queue_empty(&sk->sk_receive_queue)) {
-		skb_queue_purge_reason(&sk->sk_receive_queue,
-				       SKB_DROP_REASON_UNIX_DISCONNECT);
+		struct sk_buff *skb;
+
+		while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
+			scm_stat_del(sk, skb);
+			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
+		}
 
 		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
 
@@ -2058,28 +2084,6 @@ static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
 	       unix_secdata_eq(scm, skb);
 }
 
-static void scm_stat_add(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_add(fp->count, &u->scm_stat.nr_fds);
-		unix_add_edges(fp, u);
-	}
-}
-
-static void scm_stat_del(struct sock *sk, struct sk_buff *skb)
-{
-	struct scm_fp_list *fp = UNIXCB(skb).fp;
-	struct unix_sock *u = unix_sk(sk);
-
-	if (unlikely(fp && fp->count)) {
-		atomic_sub(fp->count, &u->scm_stat.nr_fds);
-		unix_del_edges(fp);
-	}
-}
-
 static void unix_orphan_scm(struct sock *sk, struct sk_buff *skb)
 {
 	scm_stat_del(sk, skb);
-- 
2.43.0

