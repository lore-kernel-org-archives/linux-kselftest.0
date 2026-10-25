Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913403;
	b=p0FPHaTy22toVq7bs+ZB+Boc4Ei9W64ERMeq01W9+2OXMwWOzW/w7jT//FFoUU6DFq7d
	 gK7RbN7zxsZtSLFyu+sZ4pZJ8FNF953/DW6Gdp9PaM+JUe+hsnox2oh46VuIe8+y70+/h
	 EqWtLIBRJKkoku0FJezjYTCmsw8vVc8zoluCGB3wTgJJ7yRCKbRO2aEZ1fwcXz3hoMNI/
	 O5Oad/PUZP2MOVBOLDvb7ZVm41CYqmlL8TAGLb2lIuDu4aEN0ZQnDWPsX3Rqfzj3j4AwY
	 cyflVeCFrDOlNCHjd1Wv5V82QCMMEcmVspivMHwwI5OPMgK0Udk0wpRvyY6uj79rw7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ca84V1D9B8Ybj/7LgOQ6VhiC3u886cles4dpmUcGdP0=;
	b=KVd8l+yGR1gKRn4+J3NfLl06JbyVKBgBAuGp6yKIVFvGcfStSE1TZe9kHmrGvxD5ndLW
	 7a5MPkdb3kOkfBGSLf6FIVSRCfP3mFHWzlHoQOY1a6fD0hWAt/aDZqXF2Ia2iKbPv/mo2
	 4tPuFQS9Lj3r/oPLQDregTAbXPg6EqwFWKXQ+X8Ne7fi3WMZMCGPiztMMPjVkbsPfYP8o
	 Pmr4haSfaAiWvhVM9e5pIY2K4wQxM9X5GDE/aO+rhtG9XzIu+nyzl0vQ3P7e+Eh3SOQg0
	 NDTlpjzghGRPn8oAr8uVJ4z+GMDCy4xajCCcQY+7n6fn7yjuvnh0zratKbAb4Gu81EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sbXu8TmW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F60606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 07:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sbXu8TmW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd76b1361dso11205635ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792913401; x=1793518201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ca84V1D9B8Ybj/7LgOQ6VhiC3u886cles4dpmUcGdP0=;
        b=sbXu8TmWoOHQrI8owKBYY+cShhIySq2CbLFlzir2i5fc2R9j8kIlcd1bA32HTv1ljK
         s1c2pu7rkeKozyEjYZYB2Se7ES828YwyltBHAF4G/PBj12X2ENqFNv/QOHoiHY85ldEr
         Er99edSVkY9kP97jiC21DjEYoMpySlGGzgtBxikkbnOTpQEXQa+wAMHSOZ2Y3lnJEcjn
         XcnLmHktz3Z6c3s1dTd4bxl3NmpHIGbdFh63JcXGLlyERo9Jc0iuoGSp+HNZQzv9KW1g
         njhcF7ceKgvztm6cz8xMA+PAGFaFY/iqmp6RtdZFZXfbcQ7PimdO446S0ZuU/OBO4xt0
         U6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792913401; x=1793518201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ca84V1D9B8Ybj/7LgOQ6VhiC3u886cles4dpmUcGdP0=;
        b=P/jK8LU2SIJC5AFohTMDJlst/7vr45gr9LeYYx8u3qbeEcjbmJxjJCzLj1L0plZ2Em
         mM2lPQn2fLC+0tGJkdDwd9sEuv342U0ClZKIMSh37LLVhf7kx4HJrou/iuVL7Db5Qtw1
         m0XSVet81I1mshpzfcXTlpouwyfMHtWbDHK1lfYOV5eIaWkTIvQM5XJK8y/fnnhN1Pos
         AwcD7RBU6DeF3x7w7mGowIU7KINV80R5MWJM2DjVPtDTN0mAoznJfqQjegwG5pxBNtVc
         P9Eg7T6agXeUGm2ySlw3xTiBk4buapi4cdU/baRiaePkahQ9jeP8yergXCRAfeQG/P35
         GsSg==
X-Forwarded-Encrypted: i=1; AKwUvBwaKekJKyTH7qdvZQzNH/6Rxf1Lln7fiMViy7mF69YhC5eY/38X4Rhxn/UtkTI7VqzEsYRCv1B+JxqpK8ZrkqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzMbqwuKZcEgHPt41OIErJj0tYN3tWrJUddU8jDQpWeH+tCmZn
	LMUwoKuDGylFfxT41M1fooJYcuVki4f+dYDYbz3QQZe9ahFHm4exF/az
X-Gm-Gg: AYBFou1lqcEoHk/ujeWermfk5w5NDfcy4u3hZrc2fKlpXpHQanh5+BmcsbeykG6rujr
	eDCKYWxD94UePMdhUuRA/i9f7JbunWEMvcCbrjcIq2uPD3BT0RWqTR2ZlcOddHiNQs+BI1+hlf0
	b0fUlGqZglC0knRl8xp6wZoIk036CqhZHKy6OPfj8kBfxpgFPYoawrO1jkhM2Zi7pqYSdRLHbX6
	dL3ZWqggvhDaV7CI6c8NFC2qZgxiXCQThL8QbM1Q0606jkDOBNBs7mxVzcZHzAs2+QUWVEAUQTJ
	fn8sZ5g1L13LY2dXOjPYOjxeLTmppVhbPrR6Sk4Dfk5E8/WcMSfMUb979QfIWiFPIC2vg4tIDLw
	d+UvLjkoGylzHAThsuzQk3z1j0JrTburKWYg75QHmPPGtvhStdbphP8qrqdMBLNgJ4JfQ2rU4eQ
	Iu+dVipHAH70tR851SvfuNdo+7cc5bd1FqrFfcCEXdUjNSzP6KiJLBostOvLQJZ30ady7V+0v/r
	p8iLCnW715NPaSSN08+1Uohn8+YtzGUCg/8wRDxJ0KNQIZk1/hEZgY=
X-Received: by 2002:a17:902:ce03:b0:2e2:e3aa:7a35 with SMTP id d9443c01a7336-2ea9c7fb4c2mr32015315ad.36.1792913401389;
        Sun, 25 Oct 2026 00:30:01 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121725sm7788525ad.14.2026.10.25.00.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:30:01 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/ftrace: Add debugfs requirement suffix
Date: Sun, 25 Oct 2026 16:29:41 +0900
Message-ID: <20261025072956.1739981-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a :debugfs requirement suffix to check interfaces under debugfs.
Use it in the kprobe optimization test to report unsupported instead
of failed when debugfs is unavailable.

Tested on x86_64 with QEMU:
- debugfs not mounted: UNSUPPORTED
- debugfs mounted: PASS

Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
---
 tools/testing/selftests/ftrace/test.d/functions        | 10 ++++++++++
 .../selftests/ftrace/test.d/kprobe/kprobe_opt_types.tc |  4 ++--
 tools/testing/selftests/ftrace/test.d/template         |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/functions b/tools/testing/selftests/ftrace/test.d/functions
index 826141e299e5..3cf8ac5fb4d4 100644
--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -145,6 +145,7 @@ check_requires() { # Check required files and tracers
 	p=${i%:program}
         r=${i%:README}
         t=${i%:tracer}
+	d=${i%:debugfs}
 	if [ "$p" != "$i" ]; then
 	    if ! which "$p" ; then
                 echo "Required program $p is not found."
@@ -166,6 +167,15 @@ check_requires() { # Check required files and tracers
                 echo "Required feature pattern \"$r\" is not in README."
                 exit_unsupported
             fi
+	elif [ "$d" != "$i" ]; then
+	    DEBUGFS_DIR=$(awk '$3 == "debugfs" { print $2; exit }' /proc/mounts)
+	    if [ -z "$DEBUGFS_DIR" ]; then
+		echo "Required filesystem debugfs is not mounted."
+		exit_unsupported
+	    elif [ ! -e "$DEBUGFS_DIR/$d" ]; then
+		echo "Required debugfs interface $d doesn't exist."
+		exit_unsupported
+	    fi
         elif [ ! -e "$i" ]; then
             echo "Required feature interface $i doesn't exist."
             exit_unsupported
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_opt_types.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_opt_types.tc
index 9f5d99328086..25f7192f887b 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_opt_types.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_opt_types.tc
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2023 Akanksha J N, IBM corporation
 # description: Register/unregister optimized probe
-# requires: kprobe_events
+# requires: kprobe_events kprobes/list:debugfs
 
 case `uname -m` in
 x86_64)
@@ -22,7 +22,7 @@ for i in `seq 0 255`; do
         echo  "p:testprobe $FUNCTION_FORK+${i}" > kprobe_events || continue
         echo 1 > events/kprobes/enable || continue
         (echo "forked")
-	PROBE=$(grep $FUNCTION_FORK /sys/kernel/debug/kprobes/list)
+	PROBE=$(grep $FUNCTION_FORK "$DEBUGFS_DIR/kprobes/list")
         echo 0 > events/kprobes/enable
         echo > kprobe_events
 	if echo $PROBE | grep -q OPTIMIZED; then
diff --git a/tools/testing/selftests/ftrace/test.d/template b/tools/testing/selftests/ftrace/test.d/template
index 2cd8947edf72..d4a2500498f6 100644
--- a/tools/testing/selftests/ftrace/test.d/template
+++ b/tools/testing/selftests/ftrace/test.d/template
@@ -5,6 +5,7 @@
 # The required tracer needs :tracer suffix, e.g. function:tracer
 # The required README string needs :README suffix, e.g. "x8/16/32/64":README
 # and the README string is treated as a fixed-string instead of regexp pattern.
+# The required debugfs interface needs :debugfs suffix, e.g. kprobes/list:debugfs
 # you have to add ".tc" extention for your testcase file
 # Note that all tests are run with "errexit" option.
 
-- 
2.43.0

