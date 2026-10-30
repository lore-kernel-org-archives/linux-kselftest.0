Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355904;
	b=rbY87RtdPAjtTNDXcOxTLEp1EtT8kJ8VC/5gYj1INbmwQUujhzlj2q64LhC4XcHZLpW2
	 dwdEYJgwjpwcAHTAxlE6xIYLUNqqOKEOo2HwWSy19nYoN9Fz2C/RFDglDXN1Qt5DM+tja
	 iajXao7dfjUORk34lpPu1uwoMjWmHPgohzZd3/2DKU8ijYJR/K133BzAmyFHolD4ExBHa
	 doTlp7jeReAzHHF9BcaAa9PFIJJkO0TblxTSRWeZ6xiflMWf7sWTeJaXOYt9oMHgjJP3p
	 eyfJXz23sM2ygt+jAA04siEAgfvywbsRFyMUf+BW/e4T8oAMclVI4yAhQ5fPOo5rIvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
	b=q4ezaEoyCQ/FuJc0ezBEBcCeeSYmdvWZvNFUNRsUtjrNMKKqcfPMFhqs4UPy8p49O/UC
	 eJmVnZbClebFFaK4Aazns90VpLTD74KJODLBqdSVeOVIvvxJeisI5MkBuGEu2vP4gUPU5
	 31kFuZlTqmiObqYlwg+CUSby33gksRVGinWX2/Qu0o/5lh2QqO6mdYYN/OVUnncgn2nYx
	 WwqlRtIK4HiU92CzQkhSdIDAlUXUG8LG4ejFnxyy8tKXNlbX8P0yadM+XAW+iLamqT6bx
	 NEANDZO1CnXg8KNtQcVnQPkaYLZ7LIvrA7WtjazcMLfcI2pK2wnu/ehN0Qjd7lJo7gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH0pUumP;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF67606A336
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF67606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WH0pUumP
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8698995e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355902; x=1793960702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
        b=WH0pUumP62m2FpRN4el6/yxdfGNl6glm5dxHyT+PoslYBKWOtwcJZzUidXa1s9ElUq
         qn1+gtJ7p95+v3ARiB3mG6GmGabemikbRTCdSf1o1O4+HIOPPKJjggFWO+qISQ9gc3LR
         2d/yqhS2Kc+wtTOMgsKflInybDn50AEl2qGkstwRej3nPe/Tolo7I8opj7HH8t10966f
         qBAT0U8U1LWx80j5U58927Z68iCE39qwPzWmiONerj6wzT24q/w9E7mwq1zdWFQd5FVV
         z1skikCAaCh+iEXLa9Iz+0xv99Tx20Dg0J0NH+Z/T1cPSm4OEowrHSfTiM4z0CHIKU72
         wcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355902; x=1793960702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuBbZFfmsbv55VA2uPYkZzZXFL/PczYYekIANInBKXc=;
        b=K2dJTqic7X4zjPO0++gwGuW8GXjqttAVPqx1wBIJ2rqyMFN27+m1/1uwIVUFEMjMvA
         XY2xdgFqkOMhBM63H7sy80k7wecRPdlxQ6GdFMLgjLsckhtOhG83BIPMXa00R/Vlt8Vq
         HaDsP/809PCaSCBEKpHRQsqdzzKBTTU5GyikKIyvdxVnrOf2Qb3EGnyARdWS1E504E7f
         CDzzI4CA0JS+mAOL+PZzdQNuzdSQOOV8yJ9yCNHUhCyoYG0rz7Od/yvPH1IkCZzSQJAz
         fPloW4jOu27JLT/etYZcC58FJa4BkcYq9sTBo7ochn6HZQfC6PkQO2V1UA7VnWFkW7O6
         fbXw==
X-Forwarded-Encrypted: i=1; AKwUvBwolnrig9Nm/bPIwt+DqDz7In4Robq2MBrBdwQ8aqkjwqPudaPEBTKyTMzYtTy/hPhlcnv+jS3CZmslLlCyj6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXiIJRDz/6KQnCEE6rwTlWsPSntW8gzzniodqV9eJgRd9busW4
	Ikl3zzheU+iJwEtaHkuFTosJeeS+AGhW9OtCGwx7Wo+Upe3nEUdvSKuhhNht5gB4
X-Gm-Gg: AYBFou2P078qmrunzkZcqe4JbGPVWFyiin/4FBfS3E6g0baThQkl1HBM1kr5nNAVk0r
	TOOZbQx2yqxdcbPUsYtPKTH90zBo3yGUSm6+wE5nrgnZGba6RBD6PZb/tIi2to6HD3m3McPUhME
	BpnhWOL80P2itYUBrX9k7fH1yt4m1NkFpiSkSauIR9bXVsjJq34XGLtrb91d9BJK9lSwIRqMEGD
	7a9dqy6UtAPAJ1XNcgNmc1KbQZJmT5FHsOQKB2xD2inx+QUtozWfrkFFTuLA1uCh8koHYNZsTgH
	acTiFeeOYbui82nq8UMHXbV6d5ClIrxXvtTlRReZrvOlOul2JGjnjtrytmWV1u3YhbzMxQZE7s4
	qA+utOOSbGJsvxXiXJuHImYtbOgelPnXvYrtIDNRnvf9vS/EqJ/4u0A7/azQDZRBRSBhJNSHhRM
	ulgtlXf6rRPwhoJzCmqI1ZL7+2btt5TxfFHd2w0BYD1PyCM+CoxgZKSehBp7CUikVb7PgBILgjO
	d3fq5glpH0KKc4ZXJkZFwI82WLaVqDuRngCFkFgNKIvhI3IByWn0/pmZb+26RxZQ9Cc1Va3NyrC
	g7sDQ7u7MYw/1ZT9yNFIWvjYsqS1Hw/gmPn/GUn/uoPuACivZICpFQ==
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr39549955e9.0.1793355902258;
        Fri, 30 Oct 2026 03:25:02 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm143295135e9.11.2026.10.30.03.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:25:02 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org,
	Dwi Siswanto <me@dw1.io>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] selftests/landlock: Test that layering does not break refer
Date: Fri, 30 Oct 2026 11:24:09 +0100
Message-ID: <20261030102411.12985-3-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030102411.12985-1-gnoack3000@gmail.com>
References: <20261030102411.12985-1-gnoack3000@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Regression test to exercise that layered Landlock domains do not
accidentally deny the LANDLOCK_ACCESS_FS_REFER access right.  This
used to be the case when layering a non-filesystem ruleset with a
filesystem-enforcing ruleset.  In that case, REFER operations that
would have been allowed for the individual rulesets would get denied
when layering the same rulesets.

Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 6e979cef884d..c319bcea1437 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2619,6 +2619,45 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
 				layer_dir_s1d1_refer);
 }
 
+/*
+ * Regression test for layered domains: The two enforced Landlock layers both do
+ * not restrict the tested "refer" operations on their own, so they should also
+ * not restrict them when they are layered.
+ */
+static void test_layering_does_not_break_refer(
+	struct __test_metadata *const _metadata,
+	const struct landlock_ruleset_attr *const non_fs_attr)
+{
+	ASSERT_EQ(0, unlink(file1_s1d2));
+
+	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER, layer_dir_s1d1_refer);
+
+	drop_access_rights(_metadata, non_fs_attr);
+
+	EXPECT_EQ(0, test_rename(file1_s1d1, file1_s1d2));
+	EXPECT_EQ(0, test_rename(file1_s1d2, file1_s1d1));
+	EXPECT_EQ(0, test_exchange(file2_s1d1, file2_s1d2));
+	EXPECT_EQ(0, test_exchange(file2_s1d2, file2_s1d1));
+}
+
+TEST_F_FORK(layout1, layering_with_net_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
+TEST_F_FORK(layout1, layering_with_scoped_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.scoped = LANDLOCK_SCOPE_SIGNAL,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
 /*
  * Tests walking through a denied root mount.
  */
-- 
2.56.0

