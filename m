Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9622298987
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Feb 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770427821; cv=none; b=jFhrmfZ040skM61UjFmAzwGaIr5jdCIj75gedYQqSOky0mWuJHGLofN6c96HszphodDqKBYHp7fpqzgTLta7p6OU9/cONo1GTZZlU98OtDzb1WDhuSXBhqPbnsEckz8wCzHiKvV0S/yDk8gj14W7Pau+SPU0PhF4o0yE/9gNldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770427821; c=relaxed/simple;
	bh=A+ftBd2Jtc29Pgy/SA6btDqagDLkGK8wLmvgN28yyX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCyjm8SXyA/YcUkfGDW9fvQ3ipfk8yqn65t9VyVQd4MTTxMabOLVJKgjqOqfdm7t8T3PLW7k15LGKU76BuFHzzXDKcMPRmtVHcINEYjHm8/XV4jsu+b7+8O3V8R4YVv1GRHvUt2TmOVNFJqxVodyRGEuFypcf1qkI8UNULOVf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etfkEqN9; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etfkEqN9"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d148dd3421so496264a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 17:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770427820; x=1771032620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYNkIW0UP5hKW4DkRpPD0FYrX4D16Qtz0FKf0quRohI=;
        b=etfkEqN9XhIZXROyBZwH+SizgI6DKLVx94R/ldgfJT3lQjlDTgdYDMTSXMiHxEGAsV
         rsKl7bvvxChBuRC216JqWOrvUCLisIrggwuaGcYOkInhV+TdEeg19Jq8V4lM6yG3iuIQ
         C5fngSQyXovVmnIpaADbj55+oKmDJZMr202n12yJIBDf95ma5pxX5cxyPOEC4Xb0Fx4V
         +gbs2uYeEbh08d9BHiFf0+hujdtQ0+ldFu9XRNWf9WzPIIA4SMTz3U6FgqPlbOVx6YdW
         JOuNTzD8DdDjVzaWv0OoWrm7SCoVf0MCLCnHfzgQCNWG3Wfzl3wqcBPKh00/bAFIT88n
         pp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770427820; x=1771032620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYNkIW0UP5hKW4DkRpPD0FYrX4D16Qtz0FKf0quRohI=;
        b=KwxmeqGZy+nAeYvbacnSFqXOlzoDP3O9djb4Sb/AQPaP0ti7OlSkKBADXvE3anh4Pu
         CZitNuGB/RKihi7HJ3ZZeLS46WNbVQ54CwLt9HrvfamvlFVtZkoq5HRncQqa1pcy2tFd
         MwdMs91Aj1mBdt1Sd3DOBe81YSj6Tn6x5xY6fIVeL0NikNgVJjl3nuDbtw0nW+bWEG1C
         TOnc3hPin54wVxA4A0nE6wvlU7vtjDnzfgu/ythatyM1Qxov8qE7+NwmGys9fIJIaPPQ
         njkVnYP2q30g539P6OuAwphAEPI4WlC3zeS+R7hyQN8tl/OfNOlJHMbVUCVL3gNoIzY1
         OVrA==
X-Forwarded-Encrypted: i=1; AJvYcCVXE9T5aizfA9GTIlXdZPZslRn14nDLypdSQtcXuNqtT2AG28AOJzHwA3vDtGuk59l6eRnAp7gxsNHpYH7e4+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+IlKj7tY46l/eWYQQNmdfEde2e3HPTXDAeog1GP/mSFxEspF
	qw3aGcjKyGCC+LfGcRXbdaQ+3l3xNEsCFa9/54a+0t4W88fFXckKsO4QX9o/rw==
X-Gm-Gg: AZuq6aJ8IER4UvygjDlqphLoEZS4Bd1WY/IkN6+OLDRy+M22HFJr4XVETIOmWfYFKMe
	zxrQpHTXBQEAxMO4seeQTQmvQFCeVQAm+DKL3R8yEJE9y8apzb0i1DsxEX/MiAKXe/fPyNWMvae
	N44hQ6PaE+Caqi/fpuXO8wycQDkaTd0QSjtoazEvZs7W3xZGjzexS3jdc53UdaxjUVyzkqET+/h
	tswhLumYcWE8el3X4tJx6MK9AnafZPjxeAz/KiOUVNSRowI6AYlWFiHLtR+LpbWmBqh6BnwRrme
	FDMECdSqNjmFDQLvhWh44Uyn1xTAOk2VQWuH2DGpwygfc6vF+dns/Qb01DmVf2JAyWL5gpPo0K+
	pQYCBVzuyOuQ5uWuyrHuGU0LJXKLZxGdsH19gWvEDMHBmsB+iibPmFsxKUm3gq+FG0oeV4l8CqC
	UljSa9IN3zEsCkK/V1
X-Received: by 2002:a05:6830:2b0e:b0:7cf:c485:be43 with SMTP id 46e09a7af769-7d4643e7eddmr2341449a34.7.1770427819735;
        Fri, 06 Feb 2026 17:30:19 -0800 (PST)
Received: from localhost ([2a03:2880:12ff:4::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d46470da04sm2765988a34.7.2026.02.06.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 17:30:19 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Willem de Bruijn <willemb@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Gal Pressman <gal@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drivers: net: hw: Modify toeplitz.c to poll for packets
Date: Fri,  6 Feb 2026 17:30:18 -0800
Message-ID: <20260207013018.551347-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to this the receiver would sleep for the configured timeout,
then attempt to receive as many packets as possible. This would result
in a large burst of packets, and we don't necessarily need that many samples.

The tests now run faster.

Before

 ok 12 toeplitz.test.rps_udp_ipv6
 # Totals: pass:12 fail:0 xfail:0 xpass:0 skip:0 error:0

 real	0m54.792s
 user	0m12.486s
 sys	0m10.887s

After

 ok 12 toeplitz.test.rps_udp_ipv6
 # Totals: pass:12 fail:0 xfail:0 xpass:0 skip:0 error:0

 real	0m36.892s
 user	0m4.203s
 sys	0m8.314s

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
---
 .../selftests/drivers/net/hw/toeplitz.c       | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/toeplitz.c b/tools/testing/selftests/drivers/net/hw/toeplitz.c
index cd4bf58a44ee..315e353dafab 100644
--- a/tools/testing/selftests/drivers/net/hw/toeplitz.c
+++ b/tools/testing/selftests/drivers/net/hw/toeplitz.c
@@ -72,6 +72,8 @@
 
 #define RPS_MAX_CPUS 16UL	/* must be a power of 2 */
 
+#define MIN_PKT_SAMPLES 40 	/* minimum number of packets to receive */
+
 /* configuration options (cmdline arguments) */
 static uint16_t cfg_dport =	8000;
 static int cfg_family =		AF_INET6;
@@ -251,15 +253,30 @@ static bool recv_block(struct ring_state *ring)
 	return true;
 }
 
-/* simple test: sleep once unconditionally and then process all rings */
+/* simple test: process all rings until MIN_PKT_SAMPLES packets are received,
+ * or the test times out. */
 static void process_rings(void)
 {
+	struct timeval start, now;
+	bool pkts_found = true;
+	long elapsed_usec;
 	int i;
 
-	usleep(1000 * cfg_timeout_msec);
+	gettimeofday(&start, NULL);
 
-	for (i = 0; i < num_cpus; i++)
-		do {} while (recv_block(&rings[i]));
+	do {
+		if (!pkts_found)
+			usleep(100);
+
+		pkts_found = false;
+		for (i = 0; i < num_cpus; i++)
+			pkts_found |= recv_block(&rings[i]);
+
+		gettimeofday(&now, NULL);
+		elapsed_usec = (now.tv_sec - start.tv_sec) * 1000000 +
+			       (now.tv_usec - start.tv_usec);
+	} while (frames_received - frames_nohash < MIN_PKT_SAMPLES &&
+		 elapsed_usec < cfg_timeout_msec * 1000);
 
 	fprintf(stderr, "count: pass=%u nohash=%u fail=%u\n",
 		frames_received - frames_nohash - frames_error,
-- 
2.47.3

