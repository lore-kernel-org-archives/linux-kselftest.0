Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B813368B9
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049083; cv=none; b=qN9kqVliVgWhFiTXN9B/zn3Z5IECaPaMU9OASYqc/QABM4SmwT40y5kGWst19r5FVV/0r4IBdsiYh6V/HwxVfJp5ZS4ylXM5YsVcIf7M/5aZyORVOyVQd0p34/Zeb9Zoa2DCCNXLy09yTIqM1c0+zidvsHbRhyWO3NyExtrxzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049083; c=relaxed/simple;
	bh=rF8chEsRLAyFifMie09a09vdRaUnkgbDDLWk879DYiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nCwu0nW1Ctbu5VLNA62kkceKK1NMRsWyHw/sRifvFr3sZZxe9Oet7lhF1fISU0zsgOaGfauTK4JqymHQXTNkMtHm3v3Is5zwGKv9lHe+nkAQFFFSiu8ZY9VFxGekIn5W9AK3y9a9hh/1P4bM9AInpuRccjdqG8H4Zoym37hXhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMiON9K4; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMiON9K4"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso10886030eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773049082; x=1773653882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMY5TmeO/snHhjB5FHAsBzxAbIw3WrFDM3Ti8e3EvkM=;
        b=JMiON9K4nL5/JIvknlBpH58eM0ZHiFkMvAueET0Rt93Sr1E7t9/AJZqKQP+UQAtXeQ
         +lBTbwDa2haRkwvWEdcvUg/2g6GnAuQSutH/IGOf+T8hQ/deFdYRmXNASM0OKJZvu7Kw
         p3Dfz/K38p27fQ9b8yeb2L82KtJyPlB+qdxwqGQRbewCltTAHYEXLH7/0DPKcdP8Q3F+
         skZrZ2Vk46Wg4qFtrtVlNGu4He7ZIy39STYdz/XE3JP95VVZa7K/+8rVmgmK8PsSY/sd
         n90xCz/SsXV+Tpr1g6uMIDXUXdp9PtBg4VWxSBuzl4RpHbJeSyPYdnYFsrkgHmykhXd9
         SSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049082; x=1773653882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMY5TmeO/snHhjB5FHAsBzxAbIw3WrFDM3Ti8e3EvkM=;
        b=PXXC/Nm2e9DyVBNhoKy8gSp7JLreYfZoQm+Xz3ghcPE5pOvhBee1+CLxnLsncV7DGS
         RP0DKuY79/3NUBHzEAhqeKyTe0tBTl1dSFCfOi+VCee3d3wecu4CIXOsvIGQ8dUuaQXS
         g36P4OPwDd4QF2s028tGf4PGaCeqnQm6MPfpOCdZiJSJL5sUAnpDtKPi6Y2XOT2x2Ynp
         xpa3sEnqmTI1ArCEVkrn+tIDbTScvtGIFpSSJcNUZZOxj9zR0XOcdjg3l65JYdEWIGJb
         j2xlebhhcNOu3KLuRJ+9k5foLtxTw3qHQiALQy6zh0iUCcfoyey9+DYRJirBf7cpBvU+
         9KxA==
X-Gm-Message-State: AOJu0YwsRzmBVf6mDxcttxg/Zv9QlnTmvROxxSPZdY/dn9KMrPruxPvl
	O4nDz78TE2YDBcIyenSht6vTiI9AsNGTBU/IsY90XaOq/02awYF3Orf3
X-Gm-Gg: ATEYQzwaoglsuJvWTlwNa2t0j9ur3IiTAwrscIaQF67v4GqE0NMPnWuYLGdwKmCC45S
	7D9C/zwqOOem256WjcDvrBAOu0fUnvU/U8QACmIGyMlbQ3d7BdcRXr+ykTvPbwyBhg+Iokcrg0e
	ZLq4PoD5HSBkebHBLR8Fph4uRYUt2XePuuIfNpBlmGsrnfzsKJozVqETw0+RJ/w1VtQA0rdVBsi
	QGJjMZfPJ5wc7O6FfN+2c0oXbwZ/fQsG64fA/qZnnCZ7AC+TimJVWmb6jyVjnPp6imF1/UuBtVg
	k2kmGtnpP4fuqEJDFgq2kHQ57R3vQJOhC3zBXr+hBW9Eggbbg9jq7bkWzlw2lRiWqGsjtyo9nyZ
	LUU1I7TLNH8RUg+2VHb27ZJPJlyJZSKAGiSx0mvmgsFtlgPNOTX60s7NjRv743AkfqptUdijnaO
	aJAyne75dXEtHf5TzV0OGZJLuWKmEVwOv6eWcQBldVfo+846zjlqnqQKZzuxZV62PGypupUNSxt
	I+R3ZSufVc+klzs4J389NIAwL8=
X-Received: by 2002:a05:7022:629f:b0:128:cf80:deea with SMTP id a92af1059eb24-128cf80e01fmr2251526c88.1.1773049081592;
        Mon, 09 Mar 2026 02:38:01 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128d989cd36sm2095710c88.1.2026.03.09.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:38:01 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kees@kernel.org,
	thomas@t-8ch.de,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/harness: harness-selftest: cover XFAIL_ADD ctor ordering
Date: Mon,  9 Mar 2026 17:37:52 +0800
Message-ID: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a fixture-based test with a single variant and mark it with
XFAIL_ADD(). The test intentionally fails and is expected to be
accounted as XFAIL, covering the constructor ordering dependency
between TEST_F() registration and XFAIL_ADD() registration.

Suggested-by: Thomas Weißschuh <thomas@t-8ch.de>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../kselftest_harness/harness-selftest.c      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.c b/tools/testing/selftests/kselftest_harness/harness-selftest.c
index 7820bb5d0e6d..9920ef7e4385 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.c
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.c
@@ -118,6 +118,29 @@ TEST_F(fixture_setup_failure, pass) {
 	TH_LOG("after");
 }
 
+FIXTURE(xfail_ctor_ordering) {
+};
+
+FIXTURE_SETUP(xfail_ctor_ordering) {
+}
+
+FIXTURE_TEARDOWN(xfail_ctor_ordering) {
+}
+
+FIXTURE_VARIANT(xfail_ctor_ordering) {
+	int dummy;
+};
+
+FIXTURE_VARIANT_ADD(xfail_ctor_ordering, only) {
+	.dummy = 0,
+};
+
+TEST_F(xfail_ctor_ordering, expected_fail) {
+	ASSERT_EQ(1, 0);
+}
+
+XFAIL_ADD(xfail_ctor_ordering, only, expected_fail);
+
 int main(int argc, char **argv)
 {
 	/*

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

