Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C6557D214
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196989; cv=none; b=gDhgcSPc1I/V78FllJWm/Uknne59WaY0ExgnweGzFGN4W2Jd75R2Z8AIoa+6cXqt4seZ2TbbtlcgIJMA4Y7+4StijYH5LA74Zt+vsjURLtnVPswwc8gAPOdC5Y69taYhpfASGhHX3Gt2Nf4CMux4KpSZLUB6X6BNfY4vyn1ig68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196989; c=relaxed/simple;
	bh=KoXj6lDz/zEBfEDePNaRooRZZ1oXmLqh7Vi2llPxlvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiPkIAWsCvLD5qQtB3zlLlIZN0wTFVBUOuIM5e+2goUWUFBaBxmDcHeTpFPhCudkDaCSfRrP+Nmd1RMMz2moOJxAAPJQdTV9CXNnmkCsFQixVetD/Gd8pFViynpqTFhYiKRwqsTsYkm0gCOdQ3ubYgJ3uQC1jM7J/u61OylR6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqwLqlw6; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqwLqlw6"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso1157134b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 13:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196986; x=1790801786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEO8AN5y0124ULpZTldBK8ZJ7R24pfDL+mJFB6JEsyI=;
        b=fqwLqlw6d03aME8cU8AmS5XrMcGsj5tF/xzaSYCrAyY5H2efou4ii7em5vceKC2bFT
         qsm6ag6iTvXLPKPf+EfX87N60/w6hwi/47psV36isZegpRgZlW4YlNb+JymVcG9uW2L8
         +BIH98YrZ2DmA8SflRP28V23sHBApbPXXov3PrU6v+VlVbBjXLHFhB+AP1ApU5WDBdMm
         0umZJmqEYgvCxGdKaxtMEu20mNWotX69GPc9pI4p8PVPJoyORZ6r3KeNG0rL4RlUYJzj
         wsIMFV+GeEUO4Uw0lQZo8K1DG02jF4KFdw2fuXhrAWPJLIGHLYXFeiSKRkYIU8tyoyHI
         XR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196986; x=1790801786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEO8AN5y0124ULpZTldBK8ZJ7R24pfDL+mJFB6JEsyI=;
        b=R6cFVHk+SMiPcyz3qvI+JkAVz3OyaBg2LQLgAE+4DkwW0PPxtKBjQkQrCK/2KvdSW2
         3ryMlGPaHsQRDW/B6B7putIaOogoZLRSJ2OHKLFfzxGJfxvgfs7xHfotxyCiI9zfDml9
         mQPQyOfL1VRPSQJPpquQYMQVxcZPKEW7pgUAod4HWC8iDz6WE2HfWtvtpRncHbTAVLJH
         4EuH2hhG9wLAP+r6RmV4/XVl5y5/PH6nSNt0he3bEq/lkGsWpGmWQZD43iZZO0EyIb26
         KP2lR/ZxJLd4CJSrSnZu9VhoOICOl8Om7i+pagrUCteNJ6AIHFUJDhHdS2CFkfDnWs6s
         yPQA==
X-Forwarded-Encrypted: i=1; AKwUvByMVRetNbeln37sM+bJlTaY1Rukbno3lpgE32lif249xE62vSI0EWCqQ7Q0VP5VbcyoJrI21a9o2SNsN3q9ZSo=@vger.kernel.org
X-Gm-Message-State: AFuF++k+6dYCqa/HcOUTKG9VaSpZ07m6qbN3y+9FDE0BnCDR862m/x51
	KK2c0esLeFoJbp1Ogo0YEcym0NUIecbTT1JxPSlg9ab4ShGwIeQ+dGFV
X-Gm-Gg: AYBFou0DoyVMCjtVsBddJI4pqrylXj0S+JBnbZ+Qo1tH/rmExrQtME1rWX7PtU3qajm
	H9xaljDjH8EgI1wjR0Wnv0nmbN3tYQYYMwt4cNknxHW91pGgIgqnRgw4Djaq6FWbhwtUEQIBNYb
	VcU7xWtIX3a9k3mNOXNsadLnFG8VhMc9ieInE1l/QSzWILn4ptYwf06yZ3tu7gr+D2kApLezGpf
	7tQpRL66fWTCYHF+28LrkL2MRoRWzq7Ge5NqqAmu/YBKgpO3vlr2iJHCJLub49tFsbZbzcHk9ed
	qMHYPY2IOxq+D0IRfWnc/LAaL8vzBlvX9gw4GQT39ssW811494BfkqG4nyP/zkiJdFj1ZiS1mNC
	XsEPveaC0MkaK6nU3emu8IcVRmHS1QScs4+srCmQcevVbf9HHGB/VzEsTHBDK7Q2xZA5AdbHeJ6
	cCUN1b0UzkhvKFTfknf1U6WcNTfjNP1pBi97CoG+zRZAyPbkN/nEOub3ik0iEOsfsCsRROs7D51
	85R83x337f0CkeJHnjcyHnvOAEcwp2vWsFZ3XiL
X-Received: by 2002:a05:6808:159b:b0:4d6:9293:9b53 with SMTP id 5614622812f47-4d72ef56171mr358627b6e.59.1790196985628;
        Wed, 23 Sep 2026 13:56:25 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603ad0f20sm4498893a34.9.2026.09.23.13.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:56:25 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] tools/nolibc: fix WIFSIGNALED() for status 0
Date: Wed, 23 Sep 2026 15:56:21 -0500
Message-ID: <20260923205622.1123270-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
References: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WIFSIGNALED() needs the subtraction to wrap around for status 0, so that
only 1 to 0xff, a terminating signal with or without the core dump flag,
pass the check. But status is an int, and 0 - 1 is -1, which is less
than 0xff. A child that exits with 0 is therefore reported as both
exited and killed, and a caller that tests WIFSIGNALED() first sees
"killed by signal 0".

Make the subtraction unsigned, as musl does in the same macro.

Fixes: 8c934d4822c7 ("tools/nolibc: add helpers for wait() signal exits")
Cc: stable@vger.kernel.org # v6.4+
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/include/nolibc/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 8f3cb18df7f1..4373bd8a5b5f 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -119,7 +119,7 @@ struct timeval {
 #define WEXITSTATUS(status) (((status) & 0xff00) >> 8)
 #define WIFEXITED(status)   (((status) & 0x7f) == 0)
 #define WTERMSIG(status)    ((status) & 0x7f)
-#define WIFSIGNALED(status) ((status) - 1 < 0xff)
+#define WIFSIGNALED(status) ((status) - 1U < 0xff)
 
 /* standard exit() codes */
 #define EXIT_SUCCESS 0
-- 
2.55.0

