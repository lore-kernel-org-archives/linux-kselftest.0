Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36693A2560
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638496; cv=none; b=Vo6/IPumWv0uTea19Ye5Q6+k9hJM4oXZ6YQKxu6gbMzP7ylk/UJ+KubA7WHITehqfbXF4/BDIr32Xc/sF+xd6gt0ag/EqY4+lh+NMIycUle4tjh0ucXIx6eUqzy6CtX+5HghXkdT2z3SOTaP8Ad+IszqGfRwniUL7nTBRmHfxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638496; c=relaxed/simple;
	bh=9TjFmxMAJxEeP15Mp+otopDVbPHM2YTsOimVxWwo2go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGADbkCL/2vKX/WmR9PpkYlSu1pC9uPW+a/tHLGZkaysGIkzZnFQDaDvkMVOniK/Kp94GVfkRUg4XQQAEIN4/H5hOTQXTZ4EwX24vubK26c+dYjvnPsqL5qbbM5bOQ8e/uQ71YXGuglEQXW9i/SMA/6kC7WPxIwCV8937C0spXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1R5u+HW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1R5u+HW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b7adb38d65so17100075ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777638494; x=1778243294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEYXiPSD8teEVjafPyld1dLG1JDxUCAY+nTRXNsUO0Y=;
        b=V1R5u+HWQ+/78n/3APuT+DwksG+sYnd+Iynum3HfOlNEM9ybfU5/yOMUHOjDC+yh+k
         qxEgGmDGoRpI+D6Kf+Gd8T/ES7xTuVIe7FroxNx5Zxp6eXvktLHGj26ezgI9V5xDn4tj
         fqDbKixMLh7RfjJUzenfasfZ6O5/SLl7SGD0+rX+gYz98Pi1MacmpIOwpR7281vJYWh6
         ZN3Dd37rKWJ903OeW2PPUer4kfr/SFTtxeNd9Mv7ffmzyzK0ndNiWk0w+5iXHf2IXXaS
         Uu+BemB06RaZdrE8gM9a/DXS7dS/1JnQ8OJMWV2gmPBsvw48vRHYPggIMIvdh2ecdggr
         EkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777638494; x=1778243294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JEYXiPSD8teEVjafPyld1dLG1JDxUCAY+nTRXNsUO0Y=;
        b=QC+EjPR7Ubk8s/H4f9fHHeSFPnO8EZDbwaLJf3QW5AORl/QR0AXVeBh/fBd+SIPA/8
         9Sjw9U/VG94mZ7hUSTAd04eyhWTZezUQl12QoRFfaDk013U8NWCzi/p8W4deHe7nkzvG
         ikozhO/nNUec+okuHZ68CfoOcgHuSbw4gMjz0ZIvpMnnD1NrSa4IoIJ9GUa6FA0t9oKP
         Vha/oyRijM2H0v3YNxQ1jph9zdxEC55lZypM++kLLXVxh3GvBKqMe2g08X8Qdb8z52Xn
         tv4JS8UqKLcfgE6XuyuJ68GTzN2xwkTLUuOJqg+CGtTRgTwoDmwikR+DTgJs8UymeDJI
         daKQ==
X-Gm-Message-State: AOJu0YypZ6b8vtCNrzAQvQVMfSSJEKFrVwcOx5wHyREwfcIznYmz3Rvt
	oB/5HgejcreQyu4tII2+YfEP4g/7KnZdtjB8NaA1sRiiOZDtc5aOI4EY
X-Gm-Gg: AeBDietsbsmWiPPYbDE8rRMTDkVRwvv9P9hedcLnJ5V2Ri1PaLR0LMk1Rc+MtbPaCjF
	CSyvPFvph1qD4pO91o3LRlqCIspSBR7aHrKU93sENXuWDkNYhHCTBv9d4B+q6oJ/4AFhgoBylEM
	+bg6wK6dZElk3SvMer55n54Kb9WjCBNgeVJxf575cAUbWttNbp3aWJ+4B9p7LYpJeR5lm7vCSgr
	olJa+C4gKrls0BsSxhEHHioI9m6ejXKWkFoV/L8ixfnIkj2LXESZ7b2Notn4o8VdFNpTnp+YaxP
	FB+4awx2fyl7kIOD+LeFrvQBzxVKcIIiOGvCdl+WXRtcPCRffC6XoylSz9yiAFYGUNXpa+FP0FP
	m2xnJxbxAjT/2Ey5JHWJoNl2OhRy2uKffWYXSFxWhA0ZSbBOtZF7ETG5QFPf0YG7duxgZ5cGDtC
	yuOzxVQqed8yQ2/1yo30C2QBmJVmA=
X-Received: by 2002:a17:902:76ca:b0:2b0:ac1e:973a with SMTP id d9443c01a7336-2b9a2524332mr51585155ad.39.1777638493923;
        Fri, 01 May 2026 05:28:13 -0700 (PDT)
Received: from houminxi ([38.207.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9ca953894sm23370395ad.0.2026.05.01.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:28:13 -0700 (PDT)
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
Subject: [PATCH 1/2] selftests: openvswitch: add vlan() and encap() flow string parsing
Date: Fri,  1 May 2026 20:27:55 +0800
Message-ID: <20260501122756.3081754-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501122756.3081754-1-houminxi@gmail.com>
References: <20260501122756.3081754-1-houminxi@gmail.com>
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

