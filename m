Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147D3A7849
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291364; cv=none; b=R12IPAI04tLt6DaSo2Nvr+XiZkp+PflK7LvH/3cL3o4LwZY+PyKIG41PzC9VdX8+FvO/enSw1HNArNMEKHilwquDYZ0eX+pvGC6ZDTs4TgHsYw1OeWk3YDbBOTor2zLw+YIKVd7tCgpeQak9YXYn5N6TUtm1SqD+0m35nVacH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291364; c=relaxed/simple;
	bh=bPlI/2xmJK0Qts5eddw/Vh21IiHuQaslrq963O+3tzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVILhJ+jGva9G22bSWdMwQfQglDyKO2eO1Lvuwqf+i5niw2e6iUvMVMkXQQ/AEy9kBw7S38iMOYbk51azYDAc4QqazRVKmkJWigJxgPN/ZvRiZcpj0PU+otKlGAh6xiomj0WN4r9gfsex/5xjU9OejC7amtaFsje0bgSNiAXn2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL9awbNx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL9awbNx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c2a68d01so9656485ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781291362; x=1781896162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRg96KjMZPBuPn1RKC3qLwa0FZMA6GdGbqmzSwsfaRM=;
        b=BL9awbNxvPfVsNfpQj1luXAl4MFsRWD4d1Lmsue8cB/NHkbz5ybKXADUH3hTU+hFwl
         UxV9IDYhi8T0vQFHz5W0DKsUaaW9rr10E/PCcjm4yiXaAb7bWY3JNtP9jijkkNsZ74Lh
         bfU7euv+Uhr/mT+NNI9R13h85aTTy7DUV1ZBB3HmJkciITv6VZ+Ck9OrL8l1ibGOBn2Y
         imvqTIgxxqTFkY96axUZfo3D8/Z11BQt9DfmsZl72X9qqCuSQ2pfKUy24OnPhT7q/C9b
         UA1JfZA/Is0RZeTW/ektUDIOmww8ISwBwoVohipJFGrwKT73T5eI0oUeYCLck9m8I6Ju
         n0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781291362; x=1781896162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XRg96KjMZPBuPn1RKC3qLwa0FZMA6GdGbqmzSwsfaRM=;
        b=GONilIBVapDgylI2u1B2JhKwa6KyCX6EDSBvSHi4pFaAJHsqFn0ZPqPR4Ahp3NvlmK
         3wxk6yeKWE358oUQuxHY/L70PJtAW1zWiL73blUW7wop+U4TO68+YApoSjRaZH0gbYk7
         BnyRB7i8MIRZBqvZUEPQciOxS+VFhmS2eu0VX8y7Qlr59l73i51txYGg4HhQEUcd5Isy
         dsvNDF42NItIAKlG6+34/6DXSnh/XRDNu+PnHOgmf7UWn9WLxSCtwiqUxNR9PF1aUlAa
         janzhGxytbqtxo2vGF6dG+RCnoy7+UW8Yg6Muftbvda9Gy1qg//nZXqvYVNfDFi7z6VW
         /71g==
X-Forwarded-Encrypted: i=1; AFNElJ8SWmqIwH5tJccdXRx7Cf84f1YdvwCN/SahjvpsPl4bFz6r4f06geQf3+Rxmgm5VdBFQObse4FmAyufJH0lkp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUcPnEM/jRvcd8cFcQuk01ZUZ32L4I7G5erKiP0QkhKbZkHIiU
	kkX+3EKJ63A53cSUJnZcfzHDg2V39UvyYoJUvuzxcgmM6ETzJGUmI7Jg
X-Gm-Gg: Acq92OECGFRVpmZQZal7Y/i9fxuq0tHiA3dVq2kmxVbaxA03uRdAM1LUAcxMolxGqHg
	MhFMftFMMU9VWl9zLWXNeEJFscXzGPJR+9qmqcYzhSyjXuM1Yy23jtMmDqbUg2SLS+lBI5GMyfq
	Uqg+WnNLsEbY7xb679hagW4raI9dAhUl4V7UCb1LI4YEpZiEzVCgBG0AynDNi3U5Fmkg/5/MfZQ
	bdjT2uiDyeSTqCceW/ZG23wdh1G/FYqdj9pPPPRv2Tg8S6dHHgV1kXh5nfCPKa4owaBzBWI5mBl
	Z7SlIOr1GEuuXZSm55wwQE/28QKU/ptv6040nqLuEyfiZRyypHGDTcBH1a17i77KHz2BaHla5jP
	a9r+hL7iealZnsxlBPh1eoB4bkAPXVempc9YAfr5n14mMc5i3v+q43r7kfsXfVOqxUjWS9xSVr9
	iWGmyU3jhYpvsQRizxJVY=
X-Received: by 2002:a17:902:ced2:b0:2bd:7684:34b0 with SMTP id d9443c01a7336-2c4105092a4mr52571515ad.15.1781291362268;
        Fri, 12 Jun 2026 12:09:22 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5c::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433460a60sm34934225ad.76.2026.06.12.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:09:22 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 12 Jun 2026 12:08:41 -0700
Subject: [PATCH net-next 1/2] selftests/vsock: accept vng 1.33 or >= 1.36
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-vsock-test-update-v1-1-7d7eeed3ac8f@meta.com>
References: <20260612-vsock-test-update-v1-0-7d7eeed3ac8f@meta.com>
In-Reply-To: <20260612-vsock-test-update-v1-0-7d7eeed3ac8f@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The current vng version check uses a discrete allowlist of "1.33",
"1.36", and "1.37", which forces a script update on every new release
even though all post-1.36 releases work.

Replace the discrete list with: "1.33", or any version >= 1.36. 1.34
and 1.35 are skipped because they were not tested. Add a version_lt()
helper that compares MAJOR.MINOR numerically, so the check reads as a
straightforward version comparison.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 39 +++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index d97913a6bdc7..ee69ac9dd3dc 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -330,27 +330,34 @@ check_netns() {
 	return 0
 }
 
+# Compare MAJOR.MINOR versions numerically. Returns 0 (true) if $1 < $2.
+version_lt() {
+	local -a a=(${1//./ })
+	local -a b=(${2//./ })
+
+	if [[ "${a[0]}" -lt "${b[0]}" ]]; then
+		return 0
+	elif [[ "${a[0]}" -gt "${b[0]}" ]]; then
+		return 1
+	elif [[ "${a[1]}" -lt "${b[1]}" ]]; then
+		return 0
+	fi
+
+	return 1
+}
+
 check_vng() {
-	local tested_versions
 	local version
-	local ok
 
-	tested_versions=("1.33" "1.36" "1.37")
-	version="$(vng --version)"
+	version="$(vng --version | awk '{print $2}')"
 
-	ok=0
-	for tv in "${tested_versions[@]}"; do
-		if [[ "${version}" == *"${tv}"* ]]; then
-			ok=1
-			break
-		fi
-	done
-
-	if [[ ! "${ok}" -eq 1 ]]; then
-		printf "warning: vng version '%s' has not been tested and may " "${version}" >&2
-		printf "not function properly.\n\tThe following versions have been tested: " >&2
-		echo "${tested_versions[@]}" >&2
+	# Supported: 1.33, or any version >= 1.36. 1.34 and 1.35 are untested.
+	if [[ "${version}" == "1.33" ]] || ! version_lt "${version}" "1.36"; then
+		return
 	fi
+
+	printf "warning: vng version '%s' has not been tested and may " "${version}" >&2
+	printf "not function properly.\n\tSupported: 1.33 or >= 1.36\n" >&2
 }
 
 check_socat() {

-- 
2.53.0-Meta

