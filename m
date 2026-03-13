Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E1381B11
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435544; cv=none; b=ZJfSs5ILLcZqX/GtL54vJGUz0gUlNUzhhuWEXFSNmSpcWO+CTiTghinnWcJlRZ94Er60c9BU3BxlWyooQrPX3AnDuJbYbxTzH6b/dkWwhrkBPgKsBttiO/Myn9FHNLPP5EsNDaT0gUnPYMu4G/TQzTOhkDFT1pBxIY0yJ0H11t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435544; c=relaxed/simple;
	bh=VRVN7RkiGrgm69aDuMpcOshBDCo1eHbzdD2OnFzwxC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4eLNrNne9RB7uhODm729u5qsadTZ7/b2+azfYLJ3g37PU29FQqMYqFmq56xA5Uzr+0sLlmcm8HO8mNtiuMxg4BxkE/AWFM6omwHr83FfxgIeHAdy8wvsM1VfbdHzlMObg53++wSkv8A5vb87tYvCVcb89J/u8JVBiotNyUuGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xg/259g9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xg/259g9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so21248395e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435538; x=1774040338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSXSOnbGFJdo6hwFszubEP6hGZ4DJRtieMzbVIvPjZM=;
        b=Xg/259g9Ew2Fi/sRw8BaWvyPSe4FmFyRaDqWQ7GNS5i9uoS2bPqInTy9CAT75DnKX1
         4pDzT9b8oo4UskjRuJkORsGlkQNsQ+0N/ZHBcpT6bJaqoCIIqXG+IAWBotGKp/UQJlQg
         leXUq1leggs5NjmrO5Jy9T1bBUPpj92MIi7VNcH0TZIMGdrQ+z9GJTGcda0sW4C+IIDE
         ihRZWM0cY7KMVhqOz/iZXTB1szOY+MOvclwDnnAo1LyvYBmTfwdnLpw9sHFb/zXCRrpb
         MmBXUFyNcoHKSQBrZRsjMCRGBbydJ7hvMjFIwm3tLlnucisb3UVwrYriPEubCxeVSw4Y
         ZK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435538; x=1774040338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSXSOnbGFJdo6hwFszubEP6hGZ4DJRtieMzbVIvPjZM=;
        b=iwV/gy6Os3ZewTE8y5abFPOtbFxwhGROubiO1mAMFnb7mBOzRgZ7VpoDY2EdFhzwZ+
         Jm78YUsvoycTejKXAV0xB1c5Ul1X1nO5ux8xpDSmcNkmDx/Xf1Mf3SsywD9lknADJuSK
         B5U6ibVQaHw9ijRd6yPFSf/B2o2OOgHXbF80SF7eJW3QDSM/ueoAWfFuetljpewVNYnf
         NkHemPLzo3riTFzV5O7vg4u4CUYRbFHGkA8Gddy7MSw73orKfuKVszUNGwMmp78JbgWr
         MPRQ22Q+eosvT5CKjt23B9ba0MAwX9Qp2j00mMtl8A42uYO/FZR0wuaABJWWta8genv6
         WhmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJE92+yAagC90yBKX12TVaaA8H5Ppb6vTHjE2Q6MgbVqB/zal47+Bk+Z2SCWBMBj9Wu6X40133fOoRLRLiYeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7p3bfT7yRdzI6XYgTcUNpf5q4jR4KlO7XhAPKCP2zNT9+WSrs
	G/m4pQbE3h8u4kAhesbKeqGD1dAx2sdjrAjKQxYNTpnx49GyhGLi25bjH47Hz2I5HZFWTP1SZ/4
	qXUOYES4=
X-Gm-Gg: ATEYQzy1P1VcB2WlN5bBmOSpCDZeJAIMHw2qAi0os3agd4FMZgXFCoBtSI2e1G8IaNf
	dQVrfSmK52mZ7j5KjWK/ZHsbxyMhU9NnSdpPQQ0/Qnz+z50NJWgVN1yPMYP0/PGYjGFv4MtMEL4
	Ls3zzJ8I3NMKUo91AugKx2pmJCO/5xK71tVwnm9tsvkO+EQD+JTze2v5jp/mWxAoA9KdhroBem/
	YyKasyDvyZcQ6AXe52JgjroX3aeuneGtvr46NHW3I8W/zs9nRV9OTVS8TLi5ui66e+i6Aakj1uj
	6vSRKV8hudWYkxr49s7atxhOKuNmtEJsL49lq/Kev5zRroN8itzG6m1pYCIXcEbzHWjqDb91d3f
	qu4cHM8X3IK3NxMHv/+MxB4m2fpXE6KvVQkmaMMP/R1I0Up1c5FcDTWIYiflZThBWbQ/WJOiXGA
	MSJ+jfJQ/V5PplAbHghGNs
X-Received: by 2002:a05:600c:1f8d:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-48556711419mr77064255e9.31.1773435538040;
        Fri, 13 Mar 2026 13:58:58 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:58:56 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:35 -0300
Subject: [PATCH 4/8] selftests: livepatch: functions: Introduce
 check_sysfs_exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-4-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=1140;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=VRVN7RkiGrgm69aDuMpcOshBDCo1eHbzdD2OnFzwxC8=;
 b=j44w73MHAVUmex0H1jUYBDxUa2M7EmxhvQ7ovZCyWcxRTXhf661foGU7zlt8GToTphwQO3QH+
 9qbyHFqgc/mCDhnhbX2ucfZhx1+sGhqjDLZRV/6h3nOQKdO9mPtiBNM
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Return 0 if the livepatch sysfs attribute don't exists, and 1 otherwise.
This new function will be used in the next patches.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/functions.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 8ec0cb64ad94a..781346d6e94e0 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -339,6 +339,20 @@ function check_result {
 	fi
 }
 
+# check_sysfs_exists(modname, attr) - check sysfs attribute existence
+#	modname - livepatch module creating the sysfs interface
+#	attr - attribute name to be checked
+function check_sysfs_exists() {
+	local mod="$1"; shift
+	local attr="$1"; shift
+
+	if [[ ! -f "$SYSFS_KLP_DIR/$mod/$attr" ]]; then
+		return 0
+	fi
+
+	return 1
+}
+
 # check_sysfs_rights(modname, rel_path, expected_rights) - check sysfs
 # path permissions
 #	modname - livepatch module creating the sysfs interface

-- 
2.52.0

