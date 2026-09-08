Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AA378833
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845226; cv=none; b=WEaomE5juYsSfbC537xLJ3SaFA9/reDNFEcOjyidLGFGYOldsQ0aW0Tpfcy/pbuYGfz4h5Dk8JiXx2GYovrbQUwG84dYkIxrq97bHJi3BaOql6KleSbcTgdfLkqS1KUVcDVFNmKZlfvd4dbt2f+wYwvdnJkJSimZ1EIeuR6Ipsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845226; c=relaxed/simple;
	bh=T4JVOAZANZ6C1YahNa+Jhd7yYk1njwqrdyNjpmXVS4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMsG9vxlGbATknodRuugbkvWch4ImqnujTA1mtXLOKQiPDqfWURLdB6XfAGJHOxWOei1wnhUyJE9NFNVogFw2pF3yoryvjNuh/IYIaqBYqy+J59K4Jt44mWK97Rz2J6XVT7SPUEW/HbYIeVgjcXeBWsFmlDveL3q13To+VZ+e/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifBrSWDj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifBrSWDj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so4549420a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845225; x=1789450025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeACi7rIC37eW3ZQypGb8w+9vS3x8jaLiLrfiFFFVvQ=;
        b=ifBrSWDj0nH/G01Kb0UDBd1fYJsUkb7MuEDYXpxSJiWHfGBaWfRxa+jV82Ght3yEAH
         6ek4uU1AbIrhXuS5FFzuhJqaob4D9aLXcc95PLQN4sjvU1MeZWy4Hl6h8aKk+Se2KUm/
         I09r5d1h0xaLYjYaIcPXsA85mfFoz9DDMiIQGjqCdWQUZrDAyTIPvVMiKnq/nYsZjCwD
         JrulUcW9nyHZfPtSYv44uXpOiykWyMFsGFQKnaV7Sv1HUqkeW7Wp0K+z5xLbweXafubm
         zXX1/CHWMXMqqsM+x5f4N1aX6V9jyKbfkXqNA4ZMPxPfXZjBFiviAyz9oaLkdz1ynjOj
         nWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845225; x=1789450025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeACi7rIC37eW3ZQypGb8w+9vS3x8jaLiLrfiFFFVvQ=;
        b=BM9NJCc6p31PqwZCY/+x5e1yM14ARHTMxGbKEabuFuNjsOHdb54EWlFaZSVUZSt6e2
         DgcCmZNTfPQewsTE+C/XrtA00K29BjTRF5vs8L8mQHROfT31QH9HYOSQF7HD63bJzhN3
         +UVjJRJKUyvRGU6LO/msYd4gx9dmPX5Xut3yWh+wXY7uaevNLquOsZ9AcynvOwT6FCIb
         2sfKdAyribSnWbh0OGTmRmM9mdwFGtLKiyRBxFQw8I7NMIUxREAVAz32hvVmrdJV3q4j
         rdx62D3qNqGC9e/Ta4b3Dbm13UKgwP/vxbEc92GiLQhpr2F5NNEMLfN5Si28qDw3UTb7
         0Ujg==
X-Forwarded-Encrypted: i=1; AKwUvBxwmP2OJLuWU6LMIm7mLVdSjs95INQjgWKkIgpz4xICIwo86TLf7luWeHN9ww4An/6EGJsvHYQ9A+CTiDDpQRw=@vger.kernel.org
X-Gm-Message-State: AFuF++ng9HUVoZ+6EuC4Kqt3SS/M0xuNcTMtxmgCHROWJ/aH6dYbgAe6
	yJPLe5+KN1GjZEYyIXIdY6hQ/gH4ci5Tw3MbBxWCwWq0eLsRPXfx2d5H
X-Gm-Gg: AYBFou0v8EdynH47Jw0m7gcq/RXN0WaNFAHqni0OxMwBd5BCYJSVlo4APrQUdOfPkVB
	qs8QZMeU/SigrIYu1U2iTKvFl3/QPG3FOc2XlVCiJq8ycu7XMwbkjLNPd10Qe/xpa2X4rmQc1AV
	Zqd3Z72DA+pIeZLDZVVuZOjnGyQgAda1lr3Bd6SxEkVGZfWcBuoM4HCmh1m2cHyjsIHRpt4CNfH
	aXGUHl0U5yE028BItAvUTTUbsBXEE+iuzoySQ4LvH8aNQZH7jUI+UFPn7te4DzBW4k+xjiy0IkG
	OsEZ8MNWLkgyXud3RAbiEvd7DjhMKbRCR3HiekvQIVMEhyvMo6LMlaqcIw/ea2Q+Z4f59el3zPD
	8wj4rlPU0AB4rNGxMu2Tn1ryG4by0SJoPNvANd5ptwkYwGU1laHneRWdZyMiMKwzgU2Olq0Pmqc
	0rC98/mgignMQsh6KWoRmnQr3yViyWNJCYwpBLtZXmhvyn4EO2quRF6AF1mKgUrdn2NMapvoIr5
	lgTV1NPW8o8/MBhKww/i5jD
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr43900792637.4.1788845224592;
        Mon, 07 Sep 2026 22:27:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 06/10] net: fddi: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:58 +0530
Message-ID: <20260908052602.27497-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/fddi/skfp/cfm.c     | 2 +-
 drivers/net/fddi/skfp/ecm.c     | 2 +-
 drivers/net/fddi/skfp/fplustm.c | 4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h | 2 +-
 drivers/net/fddi/skfp/h/sba.h   | 2 +-
 drivers/net/fddi/skfp/pcmplc.c  | 2 +-
 drivers/net/fddi/skfp/rmt.c     | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/fddi/skfp/cfm.c b/drivers/net/fddi/skfp/cfm.c
index 4eea3408034b..b722a195d831 100644
--- a/drivers/net/fddi/skfp/cfm.c
+++ b/drivers/net/fddi/skfp/cfm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- *	Hardware independent state machine implemantation
+ *	Hardware independent state machine implementation
  *	The following external SMT functions are referenced :
  *
  *		queue_event()
diff --git a/drivers/net/fddi/skfp/ecm.c b/drivers/net/fddi/skfp/ecm.c
index 2f5f5f26bb43..e418ab65cb61 100644
--- a/drivers/net/fddi/skfp/ecm.c
+++ b/drivers/net/fddi/skfp/ecm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/fplustm.c b/drivers/net/fddi/skfp/fplustm.c
index 036062376c06..0d4201345f9b 100644
--- a/drivers/net/fddi/skfp/fplustm.c
+++ b/drivers/net/fddi/skfp/fplustm.c
@@ -150,7 +150,7 @@ static u_long read_mdr(struct s_smc *smc, unsigned int addr)
 	CHECK_NPP() ;
 	MARR(addr) ;
 	outpw(FM_A(FM_CMDREG1),FM_IRMEMWO) ;
-	CHECK_NPP() ;	/* needed for PCI to prevent from timeing violations */
+	CHECK_NPP() ;	/* needed for PCI to prevent from timing violations */
 /*	p = MDRR() ; */	/* bad read values if the workaround */
 			/* smc->hw.mc_dummy = *((short volatile far *)(addr)))*/
 			/* is used */
@@ -572,7 +572,7 @@ Note	After any ring operational change the transmit complete
 	The operating system dependent module must enable
 	the transmit complete interrupt of a queue,
 		- when it queues the first frame,
-		  because of no transmit resources are beeing
+		  because of no transmit resources are being
 		  available and
 		- when it escapes from the function llc_restart_tx
 		  while some frames are still queued.
diff --git a/drivers/net/fddi/skfp/h/hwmtm.h b/drivers/net/fddi/skfp/h/hwmtm.h
index e97db826cdd4..0ab49cc0a8bd 100644
--- a/drivers/net/fddi/skfp/h/hwmtm.h
+++ b/drivers/net/fddi/skfp/h/hwmtm.h
@@ -113,7 +113,7 @@ struct hw_modul {
 	struct	s_mbuf_pool	mbuf_pool ;
 	struct	hwm_r	r ;
 
-	union s_fp_descr volatile *descr_p ; /* points to the desriptor area */
+	union s_fp_descr volatile *descr_p ; /* points to the descriptor area */
 
 	u_short pass_SMT ;		/* pass SMT frames */
 	u_short pass_NSA ;		/* pass all NSA frames */
diff --git a/drivers/net/fddi/skfp/h/sba.h b/drivers/net/fddi/skfp/h/sba.h
index f30301fcd022..7fe99c12e201 100644
--- a/drivers/net/fddi/skfp/h/sba.h
+++ b/drivers/net/fddi/skfp/h/sba.h
@@ -94,7 +94,7 @@ struct s_sba {
 	long		msg_mib_ov ;		/* Current Overhead for this Path*/
 	long		msg_category ;		/* Category of the Allocation */
 	u_long		msg_max_t_neg ;		/* longest T_Neg acceptable */
-	u_long		msg_min_seg_siz ;	/* minimum segement size */
+	u_long		msg_min_seg_siz ;	/* minimum segment size */
 	struct smt_header	*sm ;		/* points to the rec message */
 	struct fddi_addr	*msg_alloc_addr ;	/* Allocation Address */
 
diff --git a/drivers/net/fddi/skfp/pcmplc.c b/drivers/net/fddi/skfp/pcmplc.c
index 90e8df6d9a88..745285d4d6d2 100644
--- a/drivers/net/fddi/skfp/pcmplc.c
+++ b/drivers/net/fddi/skfp/pcmplc.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/rmt.c b/drivers/net/fddi/skfp/rmt.c
index 314623650a84..5708124f05d2 100644
--- a/drivers/net/fddi/skfp/rmt.c
+++ b/drivers/net/fddi/skfp/rmt.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
-- 
2.48.1

