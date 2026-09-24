Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4B4248DB
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 22:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289914; cv=none; b=l4m1HWx61a4Li7Eg9FEoZhXlhkqm0RHLLBZ3OZFKiuJdx19MFRePkhyyk9dafKGooBZjxdajVv8Tk7h+5IyIqCC9fKuCk99laZ8XdWaiaabrWmE4F92z/bCDyuOFpGEA/UZZMpK+f+sMnwNKP40gllPGg2R1LTbuPiGyy3BDCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289914; c=relaxed/simple;
	bh=NePuDN/GagRxxQzM24a1ChFIy2sF05vRYKBSqljR36E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vzt5axbPlAWqfLs10+xdkk46GdWVFbZSi2db4PpjOLRXjkKm/v+6T6zO8FcXefjUGEJzqN/LTaP2YtDJhZKyQxdULhlFZJtvaS2XqFcg/nclzM7jSpH1hv0ai26bpePPhApkXa4gyrdvoF+MZR2XbC61R1c3um5VJpekOXvSed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=Ij9MblkL; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="Ij9MblkL"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9123599f5e3so4208136d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790289910; x=1790894710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5LiObb8PczoN23fJheBRSuBwxtHznmlcKkljDuIqRU=;
        b=Ij9MblkLiLehosjBO28U2w5E3wkdmNDAoSeFMTcSQHhowUJdiXsvDVFlO2FDL9Ru51
         N8YNG5Xo1NezMdxF99HAxsrNb7XwrVt+4td6mJc4unAxygmp9YcAHZmTPW6F98G7yIC/
         NDhNqXmJDRAQufaVZSMZaxckpTOs0JIu9zTLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289910; x=1790894710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5LiObb8PczoN23fJheBRSuBwxtHznmlcKkljDuIqRU=;
        b=ppM649Q0Yw37tep96Ty91uOiCiyLR0BLcnlyypDdkL+IN3v2865Q8jBndYc5ueVISu
         uacUFE3rmY1yDuX3ZnCNPXLyRzyfhFQMUbSEK79xPLiiahnrjqviSDqo2yL/PrLGyoB6
         oJlqIO531nx31JjqSVsH+HDS8whNEXcPnerjVMb/LWsJ4i0S99wmJzq7t0Q8Eq0tp66i
         GdcshDIFlpmHh427PHxIvdRQ8y4/u7KrOWOk84+yz4fL67htdPY3r+sDzcSMeuwrCaN9
         kwLhsWh9mkS5btV9vTXv3PtAKhNVW0ioPUt4tyyAP02UTd318ox7ZXRJrGlkkXMhtIOj
         mrPQ==
X-Forwarded-Encrypted: i=1; AKwUvByTyPqLrXD8ELinEhi4z+G1TGCPTkmmWsr4VMS6G9bpHlIBmEE596BOVcZUoTi6gVCYhM5e0xAZcQPHyOt2tAs=@vger.kernel.org
X-Gm-Message-State: AFuF++nKJLDvXPr0h4T23TrQGntKBOemd47nuMS3XhCfABxf4JOBop6s
	bigszF1gqotwJtBhkANq5Ox1j/FZfx2N53dXR48p1X5RQ3w0YzjWQDZRrAbBoB2eE3E=
X-Gm-Gg: AYBFou10bqcMprXaK/EEvTQ0QhmGienZsJq8l6fkOpsyaAbZZpYukrHFDroouKWhI6p
	brC4YoQTFsH3x+niZg34CTxGqKwtSABfXg8wPLgHCAiGYGWC2LPZH7IYuK8W8WlEt/Q9Uojagty
	8A+X3MxvupA56srdYDEUWdGNvzOEIMcgJRpnWT0a7ywFiNfCm4GtkHH7ce4Cvq1bGHAAB2LGWfR
	nXkua8sA7mpLVPGn0mbGHNEa1j+FDj1eRDeVKvfN0ye0U4E8HS5+sqafErSIWQIuFguPFPi8eSW
	4Qc2Ch02b5w2ifry3qrLOhNpBVjVszxsS6RGP9Cax//qI6unx+lp1GaHmxqML3zhUCSENLiHej7
	oervZIjGHEm6Q+1/mbrVfk8ibHN0boVKCRpMtt5yh2Y55J8lDFsvtdlDuF8TLGJdhB/WKraaXgG
	eM9Z5Qz4Ng+RZ8aHE4e9OVmOwBaOOdZqRRWOpxTr9lJgtZQlTmEdkhIQXMYTkRYc7ckJA1hg2UX
	PP7Vp1O79Gh7XvUfaqXj+7wXciFVg/cnMAj9Tt9P9PfyA5AjKe+z2EIKuQTYFDnt9bpp+EhkII=
X-Received: by 2002:a05:6214:2c08:b0:912:5f4c:ad3b with SMTP id 6a1803df08f44-91432234280mr4821276d6.16.1790289910313;
        Thu, 24 Sep 2026 15:45:10 -0700 (PDT)
Received: from com-94485.corp.openai.org ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm3858566d6.28.2026.09.24.15.45.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 15:45:10 -0700 (PDT)
From: Jeff Jo <jeffjo@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: check timestamp echo after an old ACK
Date: Thu, 24 Sep 2026 15:44:59 -0700
Message-ID: <20260924224456.55690-6-jeffjo@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924224456.55690-4-jeffjo@openai.com>
References: <20260924224456.55690-4-jeffjo@openai.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test for a gap-filling packet whose acknowledgment has
become old. Linux first sends data to the peer. Deliver two peer data
packets out of order: the later packet acknowledges Linux's data, while
the delayed packet still carries the earlier acknowledgment.

Require the ACK that closes the receive gap to echo the delayed packet's
timestamp, 301000. Without the fix, Linux accepts the data but still echoes
the previously saved timestamp, 1000. Also check that the application can
read all 34 bytes.

Use a large jump in peer timestamps to represent the idle interval, with
no real wait, loss or retransmission. The test directly checks the outgoing
timestamp echo. It requires packetdrill's merged TSecr verification fix
(linked below); older tools incorrectly pass on an unfixed kernel.

Use the existing packetdrill selftest runner for IPv4, IPv6 and
IPv4-mapped IPv6.

Link: https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7cfab5b6d872
Assisted-by: LLM
Signed-off-by: Jeff Jo <jeffjo@openai.com>
---
 .../net/packetdrill/tcp_old_ack_ts.pkt        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
new file mode 100644
index 000000000000..f072e5e4c449
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+// An out-of-order segment advances SND.UNA. The gap filler still carries
+// its original, older ACK. The reply must echo the gap filler's timestamp.
+--tcp_ts_tick_usecs=1000
+
+`./defaults.sh`
+
+0.000 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0 bind(3, ..., ...) = 0
++0 listen(3, 1) = 0
+0.100 < S 0:0(0) win 20000 <mss 1000,sackOK,TS val 900 ecr 0>
++0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 900>
+0.200 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1000 ecr 100>
++0 accept(3, ..., ...) = 4
+0.300 write(4, ..., 17) = 17
++0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
+0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
++0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
+0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
++0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
++0 read(4, ..., 34) = 34
-- 
2.55.0

