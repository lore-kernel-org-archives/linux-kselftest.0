Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41373E3145
	for <linux-kselftest@vger.kernel.org>; Sat, 16 May 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949999; cv=none; b=f+kCPlTBs4BFWTVqus0mAMeFLljg4oP7K6uUB1KYMe6miFXK4jBYpTmUsJ4VR6G5MzWiO1DP3vDxvcprERlGED0nsmvWkMkBlICVpOIFxeS0DP27QsMGrMTg/n/cOOgTXPhuIhICWkfTUSjYfF3QzpmptjBW3lfq3a3kQoRO3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949999; c=relaxed/simple;
	bh=ZxaATZjZviUzIS1I3yMp03Hu1+EJlyqt24bR3Qg6F74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AvntmD9j+vvWaUr+rGxwdMRkPT7IHWpegSm4Jku8EPWJxP7TpkyeJvOzjcgTzKha+00vSdYr8lpxUPsG/5hRdC2h0ufMsVs0RtPQneuAivv8svHzEDUvrXAQM07/EyCaZ3Es5xpe09c5Ji8PyQkkeCvLBZ1WoUt5sUha+gOGWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJQM9V7N; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJQM9V7N"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-453903ee4adso670208f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 16 May 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949996; x=1779554796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qpDX3cf6lKigTgOUk277JsOSVcitFS07cMS9djAf8s=;
        b=sJQM9V7NhKTLAWh+ozXMRz1QKW7fHs3Ah4H9MaQfS4VRXkFwwzBQPnSok97f9IJt6d
         X1RHuupqpq74JNe6IjDXALnrroUtVtt9g9p3Dz+KWCNwu6JJDRLy3g/0fSM2SRwvDq41
         Nmrul4YwtHoP9Hop++eH5wzkUtfw5nv9cuOkDYkHAvnZwl11k3XqRBsy4DoysYE+CbVK
         gNmbNdvo46MxFuSPyEGhmV9RESL0vQ1ApLZZuNAUOlAA1dwdBFF4qQblMKOu87UErXg4
         /OHRFtxIcaQKar4dTto7wRrVJ3Tay6itqa1Ifyq7Y6OBVDk3fpkZbxZOkbp55GFhW2AR
         vCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949996; x=1779554796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qpDX3cf6lKigTgOUk277JsOSVcitFS07cMS9djAf8s=;
        b=QvSQwU1h87BJLbnZ+hQuWGxsV9511lrogVZyZ0NnkTuJFIdrKz4iDCHdpwk5FWWEKn
         H8FO+yv0wSJPuDZVpctDoC3Ht8XEm/dD/wCLUuLHKOwrOGbl+P1nfQzt3mWrwYYfeDWb
         6cPLW0pqFUIKgKTdQgZ+/LesRhI7V27L985HvmahFTTst2bIdyNJpPG+aQQQfAv7mGSW
         hHJS+31IRmcZeAUIOiQbVGi0Gg7fhkEY/W1d5vKeoPgiEXMK27rTU5X2HdM6JL1xRPOb
         31En6yiUrKoUVv+qfmCoRF2BbpHLkfSJ2dNVLJW1IAsEqJw6mUrG2P1ehPjL0yzYxkbS
         rWtw==
X-Forwarded-Encrypted: i=1; AFNElJ+uddafYZjYCvYS5L/7gsTx/jVa1VOJDt5JIGduRSWw7KPdY3axjegmq+shc315bhAJwVNPW5Mszx7Imsj3sVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtixAwa+1PooGyDoOtInyEeehAzCMWb+cx7tS3SPUvG4k6rzh
	gI5xsDo+S74koXqMv/pb5IA0tCOsI260bdmwwMN9WQsyjJh06bYCdGtJ
X-Gm-Gg: Acq92OFHQpX8YXx3Lh86rdN33ecF+iTOo0kaWLNxgsW8pJEn5f2QAlpPKcXKWZ1IuHg
	GgnXlTZVBHpIxapQ2U5SFOuR26d5znjxIv/pHncAvMAh75T/Jj8Rf2AtcHjTsnS6mHPbhPX0EtM
	V/Dx2ZBW0Zi/PNE5DERe6d3yOfOboN5EQNT5xqXgL84de4WHL9qeyS1AyhIB3icu2AT3+S+Ml7R
	mreYP6I3b98q0b33RpB+ScLG+6WVLoVkPW41+vo0M4IXZsECdXtaVeoqgaTQTJBKbdIT7N9BuNv
	eGZeFgnCvm74WdgTpM54WLC1V4t+iwflAElaQcuTt2c6wk5P7p2dFuWvY4zYAvLluuuaph7oqzc
	1fuCqBkDnYQg2gesPo4BDLyhnkyFLO+EsF3AjPMYxtvjGtGpUZ7oQ49hpDURQCX0cQfEY1NALXA
	fKIhH1qiAv228r0BCf69j/GWR3BmV7dQokkOYu+gQAWvj2dqVnmeccG4DBMo5O0uES3ADHuJnT6
	yg9GLfdq5wP77Pt3nk+r8RCqyTA4opFmAfAZxXEijrhw8R0M6zjL5MT2Dtv3E0eY6w=
X-Received: by 2002:a05:6000:290d:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-45e5c35e415mr12417523f8f.2.1778949996055;
        Sat, 16 May 2026 09:46:36 -0700 (PDT)
Received: from jaeyeonlee-Standard-PC-Q35-ICH9-2009.. (host-125-160.campusbrigittenau.at. [78.104.125.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm22654922f8f.2.2026.05.16.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:46:35 -0700 (PDT)
From: Jaeyeon Lee <ljyeon9466@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jaeyeon Lee <ljyeon9466@gmail.com>
Subject: [PATCH] selftests: kselftest: fix missing @fmt descriptions
Date: Sat, 16 May 2026 18:46:20 +0200
Message-ID: <20260516164621.26126-1-ljyeon9466@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the missing @fmt descriptions in ksft_test_result() and
ksft_test_result_report().

Signed-off-by: Jaeyeon Lee <ljyeon9466@gmail.com>
---
 tools/testing/selftests/kselftest.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index b50a8478d4d3..347d1b65b2b9 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -234,6 +234,7 @@ static inline __printf(1, 2) void ksft_test_result_fail(const char *msg, ...)
  * ksft_test_result() - Report test success based on truth of condition
  *
  * @condition: if true, report test success, otherwise failure.
+ * @fmt: format string for the test description
  */
 #define ksft_test_result(condition, fmt, ...) do {	\
 	if (!!(condition))				\
@@ -349,6 +350,7 @@ void ksft_test_result_code(int exit_code, const char *test_name,
  * ksft_test_result_report() - Report test result based on a kselftest exit code
  *
  * @result: a kselftest exit code
+ * @fmt: format string for the test description
  */
 #define ksft_test_result_report(result, fmt, ...) do {		\
 	switch (result) {					\
-- 
2.43.0

