Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E81440A2D
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905602; cv=none; b=T2MYeyQfuXQKqYGHVrg6OFi3k40zraSkgm8f/JkPpaGbyRJFsVnN+h9c4QQExpc2v4efjQIO37NnzjF+OMuJH02xulQSaaL6QpSyiYPMaYkIuCkPcwS5DbUnyrpNfnNznc0QxNHgoODuPEu4esDJa7Br1P+0XMsW3cz+ReX8GwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905602; c=relaxed/simple;
	bh=WCFeK1U/sB8u6+XghEzeDL5uvuawBnLyk20EecCgWSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA4rK4pNSzRNIsLM1ftl+HAGMfcA3wIrU1K7N6Ice6nUgpnRfhWpZmZLQcdid0nhBdDEZn2YFOODMI7dFnu8i4HI7uEhQNLvNx9Y2Dt+PzWD4Qw+K4PugcFdAhlqNLVOjNHDSEGEejUtaUwnEINtYUjAF70VfNCtNeCpICaTz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXq6QU+3; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXq6QU+3"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-74d55dac06dso131869137.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784905597; x=1785510397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oyqB7q7QHkqcZKXENbolthguPaX/LV0/csmdxwyvY8=;
        b=gXq6QU+3Qy1TeVqxyjn0hdRDRTYkqUieAMH2shLXY4sgOR9StX1V6kGtTXSEjVulwT
         kWbNHiCPx8TR3i0f+4ysV+PLhboKdDKxNN1YXI4TUEtdrViovBVQDTbel2WzOiEBVyWd
         q73LrMTGCq5ITpAkvhkGPJXiJ28BU6HCJ85zclS9uIp56ksKXQhCAYz2L66ZjTNFPL2F
         HMlenBYPKQun5QDq4GSqxA3qx8z22rZhgjExfTKcxyE0A+GhDZTg1PgWD8+CxtesjOEk
         CdUc86NdhGFy9TiUmvt6ApWXOc8JWqH5VQ/dfFt1RxJlf2KCa+wiLYoUWhGIz7+stDgE
         tnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905597; x=1785510397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oyqB7q7QHkqcZKXENbolthguPaX/LV0/csmdxwyvY8=;
        b=clmK8YnV6QKITMn7NpcuS8ykHxGqwrF6lrSEAuVtmUo0/ZOJd9kwBGDO7wjcxZ7bv6
         ajrW/wurtK+5E/b9C6agR8e0gR47x5C4Na0fddyVxbdg3j2lxtwMauqd8SU20rAKTBl4
         sEOoeLdqBA2bhAf9qEQHa1727WiT8uzxZ43scNEP0kM+SFX78ibiOgqvKHYj5wRXQ73s
         rt8UlZWHjya79nv6gLNXiHdMEuJjg3ByLA0hNSW+qnLpvntM6s9VJBLCG9+JI9nv80Ds
         OqlXkObS9dSpmMDixvMjNaf0NjFAj+FUp0KtTCEdD2wH4fO9xFq9vr2FaseP6eTTfiqM
         yp2w==
X-Forwarded-Encrypted: i=1; AHgh+RoXuGzn8GtidkEgwc48OByH/UXaTiOva//TYcU9iZfwYfJfwpXz6KLdEOJ7avu6zNv8J0jEmatCKkajSAxFASU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYjCJJcQ2bV2Il4AseIVu1pb/+bZpMmNRShhaovHJM4aY8rZd
	j4aqKAbcChvVmI2WKtR3xZr67WzMO6wt/NBEkpvHX1CN41C9/kWXsDMt
X-Gm-Gg: AR+sD12RDd7tdtRaCeCs3OtOm7xpUzhPX3kcbJBlEsXFcbONrL2yxBpcNO7KTmqedhq
	JSrT9mW7fvyUFDNCT1+3BBG1sgvHq9foMIhdXGlGMV7JRzXxf67uO7p13FLW/6bS8bguNO/brsU
	WrwKl1Lh8eMSQ+53jS3CTLVc3hxE7QLhyP1o1i9fbnE6WJew136MOl+7HVdAlunmTamzfK/rFIx
	pYIKMNzFg2Uy1J29YF/hVEB3x1PesMeYxoKHmmVZvb3d7Al/6fLyAPMdMvfiT/3jitziQSx0NBb
	8jsOAgRiZePDPiF8ZA0ym+ogohwSXlByYTAPOQ0F8sBy/SLjfI3+DPq2xNefGztM6Qks1ir6vfn
	j0aEIaoC4oyCVkqe8P2QzM6wm/b8+tWVVvcT60FB7QrNOnQo3FbOH/Uq7lGmMrHCcAPSU+g==
X-Received: by 2002:a05:6102:2b83:b0:74c:7dbd:8c89 with SMTP id ada2fe7eead31-74d60909992mr3314336137.25.1784905597005;
        Fri, 24 Jul 2026 08:06:37 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad32165f4sm7744810137.6.2026.07.24.08.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:06:36 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v6 1/2] selftests/net/openvswitch: add SCTP flow key parsing to ovs-dpctl.py
Date: Fri, 24 Jul 2026 11:06:23 -0400
Message-ID: <20260724150624.3457427-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724150624.3457427-1-houminxi@gmail.com>
References: <20260724150624.3457427-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
flow string containing sctp(src=.../dst=...) parses without error but
silently drops the L4 key. The resulting flow carries only
ipv4(proto=132), and the kernel rejects it: match_validate() in
flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
IPPROTO_SCTP and returns -EINVAL for the missing key.

Register OVS_KEY_ATTR_SCTP in the parse table and add unit tests
(runnable via ovs-dpctl.py --test) covering SCTP and the neighboring
TCP/UDP/ICMP/IPv4 key parsers.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../selftests/net/openvswitch/ovs-dpctl.py    | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index f3edd198223f..633af10d7e8a 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -15,6 +15,7 @@ import struct
 import sys
 import time
 import types
+import unittest
 import uuid
 
 try:
@@ -1984,6 +1985,11 @@ class ovskey(nla):
                 "udp",
                 ovskey.ovs_key_udp,
             ),
+            (
+                "OVS_KEY_ATTR_SCTP",
+                "sctp",
+                ovskey.ovs_key_sctp,
+            ),
             (
                 "OVS_KEY_ATTR_ICMP",
                 "icmp",
@@ -3165,5 +3171,128 @@ def main(argv):
     return 0
 
 
+def _init_ovskey_nlas():
+    """Initialize required NLA classes for ovskey parsing."""
+    nlmsg_atoms.encap_ovskey = encap_ovskey
+    nlmsg_atoms.ovskey = ovskey
+    nlmsg_atoms.ovsactions = ovsactions
+
+
+def _parse_flow(flowstr):
+    """Parse a flow string and return the key."""
+    key = ovskey()
+    key["attrs"] = []
+    key.parse(flowstr)
+    return key
+
+
+def _find_attr(key, attr_name):
+    """Find an attribute in parsed key."""
+    for attr in key["attrs"]:
+        if attr[0] == attr_name:
+            return attr[1]
+    return None
+
+
+class TestOvsKeyParse(unittest.TestCase):
+    """Unit tests for ovskey.parse() flow string parsing."""
+
+    @classmethod
+    def setUpClass(cls):
+        _init_ovskey_nlas()
+
+    def test_sctp_dst(self):
+        """Test SCTP destination port parsing."""
+        key = _parse_flow("sctp(dst=4443)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_SCTP")
+        self.assertIsNotNone(attr, "SCTP key not found")
+        self.assertEqual(attr["dst"], 4443)
+
+    def test_sctp_src(self):
+        """Test SCTP source port parsing."""
+        key = _parse_flow("sctp(src=4443)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_SCTP")
+        self.assertIsNotNone(attr, "SCTP key not found")
+        self.assertEqual(attr["src"], 4443)
+
+    def test_sctp_src_and_dst(self):
+        """Test SCTP source and destination port parsing."""
+        key = _parse_flow("sctp(src=1234,dst=5678)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_SCTP")
+        self.assertIsNotNone(attr, "SCTP key not found")
+        self.assertEqual(attr["src"], 1234)
+        self.assertEqual(attr["dst"], 5678)
+
+    def test_tcp_dst(self):
+        """Test TCP destination port parsing."""
+        key = _parse_flow("tcp(dst=80)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_TCP")
+        self.assertIsNotNone(attr, "TCP key not found")
+        self.assertEqual(attr["dst"], 80)
+
+    def test_udp_dst(self):
+        """Test UDP destination port parsing."""
+        key = _parse_flow("udp(dst=53)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_UDP")
+        self.assertIsNotNone(attr, "UDP key not found")
+        self.assertEqual(attr["dst"], 53)
+
+    def test_icmp_type_code(self):
+        """Test ICMP type and code parsing."""
+        key = _parse_flow("icmp(type=8,code=0)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_ICMP")
+        self.assertIsNotNone(attr, "ICMP key not found")
+        self.assertEqual(attr["type"], 8)
+        self.assertEqual(attr["code"], 0)
+
+    def test_ipv4_proto(self):
+        """Test IPv4 protocol parsing."""
+        key = _parse_flow("eth_type(0x0800),ipv4(proto=132)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_IPV4")
+        self.assertIsNotNone(attr, "IPv4 key not found")
+        self.assertEqual(attr["proto"], 132)
+
+    def test_eth_type(self):
+        """Test Ethernet type parsing."""
+        key = _parse_flow("eth_type(0x0800)")
+        attr = _find_attr(key, "OVS_KEY_ATTR_ETHERTYPE")
+        self.assertIsNotNone(attr, "EthType key not found")
+        self.assertEqual(attr, 0x0800)
+
+    def test_full_sctp_flow(self):
+        """Test complete SCTP flow string parsing."""
+        flowstr = (
+            "in_port(1),eth(),eth_type(0x0800),"
+            "ipv4(proto=132),sctp(dst=4443)"
+        )
+        key = _parse_flow(flowstr)
+        in_port = _find_attr(key, "OVS_KEY_ATTR_IN_PORT")
+        self.assertEqual(in_port, 1)
+        sctp = _find_attr(key, "OVS_KEY_ATTR_SCTP")
+        self.assertIsNotNone(sctp, "SCTP key not found")
+        self.assertEqual(sctp["dst"], 4443)
+
+    def test_sctp_roundtrip(self):
+        """Test parse -> dpstr -> parse keeps the SCTP key."""
+        key = _parse_flow("sctp(dst=4443)")
+        key2 = ovskey()
+        key2["attrs"] = []
+        remainder = key2.parse(key.dpstr())
+        self.assertEqual(remainder, "", "round-trip left unparsed text")
+        attr = _find_attr(key2, "OVS_KEY_ATTR_SCTP")
+        self.assertIsNotNone(attr, "SCTP key lost in round-trip")
+        self.assertEqual(attr["dst"], 4443)
+
+
+def test_ovskey_parse():
+    """Test ovskey.parse() method for various flow key types."""
+    suite = unittest.TestLoader().loadTestsFromTestCase(TestOvsKeyParse)
+    runner = unittest.TextTestRunner(verbosity=2)
+    result = runner.run(suite)
+    return 0 if result.wasSuccessful() else 1
+
+
 if __name__ == "__main__":
+    if len(sys.argv) > 1 and sys.argv[1] == "--test":
+        sys.exit(test_ovskey_parse())
     sys.exit(main(sys.argv))
-- 
2.55.0

