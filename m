Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057836D4F8
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542770; cv=none; b=ly81mI+raG4MEAtSJGRQ67ujGlI5i2U01n/mOe6TKkBCsVO4DDRUTq0dd7Ynq+j1grAxpWXY3aAleOXl7raDBtswiDDTHxMQfVFSJwvSExhFiN80Us2YWhZOJsreo+z/cdRvr0MOiLMJa5cQNaHgb/ch8HwtGcNJQUU5BBMQQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542770; c=relaxed/simple;
	bh=g6k7zzUsrT7F487MO4zf2ZQi4xNe9hcuQHBGVzU3D4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rovhF4UM2goZV/8/1VkhkxSr6KljvHXWNxqp/4oUFIdBX38grozh3IoUCGZ3rvc/Z5yI72plZ8/cuvVxEQzJzBeJG+GA9YfCacYEMPUoWccuWiyDpkYS8P7qaMJTizdMwAiYPaaKjiVYbX+uGzf87J5Ia+YgyTNIDZJwWN7R75A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZFzzsc0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZFzzsc0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso12176127a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 11:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769542764; x=1770147564; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSbmEUZcW8Nu0dPxbuGEHIOk7OwoB0RMeyMHkhwbJas=;
        b=nZFzzsc0hUHBBgS1vIhmtsIYXNEyZnoXazGfK2lLUYFCVotRAHgXY/M65lWfkIYggb
         O8VS4z+7kOYTx6Ucbq8YOYETcm3sF46Na9/MoOt7qluE99EyoA//PxuGMZOPT8O5Q+ri
         bORdpmYoIEycf9ejwKTyPa1w9y/YkbXrB/gF2JF2O44C9x1iNLn28fwYeTEU3yr2EVDV
         8+J4rtstSyN+76PsSt47nu7szCUgE1/n+FyyF1zQVcdUDQnjpP0PSnVuue5VtulrArcb
         PelPdlcNismPIIK+w8TVEBbd7aHiBNLOzl/y1dRYa91qEOhYvHx5dkOwdsWh4jeJjOe3
         sJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542764; x=1770147564;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSbmEUZcW8Nu0dPxbuGEHIOk7OwoB0RMeyMHkhwbJas=;
        b=YLHzWu77lBvQTfZh+01Cf/OxIqlLLCTRHlp1GY48pjn/jBzlDbeWAVn4WJ7L7F/WFy
         puh4EhO4VL8N5iQD6xxGAmssfnGPYZZrA66tsAGQvPSqlrJPojtyY8x0twtoM0IHB3H/
         rir+Pf2NStZkcFXwslnbjQ3lbZdr4AI9xHvwzD+KrE7GN81g0r1VVgX1Dx99iWm2UOgG
         VvWLzl6XUo0KS9Hld1O1fx3106z2MtJWKkxtLHUftpzdwHuoJeYVuo0JALOyrzj3fBFY
         DfbiC1GSX01bCyyBkGeVDStpvq0dzyjyZdU6aKfiW8/w6g/knK+JVCR6iLW6MjV7Py+/
         ivyg==
X-Forwarded-Encrypted: i=1; AJvYcCWS+0CyS4Q99ip5ehLh1vv+XDOE2MSSlqx44JdqfWgiNY2TyLriTqFpVVvDrJIQ43MrAw2H/lIUl6DQ8O82yb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5u39fSYkwL9QX2EGCNLOhCpjAo0ikai1DdYEl5C05iyju0L6E
	dIutznR6hi+eLAHdeEwvyGSanTG2jV1qNe3bR4M3onOpZw9lOoC+evrK
X-Gm-Gg: AZuq6aI/AbRIBsQEcIFgiLewVSxxSWjSxrhLQvfds8YMXkp7EWyxBWfTNgIOCKYNVvS
	BuVCVReGihyO0e/PMnnh9ninZpoIienHGvI1kmkDIGi8XAR1A4jSLZnMeuXrskVD04b5z5B6igL
	eB1GBuGr6jNDAPi/NM5sCQS67vGvfy/gal4g6CgrFMSRdP4JpUBs8H1ULwi8NOCnfkUlG5ik5DG
	NWzgOFaOzN22HREyuDcwX2nq+Pek3LTSkwnCG2Sfcsa3degvLBWvG3CrtsX8jlMZnwGbUhnbN1k
	SAcYV+ireuxgQvQlT1rWUVa5TD+Fi131/ujd4K/AquocSNmKPZ4C4zBjSA96eicONSmofDplvnO
	Q2gCRrbfhde95qWG2b/TVSqED2fURyxzerDL4KxqMuYI/Ok+DLr1flqZhuMR9l1RAVKQZHfSHxY
	AwWXvCsC3iP/W75A==
X-Received: by 2002:a17:907:743:b0:b88:411c:fcbf with SMTP id a640c23a62f3a-b8dab28d5b8mr227101466b.12.1769542763675;
        Tue, 27 Jan 2026 11:39:23 -0800 (PST)
Received: from [192.168.1.243] ([143.58.192.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc6685sm22433266b.17.2026.01.27.11.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:39:23 -0800 (PST)
From: Andre Carvalho <asantostc@gmail.com>
Date: Tue, 27 Jan 2026 19:39:20 +0000
Subject: [PATCH net-next v2] netconsole: selftests: Move netconsole
 selftests to separate target
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-netcons-selftest-target-v2-1-f509ab65b3bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQrCMBBFr1Jm7UiTRouuvId0EZNJG2gTyYRSK
 bm7obh1+fi893dgSp4Y7s0OiVbPPoYK8tSAmXQYCb2tDLKV11ZIiYGyiYGRaXaZOGPWaaSML2G
 t0K7X8qKh2u9Ezm9H+QlVquKWYajL5DnH9DkuV3Hsv7r6W18FCrTdreudUkYZ+RgX7eeziQsMp
 ZQvLLOy2sgAAAA=
X-Change-ID: 20260122-netcons-selftest-target-b1dd1af7a25a
To: Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, Andre Carvalho <asantostc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769542762; l=10027;
 i=asantostc@gmail.com; s=20250807; h=from:subject:message-id;
 bh=g6k7zzUsrT7F487MO4zf2ZQi4xNe9hcuQHBGVzU3D4w=;
 b=ahjUZtSUNXgxupp+8CwZFXKv/EsOb7a5HAAKBYSHPvjFzPBo/mYk9B6b/bqQoz/YakGW4TIuf
 zqgLndsiBezASxDzT/OBG9f+JLjT+QhsMxYoJEwVqY5cxQiLlLFXfHW
X-Developer-Key: i=asantostc@gmail.com; a=ed25519;
 pk=eWre+RwFHCxkiaQrZLsjC67mZ/pZnzSM/f7/+yFXY4Q=

This patch moves netconsole selftests from drivers/net to its own target
in drivers/net/netconsole.

This change helps saving some resources from CI since tests in
drivers/net automatically run against real hardware which are not used
by netconsole tests as they rely solely on netdevsim.

lib_netcons.sh is kept under drivers/net/lib since it is also used by
bonding selftests. Finally, drivers/net config remains unchanged as
netpoll_basic.py requires netconsole (and does leverage real HW testing).

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Andre Carvalho <asantostc@gmail.com>
---
This was initially discussed in [1] when Jakub pointed out new tests
were failing on HW runs. I'm not sure if the CI is going to
automatically run these or if some changes are required on NIPA in order
to do so.

Link: https://lore.kernel.org/netdev/20260120172057.6600eefe@kernel.org/ [1]
---
Changes in v2:
- Removed unnecessary "*" on maintainers entry (Breno)
- Link to v1: https://lore.kernel.org/r/20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com
---
 MAINTAINERS                                           |  2 +-
 tools/testing/selftests/Makefile                      |  1 +
 tools/testing/selftests/drivers/net/Makefile          |  7 -------
 .../testing/selftests/drivers/net/netconsole/Makefile | 19 +++++++++++++++++++
 tools/testing/selftests/drivers/net/netconsole/config |  6 ++++++
 .../drivers/net/{ => netconsole}/netcons_basic.sh     |  2 +-
 .../drivers/net/{ => netconsole}/netcons_cmdline.sh   |  2 +-
 .../net/{ => netconsole}/netcons_fragmented_msg.sh    |  2 +-
 .../drivers/net/{ => netconsole}/netcons_overflow.sh  |  2 +-
 .../drivers/net/{ => netconsole}/netcons_resume.sh    |  2 +-
 .../drivers/net/{ => netconsole}/netcons_sysdata.sh   |  2 +-
 .../drivers/net/{ => netconsole}/netcons_torture.sh   |  2 +-
 12 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3df85fd5acd..ee9c76cc0561 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18021,7 +18021,7 @@ S:	Maintained
 F:	Documentation/networking/netconsole.rst
 F:	drivers/net/netconsole.c
 F:	tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
-F:	tools/testing/selftests/drivers/net/netcons\*
+F:	tools/testing/selftests/drivers/net/netconsole/
 
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 56e44a98d6a5..450f13ba4cca 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -22,6 +22,7 @@ TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
 TARGETS += drivers/net/bonding
+TARGETS += drivers/net/netconsole
 TARGETS += drivers/net/team
 TARGETS += drivers/net/virtio_net
 TARGETS += drivers/platform/x86/intel/ifs
diff --git a/tools/testing/selftests/drivers/net/Makefile b/tools/testing/selftests/drivers/net/Makefile
index 3eba569b3366..8154d6d429d3 100644
--- a/tools/testing/selftests/drivers/net/Makefile
+++ b/tools/testing/selftests/drivers/net/Makefile
@@ -15,13 +15,6 @@ TEST_PROGS := \
 	hds.py \
 	napi_id.py \
 	napi_threaded.py \
-	netcons_basic.sh \
-	netcons_cmdline.sh \
-	netcons_fragmented_msg.sh \
-	netcons_overflow.sh \
-	netcons_resume.sh \
-	netcons_sysdata.sh \
-	netcons_torture.sh \
 	netpoll_basic.py \
 	ping.py \
 	psp.py \
diff --git a/tools/testing/selftests/drivers/net/netconsole/Makefile b/tools/testing/selftests/drivers/net/netconsole/Makefile
new file mode 100644
index 000000000000..b56c70b7e274
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netconsole/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_INCLUDES := \
+	../../../net/lib.sh \
+	../lib/sh/lib_netcons.sh \
+# end of TEST_INCLUDES
+
+TEST_PROGS := \
+	netcons_basic.sh \
+	netcons_cmdline.sh \
+	netcons_fragmented_msg.sh \
+	netcons_overflow.sh \
+	netcons_resume.sh \
+	netcons_sysdata.sh \
+	netcons_torture.sh \
+# end of TEST_PROGS
+
+include ../../../lib.mk
+
diff --git a/tools/testing/selftests/drivers/net/netconsole/config b/tools/testing/selftests/drivers/net/netconsole/config
new file mode 100644
index 000000000000..a3f6b0fd44ef
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netconsole/config
@@ -0,0 +1,6 @@
+CONFIG_CONFIGFS_FS=y
+CONFIG_IPV6=y
+CONFIG_NETCONSOLE=m
+CONFIG_NETCONSOLE_DYNAMIC=y
+CONFIG_NETCONSOLE_EXTENDED_LOG=y
+CONFIG_NETDEVSIM=m
diff --git a/tools/testing/selftests/drivers/net/netcons_basic.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_basic.sh
similarity index 98%
rename from tools/testing/selftests/drivers/net/netcons_basic.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_basic.sh
index 2022f3061738..59cf10013ecd 100755
--- a/tools/testing/selftests/drivers/net/netcons_basic.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_basic.sh
@@ -18,7 +18,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 modprobe netdevsim 2> /dev/null || true
 modprobe netconsole 2> /dev/null || true
diff --git a/tools/testing/selftests/drivers/net/netcons_cmdline.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
similarity index 97%
rename from tools/testing/selftests/drivers/net/netcons_cmdline.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
index d1d23dc67f99..96d704b8d9d9 100755
--- a/tools/testing/selftests/drivers/net/netcons_cmdline.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
@@ -12,7 +12,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 check_netconsole_module
 
diff --git a/tools/testing/selftests/drivers/net/netcons_fragmented_msg.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
similarity index 98%
rename from tools/testing/selftests/drivers/net/netcons_fragmented_msg.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
index 4a71e01a230c..0dc7280c3080 100755
--- a/tools/testing/selftests/drivers/net/netcons_fragmented_msg.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
@@ -16,7 +16,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 modprobe netdevsim 2> /dev/null || true
 modprobe netconsole 2> /dev/null || true
diff --git a/tools/testing/selftests/drivers/net/netcons_overflow.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_overflow.sh
similarity index 97%
rename from tools/testing/selftests/drivers/net/netcons_overflow.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_overflow.sh
index 06089643b771..a8e43d08c166 100755
--- a/tools/testing/selftests/drivers/net/netcons_overflow.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_overflow.sh
@@ -13,7 +13,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 # This is coming from netconsole code. Check for it in drivers/net/netconsole.c
 MAX_USERDATA_ITEMS=256
 
diff --git a/tools/testing/selftests/drivers/net/netcons_resume.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
similarity index 98%
rename from tools/testing/selftests/drivers/net/netcons_resume.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
index fc5e5e3ad3d4..cb59cf436dd0 100755
--- a/tools/testing/selftests/drivers/net/netcons_resume.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
@@ -20,7 +20,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 SAVED_SRCMAC="" # to be populated later
 SAVED_DSTMAC="" # to be populated later
diff --git a/tools/testing/selftests/drivers/net/netcons_sysdata.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
similarity index 99%
rename from tools/testing/selftests/drivers/net/netcons_sysdata.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
index baf69031089e..3fb8c4afe3d2 100755
--- a/tools/testing/selftests/drivers/net/netcons_sysdata.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
@@ -18,7 +18,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 # Enable the sysdata cpu_nr feature
 function set_cpu_nr() {
diff --git a/tools/testing/selftests/drivers/net/netcons_torture.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
similarity index 98%
rename from tools/testing/selftests/drivers/net/netcons_torture.sh
rename to tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
index 2ce9ee3719d1..33a44adb6f8f 100755
--- a/tools/testing/selftests/drivers/net/netcons_torture.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
@@ -17,7 +17,7 @@ set -euo pipefail
 
 SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
 
-source "${SCRIPTDIR}"/lib/sh/lib_netcons.sh
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
 
 # Number of times the main loop run
 ITERATIONS=${1:-150}

---
base-commit: 62777c8015f3d86ab7853790192b24f0cee8a647
change-id: 20260122-netcons-selftest-target-b1dd1af7a25a

Best regards,
-- 
Andre Carvalho <asantostc@gmail.com>

