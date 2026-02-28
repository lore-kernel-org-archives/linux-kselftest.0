Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285C22D7A1
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772264976; cv=none; b=n4P6WwMBzolLp/+RJSoFdtJHLoOTt1Z+zlNvDoc26p8ko5ncqv3SqSGihogC7m8DhegLgorjorvro8v1k8jHPulvAFkRcC9DeNTmkJT2ERKcppU+o3dPQUeLcQbDz/UcOHdnuio8xxD7tTDjOOUDcPky/sZLVQzmZ7hCUULpotA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772264976; c=relaxed/simple;
	bh=wjYc9+A467gBJ1MBHXbnsqfQmtNcq2uWJM5XXcSSdj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p1ejGGjvIC5sQ+eO+q6ho5ohoYfCjrqZxf6RQFOlYRX+R1pdmy6wU693dQ5NGabVyNkugZyahyNtwc3yfXi11SfO7wTOQot6ywOe+hT1eSOD+F1ppyl2t1OGLolipabinJxpotPqQg6aJj0u/lajWLfYlgNyAsBFWzJvprEvfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6SCd5gN; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6SCd5gN"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7350fd4efdso20820a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 23:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772264975; x=1772869775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQsyceTj+Q/vii9FVOmBz/AIAH+opjiNSPLbnguOkJI=;
        b=D6SCd5gNc4m1mjYd0Jiwxr5lpolUyIYgzhmWftF8p3EJdEo/3BNDTjCoozZgwZTrT7
         B0m/DPgrpgI3pV9RKTqMguvm7+ffkYy++FpJdfxmamJocK+vQi2XVznP+jPkvtvvyMMC
         E7jB+pQJWTNqbuijjioFKB4PoS0RrDdfNnDFMstpDakQsry2ZnNhQiDokTSWbGKOtdMM
         hCzbsEjLbkfxOVaEqjqA0I6fKDC4nfik8kxCLyof4idPwFdGM+tKsurGdx5qfoKvmQEP
         RcjFhONH1fmL15wzKwFr7wj9ePN5QCmliQ4S7XXLMNdNtOJ9g3ApuMsoa3ShDGGVbSHo
         wGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772264975; x=1772869775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQsyceTj+Q/vii9FVOmBz/AIAH+opjiNSPLbnguOkJI=;
        b=R+hnEFLKYBsTebOAQwTWTaxJ9xb8zLHF1h8dPAAfRX8dhw4uSJmtn6pvf4iefZhbZI
         grI6I3ykX86YKVYxnmhk3bDyef2PtJkFLln+6t++t0ep4RfLrhCBYuot0h9rSwouAqy6
         t9BxKCA2P1GP9uwCqAszc0reQMjUQUQSESRfhEh+U5OiRwA3NjfFbgtF9htvskYg1gnR
         mErYUGKuydgVhnmBmb1DiAthTXQD4aQ7+ejeDnk5moWfduxUt6WAs3e5oxzkRNOd0j/8
         l/mf44AgfUft+QliBINlh33sNmRbKNLtFzXTkuP82Vzp3AmP/7geoMrkdiH1fF4EOMiz
         HpVw==
X-Forwarded-Encrypted: i=1; AJvYcCVtcQN+AYW3DD0PfK3sMEaMyopXCpVPG3ZIzDb9ZHzydrHaapa9eTGeMGN5+bkhA8QGQa4a2AnwGw33eY7YS2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIY+MqvtUhtqERHfeLL5q+qlnvcHSMWH03XFtxSbSNcI6ozg4k
	Er0VVjzT379+b0/iCy+BpLgy/tAM5NceTjqpT5dCaxnpCiSJgKhVREzn
X-Gm-Gg: ATEYQzyaZT7AOxVGxvRwWCLX7qzW62GFNzLYL06wbaKy0iFU2Bby4Mi1AXiljhOz8lk
	2g7ovS/0fejgWCcr8+Yp0OxjgjF8IYoFOZa4enxtyXWW3BJehMWp9jSRqmBj8wPbWFB/YFfcoJ0
	m7ft7+Jf79PnrcbI7VNKBJ+WjGiZlRhcdoa4lNgqIj8Mj3uvfLq1dTRScgTlcnsDOVIMOKCBWaa
	ugjgiPqHrnpq2qqNKN+Qy3N6foVCErxImd+TPdfJdmfk855UvCRnfufPa1O2Yjg+MXzecbCRIbU
	Sur29cuztkXJzsivcd9AaHs/mij+sz8M1Lobx9Uncf5qOZCIEHh7p9QSzf567xny+7C5ozxyY9k
	vtr18OR0Km1yjTiplJMWJNIhv8n30ek/aeSQ2O7UKU/ZJRbEL9D0/XdIJzYylyQBgrdSwzOz4iQ
	OjKpJ3WLzPNFfLaAIrqlbLHmTcXctHijPgSdoJLapUHByxua07dydjAO4zZoM9ZMI1m4K/
X-Received: by 2002:a17:903:3c25:b0:29e:9387:f2b0 with SMTP id d9443c01a7336-2ae2e4bb1fdmr59084675ad.39.1772264974773;
        Fri, 27 Feb 2026 23:49:34 -0800 (PST)
Received: from strange.. ([2405:201:e066:f03e:b47a:832e:ca46:7937])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5db596sm81457605ad.35.2026.02.27.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:49:34 -0800 (PST)
From: mr.navi8680@gmail.com
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	Naveen Anandhan <mr.navi8680@gmail.com>
Subject: [PATCH] selftests: tc-testing: fix list_categories() crash on list type
Date: Sat, 28 Feb 2026 13:17:35 +0530
Message-ID: <20260228074735.10438-1-mr.navi8680@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naveen Anandhan <mr.navi8680@gmail.com>

list_categories() builds a set directly from the 'category'
field of each test case. Since 'category' is a list,
set(map(...)) attempts to insert lists into a set, which
raises:

  TypeError: unhashable type: 'list'

Flatten category lists and collect unique category names
using set.update() instead.

Signed-off-by: Naveen Anandhan <mr.navi8680@gmail.com>
---
 tools/testing/selftests/tc-testing/tdc_helper.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tdc_helper.py b/tools/testing/selftests/tc-testing/tdc_helper.py
index e06f03c0fb5d..adb52fe3acc1 100644
--- a/tools/testing/selftests/tc-testing/tdc_helper.py
+++ b/tools/testing/selftests/tc-testing/tdc_helper.py
@@ -38,10 +38,14 @@ def list_test_cases(testlist):
 
 
 def list_categories(testlist):
-    """ Show all categories that are present in a test case file. """
-    categories = set(map(lambda x: x['category'], testlist))
+    """Show all unique categories present in the test cases."""
+    categories = set()
+    for t in testlist:
+        if 'category' in t:
+            categories.update(t['category'])
+
     print("Available categories:")
-    print(", ".join(str(s) for s in categories))
+    print(", ".join(sorted(categories)))
     print("")
 
 
-- 
2.43.0

