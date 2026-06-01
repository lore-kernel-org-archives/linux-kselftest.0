Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FD3438BE;
	Mon,  1 Jun 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780299823; cv=none; b=hqX91t0OVtVorvuEtQMnrRBEpkIVa8v9WA94FvWGwpS8RrbNNZPxUbEyi3kFO9S0qLtcX+PP5URLkwSLPKshe1tb6aSvcxWKIC3A2EKIQqbc2UhTcNK0Eiu/MlGHMjS0AP6ylyTe88txUuoBYp165nosryfnJZmHADque7PuWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780299823; c=relaxed/simple;
	bh=vklZS+F0UdfrHjMTBGchkgs5NC7WdZIykknOrYnrgD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDqEsePtxwkXnc+bd9dIO0N8wkmWb02K2mdlxoySyz64ylQ1Rb53W6962uq7wgBg3kKXKaEJoYhPFOHm4YcINfEDccYoQwKU+orD5CVc7x76c/wL50B2sOnUOdL08rkXYTTFs3gFtU01bx8Q6iVs5ZAeoqwA5TPdC7LJYWXr2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nUjIU/Bu; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nUjIU/Bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780299789;
	bh=pwZkHXqKqxkxLcfcppEkvJjtNsDiBPN5huDHZl9Eqqc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nUjIU/BukiOGcfae12Pr28aUl+p7bkLozg4sxgd4o8ZJiKyDFujVZ9Zbcst6Rbiqd
	 ojTzr09SCiQ+fQxkV8GgnmD3zAABG2cYWj0j0rotDcLRB1BxTq6867r73Y6JbbzEH1
	 wQhQEpeH68mdJ8fidJc/4E7ZiJkCmAiRYNPyL2fs=
X-QQ-mid: zesmtpsz8t1780299777te9dd8a35
X-QQ-Originating-IP: sj9qZnDxjOiHmc+F6pDsHm4ywVs4+jfPh2wpfeznSRs=
Received: from PEN1097 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 01 Jun 2026 15:42:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12067453659540289926
EX-QQ-RecipientCnt: 8
From: Cheng Nie <niecheng1@uniontech.com>
To: sj@kernel.org
Cc: shuah@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@uniontech.com,
	niecheng1@uniontech.com
Subject: [PATCH v3 1/2] selftests/damon/_damon_sysfs.py: fix memcg_path assignment
Date: Mon,  1 Jun 2026 15:42:49 +0800
Message-ID: <E4B88E7D4879D1B1+20260601074250.203583-1-niecheng1@uniontech.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601073635.200015-1-niecheng1@uniontech.com>
References: <20260601073635.200015-1-niecheng1@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NfCiKUdyqwvYVH7Nc7tPkOYzQ0ufTexoNNJxrhOV6EJBqROmP0f/esBV
	cnU3lvM4a0LZW4zMD3rZ5hClxBlyP7/RlocgN8MaMriPHpp+mkxgx1NSXDPxFX7rXxmwnFU
	X/CIl/Me+0njusvVMgeko0kI73Wh2L5NrcRCisNDJ2SHH8uMinXsN8VgPakUDUzTjblnHPe
	tt4RSH/aScOrPl+21R95uhh9H53W9En0DRr9VM5yy1zgXm1DhRyLHLp8Fb8o241t49bfN0A
	mu6DE/sTxJ8RLJODwQY1Q9Ok5Q8vUGaJvr3zZ96xRpjnGKhw2aMapxk/nvu4w9thY6L+/j8
	SxQ0YCCPzIFRpdUxUlQkjxKKIDaCuVHf28rN1st6OO/rd7RN0/mjjp+2pYaeP2v3qr7l9jL
	NSyT3ATCGm4wyR7pIjvJgQtck2Q0+ElMtUJsfztZ2OPqz1UmasZSTauzU1tj1ULap31lVmv
	FpiCr8bJuaJqQDoppqEx5DgUfwqKbVMmsyEtisCa5QThxbvmi7gktdT8DdQlZeg1xYL+lWg
	FreBEiw/UlOVIuiUHXYikF6VjbxSbzV1MdntIu8I5k6GNrWIxmiPdpFD//qhx55RKyZth1L
	Xb0YMpFy/e9Mzc8YUws9NaxcP99yKKNqziJ64YUPGuPL9FSeAR9PAOGwyP8WeZXM7CqGY4H
	Z3w5vky9JDtPXrmsaBhFHCxoecpJiRDtBnX2/+f5fRmfOm03vz4Z+D/QbeLyhh8vkRB+68v
	u6+0VeOplNEit0VuWgyRDMbMZtZEdhGcuND1bIvqpL4KH9sWHEUb6/TKkVkhHnfB9DI2CCi
	7k/J03vYOulxKZa2KFZm6FQuvcuumAhjcK0+//a4Sbjl1AMsR2a4YtbWF8uUU2udOfAMdzF
	Ga+ghoPwcindFrw8lAaa6AVFvXOefrcFVd2dhXXfmo3Fi2MU5f197KmwGgsZPGkenefm50U
	U+It/df0E++OIer2ttaRZFzDFrDJDpmU4peboFv1cpy142VCxzNdhIGrPIWdaGd+7QRCPIO
	ja8PPlCVF2UMrmPTkp+QtYpe7Dh4w78xxPYpejWEDAuvdJCXzNSGn0Ze+o3js=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

DamosFilter stores memcg_path for sysfs staging, but the constructor
assigns it with a trailing comma and therefore turns it into a tuple.

Fix the assignment so memcg_path is stored as the intended string.
This makes memcg filter staging and follow-up validation use the
written path correctly.

Signed-off-by: Cheng Nie <niecheng1@uniontech.com>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 8b12cc048440..43075892215e 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -271,7 +271,7 @@ class DamosFilter:
         self.type_ = type_
         self.matching = matching
         self.allow = allow
-        self.memcg_path = memcg_path,
+        self.memcg_path = memcg_path
         self.addr_start = addr_start
         self.addr_end = addr_end
         self.target_idx = target_idx
-- 
2.51.0

