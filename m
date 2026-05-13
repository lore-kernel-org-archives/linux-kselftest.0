Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3D3FF892
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674409; cv=none; b=FkKbEVxtwIuKMmKj+8rpYVcDf3E2KdasbtMoXxdNocOjz2R91JS4TFke+nFozNbzIM8Eo3IL9nrE4F5/efPT7mWBibS1eBxODd/ErGxa/NPBlHV9kbj6nwsipsfiKGjuTSdasIof8HmawoL8ltnEWlUTwsHO4ZTxeUyKRNb2OpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674409; c=relaxed/simple;
	bh=6vOeaWIFRWOCkQ2ypviIEtXbauIiLWVfp1rOWJGuDcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anAtT9TRoGmlXIRdGkNqP/7I3LzBB87MtDq0wZWbrSsAGuh17Riknt0J+FkyHingdk4zDS6ojjdbnxqjd6SdLo9u0Ca9mFNyb2LkMnhCFbW7EFkpbgJmZN2FDEAFV702KW0isHmG5SpqAd0U+aggZDfG8+Y3HDr8PcUvZ6UKZmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL4Do+TC; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL4Do+TC"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-404254ffe8aso5410103fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674406; x=1779279206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXar17g0k4H/KFHfDGYL5Bn3v4WqyC95txr2e3AusWE=;
        b=aL4Do+TCAffC/QHj/7yY+XQkoQUtw5iRaOUqeEw5h9o9dZubF2Yiostzz/LJGJpDsr
         nuTFwYvVdx1yfR/1RwVYQerZB4N7RDG2jszTwmfBmzqB4eo/F/oXixx16dl++FInRWX1
         gff558rnQq1QedbE9vslp3fRgJnNts+RqL7SRMn7RLg+8lEuRu6w0HFf0To3AE3ksoye
         j3vN+68/icCGZ2MfKX2HaKIXHh6cdsOuNDu54GykDd3tAWhHYyTzm7m5zvJiJIVNHZ7n
         uBO6yQzFOhLqVeyTr5yB6ECDz7KEVw/b2Tj5xXbzsrOSVkN6/DrnWnXFb6t2PERm9xO7
         X0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674406; x=1779279206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXar17g0k4H/KFHfDGYL5Bn3v4WqyC95txr2e3AusWE=;
        b=lzpNcXIHj9g8dbZoRIrxVtAFkJM7y04ySfapBQ/rONLYtIMlvZ3wR2EdS99DRHbWVR
         lldRz7OEYb4YOcnUnuIm3FOASR/+I4YSE9BV/EF3IK5s6I3eQwM67RJ5dsda+ju31l0k
         UKuoNuxEh5FxbiaYLRFiXVoLIa1SHkoN8qQGA2y4WSzvcP1wXhaPfX8sMLheGYUddFY/
         YXNk0NrKLxIUb/uDPu+YL6WQlhJzzeh0VGW9r2Ly9DG0YuRgap8UGUlCSy814vG9062V
         vSntlkFGLMrxWuGrg/nf5+/HdoUuUWRJwY8CJxrKvDchBNKY5JNGzqykITwKbCOzLMTF
         Loiw==
X-Forwarded-Encrypted: i=1; AFNElJ+EEH3WvCABvj+7bj6mtfvoGpI7Z74N9+EUudNzGmYBcApAsO/BHzJ8F3J+mf15fEUltq8urgKf8pPKnjiFTAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZaEypuoDvghqWGP6yok2MccV4epBJdSEO4ELJcwOJH394S3k
	vE9/BTZPNVPs5e62ylR6ltsbFidrYSE3eBPKA1U+UBZ5aYTqEW6hRkYA
X-Gm-Gg: Acq92OGCKhXRBei9MLFlrpuSFpd/jKwk14rK8zByycsU2OVJmdZCzELbNaU4CFIsfbd
	bhY+m75B1QRbL8hLr9kexCL3GunJRnEbTWAYpEaMhLXTRsY9z9rm18OtD8mJq8n9fVvURoY5t33
	C41H6xmWTASWGK9fGKslsi+Vn+VbOtWKIrm5krpRQyVCHy598+XBpebQeuSP5bVEFFgMnRqPzIf
	l/0ajWVfBpUV47bxmIKWaNyVeQzlld6O112OpOYrss5hi/4rEjbzYmG9UFdGOAsGDzSXC7Q/dzZ
	d69AfaOeEX6JKg8A9XKiqOLk5mXV2GdKbeRcaj2IZGrak2ZIk3q3JaFjMrvzQBciamLCJ6k5Mn5
	rXqjQ7iCOiMPvz3NKdvumqzbqU7TsZ7rq/7FKt6lAJy3Z2irWbbgGyTUt4hAvOBlAYLLrrNr93t
	lVulPUvLTm4AEUv1pCNxGwNxqIzg==
X-Received: by 2002:a05:6870:f14a:b0:42c:b9d:8987 with SMTP id 586e51a60fabf-439cac4a4aamr1607270fac.10.1778674406006;
        Wed, 13 May 2026 05:13:26 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736dbc0sm15189442fac.11.2026.05.13.05.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:13:24 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next 2/5] selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
Date: Wed, 13 May 2026 20:12:37 +0800
Message-ID: <20260513121240.2590767-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513121240.2590767-1-houminxi@gmail.com>
References: <20260513121240.2590767-1-houminxi@gmail.com>
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
  - C0325: remove superfluous parentheses after return
  - R1705: remove unnecessary elif after return
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
 .../selftests/net/openvswitch/ovs-dpctl.py    | 50 ++++++++-----------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 3671fe16b5a7..5ce054768f48 100644
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
 
@@ -688,11 +683,11 @@ class ovsactions(nla):
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
@@ -773,7 +768,6 @@ class ovsactions(nla):
                 subacts = ovsactions()
                 actstr = actstr[len("clone("):]
                 parsedLen = subacts.parse(actstr)
-                lst = []
                 self["attrs"].append(("OVS_ACTION_ATTR_CLONE", subacts))
                 actstr = actstr[parsedLen:]
                 parsed = True
@@ -929,14 +923,14 @@ class ovsactions(nla):
                 actstr = actstr[1:]
 
             if len(actstr) and actstr[0] == ")":
-                return (totallen - len(actstr))
+                return totallen - len(actstr)
 
             actstr = actstr[strspn(actstr, ", ") :]
 
             if not parsed:
                 raise ValueError(f"Action str: '{actstr}' not supported")
 
-        return (totallen - len(actstr))
+        return totallen - len(actstr)
 
 
 class ovskey(nla):
@@ -1020,8 +1014,6 @@ class ovskey(nla):
             if flowstr.startswith("("):
                 flowstr = flowstr[1:]
 
-            keybits = b""
-            maskbits = b""
             for f in self.fields_map:
                 if flowstr.startswith(f[1]):
                     # the following assumes that the field looks
@@ -1030,7 +1022,7 @@ class ovskey(nla):
                     flowstr = flowstr[len(f[1]) + 1 :]
                     splitchar = 0
                     for c in flowstr:
-                        if c == "," or c == ")":
+                        if c in (",", ")"):
                             break
                         splitchar += 1
                     data = flowstr[:splitchar]
@@ -1587,7 +1579,7 @@ class ovskey(nla):
             for prefix, regex, typ, attr_name, mask_val, default_val, v46_flag in fields:
                 flowstr, value = parse_extract_field(flowstr, prefix, regex, typ, False)
                 if not attr_name:
-                    raise Exception("Bad list value in tunnel fields")
+                    raise ValueError("Bad list value in tunnel fields")
 
                 if value is None and attr_name in forced_include:
                     value = default_val
@@ -1670,7 +1662,7 @@ class ovskey(nla):
                 if not noprint:
                     print_str += ","
 
-            if len(flagsattrs):
+            if flagsattrs:
                 print_str += f"flags({'|'.join(flagsattrs)})"
             print_str += ")"
             return print_str
@@ -2250,7 +2242,7 @@ class OvsDatapath(GenericNetlinkSocket):
 
             nproc = multiprocessing.cpu_count()
             procarray = []
-            for i in range(1, nproc):
+            for _ in range(1, nproc):
                 procarray += [int(p.epid)]
             msg["attrs"].append(["OVS_DP_ATTR_UPCALL_PID", procarray])
         msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", dpfeatures])
@@ -2335,26 +2327,26 @@ class OvsVport(GenericNetlinkSocket):
     def type_to_str(vport_type):
         if vport_type == OvsVport.OVS_VPORT_TYPE_NETDEV:
             return "netdev"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
             return "internal"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_GRE:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_GRE:
             return "gre"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_VXLAN:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_VXLAN:
             return "vxlan"
-        elif vport_type == OvsVport.OVS_VPORT_TYPE_GENEVE:
+        if vport_type == OvsVport.OVS_VPORT_TYPE_GENEVE:
             return "geneve"
         raise ValueError(f"Unknown vport type:{vport_type}")
 
     def str_to_type(vport_type):
         if vport_type == "netdev":
             return OvsVport.OVS_VPORT_TYPE_NETDEV
-        elif vport_type == "internal":
+        if vport_type == "internal":
             return OvsVport.OVS_VPORT_TYPE_INTERNAL
-        elif vport_type == "gre":
+        if vport_type == "gre":
             return OvsVport.OVS_VPORT_TYPE_GRE
-        elif vport_type == "vxlan":
+        if vport_type == "vxlan":
             return OvsVport.OVS_VPORT_TYPE_VXLAN
-        elif vport_type == "geneve":
+        if vport_type == "geneve":
             return OvsVport.OVS_VPORT_TYPE_GENEVE
         raise ValueError(f"Unknown vport type: '{vport_type}'")
 
@@ -2463,7 +2455,7 @@ class OvsVport(GenericNetlinkSocket):
         msg["dpifindex"] = dpindex
         msg["attrs"].append(["OVS_VPORT_ATTR_NAME", vport_ifname])
 
-        if p == None:
+        if p is None:
             p = self.upcall_packet
         else:
             self.upcall_packet = p
@@ -3036,7 +3028,7 @@ def main(argv):
             return 1
         rep = ovsflow.dump(rep["dpifindex"])
         for flow in rep:
-            print(flow.dpstr(True if args.verbose > 0 else False))
+            print(flow.dpstr(args.verbose > 0))
     elif hasattr(args, "flbr"):
         rep = ovsdp.info(args.flbr, 0)
         if rep is None:
-- 
2.53.0

