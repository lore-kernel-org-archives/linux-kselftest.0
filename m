Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B11351C35
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262344; cv=none; b=uesiWor50aAWAxoUXdFgw+M9pthSDGih7zy26U3fyTmc6WmNRgvTRAxms8h+95t64Pv0kQN/KJdXY7pspL940TXNf+u4wBBLJua0ueKmdp2IV0N6Bly5evkwke8Hk9wft4CAl/UFvH9ZXxi+ptL918Zdirtuy8FgR6Hfu35LKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262344; c=relaxed/simple;
	bh=NRVm+NpeqhDaHD1stYDATNicwntE7vF0BHXpPUPT4Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tZM2urDFduTSQmrKLdPVnyeJOPTbvYpQKNM6zD6idRgerCnKzt9uP+/xPW7R5vRx9CGAupYS1J7L0fdpU7CD+LJ2lKZm2wPyndIz9gKjFa344YT1D+HWbu8fejqT6JYAmZXhkMFocwnYpJAIu1UqlH82CMppBoHl2Phg5XSm7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=WQN2egFW; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="WQN2egFW"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1b233ca98so447823eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 04:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262341; x=1788867141;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEmWNrm2JJeYYsOZMUufG1GNwpjiBF7RXVW8N5KgjKA=;
        b=fNhUAMeSYxRT7e20KRcv+cPKOCgbSjBnOLd1LJIeRwPOVEdnIyL4lr6kGErOiUz9Vj
         CgUpLdb7V9O4kfRzfAA9S6+wPT/G1fB/GRHrFZ1X0uTbDndfeQ0SMhdlnEvnbKbwlPzt
         Ti8uUpMPUoT2R1JlOYu/uGv3wEtA8TCNdcHRzBKy2msc1/a+I1Mw42Sdw4aAzDbLpuBu
         aiiSAXyw2ilihjvwDUj1k0AO4aUcXfuJRz5hiawtvGwlVXb92XC0fXb9Hdn1n0W94qQt
         7DeYkShmYa3kktP7IiMknxM66YTvF/cebb3VzmeD/b+Go3M1I6Ay8JbAOKThdMq+m+AB
         tGgA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1iMVxZjXjNJMb894+mJIUceanSREdFD2dSryV7hRPYZcD+v/GAsodPee8cqhk9WK0GMVHnYeVgI76Z9O3B90=@vger.kernel.org
X-Gm-Message-State: AFuF++lpQ2F5P0KVOj2JeG48hxd3PMGNOeK9wjefSqhk95SY5lNh0g5d
	BpiPYVOtbMg5i/TWX7A2cklzokKPl9J1/YGqnLOpr3A6cilBDau5rBt8
X-Gm-Gg: AR+sD12DF9XurCni+to/8g+lzj8+8HoO760VCdyHl+T8qB28PKlOS+UUE9/xU6KMfkY
	Y2xXSKtYj3GOo5Mpkze3mbnGSuxHazOcf3ijE+H66dLmlV0P6zna+9FwKjVecyfPB+QLeKrpROY
	7a9xflorfQY4EADlsFKyiLwvyHcBJzDqQZQSx6PmSLE0h+KV6vDcMXH/J9CWbYfY9tgpHxnADeI
	QOva8QLrIfBoxk2XPSljoM1P7vo5zxGgBWJKV/EroWawoWUww0Z1l7KBvSktBehcHAb+5DuHW7O
	cFkCMsXYB5+v5lr9SUuiyslvP0TlGpTqnrZUVYNe6UCE6uwyIzTS33C1NM9lI+xe4a3YdooVHm8
	PpxHyhaD+b8xLp+5Kq7LayIpdDQJfMUoiSSYju9XRQgm+QFMvyENNIaOCRntiE+Ms71oqPrVz7P
	/jqdO3ojbS1jZPYoCZMD9pBxrqDyMh6/NQKNDPwhH4eI2cjmPB+jKCeSRvFwr38hCkYrH/DC3qj
	4c5HBEyIqrBFCsGGv7d5uHXIkTFOuvb8yYOBToslOVeMRf7wEyxeizT32xop5n/JQ==
X-Received: by 2002:a05:6820:2017:b0:6b1:5d5e:679d with SMTP id 006d021491bc7-6b1c679e571mr29869969eaf.28.1788262341283;
        Tue, 01 Sep 2026 04:32:21 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce2916a8sm13636111eaf.10.2026.09.01.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:32:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEFE660D1F;
	Tue,  1 Sep 2026 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1788262338;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hEmWNrm2JJeYYsOZMUufG1GNwpjiBF7RXVW8N5KgjKA=;
	b=WQN2egFWZ83BoX6boVS3fAw8WgfZ0I6glPax5x/l5hbQkcOA9qdHlRmUwJG+L2QAXOWQ/0
	2FrGxt1oEu7Ia50mWE2W6OkRNFR4u7NwYGZWibuoBTBgBodLpNhOh+acBmuZNsq08XE7NS
	9YzPM0GoZPq7Jrjmk9spTbWqny69Dsy7LG7r4zLxoRafEci2SQTaJbhGSjG3vQmEvOX/Dw
	t01lxVeOUVkwGOVkURI8osV7fmMYjiTYntFQry4vfqf26fU3MtyoBYatP4FdwZfVDpZ4mk
	OAFOm1FLZlW8D08mPh3r93zq2KrgjxnD2PKfxR9g6ebAwRDb94DAQNznjeXx4A==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 01 Sep 2026 08:31:58 -0300
Subject: [PATCH net] selftests/net: Fix flaky bind_wildcard due to
 ephemeral port race
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260901-selftests-net-bind_wildcard_race-v1-1-880ddc7ed62e@marliere.net>
X-B4-Tracking: v=1; b=H4sIAK23lmoC/yWN2wrCMBBEf6Xss8E0Qr38ikjZbLZ2pcaSjRco/
 XcTfTzDzJkFlJOwwqlZIPFLVB6xQLtpgEaMVzYSCoOzrrNH2xrlacisWU3kbLzE0L9lCoQp9Am
 JDVnb7dEF2tkDFM2ceJDP7+IMZQOXf6hPf2PKVV5rHpWNTxhprFEpbu8oEdb1C+5nDyOkAAAA
X-Change-ID: 20260901-selftests-net-bind_wildcard_race-c0067a2dc308
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1788262332; l=2208;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=NRVm+NpeqhDaHD1stYDATNicwntE7vF0BHXpPUPT4Ug=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAQvMA+iXtgn9SGn6DViwidV1JIXPs63Piol0t0aGONt4f1I1seQ/5dbxTlA5gP59kodzeGuJvW
 Uyx2XB5WcnAE=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

bind_wildcard picks an ephemeral port by binding fd[0] with port 0, reads
it back with getsockname(), and then reuses that exact port number for the
other addresses/families in fd[1..7]. This all happens in the default
network namespace, so unrelated processes on the same host are drawing from
the very same ephemeral port range (net.ipv4.ip_local_port_range) at the
same time.

Such a process can independently get assigned that exact port number on a
different, non-conflicting address in the short window between fd[0]'s
bind() and fd[1]'s, making fd[1]'s bind() fail with EADDRINUSE for reasons
that have nothing to do with the wildcard-bind behavior under test, e.g.:

  # bind_wildcard.c:775:plain:Expected ret (-1) == 0 (0)
  # plain: Test terminated by assertion
  not ok N bind_wildcard.v6_local_v4_local.plain

Fix it the same way so_incoming_cpu.c, tcp_port_share.c and
reuseport_dualstack.c already do: unshare into a fresh network namespace
and bring lo up, so there is nobody else to race with for the port.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/net/bind_wildcard.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/bind_wildcard.c b/tools/testing/selftests/net/bind_wildcard.c
index 7d11548b2c61..be3298c791b2 100644
--- a/tools/testing/selftests/net/bind_wildcard.c
+++ b/tools/testing/selftests/net/bind_wildcard.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright Amazon.com Inc. or its affiliates. */
 
+#define _GNU_SOURCE
+#include <sched.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
 
@@ -716,6 +718,9 @@ static void setup_addr(FIXTURE_DATA(bind_wildcard) *self, int i,
 
 FIXTURE_SETUP(bind_wildcard)
 {
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+	ASSERT_EQ(system("ip link set lo up"), 0);
+
 	setup_addr(self, 0, variant->family[0], variant->addr[0]);
 	setup_addr(self, 1, variant->family[1], variant->addr[1]);
 

---
base-commit: 1376afc7660bad2a1a5ee0876898312a486cf8bd
change-id: 20260901-selftests-net-bind_wildcard_race-c0067a2dc308

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

