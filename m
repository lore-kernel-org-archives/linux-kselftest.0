Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B8367B9C
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254998; cv=none; b=IAoaJAsdlHKCQ/xfMoDvqZ1tvqRPeCNxZiLxcq1fT8p5RnWcKE5i0VBl/EIj1abVnsCsHpEh4dm9mx30rK42aAcYOH0kcuTYWKEVPdfE5Z0uMoGgRDFhejU+cOPQruNLzZr0qa81ZYJsn36Cjh4tH0eyvLY6Rm6eogMKz1w5d6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254998; c=relaxed/simple;
	bh=dCROJAzjbJ0VyYGg4LuwxJRd4UiBiVpUWkEdKbWJWQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wt+moe21PGQN/gf3YXnOw71u5TFLLJzA2eUZad9n4bHaLPhKI7MIY6a2U2EGJHOfL+6aE8pAi78LBPCBamDzdRTUaZNSE2wykvnMKYirjPDHA/mMjb+70yaez9qXoROWXlWBRZUn0uoprJ5XqASxA+TplIh1+zdtULyatnHy/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=s4JDgoLB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="s4JDgoLB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-382ef647e20so4163715a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785254996; x=1785859796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LknHu9GV0qQrEEql1FWoKl28Cq0/YJtBdNrVp7I+OY=;
        b=s4JDgoLBEYdSLOfOsbweVAdCcXp8V4YZZTeoCTuOx/McPrR0nel5/6bawaChbL3toX
         n4T0jBN2YbHAimfDqgBjqiSKNwSzBR8NF9rY0Gt/0cgu1RozlOxAHniwksK9zGigcwE/
         Hf8lsMxjgC7KyM+TAyjCd3Pmtx9G7MMofyu/Y7SK4LzOhUQ34ADU89MS9LT1sC7tOBHR
         QfZiWs7cDDDyJQBYn0l3MhhkRv9SL5A8m/5aBVz8OSFV61AFXK/AYgYlRPStSUk6jnLQ
         6NozxX7u8xi4fNOOctf0WKXrVDpRFpiBi3/zAI62Hm0GgbbWWpxG/tSAI1x+2StxI6l2
         PYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254996; x=1785859796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LknHu9GV0qQrEEql1FWoKl28Cq0/YJtBdNrVp7I+OY=;
        b=qM+hdUfQHA2t2ORJMboxr3uOowM3ObubcMd88kzFZLTZf0sg7oz/b7k63r0homgKOh
         SLV5cwQ8dKJBP0KDZzLu8l3MqvbccQmpEZC43RTnLG42VOefpKsSISpOY8GxR5VP9qrh
         w6zAIilkygnq5xhr9DETbLpBxLxOJeMQ4hdEnSo3JwCmm9dBg7HUEqer7e3sAf8n1KHr
         PLVVPqGb+w2ACHTB6suEtei4Yvnedwhp5N8SlK8MwP6sDs7AzeZOloMZRU8kgPFHazFk
         EaUgcKMtlILyiJpxowb7/n893QUSUcnefgeiAog6e7zcdc6ZC9P4cigU2yemS+/e1bAX
         3eZw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+ioBu6JkOC6D4VwrhlRl7SO1WVVbLdNNLG6R5n4EychopYvuGlmTi9R8qv1m1Hw6pKnMTWe9LM0itPneNGkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6JRWgPckt6k+TCi+OKwOp+8WiFzGuV+VeimBrQZ1kpIqzjda
	Rv3DWoVa63NEg5JdpaMHx17iNM6xZspcnw6gVCctJnRevbOpUWLRdfRPx1k2VJ6DS4A=
X-Gm-Gg: AR+sD13YDCk/gwKxg1RidG5Af0nmNwDpNKQ1zdSq3mRYVwinYz145IIGpSv70mcU2by
	DO5ng3NDXSsUyzOwq8aIvXL9SlJeHxYZRtuUg9N07TUCJ4EHQpV55/GTZVPXdi2ctt7/7gSai/m
	2U39HRbYQkxOzS6PQ+ywX4AfU1DCD0IhTf8Pe6i0AD9gJH6N4V0WukYJe4sT1fE8UlmiFujj/Br
	p94EnMb6MTnqw9hRniw+vDG+5C9Rt/8YzU58TAbC1nWF+oM5sbanPDHoGm50ARMHHP55NMd9O5x
	bSXVtdXQJyX1y1B/RwE8gqcppcn+5cWIIDgk4ORjYUapIvZTcjCCwmGC4JfCuAR9OnphI4556gc
	4+nBsmpZI3LRsJl4BD5HstrO2mkNyqcoKpXd5oRp7NqEsWNRvdKxltNsGszjHJ4zMWUU8w/0xUj
	w/+zNyvcUVBdc3SEfFK6+MHlKJwUxeTdojS7va5gA4mQ==
X-Received: by 2002:a17:90b:4490:b0:38e:447c:9a15 with SMTP id 98e67ed59e1d1-38f6a55f949mr3146313a91.36.1785254996618;
        Tue, 28 Jul 2026 09:09:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f12ddcesm172913a91.7.2026.07.28.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:09:56 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	willemb@google.com,
	linux-kselftest@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/5] selftests/net: psock: Generalize psock bind
Date: Tue, 28 Jul 2026 09:09:26 -0700
Message-ID: <20260728160935.4128982-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728160935.4128982-1-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize packet socket binding so that types other than ETH_P_IP can
be used.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index 3313a15e0ca1..bb9a9cfdbe95 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -171,12 +171,12 @@ static int build_packet(int payload_len)
 	return off + payload_len;
 }
 
-static void do_bind(int fd)
+static void do_bind_proto(int fd, uint16_t proto)
 {
 	struct sockaddr_ll laddr = {0};
 
 	laddr.sll_family = AF_PACKET;
-	laddr.sll_protocol = htons(ETH_P_IP);
+	laddr.sll_protocol = htons(proto);
 	laddr.sll_ifindex = if_nametoindex(cfg_ifname);
 	if (!laddr.sll_ifindex)
 		error(1, errno, "if_nametoindex");
@@ -185,6 +185,11 @@ static void do_bind(int fd)
 		error(1, errno, "bind");
 }
 
+static void do_bind(int fd)
+{
+	do_bind_proto(fd, ETH_P_IP);
+}
+
 static void do_send(int fd, char *buf, int len)
 {
 	int ret;
-- 
2.53.0-Meta

