Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7C409E12
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526015; cv=none; b=IXt3gkfehqyDqIoCoZWfrITtZ6BYBccSnsXZb7s+8Z1nvdSDm0/UN/cDsLwrVLZshgzQXQ3/fw7E6aSC6qnxE5R5IVij/OHG+iUjWUc436f6185FPnDWL0FALG1eWf1RIdVDYqJ38h1eUNZdGfBjdjnX3Xv57jeHd98L8fGDdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526015; c=relaxed/simple;
	bh=9Uv+jN9i8MgmaIRa/VnQgzCK0ehaQ+ekoTnYpqeKLm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jw9RSw4ykynpVOcKsf1kraFvLG79I1/5dOus0PHwuO3DgkLQIFZPv0wUoCi6mTgLwAhv84VHeFxGCvguYdS9ki+Ql1/2GrVRkizSlpSnH8MyZ2w8JUAbs6oE8QF/nZRUCK6ro/xhStclSHnzz550aDnkzz+hIUe0/9L6tgAr1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omiu+iKo; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omiu+iKo"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c2520ad38so9072036eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 23:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791526011; x=1792130811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aA+GIDiAv6qcDBUd+RLqztP11XjFjWdmq6w7ezYObIo=;
        b=Omiu+iKoBw4YSmQr1CtCUXU5wfeWgvkThnDT+fqddx6OmtP8lz8EDUC3PeOsKoJ/eB
         ItdvRp+uSjWjtDr1FPltK37HdOCcD8fOn1jxtGSG8o4RM/07N1wmwVL/3c2fXWau+9Pf
         LRT/mWJBasYfEGqe8+WnUdslWL0ZLL9SCt8Fw6F1ZGQlOnZyWOGw7eiEMy4v46MjK2x2
         rl0hyxP/J8PvUCrYXBjFu/1nbts36cU5EHQx5p738w4jVyPvkKQeFzFxYg5B4IjZRvN/
         IOjGxqXNiMjIrI68nlF9m6gwhRi5kQ7rZ7bVytnQtcex3XzANCgO18pOAosqhHmbZV3+
         NG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526011; x=1792130811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aA+GIDiAv6qcDBUd+RLqztP11XjFjWdmq6w7ezYObIo=;
        b=E9HtdPpRvkbSAI6vedyncMIOXtc3LpPtO9doeJ3ZL/2Sw8qRJjM5yi9LB1T9dbJsAG
         0Lw45M3VwXjSSuIFQo+Njk/5/ZjIB2lFsp6Y+TII3T97tS4XqvnThhUGaRbh85pEno1b
         r4GnYEqdleNfVwTqNsD2FfNUM7S/kVJQUl/wmzBLHMMOcuuFOtkjwN/GuPKEkwHyNUyZ
         lkp3hUDZOy8pAGNEUNfF7Ic/vFrMTYYv5Nw/UA3KS3FHmk3u1ijpq2AxYfurdF1IpMCS
         kiidejPl5IROt6U18GHAFBFoOWAMTZglvHvdn4pTWgpwx3H+LJQIZvH3qYtLFsqzgUK/
         T1fg==
X-Forwarded-Encrypted: i=1; AKwUvBxkLxflEMc4sxWWvoq5Hudr7cMXWf4RsAlFEVHMFmZMB+Hc3RFbyxxlg7XYhNhwYKFOjw7+g69fcZN1ScO4uqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqEcwu25/e+gonIs9AxZX9T32EPDflLz3CQ//rILBlm0VCBv8b
	frxD02W5GBj9s/GOGTlCi3n0Dttatl28KhORd3j0TbuQLHdHqv6uzf5X
X-Gm-Gg: AYBFou285rBKafH1jkmOKXLiI23cNYsgaVSHSTrOhtLNngwH75mmFJ+1I5w+9/iQAFy
	r0bH5fvhc/Pl8IP8x9dHMocmY5YG6uChdYLWm8EpcZG45rSNh4MhCUm2+OX3YwhiWgBSNxEvWfp
	A7n0UcoguxdjynV1ZkzkGuVgfrPsEqZSiac9SU/qUsR752T7DyP9cqnQEO6qL2MwBnRKSVi6++r
	jywt3P5b1nZjQfMlgNwmiHlsP7HECooaOfH0/LET1AE7mvwD1julU2bK+XDKN+mlUW8wtiMMx/O
	GHaR3rt8Y+ZHZdAXCEL5rTQvwB9z7NKpshd/xoZW6c0hoNFG+63CWt+Yj9UoXW3X4i0urvyEaN1
	nkhthcXznoxMfgaCi5pENc6Zwv2LsSuG89hcNESON5WIu7eGiyt3QjUR5/FYTB7TdTWySXmTzR8
	JQBbFnlNGsYDjLGDuNR1ORtMfiISpcobHegkQB5WTQK/1DZPjYchs3R/pUOBBC6vLuJLCOcDJdZ
	z7ISguHMQIcgMGJOEIZb7RbwjthJ8R+uAcbl+heXexASXWskHJS3pxY5s/8r/D0bOuP+Z7yJGQ6
	lruYlwJZEHGvHFfWaO9kmx95c/HT9NKocjzKX4yF534=
X-Received: by 2002:a05:7300:f545:b0:351:1ff2:d013 with SMTP id 5a478bee46e88-3537e255922mr1349001eec.37.1791526010555;
        Thu, 08 Oct 2026 23:06:50 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a2afsm4185544eec.31.2026.10.08.23.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:06:49 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>
Cc: osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 2/3] netlink: specs: add genetlink-legacy spec for GTP
Date: Fri,  9 Oct 2026 06:06:14 +0000
Message-Id: <20261009060615.4177402-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GTP (GPRS Tunnelling Protocol, user plane) generic netlink family
has no YAML specification under Documentation/netlink/specs/, so it
cannot be consumed by the ynl tooling used for user-space clients,
documentation and selftests.

Add a genetlink-legacy spec describing the existing family: the PDP
context management commands (NEWPDP, DELPDP, GETPDP) and the GTP-U echo
request (ECHOREQ), the GTPA_* attribute set, and the "gtp" multicast
group. The spec is derived directly from include/uapi/linux/gtp.h and
the gtp_genl_policy / gtp_genl_ops tables in drivers/net/gtp.c; command
and attribute values match the existing uapi one-to-one.

This only adds the description; there is no kernel code or uapi change.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 Documentation/netlink/specs/gtp.yaml | 170 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 Documentation/netlink/specs/gtp.yaml

diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
new file mode 100644
index 000000000000..7193f5e53a25
--- /dev/null
+++ b/Documentation/netlink/specs/gtp.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+---
+name: gtp
+
+protocol: genetlink-legacy
+
+doc: |
+  GPRS Tunnelling Protocol, user plane (GTP-U).
+
+  The gtp netdevice encapsulates and decapsulates user plane packets in
+  GTP-U tunnels (GTPv0 and GTPv1-U, see 3GPP TS 29.060 and TS 29.281).
+  This family manages the PDP contexts that describe the tunnels and
+  triggers GTP-U echo requests. It is driven by user space control planes
+  such as those built on libgtpnl.
+
+kernel-policy: global
+
+attribute-sets:
+  -
+    name: gtp
+    name-prefix: gtpa-
+    attributes:
+      -
+        name: link
+        type: u32
+        doc: ifindex of the gtp netdevice the context is attached to.
+      -
+        name: version
+        type: u32
+        doc: GTP version of the context, 0 for GTPv0 or 1 for GTPv1-U.
+      -
+        name: tid
+        type: u64
+        doc: Tunnel identifier, GTPv0 only.
+      -
+        name: peer-address
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+        doc: |
+          IPv4 address of the remote GSN peer (GGSN or SGSN). Also known
+          as GTPA_SGSN_ADDRESS, kept for legacy user space.
+      -
+        name: ms-address
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+        doc: IPv4 address of the mobile subscriber served by the context.
+      -
+        name: flow
+        type: u16
+        doc: Flow label, GTPv0 only.
+      -
+        name: net-ns-fd
+        type: u32
+        doc: File descriptor of the network namespace of the gtp netdevice.
+      -
+        name: i-tei
+        type: u32
+        doc: Ingress Tunnel Endpoint Identifier, GTPv1-U only.
+      -
+        name: o-tei
+        type: u32
+        doc: Egress Tunnel Endpoint Identifier, GTPv1-U only.
+      -
+        name: pad
+        type: pad
+      -
+        name: peer-addr6
+        type: binary
+        checks:
+          exact-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: IPv6 address of the remote GSN peer (GGSN or SGSN).
+      -
+        name: ms-addr6
+        type: binary
+        checks:
+          exact-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: IPv6 address of the mobile subscriber served by the context.
+      -
+        name: family
+        type: u8
+        doc: Address family (AF_INET or AF_INET6) of the context addresses.
+
+operations:
+  list:
+    -
+      name: newpdp
+      doc: Create or update a PDP context.
+      attribute-set: gtp
+      value: 0
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: &pdp-attrs
+          attributes:
+            - link
+            - version
+            - tid
+            - peer-address
+            - peer-addr6
+            - ms-address
+            - ms-addr6
+            - flow
+            - i-tei
+            - o-tei
+            - family
+            - net-ns-fd
+    -
+      name: delpdp
+      doc: Delete a PDP context.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: *pdp-attrs
+    -
+      name: getpdp
+      doc: Get or dump one or more PDP contexts.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - link
+            - version
+            - tid
+            - ms-address
+            - ms-addr6
+            - i-tei
+            - family
+            - net-ns-fd
+        reply: &pdp-reply
+          attributes:
+            - version
+            - tid
+            - peer-address
+            - peer-addr6
+            - ms-address
+            - ms-addr6
+            - flow
+            - i-tei
+            - o-tei
+            - family
+      dump:
+        reply: *pdp-reply
+    -
+      name: echoreq
+      doc: Send a GTP-U echo request to a peer.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - link
+            - version
+            - peer-address
+            - peer-addr6
+            - family
+
+mcast-groups:
+  list:
+    -
+      name: gtp
diff --git a/MAINTAINERS b/MAINTAINERS
index 51873349ba91..a6e43995ea58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11421,6 +11421,7 @@ M:	Harald Welte <laforge@gnumonks.org>
 L:	osmocom-net-gprs@lists.osmocom.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
+F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
 
 GUID PARTITION TABLE (GPT)
-- 
2.25.1

