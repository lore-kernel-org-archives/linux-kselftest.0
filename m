Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38EE3C343E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 12:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774688; cv=none; b=GqPMrx/HWq6YvXiUpoWBNYYW1TlfdgbxDze6Zvx33i/m2z7vWWlQ6BGHuXNJ0DZDiqILFgOm+3PGJ2glj3/HR1onw80OfPAbL+vql9EUXU4Gc2Uuj9Ut2qq+iJI7/p8w3fzFvtf8/zFYHpLTr0vI+Vzl4r9NzeP0bfeq+0jwQM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774688; c=relaxed/simple;
	bh=usACHL7JFJ+Iojq2WMGOR+XEp5pZozfvJwRKATA+b/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQ9Xlmkb1A0p1C5KxVv6tl0zf+if5ku4v67+GK4gOiZNdXOwDOi2O0gVK7dr6JDKINddiGOPLa3MgGhKxZ/JIUdf+b8/W2CdBz3/u5docv7PjJAUlGhKCtEK1klrg+v6UoKhzx+bAwqFKCEHTACwUcjFd8io5RtlpKqEoCNHbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZqwRoox; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZqwRoox"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9f316d68so18654435ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 05:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774684; x=1777379484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qCHQt+5njpxpDnHvEMfTt2VrNOBnIxuj1+x6opPunc=;
        b=oZqwRooxG1EQH9IR+N9JAP7ZGi/X6mEnWAfgIFe7c9aTqD7y+/Z73H9SZ3hweSWuGH
         vT/mns5SFKsLhas35xVi2T3C7uJecCWP01AM24PuEgeYmcWiSxBYWYEU8IvV94A0SzjQ
         uWoht621Kw/J3Gis5Ne5txUs+fodLf81/IAPS+VMNqjI3lFPsDhqEP8z07bIzbg2Avj5
         lStzqXo9B9dcY+549BVBnpEUBtnbTTWc2a6AXd9MssAqL3nFuf0iIkSGNwfxRXSUq9Ss
         zfWtF+5zsaty7+rlLN4JGRlik78MrXiq2EmLUQcQ/EQShIDoVDsZrLO5RDXEcjqh3taV
         YWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774684; x=1777379484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2qCHQt+5njpxpDnHvEMfTt2VrNOBnIxuj1+x6opPunc=;
        b=XM2QcGJPpS38i6taqK/8YHblUyJ4VhwyURd9yCKEsqXz0merZ1HusREB0fB8CJGgu+
         6xDO4MysIFvXvhsOiY9Gy8MKE/VoStmVcHCOv3F9YjDFFghz/Z4Jm/PZBytUFM+TtbQ1
         eqMtA7wTd87OnDRNbyTyr0gQim/U4s3maEiax4Fbj4bIYNOWnBfciex4o1qisXy3yxcD
         e8de3hr+LVnHCm9GbLidlLTt6Pa7ueek4wRkxhTptCGz7gfXUWtI2WmJbmNbiSYpRx4q
         Oe7WQvjhS1SdmfqxWTjAh6pIPqf8Nu5FTgHWvSOe7HXgEpwa0AeVuj8lmMYb3SDmJsxp
         9ELw==
X-Forwarded-Encrypted: i=1; AFNElJ/ugUz8duWgWyQfQrBP8f2rxeZNnoy0DBmEoD1eZZup5UZRYZliEQLm1197ZArGEwfpbe9iuxPrMsq3MJuj9Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFpyBwNm/EOHJUqJGlUJynTLe3vcbm7LBBcOIziA/t4tE7+8C
	4YESFh2bqyd/+Mqg8+TJ2cvZ8v+k4yS55KVLBoaWsSTFCBaNjZOPc2q1
X-Gm-Gg: AeBDievrYKKLNP4LwbuZixrRM0G6ksbo2zZQ7LwMZ6OmyxNbxnzHIxtDGBFVTZW6vrI
	zDK2YP/PiYsJskxMOCvGf/F4exolaQOg//RcypGUYGA8GSTC/bf893fWUzKEfiZLpZ6fHn+ATyu
	aWG8OW7V712lVCRnaIBckEvzaHZomIWSRBtGc+BKTSGOEmpEnSK990gIODYCqIBRnnEF/Y03ctJ
	zn/dHUQaIdcI0JW8qGjhkWwjDpkhofcwOzykbEAN3FsnMmptCvVLaqRc1av0in1qrLTzj/Cdgfk
	Acv0ObFmXdBi7elXoeF4m67+h0cuU5otfcSo6VIJ2cOthffeLE5fyb3moTwevhKHi2JdEzZYla/
	RVP+SdidL14qZAqYGvOia0INC/aKWMQxB4H7Eu9wEjQ1d/RI9yaNPPO9Pkd72r5XL3ZQFPbrxtN
	dvr1F6TIm0B/0kpey5bH/5ftCF1VhlyjPgTWZbxtEyIWLRhnusCIJXwNxilXNnyA==
X-Received: by 2002:a17:902:db10:b0:2b2:4a9a:b149 with SMTP id d9443c01a7336-2b5f9e79dcfmr197068945ad.9.1776774683926;
        Tue, 21 Apr 2026 05:31:23 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm169724315ad.14.2026.04.21.05.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:31:23 -0700 (PDT)
From: Zhenzhong Wu <jt26wzz@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tamird@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhenzhong Wu <jt26wzz@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v3 1/2] tcp: call sk_data_ready() after listener migration
Date: Tue, 21 Apr 2026 20:31:05 +0800
Message-ID: <20260421123106.142299-2-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421123106.142299-1-jt26wzz@gmail.com>
References: <20260421123106.142299-1-jt26wzz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When inet_csk_listen_stop() migrates an established child socket from
a closing listener to another socket in the same SO_REUSEPORT group,
the target listener gets a new accept-queue entry via
inet_csk_reqsk_queue_add(), but that path never notifies the target
listener's waiters. A nonblocking accept() still works because it
checks the queue directly, but poll()/epoll_wait() waiters and
blocking accept() callers can also remain asleep indefinitely.

Call READ_ONCE(nsk->sk_data_ready)(nsk) after a successful migration
in inet_csk_listen_stop().

However, after inet_csk_reqsk_queue_add() succeeds, the ref acquired
in reuseport_migrate_sock() is effectively transferred to
nreq->rsk_listener. Another CPU can then dequeue nreq via accept()
or listener shutdown, hit reqsk_put(), and drop that listener ref.
Since listeners are SOCK_RCU_FREE, wrap the post-queue_add()
dereferences of nsk in rcu_read_lock()/rcu_read_unlock(), which also
covers the existing sock_net(nsk) access in that path.

The reqsk_timer_handler() path does not need the same changes for two
reasons: half-open requests become readable only after the final ACK,
where tcp_child_process() already wakes the listener; and once nreq is
visible via inet_ehash_insert(), the success path no longer touches
nsk directly.

Fixes: 54b92e841937 ("tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets in accept queues.")
Cc: stable@vger.kernel.org
Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 4ac3ae1bc..928654c34 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1479,16 +1479,19 @@ void inet_csk_listen_stop(struct sock *sk)
 			if (nreq) {
 				refcount_set(&nreq->rsk_refcnt, 1);
 
+				rcu_read_lock();
 				if (inet_csk_reqsk_queue_add(nsk, nreq, child)) {
 					__NET_INC_STATS(sock_net(nsk),
 							LINUX_MIB_TCPMIGRATEREQSUCCESS);
 					reqsk_migrate_reset(req);
+					READ_ONCE(nsk->sk_data_ready)(nsk);
 				} else {
 					__NET_INC_STATS(sock_net(nsk),
 							LINUX_MIB_TCPMIGRATEREQFAILURE);
 					reqsk_migrate_reset(nreq);
 					__reqsk_free(nreq);
 				}
+				rcu_read_unlock();
 
 				/* inet_csk_reqsk_queue_add() has already
 				 * called inet_child_forget() on failure case.
-- 
2.43.0

