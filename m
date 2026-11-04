Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826545;
	b=k55Z8M32CYcO1jG5lXMWfcrDFoqvYUMZKjBq+fFqun5vDEBr6BhuHdDkJH9q9qY3lXqN
	 Cds9mkn5emfLb0+7GDzq1N0s6PVA3tI3tI6RZH7Hheon9CVznKteZ2KMpMgEkhyDW0WzO
	 eWINHuJIXGgjc9JQS9jFZma6SPeCTgFcx8QzzewLnZFfhN4gEjAUDDGaneX/fXrJasZOX
	 SqHnlGQJgH24I7NeSwBPYyY1H95gKva4qS9EHZMJaZFx2i3laIkvfhW4JDyVQLAbe1uT5
	 EDvqolncGZnMvmKnbAmSoDOCosNGSvmQfWLYobGj3VQvmZgI1S0XfD0N2MvGGyEtFfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
	b=UvC2u0Jh15FT4J/mhkgaA4c5T7t78svt/y6gtZhowJEDVsTl8iSG/tPLkdRHzky3phiL
	 87NTiIeGuc6kUv9a9SJx6J7Bm5Ubl6e6E3/4L2S2niWTx5Se9JxN1m+coBqzfJYovWIEP
	 QbpfoAThfmC5U+FC2m15yg6FVovrSBNEFr72PI1DIpba98z2L9jaJx4l5qhXakjLJcMIu
	 yxCAtdTKYPmHkEbdBCaFYFT1EPY1Ejsm/R981QuTW0pmoMMLanot4CdTQaBUF7WqPSy2A
	 oF9uGeokd5mcLaeimfhxaTFIvIt02PIlSdByGdhyg+Xc1ezXNvydoA555nomDTtiCPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyYn8msc;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED837607E901
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED837607E901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AyYn8msc
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490585eddfcso617626f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826542; x=1794431342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
        b=AyYn8mscU8vUqS3lRk7C3LFoBrszPG9ICQkVOCkMxJXvaekNRR0xpbc6+vCL1FQJKa
         Cz+4cqtqSgh3cEVlOxS7KLGNTKMlEaZfTflp4mjNKTaufuYIEmE7GilVQThsmTHxsdw8
         mR9aOEDFEm3mHx8fKOxslo1wiESEmEcRbupWQvwldeiSdUIaZwY3jMUz25D9W491wcWg
         igeGPpMojr0XznbN3znlufssneYVn87FqDrH+aWxEjsqoD4rEGUC+5ph3HuH5cDFb55i
         TJ0QQZeRltXKxKCBn/17WGHGB21CigXEXoHSIeJk7OhjzwGP/VJpEFaf8MduY/QcRZgo
         5O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826542; x=1794431342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJjJiozm3d0rM1mQcNRsH5gFVPVJYU6IQSIk1eq0QT0=;
        b=gf9SIISu22+7pHv/yWUPsRVx6paNNOdo9gOlkwIBzO2wsCyWgDTq4gKHZpVn9RQrE2
         hMw7OTtUrTLo8L0R/Xul1hCnMWP5lab/pT7gRdt/9hXBsV3hy6OJ/VAYjtNVee4hBFGw
         TBI49LoK1VWDwaX3XZxTrUIwV4CW9wgnG9H8vGe+0LTNGvJTOqRTwoXTa9pzs9jF99gN
         5VadO7nUh15JLFo21QYBGqQVsj+LxPD61ahUf8+WTJgV8yyIAdu6UfXozYTxe/3yu55B
         gjuCr03v0CbeQAFQrosGa2+9Ast4o0ozAigSiEP6LsSBMUTqFWhObQCfG9gt8H2Xr0Lj
         RqFw==
X-Forwarded-Encrypted: i=1; AKwUvBxcI3/12r0yssfEFukQVOmdxD+Vz7ECr4/UO87a9S+Jaq2VZTDh3uSTIO0dtJbu9Ym/1jd+FLUKb8Ph+Rb0Z9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JOjFMKPZukgpwyLF+pLObhBEYClLdW64XW2JnUBybdPvJwWiy
	x1WKDbjFg1Zptzkd6QnmEaw1RCNKFIRK51e2MQ7UT/07HGJd9kFAWUFA
X-Gm-Gg: AYBFou000jh7jJJHDeWbEU6ebjFGrYH0jHBNyJpWSod9Y1qOu2mjkUJtNBRxnKeCtW0
	jHYlw8zXN9zIfbKxtHIWXonkJqBU9JD/xkGJtT9bJu78unlAu83jCA80NIJByOJ0ybTExNSJovp
	a0UCEQF/L/MC2/5+ikR0iFxQmc2RjiLCNpoeT8/1tK+pFyZ2EhfYqGssaGVM3BkelhL8g5WmogN
	VBuMn0RqyipgI/Hx/lbZaRo3IO6Ar7kjktivzMl3coe8YhTllwA/mfIqJXaXvOT9a6iUYAhSTI4
	Ff8xuM4sEBpwedvgHyFhCfYjMSNMpLsBJtPl34bs4WI6kAywmNQ+T7Vp0NrK19AarUPQ8Cn72W4
	7KtPoPAQLVRuHZqpkYO/W5oTGaqeej25cLI0H3ycRLnYCTPJCZF7CzSTdfc0MJYAFtd3n1m/tc2
	HmBy8PZmXkrEieyuhyc/jgmNmhBnxHsNg0+BFYwQGDeQQt4xqDZ1fHkttgXkmek3CWPqIBHepcL
	LNueL4CoSLYR79ZdDIPEeX4LmrvCgaY6Hq5FThy92pVfxBe2llgTjxzIsa7bKt6UANm6ZdJYyrT
	0N0p0KYUgiHqRmcYi9zZHLETZqs38icmnIcMJ1twDVPG/WaaU80zpA==
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr42439584f8f.24.1793826542329;
        Wed, 04 Nov 2026 13:09:02 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99d67sm5897273f8f.24.2026.11.04.13.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:01 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:51 +0100
Subject: [PATCH v2 05/27] selftests/landlock: Fix the openat() success
 check in fs_bench
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-5-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

fs_bench expects openat() to be denied when Landlock is enabled, but
only treats a returned FD of 0 as success.  Any other valid FD falls
through to the errno check, which then reports a stale errno value.

Check for any non-negative FD instead.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index d13a88dcd1ed..78d1efcb2d20 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -189,7 +189,7 @@ int main(int argc, char *argv[])
 		fd = openat(curr, "file.txt", O_CREAT | O_TRUNC | O_WRONLY,
 			    0600);
 		if (use_landlock) {
-			if (fd == 0)
+			if (fd >= 0)
 				errx(1, "openat succeeded, expected EACCES");
 			if (errno != EACCES)
 				err(1, "openat expected EACCES, but got");

-- 
2.56.0

