Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D01607A4
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 04:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769747360; cv=none; b=Ll8ug5h1EsTL22l/x9HQgfr3GjXlIOQUefES6BnmnIAh53NeFNSgDeC8+ELSiM/dZUDf8+T7ZW3+ck5nO9kt7Ys5TjDMkXuNl9D0uGzB1VwfttDhSRz0VmAp+Z8O2O7y/VKJ0CvvfJ2DhBGUBwAnu4aazp//TGtKoqC7X31pHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769747360; c=relaxed/simple;
	bh=HiIwxfb3f7+agAhgeRGoypMKaGp0L/iis+NTewLzX5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8q/bgkk0/KHHveF72snUcwwC1o+GMOM5sRrGqXpfz55fmUkvN4HrYtaSQxgbCOlE8IH6+uMeXqmmby7Yqcrkf8EQTIbJOurgoYMLFNpnSe9RnzXq3av1d46dLHl41feLGM9284UNj+bjQHIV2hEqTfcbBaTI2vkhE829mQh4FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wim2OxNH; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wim2OxNH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769747350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w3hr4mReTXz6nB/zv6oGU/eEGM2eGUpL9VZU/8WLpfI=;
	b=wim2OxNHxBS4JlmmXRPkgD1rdjm81fphI4mXk+hSB9ZQGlN5LJH6cytuPWRgIO+L/30GjX
	gIrjBlds7rt9b+0U7Ha0jIpMKAiubjh1yR5f83z2/VG0//I3cnzZreiLqYMxqn2sQyAlqi
	lYWZfpWezuq/FtN8ibssu7VbOB8iZbE=
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: pasha.tatashin@soleen.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: [PATCH 1/1] selftests/liveupdate: Cleanup kernel optio CONFIG_LIVEUPDATE_TEST
Date: Thu, 29 Jan 2026 20:28:40 -0800
Message-ID: <20260130042840.1469-1-yanjun.zhu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The kernel option CONFIG_LIVEUPDATE_TEST does not exist currently.
Remove it.

No functional changes.

Signed-off-by: Zhu Yanjun <yanjun.zhu@linux.dev>
---
 tools/testing/selftests/liveupdate/config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 91d03f9a6a39..80bd5d5e2976 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -5,7 +5,6 @@ CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=y
 CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
 CONFIG_LIVEUPDATE=y
-CONFIG_LIVEUPDATE_TEST=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
 CONFIG_SHMEM=y
-- 
2.52.0

