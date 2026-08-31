Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850EE3815E6
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210099; cv=none; b=VljdU9ZfqjVwuUEd0Oiadb1o/v2Ea7TOM8ZJjd7zRRr36WfmqndT2SjKtcov3iYgO8LcHhvU87gw/6trcOrf7zpjf7b+PeRgVWI9ViQDAIYQSX4nXeB/LBMor12Af+yVFQ+uUp8kk/Kkwzd+naWFBWfzQEwfPFTwF54LR7r2fO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210099; c=relaxed/simple;
	bh=0eTCPLGUMKlpiwgW5xNdX+fHOISCOT3c4nyXTCafW0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dttZflSlpy2ETNxK4kFpMjTWQxfP7h8/onLagvedNl55Obuh3RnxaVSXuohU3iWApTG9I6esv7TFQw6O2+ZxFB2R751/lVQEyPWp7Zi2l9n6Ju5NiRUMc/oLaQ1AUo06I3qJnpwBzRbFfOgKfEi/74gj2eEahy+hoWe1KjP1jvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiOY7Kvw; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiOY7Kvw"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ecf499af9so47962497b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210096; x=1788814896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpMLFP66XwStzGb+FjoQT89DvlrGxwIbqnFlE8RyomU=;
        b=YiOY7KvwDuTk9mgr1oGeiH3YmObjaCa15Np2rFrg0T5u+5i8morELQ2GwK8HrWt3Vr
         gTQtNeEqNB3B1P585RBlVGFHy+aYEQN41IWoGjBnVfJGnFkVl/8yHFpOIzqR8TfEW117
         5q4n1GSnoJlD6mYvF69rxsQQc3mKYSDXeht431fkD6OLPOcEKmXbNCCfsiaotghNsTrE
         ubE5ZERbIylV+FfbcYf6uVUqgH5sBjNjQzLZvfaDNbF3XuFtsc6m6zqc9/omGAzNY/vT
         +Cp1DQdfdcSxbF0GcDVZSha2WkgCadICYTNAY5aEoMwSYl5+83756Hm5rDMyOSPPSGWN
         1R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210096; x=1788814896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpMLFP66XwStzGb+FjoQT89DvlrGxwIbqnFlE8RyomU=;
        b=DaLzuynYXtCFLHkG2vIHoETDTtRhTbnkcaOf7l2zUMClfmRA7Oug+MzvSoQCsIMjpe
         Q1f5sKnN29lRFI98B93DG9R7KrCKAUrqHzKtFrIxQuSM00EiJTFWgGuLHfLyYbuFRwAp
         ep4Ohy8hn2cY21mMqd7fMH9uqSyM6Sirqm1zPI7QahbnrqgTi6B/zQDnk5TmA8ZJt5FI
         Am5o+xBR4M7VQggg5e0jfQFhhpmzZw7cInrThiUUd/f8wtvlMy2Ps46ZVR95ImarMrrH
         w9EZmwqVn1ln552jDQ5buT7Ji0wLjfflLMuLjb3E+Tjr+YKfjEBXUi9pLsX5wT8PmlI+
         VR7w==
X-Forwarded-Encrypted: i=1; AKwUvBx732kZAgeguIj/0E2lPUJ3k332Lm0Kcuw/oBMqfPZ5jOng7ItAu8pj9kAT0UM+9dB4G03k6JgZFcsHaTEDP38=@vger.kernel.org
X-Gm-Message-State: AFuF++lsleQwupLi52pW4QSGLOwcEyYpfb17ms1+xTOLUrFXbaO3MXbC
	TjFhabTx8BdmdWwyNqf7IxaBCpFZpD0oG8Dh3XJf4ocymRFObpQ1SOntly5luA==
X-Gm-Gg: AYBFou1ECDI5xcH2dEeEbr7RLfwJR7yY9ti/ZEy6I+SsI5gt3U98uptQxS0a7eCfPKy
	BVQWuPn2G5ESgwZ/W/3QjXPlAywLqfW6LbtV6GZsI/Q/qEvJVovyOeIfKsmnupGnAMDagVil+fR
	QyP2rOiNxD5fjMI/A/tzPuSXa09ZC4jjE1tgRslgXaMQhge9FW1lHudZiUxRPhcXhGDZk7j5MC5
	mcqfHLtXMjN84B4AMdtRGNiOxDmitS0KOOM/nRG9j0UsHsnmyQb1IViPmMNGpGN5GE/c1gXP4jL
	bVayidJoRK36F9/gDboYzxEGwFWjjzWyXMKwL7RVWxOGtqtlFxvUoCJvdkwyYW/6uLH5yKxoDnn
	XRnPMG3pnErqVcauS2ZxJOPY+z8+F1c9HOTu48iUJ3aI+jYvpY1wRmwHNrnfxoMkD9Wg196+AjA
	yzZzw3GBFAQ2CZoaO9O5zcLIB1ElMZUdiX9xu49hx5sbrZ1/M2o5+klmXEFSbYxPbcQ2I/EUWrS
	deLta3qCLtX0ESnPzQFSe974UZ0MVO8eEuJOJ/PRe/B2BTeXYa7/FdO3Un//6ax
X-Received: by 2002:a05:690c:60c1:b0:81e:7dfa:b799 with SMTP id 00721157ae682-85d6b179defmr101761427b3.24.1788210096102;
        Mon, 31 Aug 2026 14:01:36 -0700 (PDT)
Received: from willemb.c.googlers.com.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146f8sm60528687b3.29.2026.08.31.14.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:01:35 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next] selftests: net: csum: filter packets by source address and port
Date: Mon, 31 Aug 2026 17:01:12 -0400
Message-ID: <20260831210128.1359978-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

The receiver process uses a PF_PACKET socket to verify incoming packets
and test hardware checksum offload. While the socket filter matches the
protocol and destination port, packet verification did not validate the
packet source address or source port.

If background traffic arrives at the destination port from an unrelated
sender, the receiver attempts to verify it. During tests expecting an
invalid checksum (-E), any legitimate background packet with a valid
checksum causes the receiver to report a checksum error and fail the test.

Add source address and source port verification in recv_verify_packet_*:
Non-matching packets return -1 and are skipped.

Also
- add an inter-packet delay to avoid drops from bursts.
- remove a comment that is no longer correct.

Fixes: 91a7de85600d ("selftests/net: add csum offload test")
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 tools/testing/selftests/net/lib/csum.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/csum.c b/tools/testing/selftests/net/lib/csum.c
index e28884ce3ab3..139465054f85 100644
--- a/tools/testing/selftests/net/lib/csum.c
+++ b/tools/testing/selftests/net/lib/csum.c
@@ -2,8 +2,7 @@
 
 /* Test hardware checksum offload: Rx + Tx, IPv4 + IPv6, TCP + UDP.
  *
- * The test runs on two machines to exercise the NIC. For this reason it
- * is not integrated in kselftests.
+ * The test runs on two machines to exercise the NIC.
  *
  *     CMD=$((./csum -[46] -[tu] -S $SADDR -D $DADDR -[RT] -r 1 $EXTRA_ARGS))
  *
@@ -620,6 +619,9 @@ static int recv_verify_packet_tcp(void *th, int len)
 	if (len < sizeof(*tcph) || tcph->dest != htons(cfg_port_dst))
 		return -1;
 
+	if (tcph->source != htons(cfg_port_src))
+		return -1;
+
 	return recv_verify_csum(th, len, ntohs(tcph->source), tcph->check);
 }
 
@@ -647,6 +649,9 @@ static int recv_verify_packet_udp(void *th, int len)
 		return recv_verify_packet_udp_encap(udph + 1,
 						    len - sizeof(*udph));
 
+	if (!cfg_zero_sum && udph->source != htons(cfg_port_src))
+		return -1;
+
 	return recv_verify_csum(th, len, ntohs(udph->source), udph->check);
 }
 
@@ -659,6 +664,9 @@ static int recv_verify_packet_ipv4(void *nh, int len)
 	if (len < sizeof(*iph) || iph->protocol != proto)
 		return -1;
 
+	if (iph->saddr != cfg_saddr4.sin_addr.s_addr)
+		return -1;
+
 	ip_len = ntohs(iph->tot_len);
 	if (ip_len > len || ip_len < sizeof(*iph))
 		return -1;
@@ -680,6 +688,9 @@ static int recv_verify_packet_ipv6(void *nh, int len)
 	if (len < sizeof(*ip6h) || ip6h->nexthdr != proto)
 		return -1;
 
+	if (memcmp(&ip6h->saddr, &cfg_saddr6.sin6_addr, sizeof(ip6h->saddr)))
+		return -1;
+
 	payload_len = ntohs(ip6h->payload_len);
 	if (payload_len > len - sizeof(*ip6h))
 		return -1;
@@ -940,6 +951,9 @@ static void do_tx(void)
 			cfg_payload_len = rand() % MAX_PAYLOAD_LEN;
 			buf = build_packet(_buf, sizeof(_buf), &len);
 		}
+
+		/* avoid bursting */
+		usleep(20);
 	}
 
 	if (close(fd))
-- 
2.55.0.897.gb25b4bd76c-goog

