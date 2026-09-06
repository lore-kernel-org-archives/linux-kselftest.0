Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B9333A6E2
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706623; cv=none; b=sztmuK+bUWLYDBRtm5OjM8V4GfZsOtxoGfoNVe8TKtiTz9v3pjWo6PkkVWXUG9uqniVtNeng4hnzanpZ4buJS9e/2Qvz4cGke9ThYScABrcYUfgmQskpfyKdhhuOfjyJBSzJ9wgrEYHvs7vaYnjfkshqgjiY7BgNU4W1/tMrD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706623; c=relaxed/simple;
	bh=aPY0/u2AGw8ZO0X96EHt2DkF+60pJD+nkEu+ftpS9ok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JP+KemQ7zJg8kPn2lPoTiwfrRc12KzhDtjwiLC7CWBGC862Yfc8/aT9SVxa6UpfAKOH1ZRcbp44eRFcD12WWNHi2t+RZn1Tk2huRGr5Et3Uxgv20es29tuZk5ecQi78QQIZ74gxida1JiDT6hT2mPTVUiX89dFW2JKZ4iSnWaBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=DuLwJ/VA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="DuLwJ/VA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2617701a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1788706620; x=1789311420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/U1N8oqUrXPlxgqRESYIGpkvBK8EXbenmMc2gn96fI0=;
        b=DuLwJ/VA9U3I4Qdu5YwOdisGqpu0FXrfzwzmyCWy/s9oE+By3YQ40ceSEUZ/Gok/Tj
         R1u8wqWzX598K8jadD87NryD2R/LakvAzmSwcqc+TfoI0xFz5s4iUUgsb4vjWq5pBqSe
         1VKoz7heLAxXiWBJxdL7fg/qCLaFrXlqzBGrIeOGYJsR92v7Db8ysmSLbI+xZrwb/jUa
         stwapJARgyKZpaKIXtE727QpiHKFdjMOmelcc8IibyYTSWlQtv1X8uLwMo7fSoaIdiaw
         BgZk7Jd6A2uCJu/gUXid6eqB00buj76rJc7cDFiS38AVcsX45t1eMsgKlff3XIYnims1
         e4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788706620; x=1789311420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/U1N8oqUrXPlxgqRESYIGpkvBK8EXbenmMc2gn96fI0=;
        b=Iku4OzZk+wMGCgELZCLTkkyfQsDuSUwt7d5g6fhWKV4nFB+T8Aa8mXhBeEN6gfmQQS
         0hMu+k0jzBMnrbwb3XYbk3iIdHnQHgl67UPP8Efh3syw4N8Mziu6g07p7UUzwViFGk2z
         QV25Uc7m1EyU2JG5HeJ4rTt9yELASuGTFvAyXxdUPzX0N2BzLZQG2lCyrZlbreKDejlw
         xZEk15m9gCap47QXtvrgixddA99MddVgb6ElYGUv3Ot14w6hLvZ/4zcv4+GLGaN4a0+U
         I8LnjpNaBzoMZkhSJPpuyIQ0nO8V60k8n0OqzAedKTbyjtuPtpvFtGTxSGP06GpJxu30
         8m4Q==
X-Gm-Message-State: AFuF++mdDgtuI2/4t07j1UTdrFgd5jYXT/gOdA45So722mdbYGR8y+Xz
	HGb3jikzSiFIkOnCsLELUYH0Ueh9PV8vBd4miKlguk9bU1xx4YT/8aL4XJ3z4K2K2RIBHiaTt1h
	lQodH4Bo=
X-Gm-Gg: AYBFou2PvDnQoXkMo8yKCS0a8VwAPPZVDIYZ6XcAYbRIv+2eCTT6degKeSZVXa7+Hu3
	pgt1b40mHLp+s53U/E7p6W1w4GK+otornVXkgoJsSR3qrSNmf/VriUwb8qZslUvaMtOHABMOkTF
	+hLI9/Qmsma9aX/T2so33GYqeX8X4tu2sxK197Jl+vQjl2wm9Q1M/WJwDPGkZsvEPQpvE9eQ2mM
	YIp9BdVgG+7eAN1GNDEW6o/wuJ4tqrA18j+x3ad59Z4vcLjU403vKTtNgqZASloI1G9MzL5DYuP
	s7Tz/yJAcq3MOGXS/KsjdDn4M1SEQtmp78lw51npNI+qq6l7aHhh/KCDkG/Ao453l2HXElqE2hQ
	6q0nrd92KvN36rswY0Pe74RNANnJgFblulLzvTb/doCsPeFwWThkY697IFwiwzawBBCoA3/x2/o
	8q14zm42czwMleVFNw4iij6IJXTeFzLBeDj8CVfolYk72q4g0019ra6ASkKps4/bOYI5TyqCzBU
	lTWId1klYCgl2M22skapI1+JHlqTDA6srvoCXnQPrvcbac=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr27806022a91.20.1788706619783;
        Sun, 06 Sep 2026 07:56:59 -0700 (PDT)
Received: from localhost.localdomain (111-240-146-201.dynamic-ip.hinet.net. [111.240.146.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm15199065a91.3.2026.09.06.07.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:56:58 -0700 (PDT)
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
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next] selftests: net: Add TCP payload verification to udpgso_bench_rx
Date: Sun,  6 Sep 2026 22:56:43 +0800
Message-Id: <20260906145643.219609-1-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
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

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.34.1

