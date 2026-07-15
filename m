Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014347DFA7
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126221; cv=none; b=EcTq+g2ATYgEXCHGqdP4+oR0S4iUSCQFE2VxM3QyXX13+XYySqyrrER5eoZOrxFV71HO2cebBUn/ldaBzsepQyI69UyIFd/Qtzd0kS+RJ/ne7JSDjtHEHFDYCWUJwOmPpjYPqjlByQZeD79BAGqyt9/WumhNMTJTFVoYpYgreao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126221; c=relaxed/simple;
	bh=sJ1lnAh96oGS6PkaWKwiWo28un4N5cLDvAhC1dHUPHM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaSlfVHm5gmuAdkFLh88skblCnk7JvR4kqM90GSBZ7WAyPD2g7GjYb/T+zzW5sa78j/NqU9mfYL9cqNTCZhbzjiII1CwQuWJbf00a93/dMgN/pwwtH2n0ofXjSgkCK30Tdl1B4fQUH+h4i6ntGCCnQe8t0cPaf1wgapp+b61wqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpXY+2OE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpXY+2OE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2394948a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784126220; x=1784731020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rY098vF9FzwngbPPwA8WaV8xoRoA5ppO3RBZ4W8bTcQ=;
        b=qpXY+2OESiGdC4fvRezO8G5xcxnyn7a/IwysE9sgQKEgLYA+jFWBRTJ3vktwKTXLWz
         bnxzpjcK93jJhZKM6xsxdLgymq4l40TlHVOVLyEXCvfSNpOncZUP7N8NV7hiVVQx442u
         nLe8K88i29Stwi9w3TcSP6aewEgcPKKwf/db0i3bBqbpwr0+XeuJqo0PpAQYfFcPlozX
         tphDsHxSTitZoeiaU05SeQuG1+vW9uJ4nDkpORQZrZrJTp/src6xQJwhfdiDCtYgauKr
         WEVNBpFeEOVQOWaH/AguCYsjLhFRb3yV19khgd/EhdrczNSc+aY0RN42FY8TZG61mmUe
         CuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126220; x=1784731020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rY098vF9FzwngbPPwA8WaV8xoRoA5ppO3RBZ4W8bTcQ=;
        b=sSbwj5QLVK13IFvjojZXzif/x/e7lPlX5oVBYOE12rMdHKXR/BMPfnHmomgMmLl/03
         gANxrjflhqQNVHcPn9Tj9MM8p8dJv1D1GBcJTeS6h04v3Y0RSw93ffsyacXJZnlAVB5R
         z3qTUcsu1JVuM0omnDgP9xL9KVOvpDWd3/nK/+plTDiavxoln5JcpBkBec4zUZGOXF/N
         +2rVQGBSQ01AtiEx0ZGliAZQx9oHCnaOsJt2vzZFAmjPCP1dEbzBOeoJilr1OnZUJVnd
         VJdtwBWgOenu6oxcLdHwxDrVEoItQZ9DHlydS11BM6VuLna94bCJQeZucz3jndl46m0m
         d94w==
X-Forwarded-Encrypted: i=1; AHgh+RrEhDhQQ8aZPV+43uceSpRY/0mZJfY6CillJt1mM08WdNps2d6nXZtAx/Oefi1iGvTjIU1B0gtbESLZhbbw91g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/6tAQ0wRhavChvLRImREsXe7NYjwri6aQGPVFAKc7VRhlzLK
	PsSEFrPan+5JnIw4LVz1NY7ubGu4flKZOQmsgBvAd9IFAOPaDQDszeut
X-Gm-Gg: AfdE7cnVgddGecojYjUCC46yKeZnLJvpM2Cdz8G13aOYLQJmYW9JDjj+1uDsOut2Kyr
	SfX3uOhSYB7+jqa0Td6KxeWCeqrImbsynoum22w+i/C5PaMkZ0xXH4RZJArPkeyVQL//S60tyHK
	puP+iPpb+FUc5iAjovrZnHlbThpGcmeJSdJAcR5SeYWcpsl7vpexTOMVnZm8NxBdUF6mqXNxU+W
	g+xq6bifPlSqBas+yR0h1QT9Zv6BStQY056OAjxnCys+pqJRWZ3YfmtwIseIS/6Qf6tRYPPigFa
	9E04f617yMK018EnUBkXz3XK1g+Uvw4QWG2hU6y4i9ECCe/qOX1nImar8sUj86RzcQj1Ztcii22
	CQg0PdyJxiskJ804tSr9eNAG5oxauTrTwnq6qZvSBJGeEi9YEDzwYtdlu6ubjgfq2GJglB/mQOr
	tllkZzcNRxg0Shy69/V0VBqdFgz/Tocd1CxkCEAH/Ru9TDccrBwE8=
X-Received: by 2002:a17:90b:5863:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38dc73bcfdfmr16065194a91.1.1784126219729;
        Wed, 15 Jul 2026 07:36:59 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:90:2db1:3066:c473:74d2:497d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fd3e9sm2020161eec.1.2026.07.15.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:36:58 -0700 (PDT)
Sender: Deepak Rao Gaikwad <deepaksraog@gmail.com>
From: deepakraog <gaikwad.dcg@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] selftests/proc: expand smaps field coverage and require TMPFS
Date: Wed, 15 Jul 2026 20:06:42 +0530
Message-ID: <20260715143646.15828-2-gaikwad.dcg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715143646.15828-1-gaikwad.dcg@gmail.com>
References: <20260715143646.15828-1-gaikwad.dcg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gate the test on CONFIG_TMPFS in the selftest config file. Assert
Private_Clean, Private_Dirty, Swap, and SwapPss fields are present in
/proc/$PID/smaps output for the mapped executable page.

Signed-off-by: deepakraog <gaikwad.dcg@gmail.com>
---
 tools/testing/selftests/proc/config        | 1 +
 tools/testing/selftests/proc/proc-pid-vm.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/config b/tools/testing/selftests/proc/config
index 68fbd2b35..7dfc3d381 100644
--- a/tools/testing/selftests/proc/config
+++ b/tools/testing/selftests/proc/config
@@ -1 +1,2 @@
 CONFIG_PROC_FS=y
+CONFIG_TMPFS=y
diff --git a/tools/testing/selftests/proc/proc-pid-vm.c b/tools/testing/selftests/proc/proc-pid-vm.c
index 4e6a3e53f..59535bb3a 100644
--- a/tools/testing/selftests/proc/proc-pid-vm.c
+++ b/tools/testing/selftests/proc/proc-pid-vm.c
@@ -20,7 +20,6 @@
  * Test /proc/$PID/smaps_rollup
  * Test /proc/$PID/statm
  *
- * FIXME require CONFIG_TMPFS which can be disabled
  * FIXME test other values from "smaps"
  * FIXME support other archs
  */
@@ -409,6 +408,10 @@ int main(void)
 			"AnonHugePages:         0 kB\n",
 			"Shared_Hugetlb:        0 kB\n",
 			"Private_Hugetlb:       0 kB\n",
+			"Private_Clean:         4 kB\n",
+			"Private_Dirty:         0 kB\n",
+			"Swap:                  0 kB\n",
+			"SwapPss:               0 kB\n",
 			"Locked:                0 kB\n",
 		};
 		int i;
-- 
Deepak Rao Gaikwad

