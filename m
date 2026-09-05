Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7D44C658
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604871; cv=none; b=SAYyCRdNwFofCNtiOiu22k40wf2BWUYrKbKPI1ceYUJEXZPCKFHSVz7SllzICFPpzgYvHmcJwkHbgfMxNxkiBN/Ywoyza7m71c6b8SwgBqGj8NtgD7gKP/lg0bY98IHIFgi1IPdnZPZidd8URYlOkv5Og2nhvaAEjpLVkyrU0KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604871; c=relaxed/simple;
	bh=IKBCGIe+0rfZdqLtsEcEzIIMnR9trXnVBRpIA16kR3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tqnosr0NGXelNQbdfhx9zRYm8s+ghI27RKiN/E/wK8xZIfdWLHoos3zAqqK2vMdyUO/Ta9bVE+ovXpZ05wJEtBCehDbkNRjIqSB6FH/vj4XN3ynO6gJLIHR3/LnNuHrFfRgXA5qLp4k+RN6WPU7/HUmYeZB3AMicCdQjPn9/wdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQSdh/0H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQSdh/0H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce98cb8165so20614835ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604853; x=1789209653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVGO8QrL5Gygxi7WZN29yoHd/tJYxrEKp+l+Q17zcxs=;
        b=DQSdh/0Huf6oixM0pPsoS9P17MFu1jEGuPqe93SiOXExfBOuSaIhO3+EM9ka25YZCY
         oc1s551Px5kS4Fvqy3/h8kJ3rOsA9CkmfPfE+EK8vbz7AHyxS7mk/YofYzSumlfd0cUd
         PXYIHqQgGIYAt6cZjF99OK65JpFY14SeeBXJN4nABHtUWd4mz10JVXewZc09yAivcbo0
         3MgjCMcUA3yGjORGO90E+7Bo+XKZxGsiwc4Bd6szSeXoYUMScwZjGMWRcAA8aYGRGxtY
         J/NWp+ejFM+qoi7mIUdT9xrlfeT8+L3wv2Yxs+LZHze8JZYcQ99qRI0O7tlrWxc6pEP+
         yRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604853; x=1789209653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVGO8QrL5Gygxi7WZN29yoHd/tJYxrEKp+l+Q17zcxs=;
        b=e1pHDc0sr4ommxVy2nS9vKmfdTdStuljfBJrGl0NcTYAd+0n7+dNcwMQYtVzneYx9I
         raZNOHSJar5WvCmsNfE6u/k0WJHxa51LH0ticUuS7QBb8UNE7QhcTBlS208r9lqKyBRl
         WdUZzjbrbD0++rzvSKj+1HAUgr8EJWeJWp+fAebUytsLOEdEOh+bsmsGoeHdEhiVig6s
         wN17fT2q1Dwko+PWieIcaPjD7gux186qaNeLfp0+20TOkwL/8lJahE4jQ2qNEEXTauTh
         TYF/vqPqhGVt8YpB8vWbNZWbbbO8Fd16EKAu5oOV/+DvzZe/UHhU8IBtelxNjBRtpSYf
         8/JA==
X-Forwarded-Encrypted: i=1; AKwUvBzI6mILkhL94Ctzzp1B100Sjc5Q/TbYxfWA8Rt9E6mmYmziGFNehnbBWpugDmf6Ykhgiw31x4t3Xt5D93vDuec=@vger.kernel.org
X-Gm-Message-State: AFuF++nWGM9BXW7oHE1FkQOLd0ro9UEtpypO0KEnsuMt/ehcgJS/wfnf
	EdKIr9XqJLuWPLjVPFcLT0X1+V48HeRDvHmwettNod556iAfFQWu8LgU6DCSPohS0OY=
X-Gm-Gg: AYBFou1RVubQYCW7Ffm8hw7YqH2jFvvy47CXDe60gGF/9Aj2TtmAPl507hJStmbB2XM
	pC+GhlgSGe64ImtRRFHvoVrJW3jWnQtQvKnL6m9qO3rgh1H9UIRvM967uwhi42ueki6bblwhBJM
	1py1NMuQSVd9Nla08vujozcDpAMlcl6TVttI+2yC9KQ6I4WhX8bpR7oJG3EVimOp25B1Mrc9Zw3
	mXjmbsRRWa6jm8G9qai+gzV/yIQS/+4HYVVw6oXNmYTQ6XeLWNPVLjq9yZy3NEEOtgFV/xqfFVQ
	v2HY7TClqjAHCaztemXo39C9pr7LLfN+FJBmbJZOYPwxDQd1TMhtv6jvyvE8CIaaoa7TEIIp470
	30Ma/y17xGGZ70TG7SqWU1CVmqCUdup7+D+kO4YMrjadEITCGjqlMZTXj7LiCWhLdw4cWnnKuuk
	lHBr2iebJzbPeZFABGwtyMmFZgklniwLHLZ6DxaXjtc9+DAtWYRchrCoQ=
X-Received: by 2002:a17:902:f707:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2dafb0b191cmr174136725ad.14.1788604853368;
        Sat, 05 Sep 2026 03:40:53 -0700 (PDT)
Received: from houminxi ([154.197.57.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm13559776eec.19.2026.09.05.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:40:52 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH 2/4] selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
Date: Sat,  5 Sep 2026 06:40:24 -0400
Message-ID: <20260905104026.3776396-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905104026.3776396-1-houminxi@gmail.com>
References: <20260905104026.3776396-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix miscellaneous pylint warnings with no behavior change:
  - W0611: remove unused import struct
  - W0702: replace bare except with except Exception
  - C0325: remove superfluous parentheses after return (3)
  - R1705: remove unnecessary elif after return (3)
  - W0108: replace unnecessary lambda with int
  - R1714: merge comparisons with in operator
  - W0719: replace raise Exception with raise ValueError
  - C1802: use implicit boolean test instead of len()
  - C0121: use is None instead of == None
  - R1719: simplify if-expression to bool test
  - R1703: simplify if/else to assignment expression
  - W0612: remove unused variables (keybits, maskbits, lst)
  - replace unused loop variable with underscore

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
base-commit: 9eab111e765729e93087ff86a2ec9b2ae42d0fa5
 .../selftests/net/openvswitch/ovs-dpctl.py    | 44 ++++++++-----------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 9cd0d8f0ab23..6a02810fe4ea 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -11,7 +11,6 @@ import logging
 import math
 import multiprocessing
 import re
-import struct
 import sys
 import time
 import types
@@ -125,10 +124,7 @@ def parse_flags(flag_str, flag_vals):
         maskResult = int(digits, 0)
 
     while len(flag_str) > 0 and (flag_str[0] == "+" or flag_str[0] == "-"):
-        if flag_str[0] == "+":
-            setFlag = True
-        elif flag_str[0] == "-":
-            setFlag = False
+        setFlag = flag_str[0] == "+"
 
         flag_str = flag_str[1:]
 
@@ -221,10 +217,9 @@ def convert_int(size):
 
         if not value:
             return 0, 0
-        elif not mask:
+        if not mask:
             return int(value, 0), pow(2, size) - 1
-        else:
-            return int(value, 0), int(mask, 0)
+        return int(value, 0), int(mask, 0)
 
     return convert_int_sized
 
@@ -705,11 +700,11 @@ class ovsactions(nla):
                     parsed = True
                 else:
                     actstr = actstr[len("drop"): ]
-                    return (totallen - len(actstr))
+                    return totallen - len(actstr)
 
             elif parse_starts_block(actstr, r"^(\d+)", False, True):
                 actstr, output = parse_extract_field(
-                    actstr, None, r"(\d+)", lambda x: int(x), False, "0"
+                    actstr, None, r"(\d+)", int, False, "0"
                 )
                 self["attrs"].append(["OVS_ACTION_ATTR_OUTPUT", output])
                 parsed = True
@@ -761,12 +756,12 @@ class ovsactions(nla):
                         vid = int(v, 0)
                         if vid < 0 or vid > 0xFFF:
                             raise ValueError(
-                                f"push_vlan(): vid={int(vid)} out of range (0-4095)")
+                                f"push_vlan(): vid={vid} out of range (0-4095)")
                     elif k == "pcp":
                         pcp = int(v, 0)
                         if pcp < 0 or pcp > 7:
                             raise ValueError(
-                                f"push_vlan(): pcp={int(pcp)} out of range (0-7)")
+                                f"push_vlan(): pcp={pcp} out of range (0-7)")
                     elif k == "tpid":
                         tpid = int(v, 0)
                         if tpid < 0 or tpid > 0xFFFF:
@@ -804,7 +799,6 @@ class ovsactions(nla):
                 subacts = ovsactions()
                 actstr = actstr[len("clone("):]
                 parsedLen = subacts.parse(actstr)
-                lst = []
                 self["attrs"].append(("OVS_ACTION_ATTR_CLONE", subacts))
                 actstr = actstr[parsedLen:]
                 parsed = True
@@ -960,14 +954,14 @@ class ovsactions(nla):
                 actstr = actstr[1:]
 
             if len(actstr) and actstr[0] == ")":
-                return (totallen - len(actstr))
+                return totallen - len(actstr)
 
             actstr = actstr[strspn(actstr, ", ") :]
 
             if not parsed:
                 raise ValueError(f"Action str: '{actstr}' not supported")
 
-        return (totallen - len(actstr))
+        return totallen - len(actstr)
 
 
 # pyroute2 resolves nla_map types via getattr(self, name).
@@ -1057,8 +1051,6 @@ class ovskey(nla):
             if flowstr.startswith("("):
                 flowstr = flowstr[1:]
 
-            keybits = b""
-            maskbits = b""
             for f in self.fields_map:
                 if flowstr.startswith(f[1]):
                     # the following assumes that the field looks
@@ -1067,7 +1059,7 @@ class ovskey(nla):
                     flowstr = flowstr[len(f[1]) + 1 :]
                     splitchar = 0
                     for c in flowstr:
-                        if c == "," or c == ")":
+                        if c in (",", ")"):
                             break
                         splitchar += 1
                     data = flowstr[:splitchar]
@@ -1631,7 +1623,7 @@ class ovskey(nla):
             for prefix, regex, typ, attr_name, mask_val, default_val, v46_flag in fields:
                 flowstr, value = parse_extract_field(flowstr, prefix, regex, typ, False)
                 if not attr_name:
-                    raise Exception("Bad list value in tunnel fields")
+                    raise ValueError("Bad list value in tunnel fields")
 
                 if value is None and attr_name in forced_include:
                     value = default_val
@@ -1714,7 +1706,7 @@ class ovskey(nla):
                 if not noprint:
                     print_str += ","
 
-            if len(flagsattrs):
+            if flagsattrs:
                 print_str += f"flags({'|'.join(flagsattrs)})"
             print_str += ")"
             return print_str
@@ -2304,7 +2296,7 @@ class OvsDatapath(GenericNetlinkSocket):
 
             nproc = multiprocessing.cpu_count()
             procarray = []
-            for i in range(1, nproc):
+            for _ in range(1, nproc):
                 procarray += [int(p.epid)]
             msg["attrs"].append(["OVS_DP_ATTR_UPCALL_PID", procarray])
         msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", dpfeatures])
@@ -2379,15 +2371,17 @@ class OvsVport(GenericNetlinkSocket):
     def type_to_str(vport_type):
         if vport_type == OvsVport.OVS_VPORT_TYPE_NETDEV:
             return "netdev"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
             return "internal"
+
         raise ValueError(f"Unknown vport type:{int(vport_type)}")
 
     def str_to_type(vport_type):
         if vport_type in ["netdev", "gre", "vxlan", "geneve"]:
             return OvsVport.OVS_VPORT_TYPE_NETDEV
-        elif vport_type == "internal":
+        if vport_type == "internal":
             return OvsVport.OVS_VPORT_TYPE_INTERNAL
+
         raise ValueError(f"Unknown vport type: '{vport_type}'")
 
     def __init__(self, packet=OvsPacket()):
@@ -2482,7 +2476,7 @@ class OvsVport(GenericNetlinkSocket):
         msg["dpifindex"] = dpindex
         msg["attrs"].append(["OVS_VPORT_ATTR_NAME", vport_ifname])
 
-        if p == None:
+        if p is None:
             p = self.upcall_packet
         else:
             self.upcall_packet = p
@@ -3068,7 +3062,7 @@ def main(argv):
             return 1
         rep = ovsflow.dump(rep["dpifindex"])
         for flow in rep:
-            print(flow.dpstr(True if args.verbose > 0 else False))
+            print(flow.dpstr(args.verbose > 0))
     elif hasattr(args, "flbr"):
         rep = ovsdp.info(args.flbr, 0)
         if rep is None:
-- 
2.55.0

