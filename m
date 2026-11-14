Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673608;
	b=WRrkRzEIM4731iEpMrtV6XwfTyiTWe0/69UJE4AeWX54cMUCVP98j4gAPMxZyNqoM5jT
	 K1oJUaBznuf5edcxFiDR/33+io+R74sWRwGm4ZOhpuPDDHzWpl9uIF3dDKtpsPoKaryVy
	 9FnCRciaNuKJbL9zooNNhZJ5hgOlPdJIPpI8KvXqnZcE/H/7GTSr2yVbU+hESce1+Z6j4
	 GlTrNFnL7IIYreHILisMVbSwAfm3qy66CB7OcmcqSK1Bj7BnYQihXXvJHkATjwhfl9LUy
	 cfnITtmtnEkbcMSiEoeUfgtXJLeDUDq0u3X/4xRsjuU2/aqr/qGJvWLAIz2oTNP+DzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
	b=10iiCq6k8uf8H74IAHJkicwwZoHDTvINpxJwmTp+c2F0dzle3tCPwHUgvxX+7TYbErv1
	 IeNs9qYGssatyKlHGkAeeWnZtvLDqTChi4emop0ppzWAwIXn+Ol0f8O/YfXYkDA0Fj4Vp
	 RuHLjrffyxQ99Agd9lHGMqUmqwtwgkosFNdMN4SZ5C2nRfmX1/lePWKeeIlMLY/cy0juy
	 WPfn90kMM2AhqM6ZjeFeHyYwQOCPgN9Ik5fuD6iI8HZ39mjfEMlCi97WvCN5YkhSKxZFQ
	 JYMxltJTbo3puv8EY5TU2x/IOPL+2N/w1QuJboDynHTqfWryejsIJECSGGPO03UBNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C59606A889
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C59606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SROD+MeK
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1649497a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673607; x=1795278407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=SROD+MeKwmsh80X00loselHY8b+ysQjAA2tn3WdeygoatqMviJ+WgcOJRp2EqDwW54
         McL6tvbDuQFlyDfA3R7qrDdDfxusDfoovcotXbq2LjkJfobypAfaX4/GSF3tFvNBQ7U2
         RgDArgKk3ahojSS4MYs2zVJdRbkRxr/n9Oda+0OHcloRNNZknPUXCVu3aBVtfhGsTmWh
         4lsUuWs4J/cB/CQ8iK0TWyAyeiOh+Fs0mMYVJCwiuevSUdPWhB9hvZF5qaDMRTTnCjV9
         FBx0P40XgYKtCsp1k1hZ2LmENj6+Ym8gqmZw+zKp8BPoemHMdEkoBg21YUnt3jeOM8Ui
         6Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673607; x=1795278407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDh5QSM17nNCbx1PKGi/r35ME4tXirWNgzrpLjOcaZY=;
        b=RG3bEDm+1OSWD1jaeA8zJS3EnVRvnwl6738Jewh7Mhm+anP8Jl1muu5tMDKIpGJlMF
         YTZwY6WjYn2QYCaCS7mhgD9fDygKH3L4RCWP1x1mCGWMeHUttTg8XeiqcRMXnDOygh64
         oWWOhulAIO2r6ly+Bo2gUr/wkmAMUgWdzipBDjtIuBc13S6GxqMMJM3AbFc/nBu82/qZ
         GEvh07BLWyw1xt8316wqoxgMkXBfncwZ2aK8JJJsXIN43HrPDjMBIDAiPAsioAtLfrD7
         bAUeew7iemdyFAmrxGCscAy2PGL0qeCU4GQP1xukiHKFkjT2t1ng4rsULLU5vmisBFJm
         BrqQ==
X-Forwarded-Encrypted: i=1; AL+hErGNKo7s/fvQa9ZKs02o/iYUqa8GlNAHh0W159YyFl8bSncPbMX9BtfGl0HfeiwuQH60z7b16RaRRoFE1sOVsFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wT/WOiIjog2B9lcbIjN1Ap7sEAuihOOCHXTPL2+KyNBFwfDYb
	6Sl6BwxrJ41LRwKmSyQZkCo7OeoFI1ExGE87pL4wQcwpNNIzwJe2E5Dl
X-Gm-Gg: AYBFou3JXmvqz3gedy+3fV0Ws1ZEAFsUcjUKE+F7xBKMWfhDSJbtJoCPIDnGO6gvBM6
	E1bd3I+WEzy/xcEaJ0O9ViQjUrey7aVtBDK0579pug2QgLF+xhSmHtVXcnDkQZK+JRv0Cu7hApK
	MhaOO2UdQNvs4UNGDkMLISxISnsNWoP2Qh7i/QoLiFRQiQqeWW2VKNTfoHRqNCwLVDlxsMQPhRy
	DoahEqVoUvqVB05ATGi7eySQ3QcTwgMRcroZf0Ng4jDH/J1f6Zmh15cNM1LVYyFGYtjrO4LBur/
	aOLtBbbacC8/Nf7of8B7a/ipGmJViSH2FcMyunnvCdAnsEWAUMoq65fiO+jfCwCvm5zrBmbriVt
	VFECmTUj1BdhmlVJZQvbdjl3T/CIQm6JrcEeqzQMuHI4pFjkLHPNwoB5qAi/qx1oHUqi2tTX2bu
	RzWXIA3XyVxpgnnANDnNhYQ+zBKC45XRszOJMPU1ERomCPuAhvNJIwJMkRyjEyX3BRY8eWtLoaT
	1gCn4ZsCigySbOwqU8pFKdtqZDzSQ6y6OSRdfyCcqFpSdNHjqQzUOyiAIYt1c1BDtE2+ASZ87TN
	cIQmfbIVtWOuUZGn9hNAaVSUhcar1HckZPodF2VVs3oexR62rbNypmto39Hur3xiP3A2zHZUYD/
	PebVpAOwNZuQbzrSyXg8GBXhCDK+Aw1sdJd5iEw+BnhimJtiQ3SDv/7w9n1+bmMEeSC0xxFPanm
	AM5/1i/F3mDZdf0J1OAKp9aNl5NDYf+ClF8bWtd4bS
X-Received: by 2002:a17:90b:3f50:b0:3b0:a1af:e4fc with SMTP id 98e67ed59e1d1-3b1b0d984bcmr6359401a91.63.1794673606887;
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:46 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 1/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
Date: Sat, 14 Nov 2026 16:26:31 +0000
Message-ID: <20261114162632.16346-2-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

Move scm_stat_add() and scm_stat_del() above unix_dgram_disconnected(),
splice sk->sk_receive_queue onto a local list under the queue lock, and
call scm_stat_del() before kfree_skb_reason() on each purged skb.

Fixes: 3c32da19a858 ("unix: Show number of pending scm files of receive queue in fdinfo")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/unix/af_unix.c | 59 +++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 98fcfd7301f6..990a98330d9c 100644
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
@@ -616,8 +638,19 @@ static void unix_write_space(struct sock *sk)
 static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
 {
 	if (!skb_queue_empty(&sk->sk_receive_queue)) {
-		skb_queue_purge_reason(&sk->sk_receive_queue,
-				       SKB_DROP_REASON_UNIX_DISCONNECT);
+		struct sk_buff_head tmp;
+		struct sk_buff *skb;
+
+		__skb_queue_head_init(&tmp);
+
+		spin_lock(&sk->sk_receive_queue.lock);
+		skb_queue_splice_init(&sk->sk_receive_queue, &tmp);
+		spin_unlock(&sk->sk_receive_queue.lock);
+
+		while ((skb = __skb_dequeue(&tmp)) != NULL) {
+			scm_stat_del(sk, skb);
+			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
+		}
 
 		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
 
@@ -2058,28 +2091,6 @@ static bool unix_skb_scm_eq(const struct sock *sk, struct sk_buff *skb,
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

