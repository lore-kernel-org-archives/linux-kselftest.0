Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B026F419FDC
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526701; cv=none; b=VW89UUhL5mwBajTZkTx8dQTvlerUuRQiW1bHeryL+Uaha/jK3oV5QKa2lrDcDXolOOzY8zWFMSGSOViJbSmOhisb6u2hHuTRBrfxiG3YfiLgoyawyfHuDhPygKyyoihzjsPVBo57Sm6C+QKdLHZwj8lF996U/6HRVKuFjnDFWyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526701; c=relaxed/simple;
	bh=XHmITKDP9yW62eRsgIDeqzrgIyJ+mbBJdIVl5GgmVRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJLjfIvhTZybbTQdwKw9X54DcdpAo3cXQ34ZGR57vaCk/MpvhV4Pqi9WKPz3S9B7REBs3gMOcTt5YOWv776FAZpRznKWEzh33NspxZxamvBcWbY86DR2m2dSXkbKhVNs7xa6FSz5fejopoPg3OenpwbSg/N+U43aLQhaE3F9Zms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4OGa1Op; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4OGa1Op"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so299331eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790526698; x=1791131498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWANYSytLBDdHLqSBUNXSEBTI/4EMCEFOvFKQnoOmao=;
        b=p4OGa1OpPjgMt85i6q23PJoPREQqCEOzvcMxY5CvyVMytYwPISJEjvz7lV5aFSLnT2
         xzsGh0EeCsnxXqHDSN3fLi0WcHnx+9DbIJvxle64+BG5oMuyl8OmTXMBpFl86MhyvoF8
         EsSLUhcoGMyugGrp2eAl/EOysIi32TFk0sEPbBYrQ5fTrjMd8rOGuGKwBwiv8Ko+4jQU
         YFx93QWbJFPJLtP6omRgV9vxjhr1X3dvbIN1AT0dobFcNUVMxr3gRWtuSvrATA89owuc
         W4YP6+kcGJuKJbMtY/lsRgP/83DmxQzw2mKm3yxFZJEy+7AscIEqKVnfXbmzyIOxL4Ax
         ldCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526698; x=1791131498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWANYSytLBDdHLqSBUNXSEBTI/4EMCEFOvFKQnoOmao=;
        b=oSwtq+7DN1L4CE0YVmDFOFbxt9lKkRPaaZngLkc1z/waZ9ekZWxbS8pd59VS9Vvh/v
         13AGgVpud3eoqSpUuxRBR0HiVJ2QFXhF2qCYpHJdEaIh5lwBkENU58djRDc+VhWao/A0
         AKzbPpuEXGHFwdwn3QERKY1YHVg+9wk8tq+tm1TKInWktX8BHx+jRM2BdHSNg5b+yN9N
         rkkEHKHnY28QGhDqoXcwB5rlAekHsVFH9jyYlhl9mXd97mepKyy1jXJWocvRumrNjyU5
         9C8g6Lqah9cIAFKCE6NCy5w27c+OXsvT71UZbj0xpp3R8h8bMnJrU5a0MJeFFJujRwao
         utWw==
X-Forwarded-Encrypted: i=1; AKwUvByrKTi25HbbfMeKmUS35HhUgtnfVvDxWAFMq9ihtc6Hx88tnSxQq8meTR8eHUycLbOg++/MRfiD81V1hoF73wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl/S5GLJW0CxZxYy8pR92J/nEfRfb2bx9ZbLUS6YRtIahjlMGJ
	/8u/Lv4dZri31dW66wDxIooCW+2pQZhTzCYiANtX0MevOsBQ4UjoYAUL
X-Gm-Gg: AYBFou2EQEMZSuFNYqvfnCiWAcccoUfzvgdGwvy9yvZ26suzbN9g6YdPOVQCuh8OV20
	cc6qCAPBtGfFtdvGJTraYH+EeD5CF3BggDHGtzFIBJsINm07330wNWRXXQDSC2NC/fFqE+sRAyr
	3K8e8yDF2g4xo7oE0WVMFTD7ghq3ml8RkS3xkx6B9SkqlQ+rkn4Ibk6jSzBaz+4sjn06WF6x3gx
	xrUn9AKjXKFZUUqc/NBEWvnoGU5ZJItKBslaozve9XoGO2sT7WC3ek+Ol4djtO93cat2LN3Nasd
	BahE6tNeq9L+3SUUJMLhaAjMGiM/Ngcx6xcXPw6vE5sgnk/Z6gxeizxAu5NyQ6IFwU7L+e9VN/3
	znYednKVp69+1qZoXcuAmbghn0CJi2Lg4Rf/BcciZhNc3Dc8GS3OmIDOY+Lehwx4X5KahkLXEFz
	k9r1rPAPdGyCPjrupyq/yhc3UTwXnevSjUKDa42MXoBxB2JE2uUPTMekVrOnmNEwNhklrnJipvj
	iohJ8Xbydu76CfOdQYEgBIoxyrKVmVG
X-Received: by 2002:a05:7301:1f15:b0:340:ef5d:3517 with SMTP id 5a478bee46e88-342711aa737mr7897926eec.15.1790526698421;
        Sun, 27 Sep 2026 09:31:38 -0700 (PDT)
Received: from 192.168.50.3 ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm22383449eec.27.2026.09.27.09.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:31:37 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>,
	co+1fe9b56e2c61be5e@bugs.sh,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH 2/2] selftests: tc-testing: cover unset TCP transport header in TBF
Date: Mon, 28 Sep 2026 00:31:17 +0800
Message-ID: <20260927163117.746432-3-bestswngs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927163117.746432-2-bestswngs@gmail.com>
References: <20260927163117.746432-2-bestswngs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A TCP GSO skb created through TUN can retain an unset transport
header. Send one such packet through TBF, then send another through
police and TBF. The police limit makes the vulnerable kernel stop at
one TBF drop while the fixed kernel reaches two. This checks behavior
without relying on KASAN or global logs.

Use the existing tc-testing namespace and JSON verification. The
helper creates the TUN packet, changes the ingress filter, and waits
for TBF counters.

Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 tools/testing/selftests/tc-testing/config     |  3 +
 .../tc-testing/tc-tests/qdiscs/tbf.json       | 28 ++++++
 .../testing/selftests/tc-testing/tdc_vnet.py  | 87 +++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 tools/testing/selftests/tc-testing/tdc_vnet.py

diff --git a/tools/testing/selftests/tc-testing/config b/tools/testing/selftests/tc-testing/config
index 0e5618be03359..7d1a140464948 100644
--- a/tools/testing/selftests/tc-testing/config
+++ b/tools/testing/selftests/tc-testing/config
@@ -5,6 +5,9 @@
 CONFIG_DUMMY=y
 CONFIG_VETH=y
 CONFIG_IFB=y
+CONFIG_TUN=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_NET=y
 
 #
 # Core Netfilter Configuration
diff --git a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/tbf.json b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/tbf.json
index 547a449100411..ef850a5d28ffe 100644
--- a/tools/testing/selftests/tc-testing/tc-tests/qdiscs/tbf.json
+++ b/tools/testing/selftests/tc-testing/tc-tests/qdiscs/tbf.json
@@ -189,5 +189,33 @@
         "teardown": [
             "$TC qdisc del dev $DUMMY handle 1: root"
         ]
+    },
+    {
+        "id": "7f31",
+        "name": "Drop GSO packet with unset transport header",
+        "category": [
+            "qdisc",
+            "tbf"
+        ],
+        "plugins": {
+            "requires": "nsPlugin"
+        },
+        "setup": [
+            "$IP link set dev $IFB mtu 256",
+            "$TC qdisc add dev $IFB handle 1: root tbf limit 4096 burst 300 rate 1mbit"
+        ],
+        "cmdUnderTest": "python3 ./tdc_vnet.py $IP $TC $IFB",
+        "expExitCode": "0",
+        "verifyCmd": "$TC -s -j qdisc show dev $IFB root",
+        "matchJSON": [
+            {
+                "kind": "tbf",
+                "handle": "1:",
+                "drops": 2
+            }
+        ],
+        "teardown": [
+            "$TC qdisc del dev $IFB handle 1: root"
+        ]
     }
 ]
diff --git a/tools/testing/selftests/tc-testing/tdc_vnet.py b/tools/testing/selftests/tc-testing/tdc_vnet.py
new file mode 100644
index 0000000000000..bdd663c5795ac
--- /dev/null
+++ b/tools/testing/selftests/tc-testing/tdc_vnet.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Exercise TBF and police with a TCP GSO skb lacking a transport header."""
+
+import fcntl
+import json
+import os
+import struct
+import subprocess
+import sys
+import time
+
+
+# These architectures use a different _IOW direction encoding.
+TUNSETIFF = (0x800454ca if os.uname().machine.startswith(
+    ("alpha", "hppa", "mips", "parisc", "ppc", "sparc")) else 0x400454ca)
+IFF_TUN = 0x0001
+IFF_NO_PI = 0x1000
+IFF_VNET_HDR = 0x4000
+TUN = "tuntdc0"
+DEADLINE = time.monotonic() + 18
+
+
+def run(*argv):
+    remaining = DEADLINE - time.monotonic()
+    if remaining <= 0:
+        raise RuntimeError("selftest deadline expired")
+    return subprocess.check_output(argv, stderr=subprocess.STDOUT,
+                                   text=True, timeout=min(3, remaining))
+
+
+def tbf_drops(tc, ifb):
+    qdiscs = json.loads(run(tc, "-s", "-j", "qdisc", "show", "dev", ifb,
+                           "root"))
+    return next(qdisc["drops"] for qdisc in qdiscs
+                if qdisc["kind"] == "tbf" and qdisc["handle"] == "1:")
+
+
+def wait_for_drops(tc, ifb, expected):
+    deadline = min(DEADLINE, time.monotonic() + 5)
+    while time.monotonic() < deadline:
+        if tbf_drops(tc, ifb) >= expected:
+            return
+        time.sleep(0.05)
+    raise RuntimeError(f"TBF did not reach {expected} drops")
+
+
+def main(ip, tc, ifb):
+    tun = os.open("/dev/net/tun", os.O_RDWR | os.O_CLOEXEC | os.O_NONBLOCK)
+    try:
+        ifreq = struct.pack("16sH", TUN.encode(),
+                            IFF_TUN | IFF_NO_PI | IFF_VNET_HDR)
+        fcntl.ioctl(tun, TUNSETIFF, ifreq)
+        run(ip, "link", "set", "dev", TUN, "up")
+        run(tc, "qdisc", "add", "dev", TUN, "clsact")
+        run(tc, "filter", "add", "dev", TUN, "ingress", "pref", "1",
+            "matchall", "action", "mirred", "egress", "redirect",
+            "dev", ifb)
+
+        # GSO without NEEDS_CSUM leaves transport_header unset. IPv4 IHL=0
+        # prevents the later transport-header probe from filling it in.
+        packet = struct.pack("=BBHHHH", 0, 1, 0, 8, 0, 0) + b"\x40" + bytes(999)
+        if os.write(tun, packet) != len(packet):
+            raise RuntimeError("short TUN write")
+        wait_for_drops(tc, ifb, 1)
+
+        run(tc, "filter", "delete", "dev", TUN, "ingress", "pref", "1")
+        run(tc, "filter", "add", "dev", TUN, "ingress", "pref", "1",
+            "matchall", "action", "police", "mtu", "65700",
+            "conform-exceed", "pipe/drop", "action", "mirred", "egress",
+            "redirect", "dev", ifb)
+        if os.write(tun, packet) != len(packet):
+            raise RuntimeError("short TUN write")
+        wait_for_drops(tc, ifb, 2)
+    finally:
+        os.close(tun)
+
+
+if __name__ == "__main__":
+    if len(sys.argv) != 4:
+        sys.exit(f"usage: {sys.argv[0]} IP TC IFB")
+    try:
+        main(*sys.argv[1:])
+    except (OSError, ValueError, RuntimeError, StopIteration,
+            subprocess.SubprocessError) as error:
+        sys.exit(f"tdc_vnet: {error}")
-- 
2.55.0

