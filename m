Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A5347FD9
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730311; cv=none; b=qFBQaMf1TQYMYPliyS4FXsu0F/P7I1givBvdmHsIYrB7FsqCiP5YJkqIbhihluAgPGzKpdLBtFbbpLvOeggH5S7bvUZzVjagFP6z9Sv/wru8R55mq+yzI4bWwJNmUowhWT0F0/nuzJnbU0C76z1Uo4zjqIL+xnqhFk0V/hyG+gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730311; c=relaxed/simple;
	bh=ImbWQoR+dgm8+9dV9PXvczLRAxo2SxKksFr3fwuIhLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbpJVtYD/AQas94CziBGenJr8BWmnAfBUfN9qnjMiInKYymMqZsl0aWbCnLo+alYSA8pecZF44iKUMi1W9dR8gjZBoRpDJ/YvIKH++mV7rxvh0faYEWDal2hJyq+4EjnqHaPK/J5sVfd6wKo8V5BDD9uS96LCsbykaD7iarwB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEttchVN; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEttchVN"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d74a59262fso4664406a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773730309; x=1774335109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+IJ2HT7GzgVpfj7oyAsWSh4v8318zxK4LdAKWsY7NU=;
        b=VEttchVNmTAHva0Ips9bn6B3mdor+xxVQf0380ZUVMKtJtDtfk/gyhYG7XLoFWKkPw
         6etKYvToF3rOsEG49LUZbO369awuHZec7IBpfrx2ITkKnfDMo/jp57EMC4blBav62+7C
         dkSuoB4EL9fD1eCFQGT96caDptfve5+p2WuKUz7QSfY1diQyndBSkphZ/yL7UP2O7xs1
         paQ0V9pLgewZ6DggzyTaN330Ruy56PqJgXT+dh2CQfNF8KbZqdMgwPB6he8jb2U4tdvm
         akiXfYAAULVp0jqVV17GwqNpHDP6QiQDFCPT+nPGwNu6jlg1cWXYwdfu2QxnmLLGjgoe
         bPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730309; x=1774335109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+IJ2HT7GzgVpfj7oyAsWSh4v8318zxK4LdAKWsY7NU=;
        b=ZGk0nMPf0vmLpVBWgMzpNvPIvSrgOpZ/vvW1tyIHubysiKJLs4+pM+Zd/w0qRF9SK9
         zMzLWa0CM3mlogn7zaU74D2TZOUbwtZiIL94QvJct/Gm93/tZWgA/BdKFp9FvD5jNnxS
         i8juznFH4KQGE9AMFK7ygtMTrLVELbUoHSunMAFnHT+NbjbXws5DIyuuVxE7yZHO5adK
         WS/SVeypweTX7uHkb6CpGX5DEmqX/2nrRpzvBkqEkms8yPlbRFvVhuk8m4eqE/0drFfx
         FlP7w374kYznBSn5m1gVDGKony+8QhAuWS0RkqA98V2VqEdiQVn6iG1R0NmCmus/lY/Q
         PdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnCPxko2aJA1+uJteKzJ1tc7sSgowd77dMTrk1Wz53cFwMT5BG/Lg5klQUoppOrqvuWpasDvuiWev9YypNPe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAchBX0M1bRiT7kSRH66db7gCV+Xwh8dba5l8Vm9TlyralLt5p
	5zBkKF2h/iiXmS05pm7P9PGJZcXos7DTFgXof/1psw98Y95oKTtUPB/1
X-Gm-Gg: ATEYQzxk97SF5fS36ZBiBv6qVxEc0biLBI77CX+LqNjnjGyvAPMvDEhnhpxs70/QrjM
	geyf6wNlsxTxTU7pEcULkpVU05y91Mr0FjMKdJyP4hYO99iUMnmjrct9OmlQQnvhFjXm/hVBlNQ
	P9NuQXPe7EwhxWKvocwx3MQCLsiVLpkUGuMeHnZcRwRUvCEdfLN9ZXPHkfjEpZmdWvTiOgMKh4T
	hlcfnGqNBwIr5ughPWjKx4TyI2gSA1UxyqJ9d4AFFl714xPL5KUsqmFQh5ijWIBhOKdpFkpsvTX
	/JJzlrK0qHTg5xpVMxvVK223yppyluexNYZLg9g+wALAB4cYCXECCEuFOin5Nm/yxvG1Gyx+eOj
	fdAXH3tdoT+JOFDwOL+UwdXObMjpDdCegVebgXifHuiTZTHnVMM9LEqgdK8MH/9rq+N5YrLv0kw
	l/AwvXMQ0/SWsPXh1cXcpzdOixRcxFFkzyg3cKNhYSC+kRUbMXmr1XOjqFvFXsdKctEpG33rpLA
	MRZV5jKD9XocXhZWtszkLAj1M5qcWr14Z0qyQlR8g==
X-Received: by 2002:a05:6830:3686:b0:7d7:4721:9a56 with SMTP id 46e09a7af769-7d78260bee6mr11651705a34.32.1773730309488;
        Mon, 16 Mar 2026 23:51:49 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae68a4bsm14058432a34.19.2026.03.16.23.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:51:48 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next 1/3] selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
Date: Tue, 17 Mar 2026 00:51:35 -0600
Message-ID: <20260317065137.1533226-2-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317065137.1533226-1-atwellwea@gmail.com>
References: <20260317065137.1533226-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
tcpi_rcv_mss update.

Its exact advertised receive-window value is incidental to that test and
can legitimately move when unrelated rwnd accounting changes adjust the
ACK window.

Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
the tcpi_rcv_mss assertion.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
index 7e6bc5fb0c8d78f36dc3d18842ff11d938c4e41b..0b19de9f9307b3d0ee579bc9e3a2b9219a88cd8a 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
@@ -17,11 +17,13 @@ sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
    +0 accept(3, ..., ...) = 4
 
    +0 < . 2001:11001(9000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:11001>
+// This test cares about the OOO SACK state and the resulting tcpi_rcv_mss.
+// Keep the ACK/SACK shape exact, but do not pin the precise advertised
+// receive window here because unrelated rwnd accounting changes can adjust it.
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:11001>
 
 // check that ooo packet properly updates tcpi_rcv_mss
    +0 %{ assert tcpi_rcv_mss == 1000, tcpi_rcv_mss }%
 
    +0 < . 11001:21001(10000) ack 1 win 257
-   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:21001>
-
+   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:21001>
-- 
2.43.0
