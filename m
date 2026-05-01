Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156F83B27CF
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777642783; cv=none; b=GdRDL8Krwd9c2L8+3sReDVpROVQO9EVykwtrbjUAk+aHbxrvwdZGtRM28nCOsRufdkUVAcmjO1jm4f3ATTQZ+GEwjgHUkqOKZbFBY6Ye3IeP8Y/vZdLCm9vw+/yCu5kfITVT6BebZXKtsvuZzP0ZY+fVbf/A6MS6tbA+AzT0Nb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777642783; c=relaxed/simple;
	bh=Y0UWSrjC5k4StzAITY/AGPh+Kwc3y0vDbgyBhXz+Znw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kA/QVBNQ/u2uMi80Rs8wYoqK17550C5K4DP9N70xporsP22r808HL3iaalnMc+0fJ4/sI/VuGwNPvXrQjMg20wqge5hvRzoW/eoFHoxDf6a6YOpB0fuKP2Uo9b+AJIYB6EulXtEbrcxXCDKKc/sPSxJ2frehXdSQilMHchLNS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl1QDSFw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl1QDSFw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-827270d50d4so1851406b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777642781; x=1778247581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBUdc3yx6OeZeNgFbIeAinqkyWh6EhE9Q31G7NtAQnk=;
        b=Gl1QDSFwUOWPtMG013XIFvhu5+WpCKKE+KytRmJLGs2qe3p9bPXKM52vtSv8P3lHto
         vLD1fZtyH8sos5ZinJbqYLDFvOOWKh8rPU7s5OrKq1VMsq3P1pHkBtKClKL0c05gILSQ
         PTmSTCZ4usw1Os2FZMGuXpAHxcPMYJNSJHfk4eCDnsvFFNNWXCJSlR3c+tVpspXP2pRh
         LUAIpqLWpFKRcakyJ6sJQP8R6yUCZbX7p+BHIi/qk5MnEwbveklnpO3DmTXQPKATACpG
         nnTPN6P+KnoL0rPXu/Hdi2jgguaBkBJsdcHeLPvNxginGkDPoNpQpe8lFr/fePvWTG9P
         O4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777642781; x=1778247581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBUdc3yx6OeZeNgFbIeAinqkyWh6EhE9Q31G7NtAQnk=;
        b=I1a9qZKR/gVP8A8BDlQ5DxJhRBcsOKAQsEyxFnUyFdWhVV3Rg3bd/YjnL8OmMAiytt
         EML99wdA+3blgO6LKisFxIjeCXjDvNA8NNJV8rEUhnVY7bN9NIalLhKb6TU57nYpfBIQ
         CrBMKUatK7jkzXdKxGRT91m70E0PdOmQAwK5ADl5tB0C7Zp8gTIg3dAXHnFnVJV8a6Uj
         deVVGTX6c1EqXWwS2N/s2P2rtKHhibe2XHrgxELzj888Qv/nnjTbSvyWASSysBXqsts4
         LSUTbW5KmlkiJIsHJh97mrWzE7/MzP4dEBvwBqHXxaA6i79DTX+0aazaSNsNDCaSufyo
         1QqQ==
X-Gm-Message-State: AOJu0YxOX4NZ8kSyhYHNB/cUP5KGQwHHvUVl2SzmR6zJpAr2E08ptxtN
	WgYnQ5G/S1GmtIjxdbYta1D2iV4NkcIPRLLjMvcFtF8iHtujT63cUy0s
X-Gm-Gg: AeBDietauRWAGPLw/FKPpoMs+EUnAML4xnIVmJq4Dn9+8VrP3QumH/uQamaAzLbc5YM
	ShAh3ksd39nt1TAnIFiSHl3xEycm2lVKdlN6mAkuYGn8ZMUnjMi+KnBl6j5EyiZuWRltjc+LKW3
	pRBTgo+GqdUQXJC1mriPSqv66pib84gyI13NxYen3ErTB5tCLrZOdto5F1S3ltCjQBsfJZrKfhl
	tDSR4dbJSHaT+aEcQmB/lprh9kwHOeA6nhfrPoJTicAyRYmDtdTQ8Wwv0xtkc+duSDY8XFOXn9n
	XrUkvDH0FkAZG3EPtw/Y1MqM+HSChHqlTg1EvdH0b23QprOPj0lZXj0n1zSj0E2+ZvVCbusV+Wm
	3we064y/HfBA3kRl6f+1OvIF3nqr72CGOFMpfdTr1ia+Rv9c72XKeeijETR+HNsMpTqUM6LfNUE
	WPBHTWz8mtR7vGA/8g8zPEkbTsHOA=
X-Received: by 2002:a05:6a00:f8d:b0:82c:77cd:50e8 with SMTP id d2e1a72fcca58-834fdbeae25mr9005825b3a.27.1777642781380;
        Fri, 01 May 2026 06:39:41 -0700 (PDT)
Received: from houminxi ([38.207.130.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm2548386b3a.22.2026.05.01.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:39:40 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	dev@openvswitch.org,
	Minxi Hou <houminxi@gmail.com>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] selftests: openvswitch: add vlan() and encap() flow string parsing
Date: Fri,  1 May 2026 21:39:22 +0800
Message-ID: <20260501133924.3100680-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501133924.3100680-1-houminxi@gmail.com>
References: <20260501133924.3100680-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the ovs-dpctl.py flow parser to support vlan() and encap()
match strings.  vlan() accepts tci=, vid=, pcp=, and cfi=
parameters and generates the OVS_KEY_ATTR_VLAN attribute with a TCI
value in network byte order.  encap() parses nested flow strings
and returns OVS_KEY_ATTR_ENCAP with inner key attributes as a
recursive NLA container.

The encap nla_map type is changed from "none" to "nested" so that
pyroute2 recursively encodes the inner flow key attributes.  The
VLAN nla_map type is changed from "uint16" to "be16" to match the
kernel's big-endian wire format.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v1 -> v2: rebase to latest net-next/main, drop --base=auto

 .../selftests/net/openvswitch/ovs-dpctl.py    | 190 +++++++++++++++++-
 1 file changed, 188 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 848f61fdcee0..317be7878937 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -901,11 +901,11 @@ class ovskey(nla):
     nla_flags = NLA_F_NESTED
     nla_map = (
         ("OVS_KEY_ATTR_UNSPEC", "none"),
-        ("OVS_KEY_ATTR_ENCAP", "none"),
+        ("OVS_KEY_ATTR_ENCAP", "nested"),
         ("OVS_KEY_ATTR_PRIORITY", "uint32"),
         ("OVS_KEY_ATTR_IN_PORT", "uint32"),
         ("OVS_KEY_ATTR_ETHERNET", "ethaddr"),
-        ("OVS_KEY_ATTR_VLAN", "uint16"),
+        ("OVS_KEY_ATTR_VLAN", "be16"),
         ("OVS_KEY_ATTR_ETHERTYPE", "be16"),
         ("OVS_KEY_ATTR_IPV4", "ovs_key_ipv4"),
         ("OVS_KEY_ATTR_IPV6", "ovs_key_ipv6"),
@@ -1636,6 +1636,180 @@ class ovskey(nla):
     class ovs_key_mpls(nla):
         fields = (("lse", ">I"),)
 
+    # 802.1Q CFI (Canonical Format Indicator) bit, always set for Ethernet
+    _VLAN_CFI_MASK = 0x1000
+    _MAX_ENCAP_DEPTH = 4
+    _encap_depth = 0  # single-threaded usage assumed
+
+    @staticmethod
+    def _parse_vlan_from_flowstr(flowstr):
+        """Parse vlan(tci=X) or vlan(vid=X[,pcp=Y,cfi=Z]) from flowstr.
+
+        Returns (remaining_flowstr, key_tci, mask_tci).
+        TCI values use standard bit layout (VID bits 0-11,
+        CFI bit 12, PCP bits 13-15); byte order conversion to
+        big-endian happens in pyroute2 be16 NLA serialization.
+        The mask covers only the fields the caller specified:
+        vid -> 0x0FFF, pcp -> 0xE000, cfi -> 0x1000, tci -> 0xFFFF.
+
+        The tci= key sets the raw TCI bitfield (no CFI validation) to allow
+        non-Ethernet use cases.  Use cfi=1 for standard Ethernet VLAN matching.
+        """
+        tci = 0
+        mask = 0
+        has_tci = False
+        has_vid = has_pcp = has_cfi = False
+        _tci_mix_err = "vlan(): 'tci' cannot be mixed " \
+                       "with 'vid'/'pcp'/'cfi'"
+        first = True
+        while True:
+            flowstr = flowstr.lstrip()
+            if not flowstr:
+                raise ValueError("vlan(): missing ')'")
+            if flowstr[0] == ')':
+                break
+            if not first:
+                flowstr = flowstr[1:]  # skip ','
+                if not flowstr:
+                    raise ValueError("vlan(): missing ')' after trailing comma")
+                flowstr = flowstr.lstrip()
+                if flowstr and flowstr[0] == ')':
+                    break
+                if flowstr and flowstr[0] == ',':
+                    raise ValueError(
+                        "vlan(): empty or extra comma in field list")
+            first = False
+
+            eq = flowstr.find('=')
+            if eq == -1:
+                raise ValueError("vlan(): expected key=value, got '%s'" % flowstr)
+            key = flowstr[:eq].strip()
+            flowstr = flowstr[eq + 1:]
+
+            end = flowstr.find(',')
+            end2 = flowstr.find(')')
+            if end == -1 or (end2 != -1 and end2 < end):
+                end = end2
+            val = flowstr[:end].strip()
+            flowstr = flowstr[end:]
+
+            if not val:
+                raise ValueError("vlan(): empty value for key '%s'" % key)
+            try:
+                v = int(val, 16) if val.startswith(('0x', '0X')) else int(val)
+            except ValueError:
+                raise ValueError("vlan(): invalid value '%s' for key '%s'" %
+                                 (val, key))
+
+            if key == 'tci':
+                if has_tci:
+                    raise ValueError("vlan(): duplicate 'tci'")
+                if has_vid or has_pcp or has_cfi:
+                    raise ValueError(_tci_mix_err)
+                if v > 0xFFFF or v < 0:
+                    raise ValueError("vlan(): tci=0x%x out of range" % v)
+                tci = v
+                mask = 0xFFFF
+                has_tci = True
+            elif key == 'vid':
+                if has_tci:
+                    raise ValueError(_tci_mix_err)
+                if has_vid:
+                    raise ValueError("vlan(): duplicate 'vid'")
+                if v < 0 or v > 0xFFF:
+                    raise ValueError("vlan(): vid=%d out of range (0-4095)" % v)
+                tci |= v
+                mask |= 0x0FFF
+                has_vid = True
+            elif key == 'pcp':
+                if has_tci:
+                    raise ValueError(_tci_mix_err)
+                if has_pcp:
+                    raise ValueError("vlan(): duplicate 'pcp'")
+                if v < 0 or v > 7:
+                    raise ValueError("vlan(): pcp=%d out of range (0-7)" % v)
+                tci |= (v & 0x7) << 13
+                mask |= 0xE000
+                has_pcp = True
+            elif key == 'cfi':
+                if has_tci:
+                    raise ValueError(_tci_mix_err)
+                if has_cfi:
+                    raise ValueError("vlan(): duplicate 'cfi'")
+                if v != 1:
+                    raise ValueError("vlan(): cfi must be 1 for Ethernet")
+                tci |= ovskey._VLAN_CFI_MASK
+                mask |= ovskey._VLAN_CFI_MASK
+                has_cfi = True
+            else:
+                raise ValueError("vlan(): unknown key '%s'" % key)
+
+        flowstr = flowstr[1:]  # skip ')'
+        # Catch immediate '))' (user error).  A ')' after ',' is consumed
+        # by parse()'s strspn(flowstr, "), ") inter-field separator stripping.
+        if flowstr.lstrip().startswith(')'):
+            raise ValueError("vlan(): unmatched ')'")
+        # parse() strips trailing ',', ')', ' ' as inter-field separators,
+        # so we do not need to call strspn here.
+
+        if mask == 0:
+            raise ValueError("vlan(): no fields specified, "
+                             "use vlan(vid=X[,pcp=Y,cfi=Z]) or vlan(tci=X)")
+        if not has_tci:
+            tci |= ovskey._VLAN_CFI_MASK
+            mask |= ovskey._VLAN_CFI_MASK
+        return flowstr, tci, mask
+
+    @staticmethod
+    def _parse_encap_from_flowstr(flowstr):
+        """Parse encap(inner_flow) from flowstr.
+
+        Returns (remaining_flowstr, inner_key_dict, inner_mask_dict)
+        where each dict has an 'attrs' key for recursive NLA encoding.
+        Parenthesis-depth tracking handles nested encap() calls but not
+        quoted strings containing literal parentheses.
+        """
+        if ovskey._encap_depth >= ovskey._MAX_ENCAP_DEPTH:
+            raise ValueError("encap(): max nesting depth %d exceeded" %
+                             ovskey._MAX_ENCAP_DEPTH)
+        try:
+            ovskey._encap_depth += 1
+            depth = 1
+            end = -1
+            for i, c in enumerate(flowstr):
+                if c == '(':
+                    depth += 1
+                elif c == ')':
+                    depth -= 1
+                    if depth < 0:
+                        raise ValueError("encap(): unmatched ')' at position %d" % i)
+                    if depth == 0:
+                        end = i
+                        break
+
+            if end == -1:
+                if depth > 1:
+                    raise ValueError("encap(): missing ')' at end")
+                raise ValueError("encap(): missing closing ')'")
+
+            inner_str = flowstr[:end].strip()
+            if not inner_str:
+                raise ValueError("encap(): empty inner flow")
+
+            flowstr = flowstr[end + 1:]
+            if flowstr.lstrip().startswith(')'):
+                raise ValueError("encap(): unmatched ')' after encap()")
+            # parse() strips trailing ',', ')', ' ' as inter-field separators,
+            # so we do not need to call strspn here.
+
+            inner_key = ovskey()
+            inner_mask = ovskey()
+            inner_key.parse(inner_str, inner_mask)
+
+            return flowstr, inner_key, inner_mask
+        finally:
+            ovskey._encap_depth -= 1
+
     def parse(self, flowstr, mask=None):
         for field in (
             ("OVS_KEY_ATTR_PRIORITY", "skb_priority", intparse),
@@ -1657,6 +1831,16 @@ class ovskey(nla):
                 "eth_type",
                 lambda x: intparse(x, "0xffff"),
             ),
+            (
+                "OVS_KEY_ATTR_VLAN",
+                "vlan",
+                ovskey._parse_vlan_from_flowstr,
+            ),
+            (
+                "OVS_KEY_ATTR_ENCAP",
+                "encap",
+                ovskey._parse_encap_from_flowstr,
+            ),
             (
                 "OVS_KEY_ATTR_IPV4",
                 "ipv4",
@@ -1794,6 +1978,8 @@ class ovskey(nla):
                 True,
             ),
             ("OVS_KEY_ATTR_ETHERNET", None, None, False, False),
+            ("OVS_KEY_ATTR_VLAN", "vlan", "0x%04x", lambda x: False, True),
+            ("OVS_KEY_ATTR_ENCAP", None, None, False, False),
             (
                 "OVS_KEY_ATTR_ETHERTYPE",
                 "eth_type",
-- 
2.53.0

