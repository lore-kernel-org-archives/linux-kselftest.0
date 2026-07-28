Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617643A7F1
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255003; cv=none; b=BaRd1pjPrKfhDmpB8xS3tCRwUB8gfvCIzPOqvNgbpfEZE1Xnl2Rs6aXSkm8yUlHmNKTX4u8fLe/PCAVteO4d8P2FdTzPr+6TyMs4NGGoa/clrtAK7juhsoSH0VsclN/AHBRJ+wEkOzyu95NyFMF+FkHfvSxassNzKGBD0T0Zxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255003; c=relaxed/simple;
	bh=UYlqUNEm0YyG3FPPau/Ebm32GWInJ+TUqYC8ieCIhbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOqvJlMOJXULEt3WW56zakplYSwPrQ2BovotYwQ0SE3nxEMdRDzlrz6vz0523BTFCXRlYqDvzYmsNdWFZlvjQos1ZdMFaSdFOT46v9LyQ2CAh8yR3LVW9EDQRCT2vji4xq66WCjT4xiaHL8+vxDT2lNSErsEGSoJt0fyJcXghtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=eKveRZzf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="eKveRZzf"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848743155bcso12516b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785255000; x=1785859800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUfz/Uk5z02XF6bLGMzCGPFjLe2D8UKrXP08L9Xjsvw=;
        b=eKveRZzfM0dPMwK89rx2SKxQQRLTteG3pbaXcH1EU2EbTaX7q3x2KpJ2cHAoFt3Hm8
         Ml3/ep3WJ+Bamd8KKysorOj34QwzvaN7IlV/RceUKcxaYXZlFKM7Rg49QB1c6uowV0R3
         UGKdx/exCBTkbRj30pm6w6YkFsFvkt0SYd0/1IeqZXrmfxMRq/tN/lfH2HHVQr1c/w66
         jpOhaIh/DqDYcqnUZUVE4SMEM1NZUxHv5R7TWmF9+UmMkUtocJ3m6xuo9VlQ5TacKu7e
         OkMI+cqRLEfQTFG0FV0LkysVJGhuWL0xdwkm9nqusg0i+DYYQAH+sBJrhzuNdCGUTiW7
         6RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255000; x=1785859800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUfz/Uk5z02XF6bLGMzCGPFjLe2D8UKrXP08L9Xjsvw=;
        b=LgS5KDKpCw573nCptUG1t2owPstOCgxfyCgxmHiRwqy2DqtAftzNkIrEOUtI2v28pF
         Vh8mBxaqqblExsMeKK53SCUN2LwMbUc8FFj3laREGzuKGD17nv1PbrOzIRKKUeMRPDEH
         RH25RmWwzTkC+E/7VJv+W0bIBlbgyDSussVre/whMl8dVLKeGZ+CDY5RG2U4JZNOwE4q
         KZu8ShuSQ9z4lLwhLah9DCPLMQK0Vm9Yzmg3h/RcSHtd00v/6EzuDosfFf9SW/s7XAF8
         Ip6QdlO+ljGG6q4cerSKKQLXDG9w8OczC3Be2XKgPSdqOTh28MAM/HKk7tKYJuIqxLw6
         By+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq+y2PeyQgDVpk+mt7vhqyc7+l6kb6XkBJLSad+YjEUCZ8qzK+J9fxfyfjotl75qBImPmIQC9T1Nf4qpk+mnMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI9gospOhXsryzaraUo9Dxi104vtTZTRkSEazCjqmQVZW27fgY
	1gRGu4Wo0IKX2obhxuBCAUpxcr7TSm4FMFqtXzLBlJDGbEFlX82uq4hiPxS5NGAhRKg=
X-Gm-Gg: AR+sD1280bPejmb+mHUDqCocwaZOjvt/8My2oO02k4jj1d52GhnpY4OFvgNOCpFySRL
	uCaPdMUaksbyR8SVG0o5C8rtW1CtX8tADUVUs2bWnslELk56FDNLhMihJwrv1e3X7FKgiEUBLgK
	Q27SJ/EMgOoXZwnTVHHvT1RqERdVTY4tHHdO0LXGyvfJqUhiESYCxlzs9s1q1f5w6AzCxcwlhrC
	yzN/1tA2EU4MZdqzXgpYNiaLHcTArp5X8PBGSyBLQC+VCGPMz2RXpFOoYlomihQBwA2Jt0sYWlK
	wwNa4t9TPK4llnfIl5/lwliOqXC6Iktm8mJmk56mraMIDigvnFuATrHFJH6GMmKWarTLhyP3gQY
	IEdFC0KF1eutg0NqHhQP65r6Y7b9GME7ZcIaeraOLL98qzdaEkuxmBJVO+IEb9aBMCDy6hQ==
X-Received: by 2002:a05:6a00:ac89:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-84e93107604mr3275386b3a.13.1785255000349;
        Tue, 28 Jul 2026 09:10:00 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0054afesm170583b3a.17.2026.07.28.09.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:09:59 -0700 (PDT)
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
Subject: [PATCH net-next 3/5] selftests/net: psock_snd: unify on recvmsg()
Date: Tue, 28 Jul 2026 09:09:28 -0700
Message-ID: <20260728160935.4128982-4-joe@dama.to>
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

Don't maintain two RX paths in do_rx(). Unify on recvmsg() and pass aux
data only when needed.

No functional change.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c | 28 ++++++++++---------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index d506ea19491b..b2593daca603 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -314,25 +314,22 @@ static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
 {
 	char cmsg_buf[1024] __attribute__((aligned(8))) = {};
 	bool aux = is_psock && cfg_aux_data;
-	struct msghdr msg = {};
-	struct iovec iov[1];
+	struct iovec iov = {
+		.iov_base = rbuf,
+		.iov_len = sizeof(rbuf),
+	};
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+	};
 	int ret;
 
 	if (aux) {
-		iov[0].iov_base = rbuf;
-		iov[0].iov_len = sizeof(rbuf);
-
-		msg.msg_iov = iov;
-		msg.msg_iovlen = 1;
-
 		msg.msg_control = cmsg_buf;
 		msg.msg_controllen = sizeof(cmsg_buf);
-
-		ret = recvmsg(fd, &msg, 0);
-	} else {
-		ret = recv(fd, rbuf, sizeof(rbuf), 0);
 	}
 
+	ret = recvmsg(fd, &msg, 0);
 	if (ret == -1)
 		error(1, errno, "recv");
 	if (ret != expected_len)
@@ -341,11 +338,8 @@ static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
 	if (memcmp(rbuf, expected, ret))
 		error(1, 0, "recv: data mismatch");
 
-	if (aux) {
-		struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);
-
-		check_aux_data(cmsg, expected_len);
-	}
+	if (aux)
+		check_aux_data(CMSG_FIRSTHDR(&msg), expected_len);
 
 	fprintf(stderr, "rx: %u\n", ret);
 }
-- 
2.53.0-Meta

