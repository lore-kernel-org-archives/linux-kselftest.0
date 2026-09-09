Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75244C51F
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940650; cv=none; b=c/kQ4LJer/wOketFH+vY44Y9fkwTmUH/tOlx86ZaY/2gyHrd1R6QTCC6rMbCeIDvb4cjpb4z8RX/hwloin7w16xlqOjJEXfcRrn1CCGuKBqwqjgfQlMVC/uE1J+15qDCFYPLapImt9XQzb+RYno/jn1VR+lRKtpMmnK0vZHa1+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940650; c=relaxed/simple;
	bh=PoJ6Q5M0DPUlQ0YysIg5TB4c61efy8lFCLIq+TrJz8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFYXNdwUQRuSruHqTSEUX8B3MWcSF9o9IhAf0cwVt/8kbOtbc0mideQ8LvuLo+6KJzU52YE3UXv5yisNCDD608D0ptb9FQvHb4956CSKtytavuIi1HckIAlxDpCHjql6GCoBwWIR/KLysUM+ADHA63htEcrA9VKMrvcqM2lqpOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il; spf=pass smtp.mailfrom=mail.huji.ac.il; dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b=Ge5EEjtK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.huji.ac.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.huji.ac.il header.i=@mail.huji.ac.il header.b="Ge5EEjtK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b93204449so2512235e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.huji.ac.il; s=mailhuji; t=1788940645; x=1789545445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbZ7q/pzMG2HFYHsDRloOW3kv1MN2rhYA4VNX+/OTZ4=;
        b=Ge5EEjtKm72cexlTaNOaNSB9SzZZ0Kleb2/o7EHbA11povM1L3CzcxGwm1LlhmxMPa
         PqGgVpTHbtDuVj8/LflufF+QG/1dljzME/lN7vOaoAfxC3kPc8tuJIjVxTMEoEhf676b
         GJtKdS5IstuQykgRqSEXRgVwLSc/vbCCQDA7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940645; x=1789545445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbZ7q/pzMG2HFYHsDRloOW3kv1MN2rhYA4VNX+/OTZ4=;
        b=p4LqyRTDzfa+mIH91TU39r//QMblhMVm7jT2UVa5IeVmH0+RvmqH/HBh6cgbSMa5pJ
         UVgef3s/AYbDPHCIXsaXabzNMtOzS8oDLjku2RAoKwTmw3XidyObgvTdOIi608EAS11P
         C23mWzOh44AQNBkS4jdSPwxIfmvd7WmzO7jNn2a4Rq64kF/lc/StqE/28lFY2oYRXM1/
         tP4gXmyYG0gSaatNTx1IJDRazdXYfPxjQ57cjGDIbtAs97fDDZBNhH2lXg5XN0HSI8Wo
         i1QLh1hMtDPy0U93hib7jidaDcMO1DYdvnttGu4pGGBAiuSN+DIdfY5GQp4rJsBZflpr
         ls8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrahUC5S2M/RduTFE4Zq50I9EwVzM7uF6YqK2y8IWrh3hwzoEny1Hinimr/t/tZpX7toYG2yPZTcf2jEAyjbU=@vger.kernel.org
X-Gm-Message-State: AFuF++kZfsFxljk0//GLD381OVOobQlfVMRIEdEsUOn/yGUrNf8XmWA1
	AGy/C0OliPyqm9Lf+zUMVko7SnkXIuP8wjISb/uRC44YqDCvd07f/WMU9XA7HjV5Jg==
X-Gm-Gg: AYBFou1iXFmRBBz2BlZmkfnjhcIdFfW10G2iR06IBj/aGWA4t9AnTSLBPU8q9xkzMle
	9hcXN0MrjmSYyFHwLj0jeeo0vgqb5kuIPpJI8YhO3XWVXh0KXUGfXZ0VY191gCeVF/xJDaLtDRJ
	lxb7daRWJVn3jxmfpa44sTeitqCee3otjpMkOADNMiYB2tbgc6Pd/vKln73ZecFFc9nNJY6vuTv
	5akTUFJjCeFAB3NXbGJSTBB5q/cgSfdQZkBhyLtRtNXY2eK5vxEMMKngtZkd5nf+VVD3wWAWJew
	/3LNSdDxyicSyjdZcn+Fx2AiaFT3pVPbk2X2LzMW5pj8S0eZHeL52uNe0VejuTHNjrkbHz335Ys
	1zcFLPjO92JO7gHCMNJCP6kRr7grn64h7pQXWen7h2dl/DifgRqDeDGqEfNqj3EpOWiVqAWUTmQ
	bNuy0BchPiCwBjwMGdMs9XCI6+zGfRddndDFbP8yryMVFh+HxiU/12TG3NU+81sUs6dS/p8ahS4
	qieuUIcL2cJ/RhDDy47MaKcNDne/unQAJ97
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr239043255e9.0.1788940645463;
        Wed, 09 Sep 2026 00:57:25 -0700 (PDT)
Received: from inbal-OptiPlex-Micro-7020.tailf3f5b8.ts.net ([2a06:c701:c272:d400::7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm45677255e9.3.2026.09.09.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:57:25 -0700 (PDT)
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
	Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Subject: [PATCH net v2 2/2] selftests: net: packetdrill: test exclusion of old ACK from TCP fast path
Date: Wed,  9 Sep 2026 10:56:44 +0300
Message-ID: <20260909075644.1408171-3-inbal.lipshtat@mail.huji.ac.il>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il>
References: <20260909075644.1408171-1-inbal.lipshtat@mail.huji.ac.il>
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
 .../tcp_rfc5961_reject-old-ack.pkt            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
new file mode 100644
index 000000000000..8e7229127670
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
@@ -0,0 +1,23 @@
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

