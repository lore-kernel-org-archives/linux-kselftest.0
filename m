Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02893E6388
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919715; cv=none; b=MArz8Q9z70S4rOniyuPqHyDLJzHdetKLrxHZ0aUbGUV8akALLWFdEzeR7xfbv/iMlh8jf1TDuzbRH83ax3m+10U1NDj48SjxaluMyA0nVpP7UJGVLmyZAblgmYEfJN9FdGQKGSfNyAs6L/tRLdKVnhKdGgxpIDQ6kxFFebv6jZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919715; c=relaxed/simple;
	bh=w+QsBT+5pcbBe5xVs0oaWXhZ1MdasOi3IXWJ4w5Ext4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeYjV572jdUJekmN6vssT35/G5g+gQ2TTeGGx2J4NVKQEXnymZRi5upGNVUc96jfMo64nevsqPHgMv7WtjvuvKkV15wotJ+cgMzSaKlbuLKZsZpz1d+xvpN2hVQKrob/Fng/hpzj78uurTBScRACEoSMRrFnGvl7tt3E1CfJdWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V7it2GiB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V7it2GiB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so3509580f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919710; x=1778524510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJ2KT7kR4JMpZSd6AGblTMphpgunFcNpBlqPqv+V9cY=;
        b=V7it2GiBs99GyLDTfPFEg4NeefHGSIKV75b4rWUr3HFdZkLO+d8DrqhZjmVWhHk+kp
         4d2QTpoatOToPf+/9TZLvtuPjp3ECOOT9nQyJ9DI/h7EYeCho9sG9UCeNP7cnWo0ZNmU
         CnH9zoRni7M/xSryskKrozi9zGZtdAKJ2REEWrJiBKpbUGCLDFo5E9rFat9QRgk5FzPe
         nVl9Gi/dOtDQSRxesH9dKarBCEiefnPQoQHAiD4a6zKwlSxCXTd/GXp0K5IUe9GEYaAk
         G1xB9r5k3qXWn1eaLMOSVVLsQ2WCh7splibrbZUUJGrqvHqC7r3LWyPtPxqnQfyWQax6
         OGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919710; x=1778524510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJ2KT7kR4JMpZSd6AGblTMphpgunFcNpBlqPqv+V9cY=;
        b=c0TTmanyuGkB7myI0LItNrDzTPtBlsDufSC3+0HGU7WMzyexrhx4j8zXPNEHZVibsF
         wtXKIiGYu6ac93Vh8MNFOzsFrz40QUvfBqBi+U5AqOSTcioRUJj818ni2cMxWuGFEXnA
         29tnAMMmEM5OA2WJZy4CUjNGaPEB6PRmo9+C13MYzz+ftJC7rJnAax2AHm3dT67RUW1h
         OcJr/VVrcUuUR0J21PZd/9u4D2sZkMfn5qCDkTJ+caubaXpVFC+fGcEuz2vGB+/lrUxT
         ej8ZBM1WZ0KyBAV2RKHWzlNeP1n/WXSs+h+yZhNkoRGRK34iOEOX4FbaS3EDGMG+pv4s
         wNbw==
X-Forwarded-Encrypted: i=1; AFNElJ9j5Hke0Vj+x41UY07RMQXEY3BUv2xGEXd3HJVuMhyaUPg3QadSlfDFr6oARHA075/EG+lTGd9k7YTtsLe3fN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jYfC00beLMSx2LfBBixKrwb67QPv8c1viNmYPP/Qojj2OYDI
	rx7MP/PxzS/Q6fmlR+CDtyD1I0ONlW3Xu86dLP8/FDVmnTF//BH9TWHVs9/BPD9r+Mw=
X-Gm-Gg: AeBDiesV5K9HLCoTnGRxlVqaaXuFq/OdkBtW6YQB70b44DcA+FILGTQqIkAVczSaNGp
	Q3D+bCoYQRmqSUmyZHLw+IutGq4S/NJ179S9+4eBDI3/uzv3IZ6jMLRMSJ1zS6hkQ3LyDGJS0S/
	TYvRQK2JSzHd0bWeIvaHyQ1bblqGN73+yqAlfKOs7xI6qJcVD/YwwZPDY1bzK3xuT2OJIlnM0bK
	iWbrurO0LH4ohdw88rAQweV7XSi+4OYr2Ikn+O3l3QuXMqdkTSo7wYCo0/llo2pZTx5TjGCImAC
	yTOxQXJe29xF7rqwpFO2B69IiP5eXDhz1a+JCz684f1eJonAjfhkfwmMZ8piFdZo3nPf3ARZJxw
	t0ZRgtFQ5g9rnMAfvHZyJpby1+5cM4e26/Gu6INN9rII6HSsfeIfuZJKwyOmw56x5edcldVUx7C
	qG/azgLVPBR20znV4jh3zrKML30Lc9V80Rvg==
X-Received: by 2002:a05:6000:2410:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-44bb301c729mr17180781f8f.5.1777919710232;
        Mon, 04 May 2026 11:35:10 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:09 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 04 May 2026 15:34:43 -0300
Subject: [PATCH v5 2/6] selftests: livepatch: Replace true/false module
 parameter by y/n
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-lp-tests-old-fixes-v5-2-0be26d94ab9a@suse.com>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=2032;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=w+QsBT+5pcbBe5xVs0oaWXhZ1MdasOi3IXWJ4w5Ext4=;
 b=xVdv9+L5/kvmjiEbk0rJPyxV/31YQ4/7jB3XPtAOW4kkggtg8rTjFI1oSkIe5lwcMkJgwG2R9
 sCT5FVtenXMBIjpopKjX6gWCLIgfRMnUYKfuvAjwNxxiqzpYOSqmR3H
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels don't support true/false for boolean module parameters
because they lack commit 0d6ea3ac94ca
("lib/kstrtox.c: add "false"/"true" support to kstrtobool()"). Replace
true/false by y/n so the test module can be loaded on older kernels.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-kprobe.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-kprobe.sh b/tools/testing/selftests/livepatch/test-kprobe.sh
index b67dfad03d97..7ced4082cff3 100755
--- a/tools/testing/selftests/livepatch/test-kprobe.sh
+++ b/tools/testing/selftests/livepatch/test-kprobe.sh
@@ -20,11 +20,11 @@ start_test "livepatch interaction with kprobed function with post_handler"
 
 echo 1 > "$SYSFS_KPROBES_DIR/enabled"
 
-load_mod $MOD_KPROBE has_post_handler=true
+load_mod $MOD_KPROBE has_post_handler=y
 load_failing_mod $MOD_LIVEPATCH
 unload_mod $MOD_KPROBE
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=true
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=y
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition
@@ -39,14 +39,14 @@ insmod: ERROR: could not insert module test_modules/$MOD_LIVEPATCH.ko: Device or
 
 start_test "livepatch interaction with kprobed function without post_handler"
 
-load_mod $MOD_KPROBE has_post_handler=false
+load_mod $MOD_KPROBE has_post_handler=n
 load_lp $MOD_LIVEPATCH
 
 unload_mod $MOD_KPROBE
 disable_lp $MOD_LIVEPATCH
 unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=false
+check_result "% insmod test_modules/test_klp_kprobe.ko has_post_handler=n
 % insmod test_modules/$MOD_LIVEPATCH.ko
 livepatch: enabling patch '$MOD_LIVEPATCH'
 livepatch: '$MOD_LIVEPATCH': initializing patching transition

-- 
2.54.0

