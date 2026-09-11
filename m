Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE294A013F
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142825; cv=none; b=FTPDue9g7OA8vFJS/XX9j4HuPuvB1zKjvV9hNbT7iTxJ8Hk3/oeP8Dr9OxFkesiRcWnUFccrf4xPR4hYi0GOtx8tZyhc74aK8try2pHZXIqDz233tOTmEqnjkN3g0tVs2vl0HQhQGpaaqaswsG7Npob4WoZAnWDePzd7lwFzSbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142825; c=relaxed/simple;
	bh=a73nlWUpFLqK5BIq+RCvdpji6ixUwx/paZfTWdzUUB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/+O8pVi2X5I5YGl8BTA+CabRGHFR/gx9Quw0DkgXmk1oR/RAaVQoCcAj3YkrEAcOkVWubcHiRonJpdqKsl0pM1zpNZgOiWqOs0TPmbNV8LxI0YmHNYO25nEHL5ykkdJQFOs+KVj11dNJ9ySSzkIt00FtXoKquNcYRj5UOD57LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=R3WD5xj+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="R3WD5xj+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dcff8f44f2so14863965ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789142822; x=1789747622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=R3WD5xj+NEJWhpkZHQuer4e4w9OO+aCtG4OkcHJ3mY8kawD+83vgD5XI3TzfTrye4N
         Gvfmne8fHr9TurUYFVzHceEB/3tY5o6NDH39kPalvFzwd+q6x9LZzeOtrxP7fmPruQKK
         t7yef9P16tXKv9MttNpOFmra9L2AYeorMnFnVkX/bc71/hozRMM+kG+9/n8eZsQt/QKO
         4BCL9bciwRItZftUQMI3Sr+lAklT8gT4QoUwT2vgFnVRumuRRNeb5NVnOx2doApvm6A2
         o7/NINpqpTuWki5MXhzgFaQl1adoR5UrLdNfPc/ZzveGQ49Evi3a9uKOCi3HzGp2s9nh
         4D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142822; x=1789747622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2pCUaRthzuM/aWjTr8lb/B8fTUBfn+Ec5IEGb7Sxaw=;
        b=RRCxH8XP87Av1gkqmN8akgy6PxQFvUG7HskI4wwIyEAsiG63Ju0HZxKqSwY9zQIumQ
         +l1g4gxVh0kpOqUbqS+7pwFFA9/CiVsDVy6ub9E0rmFZPOX7l4rl4G60UEcpF+KH9h/N
         SlwAOOhkteDp5/KMoMFLdtsPAuuoiDiK8aIrHgogVmkq9CcDVFiqtARhlKvRcikXgRMI
         yQYDmrJpCAxCPHfbcg+r8g8/iFanqCkg/MtcSrWmfnGkzZgYp0S/FADp1wKmMV198HTg
         EORdG8m+Od0IK+hG0vUlM7mkMA1XvKWAeb9prlo5rKWhPzbbKMJaf8aViCMdlh31z3rn
         n9Ww==
X-Gm-Message-State: AFuF++mpDWx90eXB9Tpf0fJVQDUrcStHa0b4LNoZG8rVL+h17AsXaAbs
	ujxnElJsPBCXCPXJQSaphNo0H57Ogi2CjHuNPVa5CtQNryUa4Ku/sibjc9csMKzi2ls=
X-Gm-Gg: AYBFou06mrFs5CzU5K6GcKlqKJDdlv6RGshPgkEojEq+YmTnvE9G8qNh+8KWEHZnzsu
	3gaW2pkMbom+F9L+z9mTVUvYIMmgufKYOK6YpwaE1R1/LV471kHCmmV5UHOzg5hFuBao4+lpZIp
	ognFy1tpBeXmRvJ2JaKMrmSMXTZm2ftFMxbUn0tbTs3cpb5aMp26JsZ0zvGwUwFel636TPFXN+M
	ixDsltq5rVypsTODtTt/qnestWBDRu1oIE4xVqh5kvPxIYSuWsH8fl7aPeCAGgRsWwwT5hVZbYQ
	r6FsUYWu05AwQXOkzxObDALb0nhI4hco0cnbpSqz5fCPwkxYhTlRl+IsM/mOc7+b3eJzT5zSseX
	WZZga+B7+MQ67lzwC6cvFpAeTaT5somF0CY2He8DksNnG08rH0mZQTn89bxTMlDtjiiPjPgE29A
	aKI2JZUmgMrjHPecss//QrrNMJ7ccziWQwQ4zHw4O60LfkpfIxo1GVI0Fth5IHtTNvZbn/JLXZU
	h7lOLBqNRcZAVb06Xbx2fP8TirtnCvZKFoKnZhcPOs+wdDy+aTwmt3e0jk=
X-Received: by 2002:a17:902:d484:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2dd2a350491mr83902715ad.17.1789142822209;
        Fri, 11 Sep 2026 09:07:02 -0700 (PDT)
Received: from localhost.localdomain (111-240-145-155.dynamic-ip.hinet.net. [111.240.145.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13883055ad.56.2026.09.11.09.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:07:01 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v2 1/2] selftests: net: Add TCP payload verification to udpgso_bench_rx
Date: Sat, 12 Sep 2026 00:06:48 +0800
Message-Id: <20260911160649.51863-2-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
References: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udpgso_bench_rx supports UDP payload verification but rejects the
combination of TCP and verification mode. Its TCP receive path discards
the payload, so it cannot check the data generated by udpgso_bench_tx.

Read the TCP payload into a buffer when verification is requested
and check it against the transmitter's repeating alphabetic
pattern. Preserve the verification position across recv() calls
because TCP does not preserve send boundaries. Restart the pattern
at the payload length supplied with -l, matching the transmitter's
pattern restart on each message.

Require a nonzero -l value for TCP verification and retain the existing
discard path when verification is disabled.

Signed-off-by: shuo huang <f64116045@gs.ncku.edu.tw>
Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/net/udpgso_bench_rx.c | 51 +++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/udpgso_bench_rx.c b/tools/testing/selftests/net/udpgso_bench_rx.c
index 1cbadd267..5270a46d2 100644
--- a/tools/testing/selftests/net/udpgso_bench_rx.c
+++ b/tools/testing/selftests/net/udpgso_bench_rx.c
@@ -89,6 +89,11 @@ static unsigned long gettimeofday_ms(void)
 	return (tv.tv_sec * 1000) + (tv.tv_usec / 1000);
 }
 
+static char expected_char(unsigned int off)
+{
+	return 'a' + (off % 26);
+}
+
 static void do_poll(int fd, int timeout_ms)
 {
 	struct pollfd pfd;
@@ -161,14 +166,44 @@ static int do_socket(bool do_tcp)
 	return fd;
 }
 
+static char sanitized_char(char val)
+{
+	return (val >= 'a' && val <= 'z') ? val : '.';
+}
+
+static void do_verify_tcp(const char *data, int len)
+{
+	static unsigned int stream_off;
+	int i;
+
+	for (i = 0; i < len; i++) {
+		char expected = expected_char(stream_off);
+
+		if (data[i] != expected)
+			error(1, 0,
+			      "data[%d]: stream offset %u, %c(%hhu) != %c(%hhu)\n",
+			      i, stream_off,
+			      sanitized_char(data[i]), data[i],
+			      expected, expected);
+
+		stream_off++;
+		if (stream_off == cfg_expected_pkt_len)
+			stream_off = 0;
+	}
+}
+
 /* Flush all outstanding bytes for the tcp receive queue */
 static void do_flush_tcp(int fd)
 {
+	static char rbuf[ETH_MAX_MTU];
 	int ret;
 
 	while (true) {
-		/* MSG_TRUNC flushes up to len bytes */
-		ret = recv(fd, NULL, 1 << 21, MSG_TRUNC | MSG_DONTWAIT);
+		if (cfg_verify)
+			ret = recv(fd, rbuf, sizeof(rbuf), MSG_DONTWAIT);
+		else
+			/* MSG_TRUNC flushes up to len bytes */
+			ret = recv(fd, NULL, 1 << 21, MSG_TRUNC | MSG_DONTWAIT);
 		if (ret == -1 && errno == EAGAIN)
 			return;
 		if (ret == -1)
@@ -178,17 +213,15 @@ static void do_flush_tcp(int fd)
 			exit(0);
 		}
 
+		if (cfg_verify)
+			do_verify_tcp(rbuf, ret);
+
 		packets++;
 		bytes += ret;
 	}
 
 }
 
-static char sanitized_char(char val)
-{
-	return (val >= 'a' && val <= 'z') ? val : '.';
-}
-
 static void do_verify_udp(const char *data, int len)
 {
 	char cur = data[0];
@@ -347,8 +380,8 @@ static void parse_opts(int argc, char **argv)
 	if (optind != argc)
 		usage(argv[0]);
 
-	if (cfg_tcp && cfg_verify)
-		error(1, 0, "TODO: implement verify mode for tcp");
+	if (cfg_tcp && cfg_verify && !cfg_expected_pkt_len)
+		error(1, 0, "tcp verify mode requires -l");
 }
 
 static void do_recv(void)
-- 
2.34.1
