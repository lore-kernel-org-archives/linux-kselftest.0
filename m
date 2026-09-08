Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01D57C72E
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887976; cv=none; b=ky4JAM/ood0WFUYVDf0stF4Tv0UPHtxcjW7wmvnypqEqtL1O2/33DhCNbF75hSVr1YumiacAlXsWQ3gKA32M1G1t3k3vtfTFVr6N45IG1vqePCqVJrcrFRlOxOhSdKGPWNGFVVlxmUXT34bo2FBGnHqU8vEQG+ZBYV41iDy2oe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887976; c=relaxed/simple;
	bh=eduLNa1ORduO5B+Fudc5UsSFJ3HTzDwG02RzjX0VrvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udWcYcmGj1x5OXxYQxfBJYdTrdUU/kEwH1v+m2V+su/Fj7DegExeRkM18blg9VNzkTs6QekTH+DNRLO6Td7IsGi1nNKOd1jeqEbP04Ca9UDYQBWfJp5OBbKp9jfsNZojovnB9mEwax51SVrx0F2RfbLbIiJdaeOK7/4Sulgu3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx3eTkSy; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx3eTkSy"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52de50e77ffso60193251cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887973; x=1789492773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE7yLu5+B3sxxYWLK4S+CTO5Hdc/i1dk1vfXSMYF0IQ=;
        b=Mx3eTkSyKITv6O66ikVkImVVl0bCwZX7CJBWrU2asmqKbEWC/ikGYFUBpBIDtteTZ9
         nwJ4ijc2mBcJ0O2S3ElyhPUNOQjz1lEOMkWIB661Nvtk6EJ202d8rASo0ZEutlLEw/sN
         jUJMM5cFAZTeOSvA8i4FwAYxH9bUwlhKbeFjmYgXhnheP5HRgqN4oR08Vf8jwxl7upu7
         8641yd85fVhekAZycquScFg5HnU8K7tr31vgzCDB3UaucbHE3eLx0nllP/YvVK6yx6Da
         8A0VVQzKT2VO3F4+rYkCqCA20A6PYUcOfymLovRgeGyYlZFzFgdADOlc7/a+t0aze5b4
         YS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887973; x=1789492773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HE7yLu5+B3sxxYWLK4S+CTO5Hdc/i1dk1vfXSMYF0IQ=;
        b=JBwaiCdkSIovsATHkHwy3qpPMGT2PEeQ6KpBkm0GuBSpD4DrtBw1mqkk8wCO7SHhhc
         K4vLznDh27bevBBMHOEw7vHb4wgalpWcPLGh5IioxFBRPYM7T+ZAZZGgaiRDDBUlHFc5
         zkCR1UtEawM5FggsFGL5W1qEIYC5D+7Wg5nsqk0zW5shUfqHs6226Usg0GvqJVZwTe+r
         0ZZXnQaTjum6xpWEkabAv/xAYHfPKvpfVPyZx9vVnFOknU8OE9zYignj8fOlBOI9nfNE
         EQZA32Sttf0oBwYCEcE6Tb9eKUJTCPraWjsOX6w4OhOJ9zB4wXp7vDjRXQLKYF+XiNkt
         keXw==
X-Forwarded-Encrypted: i=1; AKwUvBww3oqFaHpq11S4htU6sABfhjIFtQW41ecl0ir/uFlZdcSF7TBmCUlqadxSRbTEnICRH4GlUr4JPLD0e+Z0QmU=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Qki7GKFN5MVKa1NqPsCpYqkWaCF9HaFakTxLRaIW92jhuS4S
	j7Lj+/aIjqB436b4ppfVg94z21aIvvz9U2M+PwlBTRaplAdTo4R5rOVa
X-Gm-Gg: AYBFou07Pbp73iUkORRjIGrhiDRYO0/LWcJyEBnFgUP/Y84cROkfyVU6LWHtDfRksTx
	tpol+chGq7hBHpSPKrYdjRTsdwInmCetH2V3CjpknTy4+pSNFT5+36YacaMNHXoNLpRmbe69x8k
	JW4AQ2oNrtI9651cAT1kuFInBXVHCkrcSq9efd9YiCATxUdhKIt/+rIR/D9Glnejc2F759+wk16
	iIu8JhhiU0IDlcjrSZamxfso9BfYm/P/o7jmQy/9Psam4beEfGC3AY9vf3FxDYy5VXnKcQ2iLZN
	H4jbEHmRFqGfPMbQCBcvDyqP5GCVVepvUqOAFFk8rsGxOKySVC7UfDhjRlPecHq+mIGQykhihi4
	a7anS5HuZg8h9LWV1QHZ6nlG2VLWuuYO8uZ1a88OD2xGlxExCgcly87rimsz0yyDRLM99K9cH0m
	96c5hSC9ZqhWc5OxuoPm2/cvu9hy8Zrk1xwrxZd3DAPlnCeqs2QkxHayU=
X-Received: by 2002:a05:622a:1a81:b0:51c:d52:6049 with SMTP id d75a77b69052e-530548e0cb2mr354944991cf.28.1788887968120;
        Tue, 08 Sep 2026 10:19:28 -0700 (PDT)
Received: from houminxi ([104.167.197.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541c94ddsm120081361cf.23.2026.09.08.10.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:19:27 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/4] selftests: openvswitch: add missing docstrings in ovs-dpctl.py
Date: Tue,  8 Sep 2026 13:18:58 -0400
Message-ID: <20260908171859.1967327-4-houminxi@gmail.com>
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

Add one-line docstrings to the module and all classes and methods
that pylint flags with C0114, C0115, and C0116 (87 instances).
Each docstring describes the command or attribute group the code
actually implements.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/ovs-dpctl.py    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 502e6eb4c4b4a..dc88cb1b20c13 100644
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
+    """Parse a flags string into bit and mask values."""
     bitResult = 0
     maskResult = 0
 
@@ -158,6 +164,7 @@ def parse_flags(flag_str, flag_vals):
 
 
 def parse_ct_state(statestr):
+    """Parse a conntrack state string into flag bits."""
     ct_flags = {
         "new": 1 << 0,
         "est": 1 << 1,
@@ -173,6 +180,7 @@ def parse_ct_state(statestr):
 
 
 def convert_mac(data):
+    """Convert a MAC address string with optional mask to a bytes pair."""
     def to_bytes(mac):
         mac_split = mac.split(":")
         ret = bytearray([int(i, 16) for i in mac_split])
@@ -188,6 +196,7 @@ def convert_mac(data):
     return to_bytes(mac_str), to_bytes(mask_str)
 
 def convert_ipv4(data):
+    """Convert an IPv4 address/mask string to an integer tuple."""
     ip, _, mask = data.partition('/')
 
     if not ip:
@@ -200,6 +209,7 @@ def convert_ipv4(data):
     return int(ipaddress.IPv4Address(ip)), int(ipaddress.IPv4Address(mask))
 
 def convert_ipv6(data):
+    """Convert an IPv6 address/mask string to a packed bytes tuple."""
     ip, _, mask = data.partition('/')
 
     if not ip:
@@ -212,6 +222,7 @@ def convert_ipv6(data):
     return ipaddress.IPv6Address(ip).packed, ipaddress.IPv6Address(mask).packed
 
 def convert_int(size):
+    """Return a parser for fixed-width integers with optional mask."""
     def convert_int_sized(data):
         value, _, mask = data.partition('/')
 
@@ -224,6 +235,7 @@ def convert_int(size):
     return convert_int_sized
 
 def parse_starts_block(block_str, scanstr, returnskipped, scanregex=False):
+    """Check for and optionally consume a prefix in block_str."""
     if scanregex:
         m = re.search(scanstr, block_str)
         if m is None:
@@ -250,6 +262,7 @@ def parse_starts_block(block_str, scanstr, returnskipped, scanregex=False):
 def parse_extract_field(
     block_str, fieldstr, scanfmt, convert, masked=False, defval=None
 ):
+    """Extract and convert one field from a flow string."""
     if fieldstr and not block_str.startswith(fieldstr):
         return block_str, defval
 
@@ -349,6 +362,7 @@ def parse_attrs(actstr, attr_desc):
 
 
 class ovs_dp_msg(genlmsg):
+    """Datapath generic netlink message with OVS version and dpifindex."""
     # include the OVS version
     # We need a custom header rather than just being able to rely on
     # genlmsg because fields ends up not expressing everything correctly
@@ -357,6 +371,7 @@ class ovs_dp_msg(genlmsg):
 
 
 class ovsactions(nla):
+    """OVS action attribute list (OVS_ACTION_ATTR_*)."""
     nla_flags = NLA_F_NESTED
 
     nla_map = (
@@ -399,6 +414,7 @@ class ovsactions(nla):
         )
 
     class psample(nla):
+        """psample action attributes (OVS_PSAMPLE_ATTR_*)."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -408,6 +424,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format the psample action as a dpctl string."""
             args = f"group={int(self.get_attr('OVS_PSAMPLE_ATTR_GROUP'))}"
 
             cookie = self.get_attr("OVS_PSAMPLE_ATTR_COOKIE")
@@ -417,6 +434,7 @@ class ovsactions(nla):
             return f"psample({args})"
 
         def parse(self, actstr):
+            """Parse a psample() action string."""
             desc = (
                 ("group", "OVS_PSAMPLE_ATTR_GROUP", int),
                 ("cookie", "OVS_PSAMPLE_ATTR_COOKIE",
@@ -431,9 +449,11 @@ class ovsactions(nla):
             return actstr
 
     class push_vlan(nla):
+        """push_vlan action attributes (vlan_tpid/vlan_tci)."""
         fields = (("vlan_tpid", "!H"), ("vlan_tci", "!H"))
 
     class sample(nla):
+        """Sample action attributes (OVS_SAMPLE_ATTR_*)."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -443,6 +463,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format the sample action as a dpctl string."""
             args = []
 
             prob = 100 * self.get_attr(
@@ -456,6 +477,7 @@ class ovsactions(nla):
             return f"sample({','.join(args)})"
 
         def parse(self, actstr):
+            """Parse a sample() action string."""
             def parse_nested_actions(actstr):
                 subacts = ovsactions()
                 parsed_len = subacts.parse(actstr)
@@ -477,6 +499,7 @@ class ovsactions(nla):
             return actstr
 
     class ctact(nla):
+        """Conntrack action attributes (OVS_CT_ATTR_*)."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -493,6 +516,7 @@ class ovsactions(nla):
         )
 
         class natattr(nla):
+            """NAT attributes for the conntrack action (OVS_NAT_ATTR_*)."""
             nla_flags = NLA_F_NESTED
 
             nla_map = (
@@ -509,6 +533,7 @@ class ovsactions(nla):
             )
 
             def dpstr(self, more=False):
+                """Format the NAT attributes as a dpctl string."""
                 print_str = "nat("
 
                 if self.get_attr("OVS_NAT_ATTR_SRC"):
@@ -547,6 +572,7 @@ class ovsactions(nla):
                 return print_str
 
         def dpstr(self, more=False):
+            """Format the conntrack action as a dpctl string."""
             print_str = "ct("
 
             if self.get_attr("OVS_CT_ATTR_COMMIT") is not None:
@@ -568,6 +594,7 @@ class ovsactions(nla):
             return print_str
 
     class userspace(nla):
+        """Userspace action attributes (OVS_USERSPACE_ATTR_*)."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -578,6 +605,7 @@ class ovsactions(nla):
         )
 
         def dpstr(self, more=False):
+            """Format the userspace action as a dpctl string."""
             print_str = "userspace("
             if self.get_attr("OVS_USERSPACE_ATTR_PID") is not None:
                 print_str += f"pid={int(self.get_attr('OVS_USERSPACE_ATTR_PID'))},"
@@ -593,6 +621,7 @@ class ovsactions(nla):
             return print_str
 
         def parse(self, actstr):
+            """Parse a userspace() action string."""
             attrs_desc = (
                 ("pid", "OVS_USERSPACE_ATTR_PID", int),
                 ("userdata", "OVS_USERSPACE_ATTR_USERDATA",
@@ -607,6 +636,7 @@ class ovsactions(nla):
             return actstr
 
     def dpstr(self, more=False):
+        """Format the action list as a dpctl string."""
         print_str = ""
 
         for field in self["attrs"]:
@@ -675,6 +705,7 @@ class ovsactions(nla):
         return print_str
 
     def parse(self, actstr):
+        """Parse a dpctl action string into attributes."""
         totallen = len(actstr)
         while len(actstr) != 0:
             parsed = False
@@ -971,6 +1002,7 @@ ovsactions.dec_ttl.actions = ovsactions
 
 
 class ovskey(nla):
+    """OVS flow key attributes (OVS_KEY_ATTR_*)."""
     nla_flags = NLA_F_NESTED
     nla_map = (
         ("OVS_KEY_ATTR_UNSPEC", "none"),
@@ -1009,6 +1041,7 @@ class ovskey(nla):
     )
 
     class ovs_key_proto(nla):
+        """Base class for protocol-specific flow key fields."""
         fields = (
             ("src", "!H"),
             ("dst", "!H"),
@@ -1041,6 +1074,7 @@ class ovskey(nla):
             )
 
         def parse(self, flowstr, typeInst):
+            """Parse this protocol's key and mask fields from a flow string."""
             if not flowstr.startswith(self.proto_str):
                 return None, None
 
@@ -1082,6 +1116,7 @@ class ovskey(nla):
             return flowstr, k, m
 
         def dpstr(self, masked=None, more=False):
+            """Format this protocol's key fields as a dpctl string."""
             outstr = f"{self.proto_str}("
             first = False
             for f in self.fields_map:
@@ -1110,6 +1145,7 @@ class ovskey(nla):
             return outstr
 
     class ethaddr(ovs_key_proto):
+        """Ethernet address flow key (OVS_KEY_ATTR_ETHERNET)."""
         fields = (
             ("src", "!6s"),
             ("dst", "!6s"),
@@ -1151,6 +1187,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ipv4(ovs_key_proto):
+        """IPv4 flow key (OVS_KEY_ATTR_IPV4)."""
         fields = (
             ("src", "!I"),
             ("dst", "!I"),
@@ -1204,6 +1241,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ipv6(ovs_key_proto):
+        """IPv6 flow key (OVS_KEY_ATTR_IPV6)."""
         fields = (
             ("src", "!16s"),
             ("dst", "!16s"),
@@ -1260,6 +1298,7 @@ class ovskey(nla):
             )
 
     class ovs_key_tcp(ovs_key_proto):
+        """TCP port flow key (OVS_KEY_ATTR_TCP)."""
         def __init__(
             self,
             data=None,
@@ -1279,6 +1318,7 @@ class ovskey(nla):
             )
 
     class ovs_key_udp(ovs_key_proto):
+        """UDP port flow key (OVS_KEY_ATTR_UDP)."""
         def __init__(
             self,
             data=None,
@@ -1298,6 +1338,7 @@ class ovskey(nla):
             )
 
     class ovs_key_sctp(ovs_key_proto):
+        """SCTP port flow key (OVS_KEY_ATTR_SCTP)."""
         def __init__(
             self,
             data=None,
@@ -1317,6 +1358,7 @@ class ovskey(nla):
             )
 
     class ovs_key_icmp(ovs_key_proto):
+        """ICMP flow key (OVS_KEY_ATTR_ICMP)."""
         fields = (
             ("type", "B"),
             ("code", "B"),
@@ -1348,6 +1390,7 @@ class ovskey(nla):
             )
 
     class ovs_key_icmpv6(ovs_key_icmp):
+        """ICMPv6 flow key (OVS_KEY_ATTR_ICMPV6)."""
         def __init__(
             self,
             data=None,
@@ -1367,6 +1410,7 @@ class ovskey(nla):
             )
 
     class ovs_key_arp(ovs_key_proto):
+        """ARP flow key (OVS_KEY_ATTR_ARP)."""
         fields = (
             ("sip", "!I"),
             ("tip", "!I"),
@@ -1427,6 +1471,7 @@ class ovskey(nla):
             )
 
     class ovs_key_nd(ovs_key_proto):
+        """IPv6 Neighbor Discovery flow key (OVS_KEY_ATTR_ND)."""
         fields = (
             ("target", "!16s"),
             ("sll", "!6s"),
@@ -1463,6 +1508,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ct_tuple_ipv4(ovs_key_proto):
+        """IPv4 conntrack tuple key (OVS_KEY_ATTR_CT_TUPLE_IPV4)."""
         fields = (
             ("src", "!I"),
             ("dst", "!I"),
@@ -1510,6 +1556,7 @@ class ovskey(nla):
             )
 
     class ovs_key_ct_tuple_ipv6(nla):
+        """IPv6 conntrack tuple key (OVS_KEY_ATTR_CT_TUPLE_IPV6)."""
         fields = (
             ("src", "!16s"),
             ("dst", "!16s"),
@@ -1555,6 +1602,7 @@ class ovskey(nla):
             )
 
     class ovs_key_tunnel(nla):
+        """Tunnel flow key attributes (OVS_TUNNEL_KEY_ATTR_*)."""
         nla_flags = NLA_F_NESTED
 
         nla_map = (
@@ -1578,6 +1626,7 @@ class ovskey(nla):
         )
 
         def parse(self, flowstr, mask=None):
+            """Parse a tunnel() key string."""
             if not flowstr.startswith("tunnel("):
                 return None, None
 
@@ -1670,6 +1719,7 @@ class ovskey(nla):
             return flowstr, k, mask
 
         def dpstr(self, mask=None, more=False):
+            """Format the tunnel key as a dpctl string."""
             print_str = "tunnel("
 
             flagsattrs = []
@@ -1712,6 +1762,7 @@ class ovskey(nla):
             return print_str
 
     class ovs_key_mpls(nla):
+        """MPLS flow key (OVS_KEY_ATTR_MPLS)."""
         fields = (("lse", ">I"),)
 
     # 802.1Q CFI (Canonical Format Indicator) bit, always set for Ethernet
@@ -1901,6 +1952,7 @@ class ovskey(nla):
         return flowstr, inner_key, inner_mask
 
     def parse(self, flowstr, mask=None):
+        """Parse a flow key string into key and mask attributes."""
         for field in (
             ("OVS_KEY_ATTR_PRIORITY", "skb_priority", intparse),
             ("OVS_KEY_ATTR_SKB_MARK", "skb_mark", intparse),
@@ -1997,6 +2049,7 @@ class ovskey(nla):
         return flowstr
 
     def dpstr(self, mask=None, more=False):
+        """Format the flow key as a dpctl string."""
         print_str = ""
 
         for field in (
@@ -2166,11 +2219,13 @@ class encap_ovskey(ovskey):
 
 
 class OvsPacket(GenericNetlinkSocket):
+    """OVS packet command socket (miss/action/execute upcalls)."""
     OVS_PACKET_CMD_MISS = 1  # Flow table miss
     OVS_PACKET_CMD_ACTION = 2  # USERSPACE action
     OVS_PACKET_CMD_EXECUTE = 3  # Apply actions to packet
 
     class ovs_packet_msg(ovs_dp_msg):
+        """Packet command message attributes (OVS_PACKET_ATTR_*)."""
         nla_map = (
             ("OVS_PACKET_ATTR_UNSPEC", "none"),
             ("OVS_PACKET_ATTR_PACKET", "array(uint8)"),
@@ -2191,6 +2246,7 @@ class OvsPacket(GenericNetlinkSocket):
         self.bind(OVS_PACKET_FAMILY, OvsPacket.ovs_packet_msg)
 
     def upcall_handler(self, up=None):
+        """Listen for packet upcalls and dispatch them to the handler."""
         print("listening on upcall packet handler:", self.epid)
         while True:
             try:
@@ -2211,6 +2267,7 @@ class OvsPacket(GenericNetlinkSocket):
 
 
 class OvsDatapath(GenericNetlinkSocket):
+    """OVS datapath command socket (create/destroy/lookup)."""
     OVS_DP_F_VPORT_PIDS = 1 << 1
     OVS_DP_F_DISPATCH_UPCALL_PER_CPU = 1 << 3
 
@@ -2232,6 +2289,7 @@ class OvsDatapath(GenericNetlinkSocket):
         )
 
         class dpstats(nla):
+            """Datapath statistics (OVS_DP_ATTR_STATS)."""
             fields = (
                 ("hit", "=Q"),
                 ("missed", "=Q"),
@@ -2240,6 +2298,7 @@ class OvsDatapath(GenericNetlinkSocket):
             )
 
         class megaflowstats(nla):
+            """Datapath megaflow statistics (OVS_DP_ATTR_MEGAFLOW_STATS)."""
             fields = (
                 ("mask_hit", "=Q"),
                 ("masks", "=I"),
@@ -2253,6 +2312,7 @@ class OvsDatapath(GenericNetlinkSocket):
         self.bind(OVS_DATAPATH_FAMILY, OvsDatapath.dp_cmd_msg)
 
     def info(self, dpname, ifindex=0):
+        """Look up a datapath by name."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_GET
         msg["version"] = OVS_DATAPATH_VERSION
@@ -2276,6 +2336,7 @@ class OvsDatapath(GenericNetlinkSocket):
     def create(
         self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
     ):
+        """Create a new datapath."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_NEW
         if versionStr is None:
@@ -2317,6 +2378,7 @@ class OvsDatapath(GenericNetlinkSocket):
         return reply
 
     def destroy(self, dpname):
+        """Destroy a datapath."""
         msg = OvsDatapath.dp_cmd_msg()
         msg["cmd"] = OVS_DP_CMD_DEL
         msg["version"] = OVS_DATAPATH_VERSION
@@ -2339,10 +2401,12 @@ class OvsDatapath(GenericNetlinkSocket):
 
 
 class OvsVport(GenericNetlinkSocket):
+    """OVS vport command socket (attach/detach/lookup)."""
     OVS_VPORT_TYPE_NETDEV = 1
     OVS_VPORT_TYPE_INTERNAL = 2
 
     class ovs_vport_msg(ovs_dp_msg):
+        """Vport command message attributes (OVS_VPORT_ATTR_*)."""
         nla_map = (
             ("OVS_VPORT_ATTR_UNSPEC", "none"),
             ("OVS_VPORT_ATTR_PORT_NO", "uint32"),
@@ -2357,6 +2421,7 @@ class OvsVport(GenericNetlinkSocket):
         )
 
         class vportstats(nla):
+            """Vport statistics (OVS_VPORT_ATTR_STATS)."""
             fields = (
                 ("rx_packets", "=Q"),
                 ("tx_packets", "=Q"),
@@ -2370,6 +2435,7 @@ class OvsVport(GenericNetlinkSocket):
 
     @staticmethod
     def type_to_str(vport_type):
+        """Convert a vport type constant to its string name."""
         if vport_type == OvsVport.OVS_VPORT_TYPE_NETDEV:
             return "netdev"
         if vport_type == OvsVport.OVS_VPORT_TYPE_INTERNAL:
@@ -2379,6 +2445,7 @@ class OvsVport(GenericNetlinkSocket):
 
     @staticmethod
     def str_to_type(vport_type):
+        """Convert a vport type string to its constant."""
         if vport_type in ["netdev", "gre", "vxlan", "geneve"]:
             return OvsVport.OVS_VPORT_TYPE_NETDEV
         if vport_type == "internal":
@@ -2392,6 +2459,7 @@ class OvsVport(GenericNetlinkSocket):
         self.upcall_packet = packet
 
     def info(self, vport_name, dpifindex=0, portno=None):
+        """Get info about a vport."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_GET
@@ -2417,6 +2485,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def attach(self, dpindex, vport_ifname, ptype, dport):
+        """Create a vport and attach it to a datapath."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_NEW
@@ -2470,6 +2539,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def reset_upcall(self, dpindex, vport_ifname, p=None):
+        """Reset a vport's upcall pid."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_SET
@@ -2495,6 +2565,7 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def detach(self, dpindex, vport_ifname):
+        """Remove a vport from a datapath."""
         msg = OvsVport.ovs_vport_msg()
 
         msg["cmd"] = OVS_VPORT_CMD_DEL
@@ -2516,11 +2587,14 @@ class OvsVport(GenericNetlinkSocket):
         return reply
 
     def upcall_handler(self, handler=None):
+        """Delegate upcall handling to the packet socket."""
         self.upcall_packet.upcall_handler(handler)
 
 
 class OvsFlow(GenericNetlinkSocket):
+    """OVS flow command socket (add/modify/delete/dump flows)."""
     class ovs_flow_msg(ovs_dp_msg):
+        """Flow command message attributes (OVS_FLOW_ATTR_*)."""
         nla_map = (
             ("OVS_FLOW_ATTR_UNSPEC", "none"),
             ("OVS_FLOW_ATTR_KEY", "ovskey"),
@@ -2536,12 +2610,14 @@ class OvsFlow(GenericNetlinkSocket):
         )
 
         class flowstats(nla):
+            """Flow statistics (OVS_FLOW_ATTR_STATS)."""
             fields = (
                 ("packets", "=Q"),
                 ("bytes", "=Q"),
             )
 
         def dpstr(self, more=False):
+            """Format the flow message as a dpctl string."""
             ufid = self.get_attr("OVS_FLOW_ATTR_UFID")
             ufid_str = ""
             if ufid is not None:
@@ -2608,6 +2684,7 @@ class OvsFlow(GenericNetlinkSocket):
             return print_str
 
         def parse(self, flowstr, actstr, dpidx=0):
+            """Parse flow and action strings into a flow message."""
             OVS_UFID_F_OMIT_KEY = 1 << 0
             OVS_UFID_F_OMIT_MASK = 1 << 1
             OVS_UFID_F_OMIT_ACTIONS = 1 << 2
@@ -2772,6 +2849,7 @@ class OvsFlow(GenericNetlinkSocket):
         return rep
 
     def miss(self, packetmsg):
+        """Handle a flow-table miss upcall."""
         seq = packetmsg["header"]["sequence_number"]
         keystr = "(none)"
         key_field = packetmsg.get_attr("OVS_PACKET_ATTR_KEY")
@@ -2784,13 +2862,16 @@ class OvsFlow(GenericNetlinkSocket):
         print(f"MISS upcall[{int(seq)}/{pktpres}]: {keystr}", flush=True)
 
     def execute(self, packetmsg):
+        """Handle a userspace execute upcall."""
         print("userspace execute command", flush=True)
 
     def action(self, packetmsg):
+        """Handle a userspace action upcall."""
         print("userspace action command", flush=True)
 
 
 class psample_sample(genlmsg):
+    """psample sample event message (PSAMPLE_ATTR_*)."""
     nla_map = (
         ("PSAMPLE_ATTR_IIFINDEX", "none"),
         ("PSAMPLE_ATTR_OIFINDEX", "none"),
@@ -2811,6 +2892,7 @@ class psample_sample(genlmsg):
     )
 
     def dpstr(self):
+        """Format the psample event as a string."""
         fields = []
         data = ""
         for (attr, value) in self["attrs"]:
@@ -2828,6 +2910,7 @@ class psample_sample(genlmsg):
 
 
 class psample_msg(Marshal):
+    """psample generic netlink message marshaller."""
     PSAMPLE_CMD_SAMPLE = 0
     PSAMPLE_CMD_GET_GROUP = 1
     PSAMPLE_CMD_NEW_GROUP = 2
@@ -2837,11 +2920,13 @@ class psample_msg(Marshal):
 
 
 class PsampleEvent(EventSocket):
+    """Socket listening for psample multicast events."""
     genl_family = "psample"
     mcast_groups = ["packets"]
     marshal_class = psample_msg
 
     def read_samples(self):
+        """Print psample events as they arrive."""
         print("listening for psample events", flush=True)
         while True:
             try:
@@ -2852,6 +2937,7 @@ class PsampleEvent(EventSocket):
 
 
 def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
+    """Print full datapath state: stats, vports, and flows."""
     dp_name = dp_lookup_rep.get_attr("OVS_DP_ATTR_NAME")
     base_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_STATS")
     megaflow_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_MEGAFLOW_STATS")
@@ -2887,6 +2973,7 @@ def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
 
 
 def main(argv):
+    """Entry point: parse arguments and run the ovs-dpctl command."""
     nlmsg_atoms.encap_ovskey = encap_ovskey
     nlmsg_atoms.ovskey = ovskey
     nlmsg_atoms.ovsactions = ovsactions
-- 
2.55.0

