Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BBA4AF9F4
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887965; cv=none; b=kNqN4QmjMyDkn8wW6da8uFoFZii/4hUI/vq3qDTmoyGaEDPZfNV6N7gNUxjydS0QoKz0nievpArWe9qmGeIBba2OhipfzTKalW564YWRKIbsFc2AwFHG/Dp1UDIpUi2yvnge4iOmkCaQYbynGwp7B1rsHaoZfiOWCtLirmWkuCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887965; c=relaxed/simple;
	bh=687U7D147/AP3X6/LcvYjsxoPuCMeuHYnz5IWZ3ffIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSJRtihNRBsqV5OwYX9FSt7bP1/pIxIMInj/LiKd0zY6DtZVYxssvS6s6y4zQSfge4e5gL7YdAwm5uyGt1RlQcNuKT1/BlYgh6ikpon5qUhJUajqblXN6tr5SWEIqwEs6qI99Sq41gPy1rtQ/ZvJMMw2GA6ccObe3a9vV19DJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKn83V6C; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKn83V6C"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52ff7e275e0so49435101cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887962; x=1789492762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+H/am8qcY3j9fmsUniSD+F4ILAzH+fVDaI8KN12MUvo=;
        b=oKn83V6CYUek+eEJKuj0Q6bywy0Z9Zx3x8eouzijldHsADDnB1mKGbTdN2sbApy0k0
         +qKp2wEE/M3hygtTKd1y9wX6GQkLmuf9DuUIOU7rF9J2xjo7L/oyiWiJtBmsPUGNSy5i
         FdDRc3oPx4YKDuylBCYwePWN+s99x25U66v5BzzokjdxySzWAQTrl2ukR/6jtpOy1/80
         w9TpM3QeK43jl1X6VtZOCKXChcKgww6FLXLzxKwyyYhBX/M+a0NeZZkI/UuwkCeaFDt8
         /6CGOxYG6S6v29K0RufFGS8pYxvvhQ0CEYLNtpF1yJkHUEssfV7jAUcvwTnk9p/H/sBd
         Rr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887962; x=1789492762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+H/am8qcY3j9fmsUniSD+F4ILAzH+fVDaI8KN12MUvo=;
        b=QY4Vbc7PQcPyTgIt66B6uf7gs/d2bHqLyvkDSqkEHCRmpbwNzf5wBjay0qpYO0EEoG
         ZU9MneJjwz0Bmju/QQ2b6YMpkBAPNhz9ZR3K2q/VWhYi/4vPUslfukqDrCCPHkRPR5av
         5GnbWFp3nCYNl018FbPQ70WMKR95okuufwRKCQmG5KFxc2MPcqVSgKm+/xxfDJLHb2x6
         676zP1Xr6c1wVXLy2kRwuL2awLsi8sdIk9tRLqlo7vummaar+GDKbo6Cuq97jAkpq8/H
         qYkV410DxcsSu8VGk1ZrdpTrCmCloawq0PKVIMLO/W8E1LKpdAk+wZaJcXmD38Xw7Z10
         gaQA==
X-Forwarded-Encrypted: i=1; AKwUvByHVuKQdfkIzLM0zplhY/0tfURShhAAxWQ8iwk5FSzIO0EGZkfBQnhHCqqPMB8bY9vz+Rm2UKjk/MD4Nvhh+bA=@vger.kernel.org
X-Gm-Message-State: AFuF++lTVKGvVmrBDzWS3637fTFPcrUoAaCbAgAJm/CF1fc4xFfQgkv7
	HXE6b3Et8dEKVMtXgmEcsNFYT1gQFhGfhLCFy9XOn+OPFWYpWgHeBad2
X-Gm-Gg: AYBFou3kK27M4CFWoZ6GFz1xIMYyxP9gL+M40y7jGMW3Qcae5SfZyEwcJ5akR4RhYs1
	kmBhW+kxnJpO5YmxmmYyWwBXScJIURs66QvdByITIYr/rGGQspSxFkhXCmsGXm2jBS8RbfDlWs1
	RB5mTgTKB748j30eoTNsSjnT3gRdT5ldBv0clcLKvc/TvvL/RR2l6nwYe64zcY6JKXpOflPfHc0
	OQxxBtIZSmNSYKEivE7qkgxZF73lsjq/NN+ud2fxC59wXTNZpqB49sgko0iKxm/D3RaI3PGHTzz
	iPIv04RU7TMrxcNeHcJ3aHALmapsfRIdUgmN7ozOMQ0gP3nIa7c4MmFFEae7ZnH3hD38Ifa7NPY
	64FyKJZN4yQWvmlOmiul94FFK89GdYFvPymLpUcsuG1oS1JSn9BTajQmf7Dv1P4oEx7N5S27ti3
	/fhH9gVoCxsmAr8ewsizQGJcqCKaG7ZHdCyXMUVoNp3nWF3516yQ4W7fo=
X-Received: by 2002:a05:622a:2986:b0:530:9903:25d4 with SMTP id d75a77b69052e-53099032de4mr64528571cf.31.1788887961728;
        Tue, 08 Sep 2026 10:19:21 -0700 (PDT)
Received: from houminxi ([104.167.197.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c94ddsm120081361cf.23.2026.09.08.10.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:19:21 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v3 2/4] selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
Date: Tue,  8 Sep 2026 13:18:57 -0400
Message-ID: <20260908171859.1967327-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908171859.1967327-1-houminxi@gmail.com>
References: <20260908171859.1967327-1-houminxi@gmail.com>
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
  - E0213: add @staticmethod to type_to_str/str_to_type, both are
    only invoked through the class

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/ovs-dpctl.py    | 48 +++++++++----------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index cac858dae4ce9..502e6eb4c4b4a 100644
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
 
@@ -674,7 +669,7 @@ class ovsactions(nla):
                 else:
                     try:
                         print_str += datum.dpstr(more)
-                    except:
+                    except Exception:
                         print_str += f"{{ATTR: {field[0]} not decoded}}"
 
         return print_str
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
@@ -2376,18 +2368,22 @@ class OvsVport(GenericNetlinkSocket):
                 ("tx_dropped", "=Q"),
             )
 
+    @staticmethod
     def type_to_str(vport_type):
         if vport_type == OvsVport.OVS_VPORT_TYPE_NETDEV:
             return "netdev"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
             return "internal"
+
         raise ValueError(f"Unknown vport type:{int(vport_type)}")
 
+    @staticmethod
     def str_to_type(vport_type):
         if vport_type in ["netdev", "gre", "vxlan", "geneve"]:
             return OvsVport.OVS_VPORT_TYPE_NETDEV
-        elif vport_type == "internal":
+        if vport_type == "internal":
             return OvsVport.OVS_VPORT_TYPE_INTERNAL
+
         raise ValueError(f"Unknown vport type: '{vport_type}'")
 
     def __init__(self, packet=OvsPacket()):
@@ -2482,7 +2478,7 @@ class OvsVport(GenericNetlinkSocket):
         msg["dpifindex"] = dpindex
         msg["attrs"].append(["OVS_VPORT_ATTR_NAME", vport_ifname])
 
-        if p == None:
+        if p is None:
             p = self.upcall_packet
         else:
             self.upcall_packet = p
@@ -3068,7 +3064,7 @@ def main(argv):
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

