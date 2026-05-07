Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A3B3F0AB9
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169108; cv=none; b=ubwrVycOy+26wqfAaVr68qKZyE5voaGdoaRgWi0lCaebll0cvq04RPeGq7f1vvDB4f1YgYKqZt/39qquMwf+/6UgYI+9yZ9Vqqg7MW+V3JVhOlbzUSYZLmqX6PbDuBKN4EcFR6tcpGlMoO2SqHZCwAOp2asqixIGMLx51EgXQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169108; c=relaxed/simple;
	bh=M15uTKwN3yvrhy6+C4e1xest8u1tFHkbzRM6zHTj0ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdPAjcjY+Pmu+cz9EBu0J3rrPNTerJPnn1I32GsQ05bqmYspUABDQS83yMM5s2Y10rYkY2Adly/kkmZYEeU3SwG2eYEysI4T7THkOspKzmpWP8xVUFKuXqcgrW2B3LhHWg+I/0tCBoojUbM1B2CRBKwJhebpMhaeniaE4hGj3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Gdxekxqm; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Gdxekxqm"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6949872d84cso49209eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169106; x=1778773906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtLl8kOWvPMx0S+t/a7Mz9vgLX46fqlMMw8qeaNu9sU=;
        b=H+2EhiMn+6lJM9z/Uh3cKgL70VhYxX1UKg5LK6592me99PIqFfWoCFLpNtyyiaicF0
         YmAFIn1Kwi74P05z+GigtM0ypGQuUMp8dsmq8iHPqy2R+XoN3P8yvTdPbRswferFBw2B
         orMK0DpGGG1QK8o4U1U2YLUtNeAnJYWWww8pjegn/GmVZ3CJ+q2zRtFKHjegqe8FsrPL
         JS3UyCr2nQHFquU5gnI4aEfkOyA7fVYgnde/1Q1lVDnvRTp0ljEHkJTW8+MhItim5904
         tDSfveUlY1ajaSxjI10Us2ySIREo3mfWsOfccTqzirLFBBZgHMgJ5Brq+A+DO7hbtSVl
         FtXg==
X-Forwarded-Encrypted: i=1; AFNElJ+03Ir1mqt+AOPqv8PvSdT+UkEfPQJKxG6b1nm64X/MXPogfn7DYSjluMue8NZ774iHRB2ZZQDKOLltE2X8Ft0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQc9xtqt2SwY7r/YpsNtU0pur0YSDp2S6xZMH/BkQRY6jEA3zq
	64BygDpP5Ol7Zy/nN7OZwakK4GHBtNKxwj/eU6izjQOtsfeoIYjCrtuU/mQwuMzw7avQf8nmaKY
	D1G91z5GWxhgZENLOCOF4UdYc2SZbpBLxQvxvXF3xT0gte++G7U252CdQkXDLvekR63iz/ORIs+
	krWBKT29ZUH77DIAYt3Y8lfZW1WWpQT9IWpbL8+JQcX8fP4ixFum3jkvEhz+8LdxqtRiM4lvnk6
	kE7r1Ed2kUWAh0TOotYoKoRMWM=
X-Gm-Gg: AeBDiesu5/xdszxoTjk1jpksqU9UNZYLqBJmidtoMoQQh6FItQUP2hmstbrTe3i1h22
	4uzZ1huwFnTXxeZIYrLL1ABhocrw7sPr9d8+CxXIGCnH4KZiZuFodnFVeUp5AMvAKnCKT8HJe/A
	jLAz9q4VXWOZEwxq2pgFdpTnV0XAzAnrX9oqsx95k7wSWG+xWbIjvnIvKhSnF8naGRo9r+0kPrq
	RLQ7uXueWQeWmlB0tREez4fpeSzWg4R/2UsNKTjSR6hFpTpAEYYr3u/PMWZqCB3e3g4YF9C6Ay9
	ErZKjrzupzhEwfBKZQQNgyBjJHaDNdg7Su0JiTXIWzZAcA7PRTI/r20a55y7zxwwqs1YebEQuOo
	nh07184GbJ2ZDC+rgwudmCteGO38j1j+Rsv/yp2yzMeCq6cuGITMNdjWqiAQiGsUZvibc4q6TlK
	Z/DhpeHA==
X-Received: by 2002:a05:6830:4423:b0:7d9:b2dc:334a with SMTP id 46e09a7af769-7e1e2d30b55mr3084266a34.3.1778169106203;
        Thu, 07 May 2026 08:51:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-699b224c59bsm69153eaf.12.2026.05.07.08.51.45
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 May 2026 08:51:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb6880430dso28903485a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778169105; x=1778773905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtLl8kOWvPMx0S+t/a7Mz9vgLX46fqlMMw8qeaNu9sU=;
        b=GdxekxqmEJ3Rx7hl0zllmscamtHQJ4J7UOFpKkbkp8NKpIqdhNX+OiXH8X/Hzzob18
         TOwtRgpjTi54fGeYUicnI7/N8nW+9bJkSWnn5Mq9B0SwpwsuqYoe/1R0HSqV2tb8ALB8
         RePp0S+PgS1JWMB0e6eANZfN4feGMDtfAbuV8=
X-Forwarded-Encrypted: i=1; AFNElJ92/lS0ReyZX2NjOXnNbp/5KF4xOMn/Pcw2PSHUsdng0lq9okzHMEdjbMXpfeLdj9q4CNCGEDQX8i455NEcVJI=@vger.kernel.org
X-Received: by 2002:a05:620a:4406:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9051dafefc0mr754138085a.3.1778169105103;
        Thu, 07 May 2026 08:51:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9051dafefc0mr754133685a.3.1778169104463;
        Thu, 07 May 2026 08:51:44 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-90642b76d39sm240711885a.2.2026.05.07.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:51:44 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	netdev@vger.kernel.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Ankit Jain <ankit-aj.jain@broadcom.com>
Subject: [PATCH net v3 1/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Thu,  7 May 2026 15:48:05 +0000
Message-ID: <20260507154806.18635-2-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507154806.18635-1-ankit-aj.jain@broadcom.com>
References: <20260507154806.18635-1-ankit-aj.jain@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When an application locks SO_RCVBUF, it disables TCP window auto-tuning.
However, the kernel still applies dynamic truesize penalties to the
scaling_ratio.

For small packets, this penalty drops the scaling_ratio to 1. This
reduces the advertised window and causes Silly Window Syndrome (SWS)
along with 504 Gateway Timeouts in applications like Tomcat.

This patch bypasses the truesize penalty if SOCK_RCVBUF_LOCK is set.
To prevent memory exhaustion from large aggregate payloads, the penalty
is still applied for GRO packets (skb->len > len).

Fixes: a2cbb1603943 ("tcp: Update window clamping condition")
Reported-by: Karen Badiryan <karen.badiryan@broadcom.com>
Signed-off-by: Ankit Jain <ankit-aj.jain@broadcom.com>
---
 net/ipv4/tcp_input.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d5c9e65d9760..4b1832b3face 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -240,8 +240,13 @@ static void tcp_measure_rcv_mss(struct sock *sk, const struct sk_buff *skb)
 		/* Note: divides are still a bit expensive.
 		 * For the moment, only adjust scaling_ratio
 		 * when we update icsk_ack.rcv_mss.
+		 *
+		 * Bypass truesize penalty for locked SO_RCVBUF to prevent
+		 * window collapse. Still apply it to GRO packets.
 		 */
-		if (unlikely(len != icsk->icsk_ack.rcv_mss)) {
+		if (unlikely(len != icsk->icsk_ack.rcv_mss &&
+			     (!(sk->sk_userlocks & SOCK_RCVBUF_LOCK) ||
+			      skb->len > len))) {
 			u64 val = (u64)skb->len << TCP_RMEM_TO_WIN_SCALE;
 			u8 old_ratio = tcp_sk(sk)->scaling_ratio;
 
-- 
2.53.0

