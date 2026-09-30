Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78773E1681
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800654; cv=none; b=TljSEOubzpf0yATUkoooz7L7FZbKkUI/3Mg27G0G2xE5EqejM3AjTVffB7qQOaH64s6cJYl4Thmx9Lj/YNFCKuFwC/pQp2rLMbk9LizCUmglYh1nkFG9zPOvvNG+9vl5Rbr4p2wEJ065OG9qDuyA5rWpfIlm9tKl5YA7xyPKwD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800654; c=relaxed/simple;
	bh=SB6WfXLYyhvKySyyp3UErVUu3d/q02LxuAtXUi03Khs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ccflk06erhc4ljRtv8mS7xBax5P73FVkdaXv4v5fhRrbj2zGzG/rpxC9ssPlshgWX50fH/Se1AjcKNf877+CGH68NWJ2T43X/Y0hOa0uPhm0D4UW+6YNSUOw22SUoVWNovBgvc6S8dsVRQfBrYBGrZUdnABEOpS9ON2Aepr2zFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHGWpFqk; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHGWpFqk"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso1851436eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800652; x=1791405452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=li7VR5B3gFvDubjRrhPPXWIuFs1rEpEcUgMEBaEHuyI=;
        b=gHGWpFqkXUJa7ufH0njsTOxMVyner4cXn352rSOMUIibfJqDVudWISoFq6LFEoMbBC
         q+AD5xlyXhKCBeQXXzh3oHjGlGQL+JUTsIldflmJfZgJbu4E45x6gvu4GASqEZQWVrBZ
         RYg5gWawuFUd6PPtCYVOoDBzs1DGkLk3EyfCC2jxTVlLjuBI67mVQODmjYTEkuEXQelV
         6VGfxMgGn3oMWvBhVKFgOE2TZ9bPRfcbSE/jCP15Q44h7ckIzWMnI5GDphy5iszyMfbT
         S6R7bfEF2eV26mJwt/RIxuPll4M/hMKv/EKvTtB0Q+cE1CjFRC4tZutvNmHoyqoXe7HB
         uLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800652; x=1791405452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=li7VR5B3gFvDubjRrhPPXWIuFs1rEpEcUgMEBaEHuyI=;
        b=P4pncMEzJNfaMVKOz9STh5ozwpAaXcaPhMVxmOIZAlDvFrrbXVAlF1q6fTUfkalcLG
         SA1cMDfW2USDVVvWmoe/+fdXJkHHHROWhFZCwxDX7Hr/FyI4PErrlA5oz5FI/FZ+MWIJ
         BYyHJ/li2zmnwwo8+g3J0X+nvoQJlPDuTQN+uFiZ5d3QyPeyfOvEs28FGexTLX/TXT7k
         amuYDlURtExIRJg5VujDskYkYzhS3jtE3BvC1IMXXgxKRFu1r3iWBFdRJ73c15EzUoOQ
         5+oy89u/1pFfipR7m2ZK5NEmf5frOoEF5uWKIJjMdkewln2Gcraqhap8YanZ/JEJbuCZ
         NfqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBBIUxt1ciZ+68MFYldlRw27ks3Rvy4Qt1gJe2S9SGtujj9qMJsiVvJ92hvrE18r0ff5H02Vo87G1boaFUkZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYImybZCkmth1BeQ9poHG0jme/KY7KNjnOitlLHmD3/XF89U2pz8
	2zKxc1aZCN0xWpwzaGjTaJt9JfAXa1bVRnoAynvyeFSEm+bTQ7Rc6LHl
X-Gm-Gg: AYBFou2P8R9inAmhbYLpA/HdkjB57ZEOspmnV5D1xDPVhN4v+oCLaj8jNXF6/5YszeD
	Gnpcw6fZfKD5ZBCuHThnNA9CEOOUxZX9RHAqQ5JO4mF5eR0MUyDOhNTHzCLIph/Wr8IqDdYvtrp
	FobKvylQjKDRCoqxeKkIwojXpUJsmjFwTIzZuYNq6TSIxJA6HoeMbRLombBf+v7jrm3etfv6/3d
	kz3ITSeK7W3MIC9xZBAXNBD+QLKdgX2i2aVJ/Mjx+CBpPWyhr+vW5ihoxJvH51MeKpb9bZ3iry6
	WDMxj4aPflfdctbvF2MeJ5Jkf+9l44dBp0IgOfnHcVGB0TYO7m+qee0RyVpRtHqlB/bEYnjKeFN
	ThKhAn7A4uAqmXeaFlGd0qf2g5ZG1Ebfm5p4UNprGgXMaRYg/DgN7LIltDR6/glcmX8BvQcgH/Z
	+uCRqPgeC2JzdFQaah9Yq0/1epHGva7z6sacimtQqVn3hC+ZXTpON2k52jcUrUxbt9p9JcZWBbl
	NCHLE+J/55XEdqWv4j0BHM/kBe4aS2uCTztiHhPE3oTiL+GnvFpnI0UJz03FhCW
X-Received: by 2002:a05:7300:ae81:b0:342:94b:aa28 with SMTP id 5a478bee46e88-34ce0839716mr3045112eec.27.1790800651707;
        Wed, 30 Sep 2026 13:37:31 -0700 (PDT)
Received: from arch.srmap.univ ([103.217.237.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db5016caasm1242147eec.30.2026.09.30.13.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:37:31 -0700 (PDT)
From: jahanzaibmir <jahanzaibashraf1318@gmail.com>
To: brendan.higgins@linux.dev
Cc: david@davidgow.net,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	jahanzaibmir <jahanzaibashraf1318@gmail.com>
Subject: [PATCH] kunit: tool: remove unused JUnit imports
Date: Thu,  1 Oct 2026 02:07:07 +0530
Message-ID: <20260930203707.38766-1-jahanzaibashraf1318@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The JUnit output implementation uses ElementTree directly, so the
xml.sax.saxutils imports are unused. Remove them.

Signed-off-by: jahanzaibmir <jahanzaibashraf1318@gmail.com>
---
 tools/testing/kunit/kunit_junit.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
index 3622070358e7..b76748947d65 100644
--- a/tools/testing/kunit/kunit_junit.py
+++ b/tools/testing/kunit/kunit_junit.py
@@ -4,7 +4,6 @@
 #
 # Copyright (C) 2026, Google LLC and David Gow.
 
-from xml.sax.saxutils import quoteattr, XMLGenerator
 import xml.etree.ElementTree as ET
 from kunit_parser import Test, TestStatus
 from typing import Optional
-- 
2.55.0

