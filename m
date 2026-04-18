Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FC30E83F
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776536041; cv=none; b=ZXkXkfC9cM7Ndj/bK42+JvgR9c+qHmX8IcEeBpA3sp2Q/iJZ5VVx6fDGhoR/tYM1pmdaDZuL6rcoP0EODX0O0wQQrDIhrMMyCjztixBXyB+LeBqYoCF0QUiDoJZyXDiJ6p3oY3tdjHm5rs3T8hZ2w3kaWE8SZANL/0zX+GQ13+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776536041; c=relaxed/simple;
	bh=usACHL7JFJ+Iojq2WMGOR+XEp5pZozfvJwRKATA+b/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cT5gBYDVPLXIzOpk9ZTA3Dvuug/vTulY2N1P9lS7iyCbpGD8yOWEcaF9q9Bo8QnXXD7W1dEZSZhH3x0Xok/WOY6YY6X7sdvKZp7CtI3qx3q9IkV+226XKsxKlT9l/fFntg64ZzM9fvZAUlVAk6FZr3GV0cUtAQ/i0gREAGMzwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU0QsECp; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU0QsECp"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f2766905fso729452b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776536039; x=1777140839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qCHQt+5njpxpDnHvEMfTt2VrNOBnIxuj1+x6opPunc=;
        b=IU0QsECpAAiIVvNubSknYTQ4142KJvFFTxblP+0la2iD2AePiIK+V4TSAgNOx1bihu
         DWvTfc2YRjcKIGHXV38X78IMzLQfEasQc44j9POU0YSrYO9k1SttNj75r/NNul5sV6JG
         8Cr25l4GxFH3lDwAcQB3r8wWxZXTtJG0X3Fura4VMA0FDYsUmE2Pje4HYaIxZ77C627w
         gNOEXZZP8AtFZD7NM3zjl5WD8KxRdloxDWc652YqVXBkLO+LCRPTIhdTjMZhX4HoEbky
         oh8eiufk7LQfKLPYs2r2pQP3szqdAnDJbTJb0Xgp+q5jC2Wh9A8tXq/Fm5RXFFBVCUCf
         U4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776536039; x=1777140839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2qCHQt+5njpxpDnHvEMfTt2VrNOBnIxuj1+x6opPunc=;
        b=NezqtiXGvGeLfAlhpSdKWZm1/iuJAmdQbOWhN7A2bl1CUyZ17WeJ9ahWXOVdAycKwx
         EaObFXV0tNZTQ3izvukNxTF7ApVXCQXTiDt5cjnPA+p3USr3ZTklI/rSLpTZOlFzfQ8+
         ZQ1jMcgpNuYKVPssoM4CxMikTa0Pn+xFXce/VSAVftOscRtlKr+Ue/MlI7dbvGQcj0P7
         VS/16ntKS3pt6hhYLdcsJ6t9GIbTqyp6fahFgujLm5g+pRQDQCzA8rvWOK3q306tRRlj
         z5rOuok4g4jvVd6cO7wfR5hdTb5KSaTdgcZcj5ZrKvvTEAcRhDT9Kw9lu6BXrwQ8ZvRi
         0ALQ==
X-Forwarded-Encrypted: i=1; AFNElJ9s2kAIpUtgp5Mmu2s0BQHE/1Qu1/4eDO5wjusMx+8q1z9Whkaw9J1ii8C8LrmhIiEQ/Bt4c+tx0TJmMGAUlcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+F5gGO9gyZ4nhBKDRFEJi1p3u+/GUhC7MUZN51fzqCKblzEE
	0ZIRdN0ioJosqoSPuq0QjQZqEf7iJPXBF5/DOqT2V0a0NBH0JTSjEM71
X-Gm-Gg: AeBDievYtQoy4wlYykOC1t5qn4FfVsxJ0L9L9GVSYc4l9zvzUxDTgm350lFxjiEzbF8
	60ZFe1PNw0M0vAL98+ARGvkEyLabj0okcRPVKK+wtpNExywzjp3lrIJdTuythDkvhpEJEhJzk69
	JHrGbBc9S1q+etrH4rXXyrrK7UOXlPfGJoIFwYSKfAN7WyKtxFJP5b7dqhGYv6kjW22enZPElnU
	98Z8aPyX+GwZWeh91CNdvodjZh7UlhjIjOj6G39hBHa/k6SpUJpGz6GifsPlbyCM2XgonJvzrwu
	ux4Yh305K0Y61QCHww2Q5Nxm0edeEUS7HqCN0fP6xTT+39wRovP6gMbuGVAK0QGNPR4lUse+Yc0
	wZ/dTTGdB180WtPCvhKWysW5ueIGiNwBki5dnPQdmiCscZBJp4/t8zbb2xuKQZwdu4dJhu/sfHN
	cMPX/36MG/6fkx1MLkJF9zQg93Y+0M5CbXARVSfZCVMzin685MniLyvNqO+2VI8A==
X-Received: by 2002:a05:6a00:3397:b0:82a:6852:559e with SMTP id d2e1a72fcca58-82f8c82165amr8311427b3a.12.1776536039025;
        Sat, 18 Apr 2026 11:13:59 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm5659402b3a.21.2026.04.18.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:13:58 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] tcp: call sk_data_ready() after listener migration
Date: Sun, 19 Apr 2026 02:13:32 +0800
Message-ID: <20260418181333.1713389-2-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418181333.1713389-1-jt26wzz@gmail.com>
References: <20260418181333.1713389-1-jt26wzz@gmail.com>
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

