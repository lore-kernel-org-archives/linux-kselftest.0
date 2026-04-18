Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4E238150
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776485847; cv=none; b=IrllrRaIZqMFp7dJwWiG35+kAEyDAaih5h2FF4rCkYRyJZPFEO+YSVRbghBsk9A25XKITPhJU62xgoMqhLtyQVEzV3TThxnDvmHw+TdKGKUhdrvPd7VSE3J4XivVoB64A/YVTn9FWjPEN4HRIk2zLr6t4/GMOcwUxOcOk7y4xQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776485847; c=relaxed/simple;
	bh=DNeuuui43Z7WUckyxw1/kPzB8/wmhhyPAn6t/FTVdRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRgXdzrq8Sltt8dDxBf4mW9xiQPKWObWu8rh66mv2L0cEMbvlZJ3QghO/ZOBURAYFAdWaeH/NbY/xKnTnOruqvMZhfAPHyYsrRY7HdzSfW5wzwazgUwPuRFe3j3kHYv8bwRO0lq268sbkJDlcWIURhSCbuiT4Y9UUAHWxnN/RV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h91FiJXa; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h91FiJXa"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f8893bff3so631948b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 21:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776485846; x=1777090646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhJmNKzbi8lgBR/6qaGu+UXTmOuN+KpkyQcs/Gar+k=;
        b=h91FiJXaMX1ycer1et/ZVCtRWpbDAi0Skejbc3gg4os6SkRZX07Nx/qQJCQ1QA68+b
         MHMD6XO2+PBE+NXpTtLhWd1NmjL90rt/dfL04DFXmH3EzJuX1QCHUfhlZ+zO+5krrr1m
         zbyn4Rp8sqaa19KAxIw0/u/gk7mIjUd3yiJv+fsrk8vNf7KbZakohizxTaetfc8Y0FeQ
         02Z30XdRBSvIGNIcAH6dmpMVQ59DOrIbSr3irbo7cHoMdWLRlwKuJbaQFjAaessqOy9e
         SBy2I2GvxZoVffKmh8S8WgX6AaAxmAcodBDQedv/JbG8rhKhOoOg5A17qNB6p41li29M
         5otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776485846; x=1777090646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LhJmNKzbi8lgBR/6qaGu+UXTmOuN+KpkyQcs/Gar+k=;
        b=BzyKLZ2mGNc6zRYCH9EVhnt6sY4Zq10zmUDIkErJPDyc9IfTk9CanQ4lsKzl/68uFb
         waIbUBO7AEOFGc5TScad//lKpT07dfWvXK1icnzHq0wsvrYLmeppwsV/Xv5SQ0dvI2QJ
         NtFGEgP5S+JFXm62ZH0Xb6GN33D5YkWlM/iGhnLcZcKb5ka0ysr1ZHTaytmuR2bGsROR
         M66sQC5RGDZMXFjJLuEraC9ObDNXMvHV4+wffw0cgvHuX82yYQLqWeDUqnqiq44tOwr9
         YGoykjWdcMwrtP8z3q70Dsh2YEjM6UfuLcLU79JPojTuS07avJG6bFU0srfrxWxFIZ5s
         bF7w==
X-Forwarded-Encrypted: i=1; AFNElJ8dGWfZDplCePtoYsCNh5ogC1xwZ1Dwk2izD0cL03fU0iUvzy1NtVnjJ48G78IwTeFcT1CaIG9+S0srEtGVofI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXXx8FuAbBJlKJxQJmgMdwmBqdvEXC8Umhp0ptDl0pnCEY8b6H
	rJHajLy264dJSRWlv7ekMSVAJhgHZ9GqLWKtNbkzaEsblRi2BzebAea8fY50fJ6dwYpVsESs
X-Gm-Gg: AeBDieun3Wu78VoaZSynJzLBOZoexc6jzxksbl1W96S/sSueZfvNaMh2lNQsee9H+TP
	33/g8z0l6OheLVojmKjWqCsQjb0VNLPO6bORcdj4JjjbLhL2tsZZRQXgci/rGVUYoPgvM1W9rI6
	+wQYATlTHwBfjzbye8uw64znmoMotCze3sP7HG4Ynv1yZ43nNF50/nkQy9ZfP356LVhu0ryoJBA
	n3tJ2LmbPwXyfJuCbKmWTlWgW5GKNrj2Mayms6hlMtE5sVLsza4ZR438xGXOvS65dOQg0l1vx+R
	U3SuTefEj/i2EMNPPb9h0uY+bZ4wcsxHBuNi40+RShRcn0nd3HvJ7HnOnS4XzpqFycXxHIS8wey
	ax6JIrjUl9x6ThNGoR+tIBhJBBI7df4e1bvME2Sz1hoH6jkt1OunCUO4FnRijj2m/t236Xqy5yK
	xDGeh/rd2X7o4Bqu+SN1f5WpgCAa/z7cxy+EPg9Cu1doSCgXpafVYEabUHbSrADg==
X-Received: by 2002:a05:6a00:3028:b0:82f:6640:7229 with SMTP id d2e1a72fcca58-82f8c91c9femr5819948b3a.23.1776485845707;
        Fri, 17 Apr 2026 21:17:25 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981992sm4356787b3a.7.2026.04.17.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 21:17:25 -0700 (PDT)
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
Subject: [PATCH net 1/2] tcp: call sk_data_ready() after listener migration
Date: Sat, 18 Apr 2026 12:16:32 +0800
Message-ID: <20260418041633.691435-2-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418041633.691435-1-jt26wzz@gmail.com>
References: <20260418041633.691435-1-jt26wzz@gmail.com>
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
listener's waiters.

As a result, a nonblocking accept() still succeeds because it checks
the accept queue directly, but waiters that sleep for listener
readiness can remain asleep until another connection generates a
wakeup. This affects poll()/epoll_wait()-based waiters, and can also
leave a blocking accept() asleep after migration even though the
child is already in the target listener's accept queue.

This was observed in a local test where listener A completed the
handshake, queued the child, and was closed before userspace called
accept(). The child was migrated to listener B, but listener B never
received a wakeup for the migrated accept-queue entry.

Call READ_ONCE(nsk->sk_data_ready)(nsk) after a successful migration
in inet_csk_listen_stop().

The reqsk_timer_handler() path does not need the same change:
half-open requests only become readable to userspace when the final
ACK completes the handshake, and tcp_child_process() already wakes
the listener in that case.

Fixes: 54b92e841937 ("tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets in accept queues.")
Cc: stable@vger.kernel.org
Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index 4ac3ae1bc..da1ce082f 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1483,6 +1483,7 @@ void inet_csk_listen_stop(struct sock *sk)
 					__NET_INC_STATS(sock_net(nsk),
 							LINUX_MIB_TCPMIGRATEREQSUCCESS);
 					reqsk_migrate_reset(req);
+					READ_ONCE(nsk->sk_data_ready)(nsk);
 				} else {
 					__NET_INC_STATS(sock_net(nsk),
 							LINUX_MIB_TCPMIGRATEREQFAILURE);
-- 
2.43.0

