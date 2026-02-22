Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DF3154425
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771754202; cv=none; b=fvxNDLQ7i9pbxNbHmw49mWxXL+CKHK9ik2frFpQSHJTPBpkj3PLm1/nrDD6M5jOdWXlFydc+WK8Zhlaja4vL7xktPZd4TgQOlINIoTMvmUS/PWAyDYjXea4VLXsaZpan6p1WDD39qGm8vZXpC8Tx1Vou/Sk8yDiD/jF4M7isItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771754202; c=relaxed/simple;
	bh=mE4O0BtV173/rmaxbBM547I7Ypc4pHP28K3lvpHQstg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVIHaIPxRaqqgSb80HcXcFKH3R/EM3bPG6BEg0d+3BeoAJQAoW6lvAJXEwuzR0a7IEsV4bdz/3gzrTPYXZ07hAF8bfHO6FwkEjFMGqfkKLydGzhBlfrvQxpWwGLfau8cH48CENip7s1E7AKcp9dax+2IXCtx8Kp23qDt27m+NpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRTI++s3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRTI++s3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a91215c158so22761605ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 01:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771754201; x=1772359001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maJ0fqFSfWgbQUTbt8pkn0t5Je6F2vvbc8i45PZOpsQ=;
        b=TRTI++s3CYiq5yWozRp0iOJ6q6mXRpJmd/GT+XJgquYkrQhPIZFgowlu+1vPfjzuO+
         L07qOranodNaLwQzjgiqvZgH0gUM/vgsyr6HOaZof51MzSNwVP1EpzPaa7Op6Ujg2cla
         hih7sFwPm6cWGDefhzrF5G365aaXphBEpbJVpRcA722xrlfqnr4QxScnJe9Ll6/bP9eJ
         lRLB19BabL2JVIyGZXZoc/AVmh9QTuQKS82Hd0C9xzXWjHXvbuBUt5eXqh/V0PXCdn8k
         CgRAEjsRpccm1W7QkB6F/Vu8jtREChQx164M51K2mug/mQSe9dsWMPKg3htRfmHkmX7H
         O+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771754201; x=1772359001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maJ0fqFSfWgbQUTbt8pkn0t5Je6F2vvbc8i45PZOpsQ=;
        b=wyO9t0vY2jqEeWCYKjU72R5RcKZVk0yBVyWB2FU4H8omk8x/KXhIz+ByKL4ouEl+pO
         pRRzhGKD7ZS8LPo+mCGkocHF/mimrY+CRgTxuSApftY3ogu5OWtorpW1fBMpiOo6EKwg
         Ic5MB/cSNY3/E88hwBIJQcWOLMyMEZISRjgEw+QLSRLrjyvuxhMZIYs8cTAGEhsXkiq9
         w7eQZGdbV+iGD5JbH/ppYbePV8kS5qWu1Kb4K6B+LY8reR0IK2tvMyfrwQWsNYasGb39
         jjTzH7mVEfR/QrUyfgiBVgDmUXmOxn5zafJpIsWz8XbpgLmdjx9B6ZH8c+GJT385pe+6
         cUoA==
X-Forwarded-Encrypted: i=1; AJvYcCXhdmu+r1vIyC+0op2gBLnHhomXG419pY409oZlhNRSxHvmUyNRUEWEvClxSFFAxMqp7y8BavjiftDKtwu0Tog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwodxOJpZ3gDgM2p+F6D8wlnpVkX6yxRfOvrgIP/X3LrSrDL/WR
	lCrizj2mRc+Ms1uCpo8Kp3k+OoZNw/zHXCQM/JFzXrd3G+mvxVvNF+vxCIdykGrW
X-Gm-Gg: AZuq6aJ7GYFrVOLksT7KHMOfNXwcLFCKrKLz5j8Rykh+CrcQtyImXES1G6KZ8iZzt67
	Wc0ybWvULGGanNVuh9O2Gm/iiJlOitafjFwHQqNgiLkdSnuF3zmxyEDCOXPUiMQ5oAGsO13+u4D
	P7VHt4F46lWbXcsYvKgpRuUW2FrV7DT3spyPN4LlTCQBTocBQEOZMPXgbe4m6kxf1y02lTwdaLp
	aGK3K4v6MVnlaaZRslIN5t/FG5NqDVuN1BATQT6TyEKuHY8iHqlC9cXeJdtfeRKc7oBakkt+KXH
	L92qrl3SMJOhNDmIH52sEVI5+s8UZpFUcKglgX/8dHnfISi6mPz9rcCpBLNoXGSbV68t8qovAX9
	wmOpyIeqFE/hHmBlb9shDOfF5Jp6Cnio0TywHYZpNef9QsJGhXT778Fru+zc/9sSVnc5U02RsvD
	2h5QeBUEQ9W0c4aLV2ylmF5eTb59WsFIGhSVyI1RJTGke6fRfcDMRXd5G7jw==
X-Received: by 2002:a17:902:e787:b0:2aa:cfee:a47c with SMTP id d9443c01a7336-2ad7456550emr45059005ad.52.1771754200580;
        Sun, 22 Feb 2026 01:56:40 -0800 (PST)
Received: from strange.. ([2405:201:e066:f03e:63d0:17e6:9d20:6b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75054aa3sm43939045ad.89.2026.02.22.01.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 01:56:40 -0800 (PST)
From: mr.navi8680@gmail.com
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	shuah@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Anandhan <mr.navi8680@gmail.com>
Subject: [PATCH] selftests: tc-testing: preserve list order when removing duplicates
Date: Sun, 22 Feb 2026 15:25:36 +0530
Message-ID: <20260222095536.17371-1-mr.navi8680@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naveen Anandhan <mr.navi8680@gmail.com>

Using set() removes duplicates but breaks ordering.
Test output should be deterministic, so replace with dict.fromkeys().

Signed-off-by: Naveen Anandhan <mr.navi8680@gmail.com>
---
 tools/testing/selftests/tc-testing/tdc_helper.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tdc_helper.py b/tools/testing/selftests/tc-testing/tdc_helper.py
index 0440d252c4c5..e06f03c0fb5d 100644
--- a/tools/testing/selftests/tc-testing/tdc_helper.py
+++ b/tools/testing/selftests/tc-testing/tdc_helper.py
@@ -16,9 +16,9 @@ def get_categorized_testlist(alltests, ucat):
 
 
 def get_unique_item(lst):
-    """ For a list, return a list of the unique items in the list. """
+    """Return unique items while preserving original order."""
     if len(lst) > 1:
-        return list(set(lst))
+        return list(dict.fromkeys(lst))
     else:
         return lst
 
-- 
2.43.0

