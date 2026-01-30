Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D535295C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764378; cv=none; b=CcLjHMZomBqHz/YM6LF4n/GfstV8rTSl7M3E7Q/pyuYEfIh+VRUKAccmgOz7WbTd59OekzpjbRW10JqAnFI+7TBluOJc95ZnGSLk3SvKT7aruDEby9UV8+J6X+C0dNJzGgIddwER12Y5fJwCLXCuc1OqNiKDoqJWMIKVeUvISlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764378; c=relaxed/simple;
	bh=tVSU1w5x5sqFlUfPefz5QPNvQ7ShmBvFI0HEu15jk9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLts6chpLNVEmTbzce4bSI9oM5nRpM9F4kvKA9brSnhMsdc+cb+nAmerlKOChSwfqGGCM5wW/ePXIehjZ2wMRoEnRcNId6HA2JDzS0LGyNxUhl+kVPAfJew0qZ5zK0qezO3GX86ckqNaH1YOR4XG15PUWtTKgGqAK6T6CePr/ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHkYlsOJ; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHkYlsOJ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649523de91fso1745481d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 01:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769764375; x=1770369175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqsnWikU7Lohq8AD8p2s7XQz/GMEbrveKNhDBDZTgGs=;
        b=hHkYlsOJkVN2yOPWTIzxlQSqBnib6rCkTSb9hSkp7dQ9iaqChv44lPVraJsUrvh439
         WsIHIGSIjVBtrjwHolr4GnjmP9mqOsB3s2mW7rYa/i6u4cBRaYeDMHFk+UabTcL13sbN
         Y1sm4628cS93WkafOwCiZr0s5z7+3JY2XAaSG3gx6Nwm/Fwc4t1i6MmEbyMdtTkuhHvn
         3EOyAeQlxkZsqDAfCMKwpeaiv5zybwtZ+o6OUtl6pQdDK7ntX+frTfv4KaorL+fAFRso
         TW/fla1ecuWSG15jCp/H/af7DdoGuCaOIr+mJZqf7kjWM6uC7II28H++6R/gXfLKeyzo
         zKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769764375; x=1770369175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqsnWikU7Lohq8AD8p2s7XQz/GMEbrveKNhDBDZTgGs=;
        b=J5Jw6aGPXr+b2iOWpywqV3M5Yrhvm0g9g7Oei16cVLJYccDGZhuhOsv57V2Lbha76R
         tz+piZiFNwu+yPrCHqCCpAuUufPSHHJTvrQFI/gutmNTO+RYbI3R5+RFuU0iWl+WRQ6d
         pDPfsfhK7m7BVXtnPA9WwQhKTv2CxmKA3MXBA2+3VwtdkazxVc7rBi8c+EIVItmo/rWs
         UVNka98vY8pCqcncBGDS10XSWkep41MuzsSClkogRmJQ1HQcuxExQFPRXyVhJKxP2Yho
         dE5HXnegFKECgTcY23ahHPxhzPOEo1y8/xECBZf1alBG1GYGirFzlUBXeZ6RROrIvYHS
         2WPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+kvYDRE+aOR0blozqYrjweebLsfVt7hBhTh9fjYaKS6qQuN7eankXMgMycIghxbTLacF5Fsm2J3up48USWJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwibRe1gEML26a/1I51yhSZD6cgka2w0OlQOp8x8Ag65zh48JDX
	XX5xrhIYXay8ZgJ7g87vJeuTe4/LtXwS3FXOPMFEjWffNx/GHvHpa/z1YHr/H7+x
X-Gm-Gg: AZuq6aLTzfLzThVqkGQ2+mbhtLRuL6Wd/H+o1Y/y54RICfeX7tnvsuBNMtsyYEUHciN
	8yk/npFipIwLGarb2nB2tPaYIln4knspnon012fmryaOZtoHAK36I/sb03yaqGkAvELpRYGG5Zk
	X8mPV2y9EzUQ9vkPVEgclzNXwstNyA2ao7Fsm341opd9KITlqjAVX4pkYDK6mmUc8U8s1y50ohw
	0m+7rdQ1fmbPp84hIaJCY/LABw49lZSOGR7OT+fBCy9v1/m6aVqU+eCOrwhny1V6ue+dSFSk0IL
	n3ExeKa7zoYW2wDVPw7wDjYKQtGkNXUe7GW1iI4j/qGqq4nIB3P7F7J9jhCiZqzLtU/rd1YnIVi
	qvd3qXukQTubqd7l70t89C53QTRLSNSP4dy+yLWk/yM4d+OUoexvQzK2ohFVJdGlX3BwQfF6aiR
	jYQxGkghMOA4LSSko4bn1LSI6mtOdox8fjk3z3HczQOFr6kaRmSjTT26jekkHVFLv1U/AXyTjN5
	c7A8BNUbKJOc1lmg+kqXwLZDR07FQ3hHeZcsF1b7NouAxw=
X-Received: by 2002:a05:690e:1688:b0:644:6ad4:fdfd with SMTP id 956f58d0204a3-649a84ee166mr1735838d50.71.1769764374801;
        Fri, 30 Jan 2026 01:12:54 -0800 (PST)
Received: from u2404-VMware-Virtual-Platform.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64996063f90sm3436470d50.2.2026.01.30.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 01:12:54 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net
Cc: andrii@kernel.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/bpf: skip deny_namespace when bpf LSM is not enabled
Date: Fri, 30 Jan 2026 17:12:45 +0800
Message-ID: <20260130091245.3824029-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

deny_namespace/userns_create_bpf relies on BPF LSM being active in the LSM
chain. When /sys/kernel/security/lsm does not contain "bpf" (e.g. virtme-ng
default), this test can't validate the expected EPERM behavior. Reporting
FAIL in that case is misleading noise for CI.

Detect missing bpf in the active LSM list and skip the test with a short
hint to boot with lsm=...,bpf.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/deny_namespace.c | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/deny_namespace.c b/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
index 1bc6241b755b..5fb31912dd98 100644
--- a/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
+++ b/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
@@ -5,6 +5,7 @@
 #include <sched.h>
 #include "cap_helpers.h"
 #include <stdio.h>
+#include <string.h>
 
 static int wait_for_pid(pid_t pid)
 {
@@ -46,6 +47,36 @@ static int create_user_ns(void)
 	return wait_for_pid(pid);
 }
 
+static bool bpf_lsm_enabled(void)
+{
+	FILE *f;
+	char buf[512];
+	bool enabled = false;
+
+	f = fopen("/sys/kernel/security/lsm", "r");
+	if (!f)
+		return false;
+
+	if (!fgets(buf, sizeof(buf), f)) {
+		fclose(f);
+		return false;
+	}
+	fclose(f);
+
+	buf[strcspn(buf, "\n")] = '\0';
+
+	for (char *saveptr = NULL, *tok = strtok_r(buf, ",", &saveptr);
+		tok;
+		tok = strtok_r(NULL, ",", &saveptr)) {
+		if (!strcmp(tok, "bpf")) {
+			enabled = true;
+			break;
+		}
+	}
+
+	return enabled;
+}
+
 static void test_userns_create_bpf(void)
 {
 	__u32 cap_mask = 1ULL << CAP_SYS_ADMIN;
@@ -88,6 +119,13 @@ void test_deny_namespace(void)
 	if (!ASSERT_OK_PTR(skel, "skel load"))
 		goto close_prog;
 
+	if (!bpf_lsm_enabled()) {
+		printf("%s:SKIP:bpf LSM not enabled (boot with lsm=...,bpf)\n",
+		       __func__);
+		test__skip();
+		goto close_prog;
+	}
+
 	err = test_deny_namespace__attach(skel);
 	if (!ASSERT_OK(err, "attach"))
 		goto close_prog;
-- 
2.43.0

