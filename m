Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA6411691
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784660658; cv=none; b=IznOEViGPgSMNZN/IqyMuny0KLTzBySZcHHeAD47W7xxULrZT9etINcuc9h3HO2oU0DhArhATrwUChONX6bk1GCIKdeLqgPN5b4+TiJhur8zoN573miAcwSUFZP9Z4SfxcUrJ5i7xs6kj+itnulifzzU3lEXlV+6jDnl+2e3ZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784660658; c=relaxed/simple;
	bh=Z4eZUu12mKAhhr7fFGJH/XFiozz/hMXcfASu5IYDxqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLM/uvPAbMt6/qthi139vqHTtp5k/AVfInQspfEY4/YhzNEWAskNo4NsxSFOrCKuUikmt52TLqtFuZ7NOQ8FsoeYQ68ySLCSXr0KC5aIOAynv3iQ3Aj9i0Po7d4A5VXjB/QJu3cEKJDycLh8R6F9iRSRwW59/lm0DolbC1oxO2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFRHNpjC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFRHNpjC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1712a04ddaso915775566b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 12:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784660655; x=1785265455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JqNpnriZg+duzi2qkjlrmcfUYuT9EqwRHf7/xL8TkI=;
        b=WFRHNpjC0G1PZD+Zhd4hXx4FuOjkMogKX9SR0aqXmxPFYDrd/6gb5LeG8J+oIK8zOo
         ztceWjR/3A1mkCn0eEg/BK3nq5/kv+cfA1AHdkS00KhzNjvZk2vIU871/4nsIXwl1yUS
         eJjHXUvr9B1mf5ZagWZnva9h43PdpyDfb3kFPpS7ocz4Sx3lDfePJmKWpp+5poP6z2Dc
         N5MG+qiGoGiPYZeTZjxDBcU+rqSaM8lxoX9pCPfiRBKghfdF1V93RiJqXNP449KBR8jL
         EeBnxtnbu7yIkOV4F0X4gawxxd07ScX3yEdj/JqgMytP64l2X90TGcvTaq7Z+04tQ4SL
         K8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784660655; x=1785265455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JqNpnriZg+duzi2qkjlrmcfUYuT9EqwRHf7/xL8TkI=;
        b=FrPranlBrdpzH/+kxZWNRJ00NxLmUKSER4ZqfALEfSmXmYBMokpFO5fRIckP+LEXuv
         ubJT4NwKwS1kmz3fTHHE8nM+8wX5RO8eeks1tynpKUy+NdJKk+nuXLeG4Dl4WkAhBM5s
         t8s95yBE2YULKclqmbHXeaM5PbbqwJCdElYkX2TdjN1TtMvaI2jwWAxSyeoboRJMB+Bi
         dMxUqPi2D9GxhIGjwN5NZHRbkHfnqESaAHUSAjwK6agJHrgSwb2bcGlYMekOkWmzCHod
         2XmurSb3fXv+mHtDtZk2DllBVgGWuhqZ0UOL0d1DzPfL44o07MbzGmcRBEPmR9WuIkgc
         0XpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpv3jPBjhhRM/ziXWDZx4sXfXAvwjFKPmQqY2bqIOdHgfWfDJMpZCid9Ztef8I4775HDslRakOt3mOKxy0sNRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjiI+5Itc/Pix47+AyQ0rF7bOlCBG3/8aED9q5ebhiCBJiYKv
	a9Hi5CYrIaXktO6VBkhMaaMxC6p2XzehesHd/UHGh/ozf0UGfq7WVpeW
X-Gm-Gg: AR+sD11kFQwqYRa9OVSAxaC+mT9P50/Wa088tMTs3ikgKrnvvqtMHg3EQnigwkXkjFS
	AOHI5DXF1PM3EI7QSrautzsp5KU/tILybJ+OR6N5Q87QEWP4/BWCCw0oykwqow3zgKfgwsCL830
	ZepgW9hQmcd/9kmRKi8gBNk9z7t94gA3upkSKQPT+Mo2huajWJZRy90jLbW2da1KcJshz7QC5H5
	DSA4L5XSIpxIeXTE2dSeCcXbG3/oDoY5l/7aYvflPWd63BjqvHQRvSRuNC6xOhZotPbyOultStT
	g4u97nO4vd5+fc9TMvEBUr/OTOIV37E/qFbQw6VKSmdTmSMeS4oC1AQqcziye5fU8l1BZIz8Fop
	sTZFPK5gTBuHtYoPlakUvY8JQ5s4XiVpu36FhUBBXdqwzrMfDm+2qYyfojDviV6QD4QLyThTaXD
	olmZVGcQYjAZAAKtxr6mY1NXGxDhnh5Toi5giZGqn4DY076K9qk6zmI02EplWU9FEEqHc3LKU7j
	O2P
X-Received: by 2002:a17:907:3d45:b0:c16:1901:6ba1 with SMTP id a640c23a62f3a-c16b47c50b7mr857110866b.34.1784660655267;
        Tue, 21 Jul 2026 12:04:15 -0700 (PDT)
Received: from misharu.home (2a02-a463-a071-0-1315-eb9e-fdea-db07.fixed6.kpn.net. [2a02:a463:a071:0:1315:eb9e:fdea:db07])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebad78sm8903366b.46.2026.07.21.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:04:14 -0700 (PDT)
From: Hari Mishal <harimishal1@gmail.com>
To: SJ Park <sj@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hari Mishal <harimishal1@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/damon/sysfs.py: clean up sh processes used for obsolete_target test
Date: Tue, 21 Jul 2026 21:04:04 +0200
Message-ID: <20260721190404.135937-1-harimishal1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The obsolete_target test spawns three sh processes and uses their pids
as DAMON monitoring targets.  These processes are created without their
own stdin, so they inherit the test program's stdin, and they are never
waited on or told to exit.  As a result, they are left running (or
become zombies) as orphaned children after the test program exits.

Give each sh process its own dedicated stdin pipe instead of inheriting
the test program's, and after the targets are no longer needed,
communicate() with each process to close its stdin.  This sends EOF to
the shell, which makes it exit, and communicate() then reaps the
process.

Signed-off-by: Hari Mishal <harimishal1@gmail.com>
---
 tools/testing/selftests/damon/sysfs.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/damon/sysfs.py b/tools/testing/selftests/damon/sysfs.py
index aa03a1187489..d3d50a5a1d56 100755
--- a/tools/testing/selftests/damon/sysfs.py
+++ b/tools/testing/selftests/damon/sysfs.py
@@ -328,11 +328,14 @@ def main():
     kdamonds.stop()
 
     # test obsolete_target.
-    proc1 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
+    proc1 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)
-    proc2 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
+    proc2 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)
-    proc3 = subprocess.Popen(['sh'], stdout=subprocess.PIPE,
+    proc3 = subprocess.Popen(['sh'], stdin=subprocess.PIPE,
+                             stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE)
     kdamonds = _damon_sysfs.Kdamonds(
             [_damon_sysfs.Kdamond(
@@ -356,5 +359,8 @@ def main():
     assert_ctxs_committed(kdamonds)
     kdamonds.stop()
 
+    for proc in (proc1, proc2, proc3):
+        proc.communicate()
+
 if __name__ == '__main__':
     main()
-- 
2.43.0

