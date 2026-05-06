Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68692466B66
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073167; cv=none; b=hygZkrWJmQo6FT4bJVkrnUtaZ1zxWPAs8jy4FQBizl4MA2l6VJxCfk84hDpRhB77IbbmIM8OU7eP8mIqE1CHQhKslXDZFc0k046mI95K/0NtMu/H9IbFd5nQ+FB2atDuHmBnqTtgRAt4E8SmOhaSBGLfiZRQIzox/QS0gwD2/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073167; c=relaxed/simple;
	bh=hEYXTy36B1S+siQ5tPyffcehRVHrtA5bva4tlKs0+cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a92wr+8g0JGxNjJh1jhKHQBss4utXh3YGQeLFx43II56uOxnxQnYRF1rTZiY8tsnHNC7FEKkNZyWsy7HgZYXwJSqUrP27gZe5lcDeWM+0w8nEAAv2jKAk2S2HhMPywM1OYj5kpVJry2QkjVpi47T70zoTa9pfdtqU+wH34CuJYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKz5zjXO; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKz5zjXO"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7dca00c1591so2057879a34.3
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778073164; x=1778677964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RTucY8aaP+myLH4AwJ8twqF7kqXmyO5eBRlw0Iai4Y=;
        b=oKz5zjXOd/bzfXtYbZSoiC/SAYBWPD96bynw5RwflGAEWG43vAwKTJWUVm4bmkk6Zg
         qbGofUu5XQTcoGnBnIby6dodwSz0u1xG0t9QrlibsQenFqpoc0WgEwUptwqOpWoJrFzk
         qX0sByHpFmXGayCfiD2Cw2luOcJGgyRGAIv9DBs3NZRxFTjme1SYiEP9YPFSjO/ZdXx6
         iEBXdALCK/sp7BdMJLQjRlwL+KgjYDiK0qhaDpdRpH1VIRYmvw/V0WrHnn/F0LGQQc0z
         nepcbmRWHdldnvIEK9q7gwXPNZGXoaADLEsoIx4ujcfg0e8uF7U3+LvgXCyJhz4Gz4Yb
         jXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778073164; x=1778677964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4RTucY8aaP+myLH4AwJ8twqF7kqXmyO5eBRlw0Iai4Y=;
        b=hH6mWk6iga8uclPHgeIumQOCmtu5SV1pO1+L7MSyExZ3ZMd7BwpTcLAGiT42i8xHUq
         opBnIEDUpkkjbNLpkRSvTe3SDHZlCp8o7dnAP+ECRQYE0V+b4FgSO5s2/D7qd1yVNAJu
         kppAf7S+inzL+K6TuT4SUcnUN664gMEcip6AQ/3zijSUL30ma89sUYwzwaEVQ+XPPwEg
         trXP0VJWJHyEv25dB5swMMnoe0bewyOFxgDirLdnWzEh0SjQAoOC+C6FF6HEnNgDQhCy
         9XCj1KoUc0eCyEHwgliru5NdQ+axefU1YkCI7l86GXVf0OFFMxJ0zHlLUblWhLGY4AeK
         2RCw==
X-Forwarded-Encrypted: i=1; AFNElJ91zqU8BC4mzyRxyi0BS/+aosa+NjEagFBosuZnAjMHjW2a2GUED1Zk8tSgBfOv5wDdCIi1CWY/PKYhuOqEX4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvFmMIe+h40uGuW80AawnSekkweeJVeMJRXi1fKEwRLQ0woIv
	/3Y8OASHbzi01fSqihYbYcONUDu4SBX/FvqABPvhqWXyZ22cFao/g4Wb
X-Gm-Gg: AeBDieshYTniXCUR/QiXQT3Kai9aQoFe01rw7ctkRi54c3LmTslVLLR9gjEVYzCnBJp
	MRiHFYVNIOZsaj3pIzyRGGean3qe6oRbWpMTEVf58RrZ3liAGbtiNZFLNMOa0YSXmnjXYgMRzkA
	GGdWAAOHekXPoZ3fquKieCuL5Dy2tloT9zrsaIjhYXDiLuItzDI3nYF8iIBECWSyZODYPaY7ZjZ
	aF2OXjodCoPOX/IJnPFkuaM7cVGayi07TRAuKsUv4onbC6+NkX/6VESAtWNy/7EjeR6zhXuqtS3
	UZM0493gfkqmzS1CWbQkQssP349b2N+OBzpUSi/zuv1+9/wY/bRuI0Hu07z3OmNl3dLpsiRWOUO
	R7txpMRdm1RmI0/jfSDkV2d8FA3JZqgkoyIIQgVjNCJYvdypyF9KG4KJDRrQBd3tfxzo/HQolJo
	YTvrIr1cU4HMitwARlakeCSCLNQg==
X-Received: by 2002:a05:6808:1a14:b0:479:dcb1:dce3 with SMTP id 5614622812f47-48041ea1cd5mr1677721b6e.0.1778073164242;
        Wed, 06 May 2026 06:12:44 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434548d9decsm17327859fac.3.2026.05.06.06.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:12:43 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v6 1/2] selftests: openvswitch: add vlan() and encap() flow string parsing
Date: Wed,  6 May 2026 21:12:17 +0800
Message-ID: <20260506131218.1880852-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506131218.1880852-1-houminxi@gmail.com>
References: <20260506131218.1880852-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add VLAN TCI formatting and parsing support to ovs-dpctl.py:

- Add _vlan_dpstr() to decompose TCI into vid/pcp/cfi fields,
  with raw tci=0x%04x fallback when cfi=0 for round-trip safety.
- Add _parse_vlan_from_flowstr() boundary check for missing ')'.
- Add encap_ovskey subclass restricting nla_map to L2-L4 attributes
  (slots 0-21) that appear inside 802.1Q ENCAP, with metadata
  attributes set to "none".
- Check parse() return value for unrecognized trailing content.
- Support callable format functions in dpstr() output.
- Change OVS_KEY_ATTR_VLAN type from uint16 to be16 to match the
  kernel __be16 wire format; uint16 decodes in host byte order,
  which gives wrong values on little-endian architectures.
- Change OVS_KEY_ATTR_ENCAP type from none to encap_ovskey to
  enable recursive parsing of 802.1Q encapsulated flow keys.
- Add push_vlan action class with fields matching kernel struct
  ovs_action_push_vlan (vlan_tpid, vlan_tci as network-order u16).
- Add push_vlan dpstr format and parse with range validation
  (vid 0-4095, pcp 0-7, tpid 0-0xFFFF) and CFI forced to 1.
- Remove MAX_ENCAP_DEPTH constant and depth tracking -- the
  bracket-depth counter in the encap parser already handles
  nesting; the global depth limit was unnecessary.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/ovs-dpctl.py    | 322 +++++++++++++++++-
 1 file changed, 312 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 848f61fdcee0..c3fc615f3744 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -370,7 +370,7 @@ class ovsactions(nla):
         ("OVS_ACTION_ATTR_OUTPUT", "uint32"),
         ("OVS_ACTION_ATTR_USERSPACE", "userspace"),
         ("OVS_ACTION_ATTR_SET", "ovskey"),
-        ("OVS_ACTION_ATTR_PUSH_VLAN", "none"),
+        ("OVS_ACTION_ATTR_PUSH_VLAN", "push_vlan"),
         ("OVS_ACTION_ATTR_POP_VLAN", "flag"),
         ("OVS_ACTION_ATTR_SAMPLE", "sample"),
         ("OVS_ACTION_ATTR_RECIRC", "uint32"),
@@ -427,6 +427,9 @@ class ovsactions(nla):
 
             return actstr
 
+    class push_vlan(nla):
+        fields = (("vlan_tpid", "!H"), ("vlan_tci", "!H"))
+
     class sample(nla):
         nla_flags = NLA_F_NESTED
 
@@ -633,6 +636,14 @@ class ovsactions(nla):
                 print_str += "ct_clear"
             elif field[0] == "OVS_ACTION_ATTR_POP_VLAN":
                 print_str += "pop_vlan"
+            elif field[0] == "OVS_ACTION_ATTR_PUSH_VLAN":
+                datum = self.get_attr(field[0])
+                tpid = datum["vlan_tpid"]
+                tci = datum["vlan_tci"]
+                vid = tci & 0x0FFF
+                pcp = (tci >> 13) & 0x7
+                print_str += "push_vlan(vid=%d,pcp=%d" \
+                    ",tpid=0x%04x)" % (vid, pcp, tpid)
             elif field[0] == "OVS_ACTION_ATTR_POP_ETH":
                 print_str += "pop_eth"
             elif field[0] == "OVS_ACTION_ATTR_POP_NSH":
@@ -726,7 +737,57 @@ class ovsactions(nla):
                     actstr = actstr[strspn(actstr, ", ") :]
                     parsed = True
 
-            if parse_starts_block(actstr, "clone(", False):
+            if parse_starts_block(actstr, "push_vlan(", False):
+                actstr = actstr[len("push_vlan("):]
+                vid = 0
+                pcp = 0
+                tpid = 0x8100
+                if ")" not in actstr:
+                    raise ValueError(
+                        "push_vlan: missing ')'")
+                paren = actstr.index(")")
+                if not actstr[:paren].strip():
+                    raise ValueError("push_vlan: no fields")
+                for kv in actstr[:paren].split(","):
+                    if "=" not in kv:
+                        raise ValueError(
+                            "push_vlan: bad field '%s'"
+                            % kv.strip())
+                    k = kv[:kv.index("=")].strip()
+                    v = kv[kv.index("=") + 1:].strip()
+                    if k == "vid":
+                        vid = int(v, 0)
+                        if vid < 0 or vid > 0xFFF:
+                            raise ValueError(
+                                "push_vlan: vid=%d out of "
+                                "range (0-4095)" % vid)
+                    elif k == "pcp":
+                        pcp = int(v, 0)
+                        if pcp < 0 or pcp > 7:
+                            raise ValueError(
+                                "push_vlan: pcp=%d out of "
+                                "range (0-7)" % pcp)
+                    elif k == "tpid":
+                        tpid = int(v, 0)
+                        if tpid < 0 or tpid > 0xFFFF:
+                            raise ValueError(
+                                "push_vlan: tpid=0x%x out "
+                                "of range (0-0xffff)" % tpid)
+                    else:
+                        raise ValueError(
+                            "push_vlan: unknown key '%s'"
+                            % k)
+                tci = (vid & 0x0FFF) | ((pcp & 0x7) << 13) \
+                    | 0x1000
+                pvact = self.push_vlan()
+                pvact["vlan_tpid"] = tpid
+                pvact["vlan_tci"] = tci
+                self["attrs"].append(
+                    ["OVS_ACTION_ATTR_PUSH_VLAN", pvact])
+                actstr = actstr[paren + 1:]
+                parsed = True
+
+            elif parse_starts_block(actstr, "clone(", False):
                 parencount += 1
                 subacts = ovsactions()
                 actstr = actstr[len("clone("):]
@@ -901,11 +962,11 @@ class ovskey(nla):
     nla_flags = NLA_F_NESTED
     nla_map = (
         ("OVS_KEY_ATTR_UNSPEC", "none"),
-        ("OVS_KEY_ATTR_ENCAP", "none"),
+        ("OVS_KEY_ATTR_ENCAP", "encap_ovskey"),
         ("OVS_KEY_ATTR_PRIORITY", "uint32"),
         ("OVS_KEY_ATTR_IN_PORT", "uint32"),
         ("OVS_KEY_ATTR_ETHERNET", "ethaddr"),
-        ("OVS_KEY_ATTR_VLAN", "uint16"),
+        ("OVS_KEY_ATTR_VLAN", "be16"),
         ("OVS_KEY_ATTR_ETHERTYPE", "be16"),
         ("OVS_KEY_ATTR_IPV4", "ovs_key_ipv4"),
         ("OVS_KEY_ATTR_IPV6", "ovs_key_ipv6"),
@@ -1636,6 +1697,194 @@ class ovskey(nla):
     class ovs_key_mpls(nla):
         fields = (("lse", ">I"),)
 
+    # 802.1Q CFI (Canonical Format Indicator) bit, always set for Ethernet
+    _VLAN_CFI_MASK = 0x1000
+
+    @staticmethod
+    def _vlan_dpstr(tci):
+        """Format VLAN TCI as vid=X,pcp=Y,cfi=Z or tci=0xNNNN.
+
+        When cfi=1 (standard Ethernet VLAN), outputs decomposed
+        vid/pcp/cfi fields. When cfi=0 (truncated VLAN header),
+        falls back to raw tci=0x%04x to ensure round-trip
+        correctness: the parser auto-adds cfi=1 for vid/pcp
+        format, so cfi=0 would be lost on re-parse."""
+        vid = tci & 0x0FFF
+        pcp = (tci >> 13) & 0x7
+        cfi = (tci >> 12) & 0x1
+        if cfi:
+            return "vid=%d,pcp=%d,cfi=%d" % (vid, pcp, cfi)
+        return "tci=0x%04x" % tci
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
+                raise ValueError(
+                    "vlan(): expected key=value, got '%s'" % flowstr)
+            key = flowstr[:eq].strip()
+            flowstr = flowstr[eq + 1:]
+
+            end = flowstr.find(',')
+            end2 = flowstr.find(')')
+            if end == -1 and end2 == -1:
+                raise ValueError("vlan(): missing ')'")
+            if end == -1 or (end2 != -1 and end2 < end):
+                end = end2
+            val = flowstr[:end].strip()
+            flowstr = flowstr[end:]
+
+            if not val:
+                raise ValueError("vlan(): empty value for key '%s'" % key)
+            try:
+                v = int(val, 16) if val.startswith(('0x', '0X')) else int(val)
+            except ValueError as exc:
+                raise ValueError(
+                    "vlan(): invalid value '%s' for key '%s'"
+                    % (val, key)) from exc
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
+        depth = 1
+        end = -1
+        for i, c in enumerate(flowstr):
+            if c == '(':
+                depth += 1
+            elif c == ')':
+                depth -= 1
+                if depth < 0:
+                    raise ValueError(
+                        "encap(): unmatched ')' at position %d" % i)
+                if depth == 0:
+                    end = i
+                    break
+
+        if end == -1:
+            if depth > 1:
+                raise ValueError("encap(): missing ')' at end")
+            raise ValueError("encap(): missing closing ')'")
+
+        inner_str = flowstr[:end].strip()
+        if not inner_str:
+            raise ValueError("encap(): empty inner flow")
+
+        flowstr = flowstr[end + 1:]
+        if flowstr.lstrip().startswith(')'):
+            raise ValueError("encap(): unmatched ')' after encap()")
+
+        inner_key = encap_ovskey()
+        inner_mask = encap_ovskey()
+        remaining = inner_key.parse(inner_str, inner_mask)
+        if remaining and re.search(r'[^\s,)]', remaining):
+            raise ValueError(
+                "encap(): unrecognized trailing "
+                "content '%s'" % remaining.strip())
+
+        return flowstr, inner_key, inner_mask
+
     def parse(self, flowstr, mask=None):
         for field in (
             ("OVS_KEY_ATTR_PRIORITY", "skb_priority", intparse),
@@ -1657,6 +1906,16 @@ class ovskey(nla):
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
@@ -1794,6 +2053,9 @@ class ovskey(nla):
                 True,
             ),
             ("OVS_KEY_ATTR_ETHERNET", None, None, False, False),
+            ("OVS_KEY_ATTR_VLAN", "vlan", ovskey._vlan_dpstr,
+                lambda x: False, True),
+            ("OVS_KEY_ATTR_ENCAP", None, None, False, False),
             (
                 "OVS_KEY_ATTR_ETHERTYPE",
                 "eth_type",
@@ -1821,22 +2083,61 @@ class ovskey(nla):
             v = self.get_attr(field[0])
             if v is not None:
                 m = None if mask is None else mask.get_attr(field[0])
+                fmt = field[2]  # str format or callable
                 if field[4] is False:
                     print_str += v.dpstr(m, more)
                     print_str += ","
                 else:
                     if m is None or field[3](m):
-                        print_str += field[1] + "("
-                        print_str += field[2] % v
-                        print_str += "),"
+                        val = fmt(v) if callable(fmt) else fmt % v
+                        print_str += field[1] + "(" + val + "),"
                     elif more or m != 0:
-                        print_str += field[1] + "("
-                        print_str += (field[2] % v) + "/" + (field[2] % m)
-                        print_str += "),"
+                        if callable(fmt):
+                            val = fmt(v) + "/" + fmt(m)
+                        else:
+                            val = (fmt % v) + "/" + (fmt % m)
+                        print_str += field[1] + "(" + val + "),"
 
         return print_str
 
 
+class encap_ovskey(ovskey):
+    """Inner flow key attributes valid inside 802.1Q ENCAP.
+
+    Only L2-L4 key attributes (slots 0-21) appear inside ENCAP.
+    Metadata-only attributes (SKB_MARK, DP_HASH, RECIRC_ID, etc.)
+    are set to "none" -- they never appear inside ENCAP per
+    ovs_nla_put_vlan() in net/openvswitch/flow_netlink.c.
+
+    nla_map indexes must match OVS_KEY_ATTR_* enum values in
+    include/uapi/linux/openvswitch.h.
+    """
+    nla_map = (
+        ("OVS_KEY_ATTR_UNSPEC", "none"),       # 0
+        ("OVS_KEY_ATTR_ENCAP", "none"),        # 1 -- placeholder, no recursion
+        ("OVS_KEY_ATTR_PRIORITY", "none"),       # 2 -- skb metadata, not in ENCAP
+        ("OVS_KEY_ATTR_IN_PORT", "none"),       # 3 -- skb metadata, not in ENCAP
+        ("OVS_KEY_ATTR_ETHERNET", "ethaddr"),   # 4
+        ("OVS_KEY_ATTR_VLAN", "be16"),          # 5
+        ("OVS_KEY_ATTR_ETHERTYPE", "be16"),     # 6
+        ("OVS_KEY_ATTR_IPV4", "ovs_key_ipv4"),  # 7
+        ("OVS_KEY_ATTR_IPV6", "ovs_key_ipv6"),  # 8
+        ("OVS_KEY_ATTR_TCP", "ovs_key_tcp"),    # 9
+        ("OVS_KEY_ATTR_UDP", "ovs_key_udp"),    # 10
+        ("OVS_KEY_ATTR_ICMP", "ovs_key_icmp"),  # 11
+        ("OVS_KEY_ATTR_ICMPV6", "ovs_key_icmpv6"),  # 12
+        ("OVS_KEY_ATTR_ARP", "ovs_key_arp"),    # 13
+        ("OVS_KEY_ATTR_ND", "ovs_key_nd"),      # 14
+        ("OVS_KEY_ATTR_SKB_MARK", "none"),      # 15 -- metadata, not in ENCAP
+        ("OVS_KEY_ATTR_TUNNEL", "none"),        # 16 -- tunnel metadata, not in ENCAP
+        ("OVS_KEY_ATTR_SCTP", "ovs_key_sctp"),  # 17
+        ("OVS_KEY_ATTR_TCP_FLAGS", "be16"),     # 18
+        ("OVS_KEY_ATTR_DP_HASH", "none"),       # 19 -- metadata, not in ENCAP
+        ("OVS_KEY_ATTR_RECIRC_ID", "none"),     # 20 -- metadata, not in ENCAP
+        ("OVS_KEY_ATTR_MPLS", "array(ovs_key_mpls)"),  # 21
+    )
+
+
 class OvsPacket(GenericNetlinkSocket):
     OVS_PACKET_CMD_MISS = 1  # Flow table miss
     OVS_PACKET_CMD_ACTION = 2  # USERSPACE action
@@ -2576,6 +2877,7 @@ def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
 
 
 def main(argv):
+    nlmsg_atoms.encap_ovskey = encap_ovskey
     nlmsg_atoms.ovskey = ovskey
     nlmsg_atoms.ovsactions = ovsactions
 
-- 
2.53.0

