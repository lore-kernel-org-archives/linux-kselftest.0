Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B5472065
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143173; cv=none; b=UshZSQVZvKmzBF5vcpzuoCuOZmmZZkSVZUvOLJdpi+RJeiQRdmf77tiYFdtOMZtn+Du3Qv8xSip+TFIT4ymjHLi3Dz3w9sYJhz0RWD5TPLUrBD71hseM8kLkhJjxh9KhfBurDJBrjHJbeAWuzeh/DO1wK9S76UDNg6bKIJ2k3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143173; c=relaxed/simple;
	bh=k1OO8I8oTlXC08Pf52SlYo8UCf3RbYEZbxW46ue8Nyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F99Ss1B5QQEK81f5OJJmzmYtMNUeBtL1ssxW7mUe4mUnMuM1tlNUJYdFzjp8P9O2hqpq8/FK5wtSmD7VXu9Cta/whEuVTZQmZ8PuvzV4FaR959SbOqLzMoYsvfWix17I99zlCDaxOfHo6SV721OQG13IsfiSWQwjBnGqW1/hrII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aclsrkOG; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aclsrkOG"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35943f55c06so1058953eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143170; x=1792747970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZBNZTD52c8ihTK0P5dKq1eTSDHb6U3yTOfoZI6TI0PI=;
        b=aclsrkOGp/fvWrfhd8yL0fPaXSWZ037W7lQeBp+P+5yDNX/4SFRosoTr0V7gGU3g9y
         /zT2xTFTQWabVHv3coax7K6sKAIuFMOamchvYD/TIn+0Y1nGG3MIQxWVwOU0+cMd9Xvz
         EKuKLjdOw/+2eJflKRrhHlbdYPePpUO8b2h9/GmYatQSVP10A3xwVzpJScR0YDA+3NN8
         /tU2cOOC+f3RLEO+yKcHiCFKfv+R8lqgHh/xljD+D+/Fd+EtpGM1ZtJlmkxr1w5QVc6S
         LFlJP3ESiBSw4Dbjsz86sCKLWwzEbKFROWeLYLJBsVO4J7fBh8TSFElzglwogfLkY+DT
         9CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143170; x=1792747970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZBNZTD52c8ihTK0P5dKq1eTSDHb6U3yTOfoZI6TI0PI=;
        b=KvC007uh1nGQx3Dw73ORFDXzJxgfj0FxF1mvfVidP9tkBJqYf5gnm5/wtTzykY6n/O
         YMGyOBxp6+ug4aBs2lEHBFrTu8IniidaXi7e3uVsOI2RcElyIYkaeITZkplelvGL4G1H
         q+srCdfI3YCAyjXF/m3P0MuZsbTzCx8Q7gGkshS1s5Mu73lv9Ft41yTlIA6gIxG2UZA9
         iMUoUd7TYU12O8iq8hwS3II3OTHklohbIfxTot6HVji1ppZs7lS8Zu7NCpuOUHgoLZq6
         JxsLPbyaEL8bgeCqbnhFbm8AaQB6Z04UNDS9ZAAz1e/HeVTsReHFBk3D30Ax/OYP13RV
         7bJw==
X-Forwarded-Encrypted: i=1; AKwUvBwblilIrgusIXp09iOm3M51wUzvrN+4KsId22+6a0KfrIUmyjFd1GVINMZ/gHiGbxn3BpStx0vCMREHVvFW8DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgEN7evznfCqakBSqyAeDC1RLTYsWsxQTgh5LH3SFzmF4Nyct5
	WyDCZf8HLCcCAVHiLS+5+VSM1rzah23u5uGAdBxnJgzOs2fa2C5gHPQo
X-Gm-Gg: AYBFou167Vk8RzzVakTnu1z0FAAdFAwx7qUpFU97h0AWcUg0F1rfg4bbtoOtki0kJan
	zio+cK289iNmMxZ9speI+BuCZMPRQrtyHGT5o06mk0L+zIeuMKZgyBp+/AfQEW5xG/Hl37DyItM
	CB0wNFmvSofAo8S9VljjKQLvqUCiu+UdVyJWeybsjiuvAw5hMh7P3IGryXnDfXCzBoX8Q1lQxv3
	FAJjDTNHhwfMsGX8W70OvxQRfItdm31E5MSbNK+FmIJyVy7seOwtFORO89ex1Ld0MX2cbGS/7RQ
	3veoifT6dUrQmkY+Ccx/De4brVB0iITjmqo0Igbf2HLHIQFpwYddJvOogSrh/YE1+8sZx7howXr
	kihX/8quv5IiM05FQE92OylSd/P1XZLXnZQhTruX48iJEyC23SCyhVSiaAhRWcY38ntGJ0WnQIp
	BuaiW0f8rUO3BU1DV0vsLG874yJatS0Wwx2IS/ZOxinjzXH321Abv9Wy2edSgvij+h8XoY960Ic
	tDirzn5PZmaStMYGMJVirSrpV+C7RCT2qZrPv85n6+/0QKf6q5/IEPX9fZk1FPNOLupsFrwG4iU
	L0vhB5s4ASxcg+JVE2NL5C+kB29p/EVN2S9vTLdjvYuEgM+ohKD4mQ==
X-Received: by 2002:a05:7301:6486:b0:361:8d0:6c7a with SMTP id 5a478bee46e88-36108d07524mr800644eec.26.1792143170184;
        Fri, 16 Oct 2026 02:32:50 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm5157172eec.18.2026.10.16.02.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:32:49 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v7 3/4] netlink: specs: add genetlink-legacy spec for GTP
Date: Fri, 16 Oct 2026 09:32:24 +0000
Message-Id: <20261016093225.1036375-4-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
References: <20261016093225.1036375-1-anilkaushikwireless@gmail.com>
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
index 23e9194483d9..42df33aea837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11422,6 +11422,7 @@ M:	Harald Welte <laforge@gnumonks.org>
 L:	osmocom-net-gprs@lists.osmocom.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
+F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
 
 GUID PARTITION TABLE (GPT)
diff --git a/tools/net/ynl/Makefile.deps b/tools/net/ynl/Makefile.deps
index 3eee34e0efcf..70d308cf5039 100644
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

