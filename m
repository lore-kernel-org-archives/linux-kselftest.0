Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD80369965;
	Mon,  9 Mar 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089513; cv=none; b=VJRkS8Oz4tycLV8JHOdRD/VlFGI8pe9eP6V0lYVIwsaTrGNecEFmTTDdwaHGoRjbV8zA7jXacqWqT39RewjVrQTJsxGd2mz+3DvwqpLUUxM56bskEyQI7RLledtCEPpPmJq/2qdsV2sacjj/KWs5TGpY8sBXquq+gkUj/ImSgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089513; c=relaxed/simple;
	bh=336K5CmfkJMKpNJWj6UjVE6xXCo9IkZUCrRG1I9g8gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UObB7az7z27cYfuUpddHrUPvCNZKDlY+KU+qz+Kbck5mc7nqBNESKQs98eI3S7ja0TNIaeBp6u1CdXduGL/pepO+z+1U12uBQB8SuF60imYhUsM5tc7eHNBr/B+rSE4hOvinMw5CIYD6v0Z4PIq8OKdC61Our/CnTzg2Tvi/Dcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=E5sp4QRk; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="E5sp4QRk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=PALCl5n5LctpiNtDxiFBaOP8awHPoKLVQYO/zU0z13c=; b=E5sp4QRk6eRH
	rDB1FrIsuhkWWmTHGmFD0W/aBkyShGMsXvArvdfPNSeqO1ou+ycQkDSb1RmqGqygpsQLSvlCIyCpV
	ddy8q1lYnrgT8Lt7Q+agpOVxueLLoR8u+5zgdSbtttmp1SX6j6bwYpQIS0Et2vO6OVTISn2dJtLwL
	/D3zn9n60iaS/B6xC7AJWx8vXLtpN11QElu8ZeFCO6ktz16lRhatBPcktcr3CdXA2ktOXOHTv/E+x
	SCwXj3bxrJs8rMDlQM1atLNlemP/ZQV0nFbTBAqtNN7jWvUFvOwmqqgMKK9TSH9MWNCBv4EztTaDR
	RejGCM5S22uGVHQ+4PHpfg==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vzhYH-00FMfQ-06;
	Mon, 09 Mar 2026 21:51:40 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 629KplPw572789
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 9 Mar 2026 20:51:47 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 629KpkgK572788;
	Mon, 9 Mar 2026 20:51:46 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
        Wei Yang <richard.weiyang@gmail.com>,
        Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
        Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH] selftests: fix ARCH normalization to handle command-line argument
Date: Mon,  9 Mar 2026 20:51:45 +0000
Message-ID: <20260309205145.572778-1-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several selftests Makefiles (e.g. prctl, breakpoints, etc) attempt to
normalize the ARCH variable by converting x86_64 and i.86 to x86.
However, it uses the conditional assignment operator '?='.

When ARCH is passed as a command-line argument (e.g., during an rpmbuild
process), the '?=' operator ignores the shell command and the sed
transformation. This leads to an incorrect ARCH value being used, which
causes build failures

  # make -C tools/testing/selftests TARGETS=prctl ARCH=x86_64
  make: Entering directory '/build/tools/testing/selftests'
  make[1]: Entering directory '/build/tools/testing/selftests/prctl'
  make[1]: *** No targets.  Stop.
  make[1]: Leaving directory '/build/tools/testing/selftests/prctl'
  make: *** [Makefile:197: all] Error 2

Change the assignment to use 'override' and ':=' to ensure the
normalization logic is applied regardless of how the ARCH variable
was initially defined.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
---
 tools/testing/selftests/breakpoints/Makefile              | 4 ++--
 tools/testing/selftests/ipc/Makefile                      | 8 ++++----
 tools/testing/selftests/prctl/Makefile                    | 4 ++--
 tools/testing/selftests/sparc64/Makefile                  | 4 ++--
 .../testing/selftests/thermal/intel/power_floor/Makefile  | 4 ++--
 .../selftests/thermal/intel/workload_hint/Makefile        | 4 ++--
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/Makefile b/tools/testing/selftests/breakpoints/Makefile
index 9ec2c78de8ca..0b8f5acf7c78 100644
--- a/tools/testing/selftests/breakpoints/Makefile
+++ b/tools/testing/selftests/breakpoints/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Taken from perf makefile
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 TEST_GEN_PROGS := step_after_suspend_test
 
diff --git a/tools/testing/selftests/ipc/Makefile b/tools/testing/selftests/ipc/Makefile
index 50e9c299fc4a..fad10f2bb57b 100644
--- a/tools/testing/selftests/ipc/Makefile
+++ b/tools/testing/selftests/ipc/Makefile
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/i386/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/i386/)
 ifeq ($(ARCH),i386)
-        ARCH := x86
+        override ARCH := x86
 	CFLAGS := -DCONFIG_X86_32 -D__i386__
 endif
 ifeq ($(ARCH),x86_64)
-	ARCH := x86
+        override ARCH := x86
 	CFLAGS := -DCONFIG_X86_64 -D__x86_64__
 endif
 
diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index 01dc90fbb509..e770e86fad9a 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 ifndef CROSS_COMPILE
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
diff --git a/tools/testing/selftests/sparc64/Makefile b/tools/testing/selftests/sparc64/Makefile
index a19531dba4dc..88f7be76f962 100644
--- a/tools/testing/selftests/sparc64/Makefile
+++ b/tools/testing/selftests/sparc64/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/x86_64/x86/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/x86_64/x86/)
 
 ifneq ($(ARCH),sparc64)
 nothing:
diff --git a/tools/testing/selftests/thermal/intel/power_floor/Makefile b/tools/testing/selftests/thermal/intel/power_floor/Makefile
index 9b88e57dbba5..07463c2160e0 100644
--- a/tools/testing/selftests/thermal/intel/power_floor/Makefile
+++ b/tools/testing/selftests/thermal/intel/power_floor/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 ifndef CROSS_COMPILE
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_GEN_PROGS := power_floor_test
diff --git a/tools/testing/selftests/thermal/intel/workload_hint/Makefile b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
index 37ff3286283b..49e3bc2b20f9 100644
--- a/tools/testing/selftests/thermal/intel/workload_hint/Makefile
+++ b/tools/testing/selftests/thermal/intel/workload_hint/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 ifndef CROSS_COMPILE
-uname_M := $(shell uname -m 2>/dev/null || echo not)
-ARCH ?= $(shell echo $(uname_M) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
 ifeq ($(ARCH),x86)
 TEST_GEN_PROGS := workload_hint_test
-- 
2.43.0

