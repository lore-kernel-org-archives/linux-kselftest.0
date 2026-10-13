Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF63DD86F
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861020; cv=none; b=e+modEuEl9mmcF87qA3LXdrOxrY11bD2W9TG18K0B+PNzr/8Tsa+YKpi/zKhXBZZT7n9UY4pGL4FWOlrVApxfEcSAMaEmG+N1sXcEvzj0UEWpf1+3YwIbJAnOkDeJv0qg+R6abuVfsxJDx+aB0vXG5t+QeaACez2IfCdQVcrCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861020; c=relaxed/simple;
	bh=SMCgpK2RbD8mvHSHEYC8SHTe+3DDDclzjwq1ON7RmLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cf/ZQcpzxMao39YbnAtwi7PlRZUOYRAyWE8M7Jc7M15Mwj7qbZNmQFwjUIDkCu6vcjhqb85x85NDZkTQyfR/scB3UywZy+fb5VL+mW5exEtS15ihnjHQjrXgPb45JTRwlAuFDdFmJtmljx578NC66TPya9MMdZBN0lLfahtzJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV4e7OuE; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV4e7OuE"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1744031eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 20:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861018; x=1792465818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88IA1HO8D8y3sxUJk6Lrqp1e4LkeyODYRGnCQIX47kY=;
        b=eV4e7OuE5C3NBHmrJECJQuLBIh0uG4Jel3FkcZGAQTPNXRqsU8Y21fl0KsJvUV9r3Q
         xAwqNTxN55g4A8IMizgitqPisarCkamSyFJy/P+nygOL9RSM09KM5iNJIKhfnAnVevXD
         8/aga7xJ7dAXa1Tg9PPFvykPPMBECClPBao2EbmfuDZH21pW8kv8FIo7quRHiQuOCsbJ
         EubHOT4rGGUbhZ5s708ZMPyox9whP0O8fsi5DoHCSXyOzUjuqOcYMUbliGNfG3ZVyBCn
         vkh/2IeOR+msLMGBkr/KuDbt4YZZxoR1VtrwIkafN9ZP6kQsvFgqOipx6A0F5UOAwjWl
         1nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861018; x=1792465818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=88IA1HO8D8y3sxUJk6Lrqp1e4LkeyODYRGnCQIX47kY=;
        b=tMRs8cmYTEyXWErhbvJUyc8C7s6KkjU6VcB7pimzj5s82uKvVFJayCf0h+wALUC8iY
         u4xDjjL23sgdcwyyJ62XgfUW9cTSLWwVc//9sJOnxja8j4GNPwZtKrKVPzKOo0O2a0OP
         UoSCF9FIDTV99mYJMrg3Z8hJFyO0/HRLc5bDSyhr+w6ml34cYGOcRTUYZ4sKDW8dDvph
         UlWbUXgpwQWQ0FyvizTE+M4ifV9Xln798C4gCc0Y2rB9vrwAlI7c2Y0tscA0lUyvVAAK
         KQdZ0pvaPxwI8CjTOB1RMqHlPd1NPVMRyTdfVVeocOHlZNHHcGOMirG3XgN6wms8MeAq
         WYbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/gbT+JMXhtzFbIegNpBEFAEk2hpXiB7OBnxsZ3vXg7b47pCZ7Jk2Fc+Uj/lD0Kuz/NAupiTyHgJHQ/s4Mick=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmqyrIOKydaUNc2BfAOym3lbqXytd6DLTkEqwW4vrBZmAd+EN5
	pssMo6tEMTWZ5GNYMjGJJacnRU5WXC4JYSeyXBNOSK1xLuFW8Dzx5LVk
X-Gm-Gg: AYBFou0E+YgkXCWc6fclW/gD2waLYItmdNqs/4gDBeXufKPRKh5LGdIAEdKxwCwebDR
	EXFuIB9IMzloAsYwWJU7h8OhN0IEbl2msLQ8qSEt6gEg3xJqxojbqpNPbv5DuQ9LC1DqocQH9HF
	xgM4VjmNXXcrVr35vUWJG1hhMDDreUovOeDuCKb57i7R+gkvyp8OVCiuV8hUTlmsjtNSh/u6wzj
	E47HXvc/PSXa4J2nnWHTwF5hR4wQjow9EU3f8YgIL2Og82HIkHHBa+FUe8JVGmxIQnRdH+8tDfM
	J3vAsF0KA2OayLQZDNY7ou4Cr7ldeo/EIbe1GGNmRDg1JF2O+QPZD9Sk+iXDXbCMaiCzKb7vAlO
	Cr6RNaFsGXFdNORvESiZYJVy3HTa8g1ogzwGqmRCfHrwZr39LFQ2kWzyFzd2AIr8ugr8k1bKErj
	dfgQX6n5qxhMNaBPuxT1d7b7szWSAJUJGLc0EbeRckwvCVTLXuzxFIg1NiqEQ17TnOosZAnoG1T
	5WGeHy+Db52CPAXhANl4iDIw+XUPoayxNC+4S/l7KTqjhJ0gdaYXclfPKgfZnjBAFtuc/QHhDmJ
	GNJGnSG4HFR0oxRixDx80iJEmE2U2DU1o7s71Loq++0=
X-Received: by 2002:a05:7301:7007:b0:358:d335:f243 with SMTP id 5a478bee46e88-358d335f4e9mr10563469eec.37.1791861017811;
        Mon, 12 Oct 2026 20:10:17 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm41129053eec.27.2026.10.12.20.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:10:17 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v6 2/3] netlink: specs: add genetlink-legacy spec for GTP
Date: Tue, 13 Oct 2026 03:09:59 +0000
Message-Id: <20261013031000.528393-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
References: <20261013031000.528393-1-anilkaushikwireless@gmail.com>
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
group. Command and attribute values are taken from
include/uapi/linux/gtp.h and match it one-to-one. The request
attributes of each command are the ones its handler in
drivers/net/gtp.c reads, and the reply attributes the ones
gtp_genl_fill_info() emits.

The notifications sent on the "gtp" group are not described: they reuse
the command values of the NEWPDP, DELPDP and ECHOREQ requests, which
the ynl code generator cannot express with the existing uapi header.
The family doc says so.

Add the matching CFLAGS_gtp entry to tools/net/ynl/Makefile.deps, so
the generated code is built against the tree's gtp.h instead of an
older one installed on the host.

This only adds the description; there is no kernel code or uapi change.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 Documentation/netlink/specs/gtp.yaml | 196 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 tools/net/ynl/Makefile.deps          |   1 +
 3 files changed, 198 insertions(+)
 create mode 100644 Documentation/netlink/specs/gtp.yaml

diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
new file mode 100644
index 000000000000..7871f5def054
--- /dev/null
+++ b/Documentation/netlink/specs/gtp.yaml
@@ -0,0 +1,196 @@
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
+  The kernel registers the family with version 0, which the
+  genetlink-legacy schema cannot express.
+
+  The notifications multicast on the "gtp" group are not described: PDP
+  context additions and deletions, and GTP-U echo responses, reuse the
+  NEWPDP, DELPDP and ECHOREQ command values of the requests.
+
+kernel-policy: global
+
+definitions:
+  -
+    type: enum
+    name: version
+    name-prefix: gtp-
+    enum-name: gtp-version
+    header: linux/gtp.h
+    entries: [v0, v1]
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
+        enum: version
+        doc: GTP version of the context, GTPv0 or GTPv1-U.
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
+          min-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: IPv6 address of the remote GSN peer (GGSN or SGSN).
+      -
+        name: ms-addr6
+        type: binary
+        checks:
+          min-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: |
+          IPv6 prefix of the mobile subscriber served by the context: a /64
+          prefix, with the lower 64 bits set to zero.
+      -
+        name: family
+        type: u8
+        doc: |
+          Address family (AF_INET or AF_INET6) of ms-address or ms-addr6,
+          AF_INET when absent. The peer address uses the family of the
+          tunnel socket.
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
+        request: &pdp-find
+          attributes:
+            - link
+            - version
+            - tid
+            - ms-address
+            - ms-addr6
+            - i-tei
+            - family
+            - net-ns-fd
+    -
+      name: getpdp
+      doc: Get or dump one or more PDP contexts.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: *pdp-find
+        reply: &pdp-reply
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
+      dump:
+        reply: *pdp-reply
+    -
+      name: echoreq
+      doc: |
+        Send a GTP-U echo request to a peer. ms-address is not a mobile
+        subscriber address here, but the local IPv4 address used as source
+        of the request.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - link
+            - version
+            - peer-address
+            - ms-address
+            - net-ns-fd
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
diff --git a/tools/net/ynl/Makefile.deps b/tools/net/ynl/Makefile.deps
index 1e746e25e2bc..9fd8f3321680 100644
--- a/tools/net/ynl/Makefile.deps
+++ b/tools/net/ynl/Makefile.deps
@@ -24,6 +24,7 @@ CFLAGS_ethtool:=$(call get_hdr_inc,_LINUX_TYPELIMITS_H,typelimits.h) \
 	$(call get_hdr_inc,_LINUX_ETHTOOL_H,ethtool.h) \
 	$(call get_hdr_inc,_LINUX_ETHTOOL_NETLINK_H_,ethtool_netlink.h) \
 	$(call get_hdr_inc,_LINUX_ETHTOOL_NETLINK_GENERATED_H,ethtool_netlink_generated.h)
+CFLAGS_gtp:=$(call get_hdr_inc,_LINUX_GTP_H_,gtp.h)
 CFLAGS_handshake:=$(call get_hdr_inc,_LINUX_HANDSHAKE_H,handshake.h)
 CFLAGS_lockd_netlink:=$(call get_hdr_inc,_LINUX_LOCKD_NETLINK_H,lockd_netlink.h)
 CFLAGS_mptcp_pm:=$(call get_hdr_inc,_LINUX_MPTCP_PM_H,mptcp_pm.h)
-- 
2.25.1

