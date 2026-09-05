Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5867455173
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604875; cv=none; b=Gk+2V1TRLeCNiSAPiyPTEFkAgE4P9D682n15nitba+SibU+/ruG38uGIPCXHjilqHyP0Il2RzSjrS15/UCwj887WKhCe1Ty4HYf234SG5aK9MAiU/15wCxjCWfYlzcOcG9XcdOEzrU1qP043TKiKs6uzd+aEfK/W3CG3Kj1UYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604875; c=relaxed/simple;
	bh=byvJ6cDoECFPiIABGqWhpSuk/JBAwpvNeR95VdYydJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSZL07mbWCBlZm5+RKVhdwwrdM2WNlq/pMu4+EXJoVictcdlornJfnlhCnPZyioJHQwqZsGbfQf0KV1/8urwE3F0wq3OyeNn5OYLbpoDuwGM1czj162gbD4c/GyQ0fJCKvuPil7fF0NsxKptJH/Bq/XqmhYThChE2Nh1LBmk0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+Cm+yRh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+Cm+yRh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1269239a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604861; x=1789209661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CiII+16dre11TT4H5s+rrA0Inivb15OxMDlBCk8aoaM=;
        b=E+Cm+yRhnehBIH/yrpCzF39n58kn//TIEVYaSrSH3AVbuNvUGl/5jRaXgxMePImWx3
         L9Omcg8MGslA4//knuwku8ZAIrLCr37WwhmVVRRy2oLBDvWcpOAN+HwXT1HYXgpFNHf7
         cRbBudd+PpxTeerWZRmjkFgjhwlGhcs+Tmx9tKOWjwudxGd4oodSjjHuilatFW/MVFFp
         bdq6KMh3Ayq/8F3sOh3CJoO3/5PzgO95PE/hcNzZNslRmKk8cOfiSQh+OvNx4aSSQ6IX
         S56/8Ku6Rn3yIqQZM5V6lo6vKLvV5Xuwb/A6L/AiGVQDy+TldLzYDIDfSXO/jOSGSzHc
         hD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604861; x=1789209661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiII+16dre11TT4H5s+rrA0Inivb15OxMDlBCk8aoaM=;
        b=bo4DtKDLiEphZDmuu/puOQs7NorXSeYcScUKrlMY/PzejJsly0bsQof2l/OdPQtbDn
         g1bfCGiPG+uJv85V2JkgL0K0B3cC80b6oQIwOIhLEmbmO7wbf9Wu3tIVoxkafzCQIzpJ
         m4sAc/LAShtMzdfblbZ8JNM9BvXc/lQqVQTKsFjrOU3fZIVrgc6lUcpDSNLeVGJv9vtN
         ooppV1on7t7nzmMuxuRafsmmN2NFODgoYDrl42WSpzlk3HwWJQiVUvBzOQWojUJvo5bN
         Vx6Knx+DhX1MOq0Bk5zC4JeediS+W/xXxCnME7hqBsb+JzDDdEpI0xx+99xlfyffcLJL
         Dw0w==
X-Forwarded-Encrypted: i=1; AKwUvBxG8AdHYLwAhbP0Zzsf0yWrYebs0oCidGpJv2YZTvGzms6NNwanKrmvvSk9RyB1mSTYMf144bCiNZHciv/Dk9w=@vger.kernel.org
X-Gm-Message-State: AFuF++m38bAJGlPgKiyezQHQdbIlMQKa+GqPBqkGty6retZQlbX4SnIL
	uPKAdYSYglSGdeQ/eTbKT9e9glv6FarNmi/J30DsZf2A95glJg+lO5F8
X-Gm-Gg: AYBFou1ijmMkd4YlqimmJsHmdkKBSP+sseZ+U4HV9038/pdZxNBNH5epsoDWwYlYD03
	7IHoQ6MgLGL0RhEzpoJhv3Ws9PgzfjxdiOCo25fhpr5ccZrq7PFjtww36Ag7skwQ1kbtB6EqY2+
	MH7l9ii3sCqz1GK634OKulnlyEcrW/h6YWWQtfbciqu0yK1SaLUBv6fbRoJn8sSG//tHYdS/hRU
	BdUB5lJ4hF/LrHi1x+mw/ZwkvxcICoKC7jkyJNvTRMwbF4ZyZvMjBDrCJL0uVGKLYJUwXHQtLY3
	2cr5r97RaFCMpYUFSIFYdxDZaCSUPz1BLbpB1WMsFc3V1Ui8Bf9LrnSAq6TWMmcwsz0CbBaohMh
	CkOU2OPti5X/HwxQGjolOtzbArUVLgP9PLmoU6iSQHlM7TXq5hFxa8bKNX/CMP5S7tuu+gjgXIk
	VLOHwMU0LHsKp75zMTO7NRZcs4Pxb/jbvFaObcTKrXZLyhmpVHU0nwNkbQqrBiC+vO
X-Received: by 2002:a05:6a20:bea6:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3da39b5c429mr18372372637.1.1788604860453;
        Sat, 05 Sep 2026 03:41:00 -0700 (PDT)
Received: from houminxi ([154.197.57.228])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm13559776eec.19.2026.09.05.03.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:40:59 -0700 (PDT)
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
Subject: [PATCH 3/4] selftests: openvswitch: add missing docstrings in ovs-dpctl.py
Date: Sat,  5 Sep 2026 06:40:25 -0400
Message-ID: <20260905104026.3776396-4-houminxi@gmail.com>
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

Add one-line docstrings to all module, class, and method
definitions to fix C0114, C0115, and C0116 pylint warnings
(88 instances).

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
base-commit: 9eab111e765729e93087ff86a2ec9b2ae42d0fa5
 .../selftests/net/openvswitch/ovs-dpctl.py    | 110 ++++++++++++++++--
 1 file changed, 100 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 6a02810fe4ea..5b29aeb4b50e 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -1,5 +1,6 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
+"""OVS datapath control utility for kernel selftests."""
 
 # Controls the openvswitch module.  Part of the kselftest suite, but
 # can be used for some diagnostic purpose as well.
@@ -64,11 +65,13 @@ OVS_FLOW_CMD_SET = 4
 UINT32_MAX = 0xFFFFFFFF
 
 def macstr(mac):
+    """Format MAC address bytes as colon-separated hex string."""
     outstr = ":".join([f"{i:02X}" for i in mac])
     return outstr
 
 
 def strcspn(str1, str2):
+    """Return index of first char in str1 that is in str2."""
     tot = 0
     for char in str1:
         if str2.find(char) != -1:
@@ -78,6 +81,7 @@ def strcspn(str1, str2):
 
 
 def strspn(str1, str2):
+    """Return index of first char in str1 that is not in str2."""
     tot = 0
     for char in str1:
         if str2.find(char) == -1:
@@ -87,6 +91,7 @@ def strspn(str1, str2):
 
 
 def intparse(statestr, defmask="0xffffffff"):
+    """Parse an integer with optional mask from a state string."""
     totalparse = strspn(statestr, "0123456789abcdefABCDEFx/")
     # scan until "/"
     count = strspn(statestr, "x0123456789abcdefABCDEF")
@@ -107,6 +112,7 @@ def intparse(statestr, defmask="0xffffffff"):
 
 
 def parse_flags(flag_str, flag_vals):
+    """Parse flag string into bitmask and mask values."""
     bitResult = 0
     maskResult = 0
 
@@ -158,6 +164,7 @@ def parse_flags(flag_str, flag_vals):
 
 
 def parse_ct_state(statestr):
+    """Parse conntrack state flags string."""
     ct_flags = {
         "new": 1 << 0,
         "est": 1 << 1,
@@ -173,6 +180,7 @@ def parse_ct_state(statestr):
 
 
 def convert_mac(data):
+    """Convert MAC address string with optional mask to bytes."""
     def to_bytes(mac):
         mac_split = mac.split(":")
         ret = bytearray([int(i, 16) for i in mac_split])
@@ -188,6 +196,7 @@ def convert_mac(data):
     return to_bytes(mac_str), to_bytes(mask_str)
 
 def convert_ipv4(data):
+    """Convert IPv4 address string with optional mask to integers."""
     ip, _, mask = data.partition('/')
 
     if not ip:
@@ -200,6 +209,7 @@ def convert_ipv4(data):
     return int(ipaddress.IPv4Address(ip)), int(ipaddress.IPv4Address(mask))
 
 def convert_ipv6(data):
+    """Convert IPv6 address string with optional mask to packed bytes."""
     ip, _, mask = data.partition('/')
 
     if not ip:
@@ -212,6 +222,7 @@ def convert_ipv6(data):
     return ipaddress.IPv6Address(ip).packed, ipaddress.IPv6Address(mask).packed
 
 def convert_int(size):
+    """Return a converter for integer fields of the given bit size."""
     def convert_int_sized(data):
         value, _, mask = data.partition('/')
 
@@ -224,6 +235,7 @@ def convert_int(size):
     return convert_int_sized
 
 def parse_starts_block(block_str, scanstr, returnskipped, scanregex=False):
+    """Check if block_str starts with scanstr, optionally skip it."""
     if scanregex:
         m = re.search(scanstr, block_str)
         if m is None:
@@ -250,6 +262,7 @@ def parse_starts_block(block_str, scanstr, returnskipped, scanregex=False):
 def parse_extract_field(
     block_str, fieldstr, scanfmt, convert, masked=False, defval=None
 ):
+    """Extract a field value from block_str using regex scanfmt."""
     if fieldstr and not block_str.startswith(fieldstr):
         return block_str, defval
 
@@ -349,6 +362,7 @@ def parse_attrs(actstr, attr_desc):
 
 
 class ovs_dp_msg(genlmsg):
+    """OVS datapath generic netlink message."""
     # include the OVS version
     # We need a custom header rather than just being able to rely on
     # genlmsg because fields ends up not expressing everything correctly
@@ -357,6 +371,7 @@ class ovs_dp_msg(genlmsg):
 
 
 class ovsactions(nla):
+    """OVS datapath actions netlink attribute."""
     nla_flags = NLA_F_NESTED
 
     nla_map = (
@@ -372,7 +387,7 @@ class ovsactions(nla):
         ("OVS_ACTION_ATTR_PUSH_MPLS", "none"),
         ("OVS_ACTION_ATTR_POP_MPLS", "flag"),
         ("OVS_ACTION_ATTR_SET_MASKED", "ovskey"),
-        ("OVS_ACTION_ATTR_CT", "ctact"),
+        ("OVS_ACTION_ATTR_CT", "CtAct"),
         ("OVS_ACTION_ATTR_TRUNC", "uint32"),
         ("OVS_ACTION_ATTR_PUSH_ETH", "none"),
         ("OVS_ACTION_ATTR_POP_ETH", "flag"),
@@ -399,6 +414,7 @@ class ovsactions(nla):
         )
 
     class psample(nla):
+        """Packet sampling action attributes."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -408,6 +424,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format psample attributes as dpctl string."""
             args = f"group={int(self.get_attr('OVS_PSAMPLE_ATTR_GROUP'))}"
 
             cookie = self.get_attr("OVS_PSAMPLE_ATTR_COOKIE")
@@ -417,6 +434,7 @@ class ovsactions(nla):
             return f"psample({args})"
 
         def parse(self, actstr):
+            """Parse psample attributes from dpctl string."""
             desc = (
                 ("group", "OVS_PSAMPLE_ATTR_GROUP", int),
                 ("cookie", "OVS_PSAMPLE_ATTR_COOKIE",
@@ -431,9 +449,11 @@ class ovsactions(nla):
             return actstr
 
     class push_vlan(nla):
+        """Push VLAN action fields (tpid + tci)."""
         fields = (("vlan_tpid", "!H"), ("vlan_tci", "!H"))
 
     class sample(nla):
+        """sample action attributes."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -443,6 +463,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format sample attributes as dpctl string."""
             args = []
 
             prob = 100 * self.get_attr(
@@ -456,10 +477,11 @@ class ovsactions(nla):
             return f"sample({','.join(args)})"
 
         def parse(self, actstr):
+            """Parse sample attributes from dpctl string."""
             def parse_nested_actions(actstr):
                 subacts = ovsactions()
-                parsed_len = subacts.parse(actstr)
-                return subacts, actstr[parsed_len :]
+                parsedLen = subacts.parse(actstr)
+                return subacts, actstr[parsedLen :]
 
             def percent_to_rate(percent):
                 percent = float(percent.strip('%'))
@@ -476,7 +498,8 @@ class ovsactions(nla):
 
             return actstr
 
-    class ctact(nla):
+    class CtAct(nla):
+        """Conntrack action attributes."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -493,6 +516,7 @@ class ovsactions(nla):
         )
 
         class natattr(nla):
+            """NAT sub-action attributes."""
             nla_flags = NLA_F_NESTED
 
             nla_map = (
@@ -509,6 +533,7 @@ class ovsactions(nla):
             )
 
             def dpstr(self, more=False):
+                """Format NAT attributes as dpctl string."""
                 print_str = "nat("
 
                 if self.get_attr("OVS_NAT_ATTR_SRC"):
@@ -547,6 +572,7 @@ class ovsactions(nla):
                 return print_str
 
         def dpstr(self, more=False):
+            """Format conntrack attributes as dpctl string."""
             print_str = "ct("
 
             if self.get_attr("OVS_CT_ATTR_COMMIT") is not None:
@@ -568,6 +594,7 @@ class ovsactions(nla):
             return print_str
 
     class userspace(nla):
+        """userspace action attributes."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -578,6 +605,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format userspace attributes as dpctl string."""
             print_str = "userspace("
             if self.get_attr("OVS_USERSPACE_ATTR_PID") is not None:
                 print_str += f"pid={int(self.get_attr('OVS_USERSPACE_ATTR_PID'))},"
@@ -593,6 +621,7 @@ class ovsactions(nla):
             return print_str
 
         def parse(self, actstr):
+            """Parse userspace attributes from dpctl string."""
             attrs_desc = (
                 ("pid", "OVS_USERSPACE_ATTR_PID", int),
                 ("userdata", "OVS_USERSPACE_ATTR_USERDATA",
@@ -607,6 +636,7 @@ class ovsactions(nla):
             return actstr
 
     def dpstr(self, more=False):
+        """Format all actions as dpctl string."""
         print_str = ""
 
         for field in self["attrs"]:
@@ -669,12 +699,13 @@ class ovsactions(nla):
                 else:
                     try:
                         print_str += datum.dpstr(more)
-                    except:
-                        print_str += "{ATTR: %s not decoded}" % field[0]
+                    except Exception:
+                        print_str += f"{{ATTR: {field[0]} not decoded}}"
 
         return print_str
 
     def parse(self, actstr):
+        """Parse actions from dpctl string."""
         totallen = len(actstr)
         while len(actstr) != 0:
             parsed = False
@@ -784,7 +815,7 @@ class ovsactions(nla):
                 parencount += 2
                 subacts = ovsactions()
                 actstr = actstr[len("dec_ttl(le_1("):]
-                parsed_len = subacts.parse(actstr)
+                parsedLen = subacts.parse(actstr)
                 decttl = ovsactions.dec_ttl()
                 decttl["attrs"].append(
                     ("OVS_DEC_TTL_ATTR_ACTION", subacts)
@@ -792,7 +823,7 @@ class ovsactions(nla):
                 self["attrs"].append(
                     ("OVS_ACTION_ATTR_DEC_TTL", decttl)
                 )
-                actstr = actstr[parsed_len:]
+                actstr = actstr[parsedLen:]
                 parsed = True
             elif parse_starts_block(actstr, "clone(", False):
                 parencount += 1
@@ -824,7 +855,7 @@ class ovsactions(nla):
             elif parse_starts_block(actstr, "ct(", False):
                 parencount += 1
                 actstr = actstr[len("ct(") :]
-                ctact = ovsactions.ctact()
+                ctact = ovsactions.CtAct()
 
                 for scan in (
                     ("commit", "OVS_CT_ATTR_COMMIT", None),
@@ -851,7 +882,7 @@ class ovsactions(nla):
                     # sub-action and this lets it sit anywhere in the ct() action
                     if actstr.startswith("nat"):
                         actstr = actstr[3:]
-                        natact = ovsactions.ctact.natattr()
+                        natact = ovsactions.CtAct.natattr()
 
                         if actstr.startswith("("):
                             parencount += 1
@@ -971,6 +1002,7 @@ ovsactions.dec_ttl.actions = ovsactions
 
 
 class ovskey(nla):
+    """OVS flow key netlink attribute."""
     nla_flags = NLA_F_NESTED
     nla_map = (
         ("OVS_KEY_ATTR_UNSPEC", "none"),
@@ -1009,6 +1041,7 @@ class ovskey(nla):
     )
 
     class ovs_key_proto(nla):
+        """Protocol key fields (ethertype)."""
         fields = (
             ("src", "!H"),
             ("dst", "!H"),
@@ -1041,6 +1074,7 @@ class ovskey(nla):
             )
 
         def parse(self, flowstr, typeInst):
+            """Parse protocol key from dpctl string."""
             if not flowstr.startswith(self.proto_str):
                 return None, None
 
@@ -1082,6 +1116,7 @@ class ovskey(nla):
             return flowstr, k, m
 
         def dpstr(self, masked=None, more=False):
+            """Format protocol key as dpctl string."""
             outstr = f"{self.proto_str}("
             first = False
             for f in self.fields_map:
@@ -1110,6 +1145,7 @@ class ovskey(nla):
             return outstr
 
     class ethaddr(ovs_key_proto):
+        """Ethernet address key fields."""
         fields = (
             ("src", "!6s"),
             ("dst", "!6s"),
@@ -1151,6 +1187,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ipv4(ovs_key_proto):
+        """IPv4 key fields."""
         fields = (
             ("src", "!I"),
             ("dst", "!I"),
@@ -1204,6 +1241,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ipv6(ovs_key_proto):
+        """IPv6 key fields."""
         fields = (
             ("src", "!16s"),
             ("dst", "!16s"),
@@ -1260,6 +1298,7 @@ class ovskey(nla):
             )
 
     class ovs_key_tcp(ovs_key_proto):
+        """TCP key fields (src/dst port)."""
         def __init__(
             self,
             data=None,
@@ -1279,6 +1318,7 @@ class ovskey(nla):
             )
 
     class ovs_key_udp(ovs_key_proto):
+        """UDP key fields (src/dst port)."""
         def __init__(
             self,
             data=None,
@@ -1298,6 +1338,7 @@ class ovskey(nla):
             )
 
     class ovs_key_sctp(ovs_key_proto):
+        """SCTP key fields (src/dst port)."""
         def __init__(
             self,
             data=None,
@@ -1317,6 +1358,7 @@ class ovskey(nla):
             )
 
     class ovs_key_icmp(ovs_key_proto):
+        """ICMP key fields (type/code)."""
         fields = (
             ("type", "B"),
             ("code", "B"),
@@ -1348,6 +1390,7 @@ class ovskey(nla):
             )
 
     class ovs_key_icmpv6(ovs_key_icmp):
+        """ICMPv6 key fields (type/code)."""
         def __init__(
             self,
             data=None,
@@ -1367,6 +1410,7 @@ class ovskey(nla):
             )
 
     class ovs_key_arp(ovs_key_proto):
+        """ARP key fields."""
         fields = (
             ("sip", "!I"),
             ("tip", "!I"),
@@ -1427,6 +1471,7 @@ class ovskey(nla):
             )
 
     class ovs_key_nd(ovs_key_proto):
+        """Neighbor discovery key fields."""
         fields = (
             ("target", "!16s"),
             ("sll", "!6s"),
@@ -1463,6 +1508,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ct_tuple_ipv4(ovs_key_proto):
+        """Conntrack original tuple key (IPv4)."""
         fields = (
             ("src", "!I"),
             ("dst", "!I"),
@@ -1510,6 +1556,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ct_tuple_ipv6(nla):
+        """Conntrack original tuple key (IPv6)."""
         fields = (
             ("src", "!16s"),
             ("dst", "!16s"),
@@ -1555,6 +1602,7 @@ class ovskey(nla):
             )
 
     class ovs_key_tunnel(nla):
+        """Tunnel key fields."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -1578,6 +1626,7 @@ class ovskey(nla):
         )
 
         def parse(self, flowstr, mask=None):
+            """Parse tunnel key from dpctl string."""
             if not flowstr.startswith("tunnel("):
                 return None, None
 
@@ -1670,6 +1719,7 @@ class ovskey(nla):
             return flowstr, k, mask
 
         def dpstr(self, mask=None, more=False):
+            """Format tunnel key as dpctl string."""
             print_str = "tunnel("
 
             flagsattrs = []
@@ -1712,6 +1762,7 @@ class ovskey(nla):
             return print_str
 
     class ovs_key_mpls(nla):
+        """MPLS key fields."""
         fields = (("lse", ">I"),)
 
     # 802.1Q CFI (Canonical Format Indicator) bit, always set for Ethernet
@@ -1901,6 +1952,7 @@ class ovskey(nla):
         return flowstr, inner_key, inner_mask
 
     def parse(self, flowstr, mask=None):
+        """Parse flow key from dpctl string."""
         for field in (
             ("OVS_KEY_ATTR_PRIORITY", "skb_priority", intparse),
             ("OVS_KEY_ATTR_SKB_MARK", "skb_mark", intparse),
@@ -1997,6 +2049,7 @@ class ovskey(nla):
         return flowstr
 
     def dpstr(self, mask=None, more=False):
+        """Format flow key as dpctl string."""
         print_str = ""
 
         for field in (
@@ -2166,11 +2219,13 @@ class encap_ovskey(ovskey):
 
 
 class OvsPacket(GenericNetlinkSocket):
+    """OVS packet command message."""
     OVS_PACKET_CMD_MISS = 1  # Flow table miss
     OVS_PACKET_CMD_ACTION = 2  # USERSPACE action
     OVS_PACKET_CMD_EXECUTE = 3  # Apply actions to packet
 
     class ovs_packet_msg(ovs_dp_msg):
+        """OVS packet message header."""
         nla_map = (
             ("OVS_PACKET_ATTR_UNSPEC", "none"),
             ("OVS_PACKET_ATTR_PACKET", "array(uint8)"),
@@ -2191,6 +2246,7 @@ class OvsPacket(GenericNetlinkSocket):
         self.bind(OVS_PACKET_FAMILY, OvsPacket.ovs_packet_msg)
 
     def upcall_handler(self, up=None):
+        """Execute a packet on the datapath."""
         print("listening on upcall packet handler:", self.epid)
         while True:
             try:
@@ -2211,6 +2267,7 @@ class OvsPacket(GenericNetlinkSocket):
 
 
 class OvsDatapath(GenericNetlinkSocket):
+    """OVS datapath management."""
     OVS_DP_F_VPORT_PIDS = 1 << 1
     OVS_DP_F_DISPATCH_UPCALL_PER_CPU = 1 << 3
 
@@ -2232,6 +2289,7 @@ class OvsDatapath(GenericNetlinkSocket):
         )
 
         class dpstats(nla):
+            """Datapath info message."""
             fields = (
                 ("hit", "=Q"),
                 ("missed", "=Q"),
@@ -2240,6 +2298,7 @@ class OvsDatapath(GenericNetlinkSocket):
             )
 
         class megaflowstats(nla):
+            """Datapath statistics."""
             fields = (
                 ("mask_hit", "=Q"),
                 ("masks", "=I"),
@@ -2253,6 +2312,7 @@ class OvsDatapath(GenericNetlinkSocket):
         self.bind(OVS_DATAPATH_FAMILY, OvsDatapath.dp_cmd_msg)
 
     def info(self, dpname, ifindex=0):
+        """Create a new datapath."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_GET
         msg["version"] = OVS_DATAPATH_VERSION
@@ -2276,6 +2336,7 @@ class OvsDatapath(GenericNetlinkSocket):
     def create(
         self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
     ):
+        """Destroy a datapath."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_NEW
         if versionStr is None:
@@ -2317,6 +2378,7 @@ class OvsDatapath(GenericNetlinkSocket):
         return reply
 
     def destroy(self, dpname):
+        """Look up a datapath by name."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_DEL
         msg["version"] = OVS_DATAPATH_VERSION
@@ -2339,10 +2401,12 @@ class OvsDatapath(GenericNetlinkSocket):
 
 
 class OvsVport(GenericNetlinkSocket):
+    """OVS virtual port management."""
     OVS_VPORT_TYPE_NETDEV = 1
     OVS_VPORT_TYPE_INTERNAL = 2
 
     class ovs_vport_msg(ovs_dp_msg):
+        """Vport info message."""
         nla_map = (
             ("OVS_VPORT_ATTR_UNSPEC", "none"),
             ("OVS_VPORT_ATTR_PORT_NO", "uint32"),
@@ -2356,7 +2420,9 @@ class OvsVport(GenericNetlinkSocket):
             ("OVS_VPORT_ATTR_NETNSID", "uint32"),
         )
 
+
         class vportstats(nla):
+            """Tunnel options attributes."""
             fields = (
                 ("rx_packets", "=Q"),
                 ("tx_packets", "=Q"),
@@ -2368,7 +2434,9 @@ class OvsVport(GenericNetlinkSocket):
                 ("tx_dropped", "=Q"),
             )
 
+    @staticmethod
     def type_to_str(vport_type):
+        """Convert vport type integer to string."""
         if vport_type == OvsVport.OVS_VPORT_TYPE_NETDEV:
             return "netdev"
         if vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
@@ -2376,7 +2444,9 @@ class OvsVport(GenericNetlinkSocket):
 
         raise ValueError(f"Unknown vport type:{int(vport_type)}")
 
+    @staticmethod
     def str_to_type(vport_type):
+        """Convert vport type string to integer."""
         if vport_type in ["netdev", "gre", "vxlan", "geneve"]:
             return OvsVport.OVS_VPORT_TYPE_NETDEV
         if vport_type == "internal":
@@ -2390,6 +2460,7 @@ class OvsVport(GenericNetlinkSocket):
         self.upcall_packet = packet
 
     def info(self, vport_name, dpifindex=0, portno=None):
+        """Create a new vport."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_GET
@@ -2415,6 +2486,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def attach(self, dpindex, vport_ifname, ptype, dport):
+        """Get info about a vport."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_NEW
@@ -2468,6 +2540,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def reset_upcall(self, dpindex, vport_ifname, p=None):
+        """Attach a vport to a datapath."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_SET
@@ -2493,6 +2566,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def detach(self, dpindex, vport_ifname):
+        """Reset a vport."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_DEL
@@ -2514,11 +2588,14 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def upcall_handler(self, handler=None):
+        """Remove a vport from a datapath."""
         self.upcall_packet.upcall_handler(handler)
 
 
 class OvsFlow(GenericNetlinkSocket):
+    """OVS flow table management."""
     class ovs_flow_msg(ovs_dp_msg):
+        """Flow info message."""
         nla_map = (
             ("OVS_FLOW_ATTR_UNSPEC", "none"),
             ("OVS_FLOW_ATTR_KEY", "ovskey"),
@@ -2534,12 +2611,14 @@ class OvsFlow(GenericNetlinkSocket):
         )
 
         class flowstats(nla):
+            """Flow key/mask/actions message."""
             fields = (
                 ("packets", "=Q"),
                 ("bytes", "=Q"),
             )
 
         def dpstr(self, more=False):
+            """Format flow as dpctl string."""
             ufid = self.get_attr("OVS_FLOW_ATTR_UFID")
             ufid_str = ""
             if ufid is not None:
@@ -2606,6 +2685,7 @@ class OvsFlow(GenericNetlinkSocket):
             return print_str
 
         def parse(self, flowstr, actstr, dpidx=0):
+            """Parse flow from dpctl string."""
             OVS_UFID_F_OMIT_KEY = 1 << 0
             OVS_UFID_F_OMIT_MASK = 1 << 1
             OVS_UFID_F_OMIT_ACTIONS = 1 << 2
@@ -2770,6 +2850,7 @@ class OvsFlow(GenericNetlinkSocket):
         return rep
 
     def miss(self, packetmsg):
+        """Dump all flows for a datapath."""
         seq = packetmsg["header"]["sequence_number"]
         keystr = "(none)"
         key_field = packetmsg.get_attr("OVS_PACKET_ATTR_KEY")
@@ -2782,13 +2863,16 @@ class OvsFlow(GenericNetlinkSocket):
         print(f"MISS upcall[{int(seq)}/{pktpres}]: {keystr}", flush=True)
 
     def execute(self, packetmsg):
+        """Delete a flow from a datapath."""
         print("userspace execute command", flush=True)
 
     def action(self, packetmsg):
+        """Add a flow to a datapath."""
         print("userspace action command", flush=True)
 
 
 class psample_sample(genlmsg):
+    """psample generic netlink event handler."""
     nla_map = (
         ("PSAMPLE_ATTR_IIFINDEX", "none"),
         ("PSAMPLE_ATTR_OIFINDEX", "none"),
@@ -2809,6 +2893,7 @@ class psample_sample(genlmsg):
     )
 
     def dpstr(self):
+        """Start receiving psample events."""
         fields = []
         data = ""
         for (attr, value) in self["attrs"]:
@@ -2826,6 +2911,7 @@ class psample_sample(genlmsg):
 
 
 class psample_msg(Marshal):
+    """psample generic netlink message."""
     PSAMPLE_CMD_SAMPLE = 0
     PSAMPLE_CMD_GET_GROUP = 1
     PSAMPLE_CMD_NEW_GROUP = 2
@@ -2835,11 +2921,13 @@ class psample_msg(Marshal):
 
 
 class PsampleEvent(EventSocket):
+    """psample event listener."""
     genl_family = "psample"
     mcast_groups = ["packets"]
     marshal_class = psample_msg
 
     def read_samples(self):
+        """Set the psample group to listen on."""
         print("listening for psample events", flush=True)
         while True:
             try:
@@ -2850,6 +2938,7 @@ class PsampleEvent(EventSocket):
 
 
 def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
+    """Print full OVS datapath information."""
     dp_name = dp_lookup_rep.get_attr("OVS_DP_ATTR_NAME")
     base_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_STATS")
     megaflow_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_MEGAFLOW_STATS")
@@ -2885,6 +2974,7 @@ def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
 
 
 def main(argv):
+    """Entry point for ovs-dpctl utility."""
     nlmsg_atoms.encap_ovskey = encap_ovskey
     nlmsg_atoms.ovskey = ovskey
     nlmsg_atoms.ovsactions = ovsactions
-- 
2.55.0

