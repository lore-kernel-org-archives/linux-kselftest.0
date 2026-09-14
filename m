Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C556F41228D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376686; cv=none; b=b8lKaitVRiareP2O7hQPFHugo8In72LXNOnIWv3snoF2TUp7GAkNFIJGHmSyOxJfRqK5aG4u1CLB2MFuM6D9vi6qR67r0aeUv4raGfdfuzB/o8YzQUjTO09TU9TADkGYQusO4eMWxZlpP2mp5M2sioB6imkna7jurZfbWIVv6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376686; c=relaxed/simple;
	bh=+kYxVA269QSdSI76NmqygD6fADEqBxPvmi9m4oziKys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2kUwJzlDNr6J0MfJGDoYQTewSszUAC+vKJLPsaN98tr0tHY7mkws2nNYRZGqKSmiZAVCjuaLv86BhlLmpdIqbzN+2+CTfZkjkOk988ax/Ul8aBK0n1mX6/bJZTbnSUcTnoCeAEWp8mj9VXPllXL5+0TtJt97h0FD/BlPWzwQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=Ripl6QQ0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="Ripl6QQ0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so1084015e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1789376683; x=1789981483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+ZxnVustyskk4m7lWyI5feD0wenHef7tflNZipPiYY=;
        b=Ripl6QQ0Sik6oYv1nmEbYYPKNfMpBX9ERpUx6wufuyqnNbq2deDPbublQ2lOD+XLAa
         z20wlCIBgJ6zWqXkI+DbsT94ifp9McCAE6aZyqbJj18T6li+d/+mtEToPZmf7QcGCGVn
         d3ptdD9zLHXQKoIA8H8twND0/k0elmxBIsX2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376683; x=1789981483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+ZxnVustyskk4m7lWyI5feD0wenHef7tflNZipPiYY=;
        b=XNFmTCkwMAZS0icvfBPsz66dkioV6cLK35HGj4J5LScPqPY95u6DoEuJM/McXyb4Va
         AUjaRXmUq0D4Ny95Z440gpzDa13hohObyleVm5T6evPcYTDvZWM4ciXtBLtvZ+fnvoBh
         9XMU1sUcD5tHjlj60Y8fKrKXyYPEv2K+aoQetUhHDC6CA5z51MtR7fd6IQcbHpBdQYIB
         027+zZpBIe2R3SIqjZMBjaKL7hVyo7DU9cp896bH0/jjB/ayWVw2HGpPgU4/TaPw82Si
         wcabycEaN31uHDtXBrznpfu2VFiTsJNZz1a5sW+Gu4GgO4IfjDcXii88p9cDiy8QjN81
         Yqeg==
X-Forwarded-Encrypted: i=1; AKwUvBzOLjcaFw2Oq94iZL0Ul7U7ykW92cru+NsBX42ZGujRbPV7/Hn16iB5EqkZ8nGfTas3VHig/Q8a8RZzhrwiZxs=@vger.kernel.org
X-Gm-Message-State: AFuF++mcxw4vLkx2puPDMTU9Jq0Ppy64xO2l0t/rr7LBT0m3NHyXPxSa
	0xGfMhSBoig8I1m3EAQbUmx/I/jN48sIpCJ6CwUBStUnfgUF7+mqa/RjfD50ljxgzQ==
X-Gm-Gg: AYBFou1u0SSqiviEVBnR9H+a+4KwHILnbgAGESRoH94EflXrbPDI+bP2paHcxrNzQYA
	1c9nwn8phE3jQxWB5AIHY5lMjcsfYKg0GSg9TKDIxXBAlCI+CaC/WDYHdpk2VG7PXih8d0edFOd
	zh8NhogoOzInEyksYLTpZSL62MRzSxGZmzeusfL0ErrV1luDLrcjLHhY+O+mgQNNCZ///JLFLBY
	t9W0R5GkmG/Tc6v1vdh3rXv4AahNOg7Xp6pW5MAQwgeEf6BpmlMW1pJ1iMypcnXy4iwf1sF6GiB
	yVFIzbirRxvENgknp2nf41lldjEkjiD0TV8ZUnU43IK7afpXQEwKBIVAlNaGZkxwIHoyHtLvxtN
	hmjLXyFDdZLPeqZ0DZnlOab2kyPazAviKsmnN/fG14oKkltylzV+P+vdNe7mqQMVcaYRri/KgCi
	0sk0BovsMfqPlXlwOKgH/joNkonp8NxIqZToB60CFblTABKWtt0VjqTVVKNx6Go6PIxzXLo6QEp
	4U4Meq8TnWpspgn8NAS7+SUfobfpy7f+KzZ
X-Received: by 2002:a05:600c:4683:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49e7a5ed9a7mr15588095e9.0.1789376682771;
        Mon, 14 Sep 2026 02:04:42 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm227502585e9.5.2026.09.14.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:04:42 -0700 (PDT)
From: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	amit.klein@mail.huji.ac.il,
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH net v3 2/2] selftests: net: packetdrill: test exclusion of old ACK from TCP fast path
Date: Mon, 14 Sep 2026 12:04:08 +0300
Message-ID: <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a packetdrill test for an in-sequence data segment carrying an
excessively old ACK.

Verify that the segment falls through from the TCP fast path to the slow
path, where the existing ACK validation rejects it and sends a challenge
ACK. The payload is not accepted and RCV.NXT remains unchanged.

Based on the reproducer from Commit 3d501dd326fb
("tcp: do not accept ACK of bytes we never sent").

Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
---
 .../tcp_rfc5961_reject-old-ack.pkt            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
new file mode 100644
index 000000000000..32dd9de1d366
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_invalid_ratelimit=0
+`
+
+// Test rejection of data segments carrying excessively old ACKs
+
+0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1024) = 0
+
+// ---------------- Handshake ------------------- //
++0 < S 0:0(0) win 65535
++0 > S. 0:0(0) ack 1 <...>
++0 < . 1:1(0) ack 1 win 65535
++0 accept(3, ..., ...) = 4
+
+// Populate receive memory so the following segment can use
+// header prediction.
++0 < P. 1:501(500) ack 1 win 65535
++0 > . 1:1(0) ack 501
+
+// Send an in-sequence data segment carrying an excessively old ACK.
++0 < P. 501:1501(1000) ack 2794967397 win 65535
+
+// Challenge ACK; RCV.NXT must remain 501.
++0 > . 1:1(0) ack 501
-- 
2.43.0

