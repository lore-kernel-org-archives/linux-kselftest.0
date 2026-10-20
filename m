Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519922;
	b=o6UyuU6h4FkJ/kGv3se2apBv77JKAiK+7RsY9NmTrSHluWclIdGK/TQDcou+ZRsMiWlf
	 W0vy8hG8M8Xx9W21+S96ae7zwy17nDK0Em2KqC+qX4wQxol4LBxD+xxtKnbAZt6cUBZp1
	 FDPxr4TlpEwtfBXvkJFcnjMh77ctzAC8SraQfJO8gMULTPYUFq1ZhNcop+pswQ2yzNXsv
	 ss+rwm0iOync8xAdUFJyI0qI8/9CMaQCEzdfwASan0UMDrndS1dOkzqkzXzUPTgjxDbDH
	 ryNecofCfiSEzpY47LvJ+G8o/wKZdFBxNdxJCfoBE5Lre2JXruP7pZ3G4QxXzvfDt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+3nr/9uxi7CnlIRjhaLHkDl9x+xTKx3cPYs0W89zr6E=;
	b=Xw64E+oZt+vzPruCMYK5+r2FALADmJj6PetuHcmVgA1zBBjUxlbYpprHqSFeaKMEASU4
	 tkladgLDLxfyLgLkXrUYxwtVbvVYQqxZqEVsv5WIKSmbq9ntkqpnK+R3AEfYKOfkhwTU5
	 J9BZAcW5EwaxJxsCsXNnamt7VyoLB6lSnMtbjcc5HLQYrjMk2A3BXFxQg52h2JMb5RafT
	 MDUqb4751P/lvd/8KOtqqcZvVihvZOf4mJ4fOeqFDT23HqONvRr1vGBoelZit4iwsvd0u
	 OchjazTBeulbG2cs5RFE38+2aQX9dp/WSWBTaUF+w69V5XBK6PP8LXbKXP6JRPWGfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=R4WlUIhp;
	arc=none smtp.remote-ip=209.85.128.99
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F04606A324
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F04606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=R4WlUIhp
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so18765525e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792519920; x=1793124720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3nr/9uxi7CnlIRjhaLHkDl9x+xTKx3cPYs0W89zr6E=;
        b=R4WlUIhpGnaig96rTmdPIknfNGJjLYY1It6r8VGo7sF3FewLAkmv0EaE4SCwdn32bL
         IWQ4L8AvoiXc8la1Bg4kBbsGujF5IxJZcfiTxGS5aPKcSZTbED1hUfEbZdeSKvUmvN86
         oqHKk05AuIGw7eaeM3kVvJ+lnEYmFjMjyO7nxf67X5GuE03FyhjZOhoyBdaEwJlL++5c
         asi+lPRV+iR+W/KSqFwe761lXCDyy8A1DnEYwEk62Qt+aSwTsBkdsjFA7aybqdFa+OJ5
         cl1BNCVhk+qJEtRxDsXRCc/imzzq/OCvWdJ+ML8Agjws+NSULev9Ss6cFPptVYZmKPpv
         JwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519920; x=1793124720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3nr/9uxi7CnlIRjhaLHkDl9x+xTKx3cPYs0W89zr6E=;
        b=Qk0LsSbqaj1Cic0bjPTqvqCSL5fZdnSrsXMwrGSLUO7wUAqmjWQCIOcgCaWEQ7QbZ8
         LM65VOysAdrOFSOVGQDSs9MHnKDInZGRgIBHoRp8Z/FB7sZE/LAyYV4BuFKwGEwbPgsd
         YqmVsnOBdT4uoYVH1LCWAHhe+DpraE9/55VFlNBenmlB/UH6STr+1TC+keQDVvHlBl1A
         jnVt6VSadFLgd4POTaarkrVQGGWGifsNK44yPo0aVP9UI5ENei3O8KX0Hb5WbnIIoyrl
         HE4SaHaOIlUcP+7WW3Tcu7CYPplqOEeGyDv6OYuyjyitULHaF39M3OkhU4wSvg0kxU5+
         hLCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhL8EIrovOhFMuXc+r7V+vZMEf9kN+zXeLndBy08EHDZFlFbQfPhbpUX49OxtDGYlgrqexH1EkdXTjwhYFDtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO7TL++myqLwecwYGDE8/4kkUpAGOugqTH2MqochAP1DNFoLFo
	g6Lb5CsddL0Yr1MOZZ7arwrXolBkR4wgaHuMpeg8TgbTeuBzW4dnfGsZVM5u4N5GHsulIyMRSxQ
	s731b+f/uFz6iWuwmOVxSB3vo9BylzkpEZn6M
X-Gm-Gg: AYBFou3QfM2zWQktzyWakUAiqy/DY3+EQTWzwbeZwwq8bM/mJwklG66aY7ShoijgebZ
	Xqgquln8QoKj0HTvTqrjlpgi1BKhdKP9Q+cxxuQwGDAH3NuzCt83CQHOhkzUX+mfJKmALi45LtJ
	J6H9Z5aR70CsLeE3j+bCw+QwjiZYtgTyZ+PEPX7Oiyn/ACnYudPMCW8/62TjC9eheURGPTKQ6j6
	8x9uwvQWxYkX4xr2IWyD3vcNw0Y40ENUUB8K/QRyl09B/IxU09FJRY3F6nQqtNNmRIB3Ursal1t
	lLKq/V3vtmCFd5ocL0mc/oagLloPoVDKnf3qPfEQ9riwsXICMGbHN7K+YJ6LrwNN1A/js/w4WDp
	oUgbdO8aItj1sSH1t3G7/Zff4wGOVnNkfzvA=
X-Received: by 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4a1f7367b83mr48936515e9.5.1792519919704;
        Tue, 20 Oct 2026 11:11:59 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4a1fb983566sm910595e9.5.2026.10.20.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:11:59 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 31627401E4;
	Tue, 20 Oct 2026 12:11:58 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 2E98EDC0D46; Tue, 20 Oct 2026 12:11:58 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: add TLS 1.2 hardware offload tests
Date: Tue, 20 Oct 2026 12:11:45 -0600
Message-ID: <20261020181147.939575-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020181147.939575-1-rjethwani@purestorage.com>
References: <20261020181147.939575-1-rjethwani@purestorage.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a two-node kTLS hardware offload test. A C helper runs on both
endpoints and installs fixed AES-GCM keys, so no handshake is needed.
The DUT runs the TLS client and the peer echoes everything back. The
test covers AES-GCM-128/256, IPv4/IPv6, and small, large and random
echo payloads.

Each enabled DUT direction must use HW offload: the TlsTxDevice and
TlsRxDevice MIB counters must grow and, where the driver exposes them,
so must the NIC's TLS crypto and context counters. The peer, and any
DUT direction without HW offload enabled, may use SW kTLS. Neither
side may see a TlsDecryptError.

Add handshake and alert regression cases for the push_pending_record
fix. They install TLS_RX after TLS_TX, buffer "AAAA" with MSG_MORE and
send "BBBB" with a TLS_SET_RECORD_TYPE cmsg. The peer must receive an
application data record "AAAA" followed by a "BBBB" record of the
requested type, each with MSG_EOR, and then EOF. These cases require
DUT TX offload and work with the DUT's RX in either HW or SW.

Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 MAINTAINERS                                   |   2 +
 .../testing/selftests/drivers/net/README.rst  |  22 +
 .../selftests/drivers/net/hw/.gitignore       |   1 +
 .../testing/selftests/drivers/net/hw/Makefile |   4 +
 tools/testing/selftests/drivers/net/hw/config |   2 +
 .../selftests/drivers/net/hw/tls_hw_offload.c | 886 ++++++++++++++++++
 .../drivers/net/hw/tls_hw_offload.py          | 402 ++++++++
 7 files changed, 1319 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
 create mode 100755 tools/testing/selftests/drivers/net/hw/tls_hw_offload.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 00b440be0d46..771cd3161a05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19269,6 +19269,8 @@ F:	Documentation/networking/tls*
 F:	include/net/tls.h
 F:	include/uapi/linux/tls.h
 F:	net/tls/
+F:	tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
+F:	tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
 F:	tools/testing/selftests/net/tls.c
 
 NETWORKING [SOCKETS]
diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
index c6bed9a985bc..94c6aeecfe2f 100644
--- a/tools/testing/selftests/drivers/net/README.rst
+++ b/tools/testing/selftests/drivers/net/README.rst
@@ -188,6 +188,28 @@ The tests have a handful of dependencies. For Fedora / CentOS::
 
   dnf -y install netsniff-ng python-yaml socat iperf3
 
+TLS hardware offload
+~~~~~~~~~~~~~~~~~~~~
+
+``hw/tls_hw_offload.py`` tests TLS 1.2 with AES-GCM-128/256 using a C
+helper on both endpoints. Configure the endpoints using the variables above
+and enable at least one of ``tls-hw-tx-offload`` or ``tls-hw-rx-offload`` on
+the DUT. The peer can use software kTLS. The test checks every enabled DUT
+direction; unexpected software fallback fails. Known AES-GCM-128-only
+drivers skip the AES-GCM-256 case.
+
+The record-type cases require DUT TX offload. They install TLS_RX after
+TLS_TX, buffer application data with MSG_MORE, then send a handshake or
+alert record. The peer verifies both record types and payloads. Running
+with RX offload enabled covers hardware RX setup; running with it disabled
+also covers software RX setup on a socket with hardware TX offload.
+
+Run without other kTLS workloads in either endpoint's network namespace:
+the tests compare shared TLS MIB and NIC counter snapshots. Build the helper
+with ``make -C tools/testing/selftests/drivers/net/hw tls_hw_offload`` and
+run ``tools/testing/selftests/drivers/net/hw/tls_hw_offload.py`` with the
+endpoint configuration. The harness deploys the helper to the peer.
+
 Guidance for test authors
 =========================
 
diff --git a/tools/testing/selftests/drivers/net/hw/.gitignore b/tools/testing/selftests/drivers/net/hw/.gitignore
index 46540468a775..911a9bfeaf41 100644
--- a/tools/testing/selftests/drivers/net/hw/.gitignore
+++ b/tools/testing/selftests/drivers/net/hw/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 iou-zcrx
 ncdevmem
+tls_hw_offload
 toeplitz
diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
index 78bb0169350b..ee412ec93023 100644
--- a/tools/testing/selftests/drivers/net/hw/Makefile
+++ b/tools/testing/selftests/drivers/net/hw/Makefile
@@ -45,6 +45,7 @@ TEST_PROGS = \
 	rss_drv.py \
 	rss_flow_label.py \
 	rss_input_xfrm.py \
+	tls_hw_offload.py \
 	toeplitz.py \
 	tso.py \
 	userns_devmem.py \
@@ -77,6 +78,7 @@ YNL_GEN_FILES := \
 # end of YNL_GEN_FILES
 TEST_GEN_FILES += $(YNL_GEN_FILES)
 TEST_GEN_FILES += $(patsubst %.c,%.o,$(wildcard *.bpf.c))
+TEST_GEN_FILES += tls_hw_offload
 
 include ../../../lib.mk
 
@@ -90,6 +92,8 @@ include ../../../net/ynl.mk
 
 include ../../../net/bpf.mk
 
+$(OUTPUT)/tls_hw_offload: CFLAGS += $(KHDR_INCLUDES)
+
 ifeq ($(HAS_IOURING_ZCRX),y)
 $(OUTPUT)/iou-zcrx: LDLIBS += -luring
 endif
diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
index d89a9ba17655..169e608516bd 100644
--- a/tools/testing/selftests/drivers/net/hw/config
+++ b/tools/testing/selftests/drivers/net/hw/config
@@ -22,6 +22,8 @@ CONFIG_NET_IPIP=y
 CONFIG_NETKIT=y
 CONFIG_NET_SCH_INGRESS=y
 CONFIG_SYNC_FILE=y
+CONFIG_TLS=y
+CONFIG_TLS_DEVICE=y
 CONFIG_UDMABUF=y
 CONFIG_USER_NS=y
 CONFIG_VXLAN=y
diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
new file mode 100644
index 000000000000..4e9f8a2be8a8
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
@@ -0,0 +1,886 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TLS Hardware Offload Two-Node Test
+ *
+ * Tests kTLS hardware offload between two physical nodes using
+ * hardcoded keys. Supports TLS 1.2 and AES-GCM-128/256.
+ *
+ * Both ends must run this helper: there is no handshake.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <limits.h>
+#include <time.h>
+#include <sys/time.h>
+#include <signal.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <netinet/tcp.h>
+#include <netdb.h>
+#include <linux/tls.h>
+
+#ifndef SOL_TLS
+#define SOL_TLS 282
+#endif
+
+#define TLS_RECORD_TYPE_HANDSHAKE		22
+#define TLS_RECORD_TYPE_ALERT			21
+#define TLS_RECORD_TYPE_DATA			23
+
+#define MIN_BUF_SIZE   16
+
+/* Initial key material */
+static struct tls12_crypto_info_aes_gcm_128 tls_info_key0_128 = {
+	.info = {
+		.version = TLS_1_2_VERSION,
+		.cipher_type = TLS_CIPHER_AES_GCM_128,
+	},
+	.iv = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 },
+	.key = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+		 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10 },
+	.salt = { 0x01, 0x02, 0x03, 0x04 },
+	.rec_seq = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
+};
+
+static struct tls12_crypto_info_aes_gcm_256 tls_info_key0_256 = {
+	.info = {
+		.version = TLS_1_2_VERSION,
+		.cipher_type = TLS_CIPHER_AES_GCM_256,
+	},
+	.iv = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 },
+	.key = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+		 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+		 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
+		 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20 },
+	.salt = { 0x01, 0x02, 0x03, 0x04 },
+	.rec_seq = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
+};
+
+static int test_record_type;
+static int num_iterations = 100;
+static int cipher_type = TLS_CIPHER_AES_GCM_128;
+static int tls_version = TLS_1_2_VERSION;
+static int server_port = 4433;
+static char *server_ip;
+/* Address family to force: AF_UNSPEC (any), AF_INET (-4), AF_INET6 (-6). */
+static int force_family = AF_UNSPEC;
+
+static int send_size = 16384;
+static int random_size_max;
+/* Per-iteration progress output (-V). Off by default: the
+ * harness captures stdout in a pipe that is not drained until the helper
+ * exits, so unbounded per-record chatter (thousands of lines for the large
+ * echo variants) would fill the pipe, block printf(), stall the echo loop
+ * and surface as a bogus recv timeout on the peer. With -V off a run prints
+ * fixed setup/summary lines, comfortably inside a 64 KiB pipe.
+ */
+static int verbose;
+
+static const char *cipher_name(int cipher)
+{
+	switch (cipher) {
+	case TLS_CIPHER_AES_GCM_128: return "AES-GCM-128";
+	case TLS_CIPHER_AES_GCM_256: return "AES-GCM-256";
+	default: return "unknown";
+	}
+}
+
+static const char *version_name(int version)
+{
+	switch (version) {
+	case TLS_1_2_VERSION: return "TLS 1.2";
+	default: return "unknown";
+	}
+}
+
+static int setup_tls_ulp(int fd)
+{
+	int ret;
+
+	ret = setsockopt(fd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls"));
+	if (ret < 0) {
+		printf("SETUP ERROR: TCP_ULP failed: %s\n", strerror(errno));
+		return -1;
+	}
+	return 0;
+}
+
+/* Echo mode drives both directions from a single thread: the
+ * client pushes a whole payload with one blocking send() and only reads the
+ * echo afterwards, while the server blocks in send() mid-echo. If a payload
+ * exceeds the peer's receive window the two sides deadlock - client stuck in
+ * send(), server stuck echoing, neither draining the other. Size the socket
+ * buffers so a full payload always fits in the peer's window (the forward
+ * send() then completes without needing the peer to read concurrently); the
+ * send/recv timeouts armed by set_io_timeouts() turn any residual stall into a
+ * loud EAGAIN instead of a hang.
+ */
+static void configure_echo_socket(int fd, int payload)
+{
+	int want = payload;
+
+	if (want < MIN_BUF_SIZE)
+		want = MIN_BUF_SIZE;
+
+	/* SO_*BUFFORCE bypasses the rmem_max/wmem_max sysctl caps (needs
+	 * CAP_NET_ADMIN); fall back to the best-effort, cap-limited option
+	 * when unprivileged - the timeouts below still turn any resulting
+	 * stall into a loud failure rather than a hang.
+	 */
+	if (setsockopt(fd, SOL_SOCKET, SO_RCVBUFFORCE, &want, sizeof(want)) < 0)
+		setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &want, sizeof(want));
+	if (setsockopt(fd, SOL_SOCKET, SO_SNDBUFFORCE, &want, sizeof(want)) < 0)
+		setsockopt(fd, SOL_SOCKET, SO_SNDBUF, &want, sizeof(want));
+}
+
+/* Arm send/recv timeouts so any unexpected stall fails loudly with EAGAIN
+ * instead of hanging until the harness SIGKILLs us.
+ */
+static void set_io_timeouts(int fd)
+{
+	struct timeval tv = { .tv_sec = 8, .tv_usec = 0 };
+
+	setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
+	setsockopt(fd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
+}
+
+/* Send the whole buffer, looping over short counts. A blocking SOCK_STREAM
+ * send() may return fewer bytes than requested (e.g. when SO_SNDTIMEO fires
+ * after partial progress) without setting errno, so a short count is not an
+ * error - only a negative return is.
+ */
+static int send_all(int fd, const char *buf, ssize_t len)
+{
+	ssize_t sent = 0;
+	ssize_t ret;
+
+	while (sent < len) {
+		ret = send(fd, buf + sent, len - sent, 0);
+		if (ret <= 0) {
+			/* 0 for a non-empty request would spin forever. */
+			printf("FAIL: send failed: %s\n",
+			       ret ? strerror(errno) : "no progress");
+			return -1;
+		}
+		sent += ret;
+	}
+	return 0;
+}
+
+static int recv_tls_message(int fd, char *buf, size_t buflen, int *record_type,
+			    int flags)
+{
+	char cmsg_buf[CMSG_SPACE(sizeof(unsigned char))];
+	struct msghdr msg = {0};
+	struct cmsghdr *cmsg;
+	struct iovec iov;
+	int ret;
+
+	iov.iov_base = buf;
+	iov.iov_len = buflen;
+
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = cmsg_buf;
+	msg.msg_controllen = sizeof(cmsg_buf);
+
+	ret = recvmsg(fd, &msg, flags);
+	if (ret <= 0)
+		return ret;
+
+	cmsg = CMSG_FIRSTHDR(&msg);
+	if (cmsg && cmsg->cmsg_level == SOL_TLS &&
+	    cmsg->cmsg_type == TLS_GET_RECORD_TYPE)
+		*record_type = *((unsigned char *)CMSG_DATA(cmsg));
+
+	return ret;
+}
+
+static int install_tls_key(int fd, int direction, int cipher)
+{
+	const char *dir = direction == TLS_TX ? "TX" : "RX";
+	int ret;
+
+	if (verbose)
+		printf("Installing TLS_%s %s...\n", dir, cipher_name(cipher));
+
+	if (cipher == TLS_CIPHER_AES_GCM_256) {
+		struct tls12_crypto_info_aes_gcm_256 key;
+
+		memcpy(&key, &tls_info_key0_256, sizeof(key));
+		key.info.version = tls_version;
+		ret = setsockopt(fd, SOL_TLS, direction, &key, sizeof(key));
+	} else {
+		struct tls12_crypto_info_aes_gcm_128 key;
+
+		memcpy(&key, &tls_info_key0_128, sizeof(key));
+		key.info.version = tls_version;
+		ret = setsockopt(fd, SOL_TLS, direction, &key, sizeof(key));
+	}
+
+	if (ret < 0) {
+		printf("SETUP ERROR: TLS_%s %s failed: %s\n",
+		       dir, cipher_name(cipher), strerror(errno));
+		return -1;
+	}
+	printf("TLS_%s %s installed\n", dir, cipher_name(cipher));
+	return 0;
+}
+
+/* Open a TCP connection to server_ip:server_port, switch to the TLS
+ * ULP, and install initial TX/RX keys. Works over IPv4 or
+ * IPv6: getaddrinfo() resolves server_ip (honouring any -4/-6 forced
+ * family and %zone scope IDs in link-local addresses). Returns the fd on
+ * success, -1 on error (with the fd already closed).
+ */
+static int client_connect_tls(void)
+{
+	struct addrinfo hints = {0}, *res, *rp;
+	char port_str[16];
+	int csk = -1;
+	int ret;
+
+	hints.ai_family = force_family;
+	hints.ai_socktype = SOCK_STREAM;
+	hints.ai_protocol = IPPROTO_TCP;
+	snprintf(port_str, sizeof(port_str), "%d", server_port);
+
+	ret = getaddrinfo(server_ip, port_str, &hints, &res);
+	if (ret) {
+		printf("SETUP ERROR: getaddrinfo(%s): %s\n", server_ip,
+		       gai_strerror(ret));
+		return -1;
+	}
+
+	printf("Connecting to %s:%d...\n", server_ip, server_port);
+	for (rp = res; rp; rp = rp->ai_next) {
+		csk = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
+		if (csk < 0)
+			continue;
+		if (connect(csk, rp->ai_addr, rp->ai_addrlen) == 0)
+			break;
+		close(csk);
+		csk = -1;
+	}
+	freeaddrinfo(res);
+
+	if (csk < 0) {
+		printf("SETUP ERROR: connect to %s:%d failed: %s\n",
+		       server_ip, server_port, strerror(errno));
+		return -1;
+	}
+	printf("Connected!\n");
+
+	if (setup_tls_ulp(csk) < 0)
+		goto err;
+
+	if (install_tls_key(csk, TLS_TX, cipher_type) < 0 ||
+	    install_tls_key(csk, TLS_RX, cipher_type) < 0)
+		goto err;
+
+	set_io_timeouts(csk);
+	configure_echo_socket(csk, random_size_max > 0 ?
+				    random_size_max : send_size);
+
+	return csk;
+err:
+	close(csk);
+	return -1;
+}
+
+/* Drain `len` echoed bytes from the server and verify they match the
+ * payload we just sent.
+ */
+static int client_recv_echo(int fd, const char *sent, char *echo_buf,
+			    ssize_t len)
+{
+	ssize_t total = 0;
+	ssize_t n;
+
+	while (total < len) {
+		n = recv(fd, echo_buf + total, len - total, 0);
+		if (n < 0) {
+			printf("FAIL: Echo recv failed: %s\n", strerror(errno));
+			return -1;
+		}
+		if (n == 0) {
+			printf("FAIL: Connection closed during echo\n");
+			return -1;
+		}
+		total += n;
+	}
+
+	if (memcmp(sent, echo_buf, len) != 0) {
+		printf("FAIL: Echo data mismatch!\n");
+		return -1;
+	}
+	if (verbose)
+		printf("Received echo %zd bytes (ok)\n", total);
+	return 0;
+}
+
+static int do_client(void)
+{
+	char *buf = NULL, *echo_buf = NULL;
+	int max_size;
+	int csk = -1, i = 1;
+	int test_result = -1;
+	ssize_t n, total = 0;
+
+	max_size = random_size_max > 0 ? random_size_max : send_size;
+	if (max_size < MIN_BUF_SIZE)
+		max_size = MIN_BUF_SIZE;
+	buf = malloc(max_size);
+	echo_buf = malloc(max_size);
+	if (!buf || !echo_buf) {
+		printf("SETUP ERROR: failed to allocate buffers\n");
+		goto out;
+	}
+
+	csk = client_connect_tls();
+	if (csk < 0)
+		goto out;
+
+	printf("TLS setup complete.\n");
+
+	if (random_size_max > 0)
+		printf("Sending %d messages of random size (1..%d bytes)...\n",
+		       num_iterations, random_size_max);
+	else
+		printf("Sending %d messages of %d bytes...\n",
+		       num_iterations, send_size);
+
+	for (i = 1; i <= num_iterations; i++) {
+		int this_size;
+		int j;
+
+		if (random_size_max > 0)
+			this_size = (rand() % random_size_max) + 1;
+		else
+			this_size = send_size;
+
+		for (j = 0; j < this_size; j++)
+			buf[j] = rand() & 0xFF;
+
+		if (send_all(csk, buf, this_size) < 0)
+			goto out;
+		n = this_size;
+		total += n;
+
+		if (verbose)
+			printf("Sent %zd bytes (iteration %d)\n", n, i);
+		if (client_recv_echo(csk, buf, echo_buf, n) < 0)
+			goto out;
+	}
+
+	test_result = 0;
+out:
+	printf("Sent %d/%d iterations, %zd bytes\n", i - 1, num_iterations,
+	       total);
+	if (csk >= 0)
+		close(csk);
+	free(buf);
+	free(echo_buf);
+	return test_result;
+}
+
+/* Bind/listen on server_port, accept one client, switch to the TLS ULP
+ * and install initial keys.
+ * Returns the connected fd on success and writes the listener fd to
+ * *lsk_out so the caller can close it. Returns -1 on error, with all
+ * intermediate fds already closed and *lsk_out left at -1.
+ */
+static int server_accept_tls(int *lsk_out)
+{
+	struct addrinfo hints = {0}, *res, *rp;
+	int lsk = -1, csk, one = 1;
+	char port_str[16];
+	int ret;
+
+	*lsk_out = -1;
+
+	/* AI_PASSIVE gives a wildcard bind address for the chosen family
+	 * (0.0.0.0 / ::). The family is forced by -4/-6; when unspecified,
+	 * bind the first entry that works.
+	 */
+	hints.ai_family = force_family;
+	hints.ai_socktype = SOCK_STREAM;
+	hints.ai_protocol = IPPROTO_TCP;
+	hints.ai_flags = AI_PASSIVE;
+	snprintf(port_str, sizeof(port_str), "%d", server_port);
+
+	ret = getaddrinfo(NULL, port_str, &hints, &res);
+	if (ret) {
+		printf("SETUP ERROR: getaddrinfo(port %d): %s\n", server_port,
+		       gai_strerror(ret));
+		return -1;
+	}
+
+	for (rp = res; rp; rp = rp->ai_next) {
+		lsk = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
+		if (lsk < 0)
+			continue;
+		setsockopt(lsk, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
+		if (bind(lsk, rp->ai_addr, rp->ai_addrlen) == 0)
+			break;
+		close(lsk);
+		lsk = -1;
+	}
+	freeaddrinfo(res);
+
+	if (lsk < 0) {
+		printf("SETUP ERROR: failed to bind port %d: %s\n",
+		       server_port, strerror(errno));
+		return -1;
+	}
+
+	if (listen(lsk, 1) < 0) {
+		printf("SETUP ERROR: listen failed: %s\n", strerror(errno));
+		close(lsk);
+		return -1;
+	}
+
+	printf("Server listening on port %d\n", server_port);
+	printf("Waiting for client connection...\n");
+
+	/* Bound accept() so a client that never connects (a deploy or connect
+	 * failure on the peer) does not block the server forever. accept()
+	 * honours SO_RCVTIMEO on the listening socket; the client connects
+	 * right after wait_port_listen(), so 10s is generous, and it is well
+	 * inside the 20s the harness waits for the server to exit (the default
+	 * cmd.process() timeout) so the server is gone, and its listening port
+	 * released, before the next variant starts.
+	 */
+	{
+		struct timeval tv = { .tv_sec = 10, .tv_usec = 0 };
+
+		setsockopt(lsk, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
+	}
+
+	csk = accept(lsk, NULL, NULL);
+	if (csk < 0) {
+		if (errno == EAGAIN || errno == EWOULDBLOCK)
+			printf("SETUP ERROR: accept timed out; client never connected\n");
+		else
+			printf("SETUP ERROR: accept failed: %s\n", strerror(errno));
+		close(lsk);
+		return -1;
+	}
+	printf("Client connected!\n");
+
+	if (setup_tls_ulp(csk) < 0)
+		goto err;
+
+	if (install_tls_key(csk, TLS_TX, cipher_type) < 0 ||
+	    install_tls_key(csk, TLS_RX, cipher_type) < 0)
+		goto err;
+
+	set_io_timeouts(csk);
+	configure_echo_socket(csk, random_size_max > 0 ?
+				    random_size_max : send_size);
+
+	*lsk_out = lsk;
+	return csk;
+err:
+	close(csk);
+	close(lsk);
+	return -1;
+}
+
+static int do_server(void)
+{
+	int lsk = -1, csk = -1;
+	ssize_t n, total = 0;
+	int test_result = -1;
+	int recv_count = 0;
+	char *buf = NULL;
+	int record_type = 0;
+	int buf_size;
+
+	buf_size = send_size;
+	if (buf_size < MIN_BUF_SIZE)
+		buf_size = MIN_BUF_SIZE;
+	buf = malloc(buf_size);
+	if (!buf) {
+		printf("SETUP ERROR: failed to allocate buffer\n");
+		goto out;
+	}
+
+	csk = server_accept_tls(&lsk);
+	if (csk < 0)
+		goto out;
+
+	printf("TLS %s setup complete. Receiving...\n",
+	       cipher_name(cipher_type));
+
+	/* Echo everything back; the client verifies each echo. */
+	while (1) {
+		n = recv_tls_message(csk, buf, buf_size, &record_type, 0);
+		if (n == 0) {
+			printf("Connection closed by client\n");
+			break;
+		}
+		if (n < 0) {
+			printf("FAIL: recv failed: %s\n", strerror(errno));
+			goto out;
+		}
+
+		total += n;
+		recv_count++;
+		if (verbose)
+			printf("Received %zd bytes (total: %zd, count: %d)\n",
+			       n, total, recv_count);
+
+		if (send_all(csk, buf, n) < 0)
+			goto out;
+		if (verbose)
+			printf("Echoed %zd bytes back to client\n", n);
+	}
+
+	test_result = 0;
+out:
+	printf("Connection closed. Total received: %zd bytes in %d reads\n",
+	       total, recv_count);
+
+	if (csk >= 0)
+		close(csk);
+	if (lsk >= 0)
+		close(lsk);
+	free(buf);
+	return test_result;
+}
+
+static int send_record_type(int fd)
+{
+	char control[CMSG_SPACE(sizeof(unsigned char))] = {};
+	struct iovec iov = { .iov_base = "BBBB", .iov_len = 4 };
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_control = control,
+		.msg_controllen = sizeof(control),
+	};
+	struct cmsghdr *cmsg = CMSG_FIRSTHDR(&msg);
+	char ack[2];
+
+	if (send(fd, "AAAA", 4, MSG_MORE) != 4) {
+		printf("FAIL: send MSG_MORE failed: %s\n", strerror(errno));
+		return -1;
+	}
+	cmsg->cmsg_level = SOL_TLS;
+	cmsg->cmsg_type = TLS_SET_RECORD_TYPE;
+	cmsg->cmsg_len = CMSG_LEN(sizeof(unsigned char));
+	*CMSG_DATA(cmsg) = test_record_type;
+	if (sendmsg(fd, &msg, 0) != 4) {
+		printf("FAIL: sendmsg record type failed: %s\n",
+		       strerror(errno));
+		return -1;
+	}
+	return client_recv_echo(fd, "OK", ack, sizeof(ack));
+}
+
+static int expect_record(int fd, const char *data, unsigned char type)
+{
+	char control[CMSG_SPACE(sizeof(unsigned char))] = {};
+	char buf[16];
+	struct iovec iov = { .iov_base = buf, .iov_len = sizeof(buf) };
+	struct msghdr msg = {
+		.msg_iov = &iov,
+		.msg_iovlen = 1,
+		.msg_control = control,
+		.msg_controllen = sizeof(control),
+	};
+	struct cmsghdr *cmsg;
+	int ret;
+
+	ret = recvmsg(fd, &msg, 0);
+	if (ret != 4 || memcmp(buf, data, 4) ||
+	    (msg.msg_flags & (MSG_CTRUNC | MSG_TRUNC)) ||
+	    !(msg.msg_flags & MSG_EOR)) {
+		printf("FAIL: expected record '%s', got %d bytes, flags %#x\n",
+		       data, ret, msg.msg_flags);
+		return -1;
+	}
+	cmsg = CMSG_FIRSTHDR(&msg);
+	if (!cmsg || cmsg->cmsg_level != SOL_TLS ||
+	    cmsg->cmsg_type != TLS_GET_RECORD_TYPE ||
+	    cmsg->cmsg_len != CMSG_LEN(sizeof(unsigned char)) ||
+	    *CMSG_DATA(cmsg) != type) {
+		printf("FAIL: expected record type %u\n", type);
+		return -1;
+	}
+	return 0;
+}
+
+static int recv_record_type(int fd)
+{
+	char buf[16];
+	int ret;
+
+	if (expect_record(fd, "AAAA", TLS_RECORD_TYPE_DATA) ||
+	    expect_record(fd, "BBBB", test_record_type) ||
+	    send_all(fd, "OK", 2))
+		return -1;
+	ret = recv(fd, buf, sizeof(buf), 0);
+	if (ret) {
+		printf("FAIL: expected EOF after records, got %d\n", ret);
+		return -1;
+	}
+	return 0;
+}
+
+static int test_pending_record(int is_server)
+{
+	char *buf = NULL, *echo_buf = NULL;
+	int lsk = -1, csk = -1;
+	int test_result = -1;
+	int i;
+
+	buf = malloc(send_size);
+	echo_buf = malloc(send_size);
+	if (!buf || !echo_buf) {
+		printf("SETUP ERROR: failed to allocate buffers\n");
+		goto out;
+	}
+	memset(buf, 0xa5, send_size);
+
+	csk = is_server ? server_accept_tls(&lsk) : client_connect_tls();
+	if (csk < 0)
+		goto out;
+
+	/* Exercise hardware crypto before testing the record-type transition. */
+	for (i = 0; i < num_iterations; i++) {
+		if (!is_server && send_all(csk, buf, send_size) < 0)
+			goto out;
+		if (client_recv_echo(csk, buf, echo_buf, send_size) < 0)
+			goto out;
+		if (is_server && send_all(csk, buf, send_size) < 0)
+			goto out;
+	}
+
+	test_result = is_server ? recv_record_type(csk) : send_record_type(csk);
+out:
+	if (csk >= 0)
+		close(csk);
+	if (lsk >= 0)
+		close(lsk);
+	free(buf);
+	free(echo_buf);
+	return test_result;
+}
+
+static int parse_int_arg(const char *arg, int min, int max,
+			 const char *name, int *out)
+{
+	char *endp;
+	long val;
+
+	errno = 0;
+	val = strtol(arg, &endp, 10);
+	if (errno || endp == arg || *endp != '\0' || val < min || val > max) {
+		if (max == INT_MAX)
+			printf("ERROR: Invalid %s '%s'. Must be >= %d.\n",
+			       name, arg, min);
+		else
+			printf("ERROR: Invalid %s '%s'. Must be %d..%d.\n",
+			       name, arg, min, max);
+		return -1;
+	}
+	*out = (int)val;
+	return 0;
+}
+
+static int parse_cipher_option(const char *arg)
+{
+	if (strcmp(arg, "128") == 0) {
+		cipher_type = TLS_CIPHER_AES_GCM_128;
+		return 0;
+	} else if (strcmp(arg, "256") == 0) {
+		cipher_type = TLS_CIPHER_AES_GCM_256;
+		return 0;
+	}
+	printf("ERROR: Invalid cipher '%s'. Must be 128 or 256.\n", arg);
+	return -1;
+}
+
+static int parse_version_option(const char *arg)
+{
+	if (strcmp(arg, "1.2") == 0) {
+		tls_version = TLS_1_2_VERSION;
+		return 0;
+	}
+	printf("ERROR: Invalid TLS version '%s'. Must be 1.2.\n", arg);
+	return -1;
+}
+
+static void print_usage(const char *prog)
+{
+	printf("TLS Hardware Offload Two-Node Test\n\n");
+	printf("Usage:\n");
+	printf("  %s server [OPTIONS]\n", prog);
+	printf("  %s client -s <ip> [OPTIONS]\n", prog);
+	printf("\nOptions:\n");
+	printf("  -s <ip>       Server IP address, v4 or v6 (client, required)\n");
+	printf("  -p <port>     Server port (default: 4433)\n");
+	printf("  -4            Force IPv4 (default: auto/either)\n");
+	printf("  -6            Force IPv6 (default: auto/either)\n");
+	printf("  -b <size>     Send buffer size in bytes (default: 16384)\n");
+	printf("  -r <max>      Use random send buffer sizes (1..<max>)\n");
+	printf("  -v <version>  TLS version: 1.2 (default: 1.2)\n");
+	printf("  -c <cipher>   Cipher: 128 or 256 (default: 128)\n");
+	printf("  -n <N>        Number of send/echo iterations (default: 100)\n");
+	printf("  -t <type>     Test MSG_MORE followed by alert (21) or handshake (22)\n");
+	printf("  -V            Verbose: log every iteration\n");
+	printf("  -h            Show this help message\n");
+	printf("\nExample:\n");
+	printf("  Node A: %s server\n", prog);
+	printf("  Node B: %s client -s 192.168.20.2\n", prog);
+	printf("\nIPv6 Example:\n");
+	printf("  Node A: %s server -6\n", prog);
+	printf("  Node B: %s client -6 -s fd00::2\n", prog);
+}
+
+int main(int argc, char *argv[])
+{
+	int send_size_set = 0;
+	int is_server;
+	int opt;
+
+	/* When the peer aborts a TLS connection (e.g. tls_err_abort() on a
+	 * failed decrypt), a send() here would raise SIGPIPE and kill us by
+	 * signal, so the harness sees only a bare non-zero exit with no
+	 * "FAIL:" line. Ignore it and let send()/sendmsg() return EPIPE, which
+	 * send_all()/send_record_type() report.
+	 */
+	signal(SIGPIPE, SIG_IGN);
+
+	if (argc < 2 ||
+	    (strcmp(argv[1], "server") && strcmp(argv[1], "client"))) {
+		print_usage(argv[0]);
+		return 1;
+	}
+	is_server = !strcmp(argv[1], "server");
+
+	optind = 2; /* skip subcommand */
+	while ((opt = getopt(argc, argv, "s:p:b:r:c:v:n:t:V46h")) != -1) {
+		switch (opt) {
+		case 's':
+			server_ip = optarg;
+			break;
+		case 'V':
+			verbose = 1;
+			break;
+		case '4':
+			if (force_family == AF_INET6) {
+				printf("ERROR: -4 and -6 are mutually exclusive\n");
+				return 1;
+			}
+			force_family = AF_INET;
+			break;
+		case '6':
+			if (force_family == AF_INET) {
+				printf("ERROR: -4 and -6 are mutually exclusive\n");
+				return 1;
+			}
+			force_family = AF_INET6;
+			break;
+		case 'p':
+			if (parse_int_arg(optarg, 1, 65535, "port",
+					  &server_port) < 0)
+				return 1;
+			break;
+		case 'b':
+			if (parse_int_arg(optarg, 1, INT_MAX, "buffer size",
+					  &send_size) < 0)
+				return 1;
+			send_size_set = 1;
+			break;
+		case 'r':
+			if (parse_int_arg(optarg, 1, INT_MAX, "random size",
+					  &random_size_max) < 0)
+				return 1;
+			break;
+		case 'c':
+			if (parse_cipher_option(optarg) < 0)
+				return 1;
+			break;
+		case 'v':
+			if (parse_version_option(optarg) < 0)
+				return 1;
+			break;
+		case 't':
+			if (parse_int_arg(optarg, TLS_RECORD_TYPE_ALERT,
+					  TLS_RECORD_TYPE_HANDSHAKE, "record type",
+					  &test_record_type) < 0)
+				return 1;
+			break;
+		case 'n':
+			/* The iteration loops use an inclusive int bound
+			 * (i <= num_iterations), so INT_MAX itself would
+			 * overflow the counter instead of terminating.
+			 */
+			if (parse_int_arg(optarg, 1, INT_MAX - 1,
+					  "iteration count",
+					  &num_iterations) < 0)
+				return 1;
+			break;
+		case 'h':
+			print_usage(argv[0]);
+			return 0;
+		default:
+			print_usage(argv[0]);
+			return 1;
+		}
+	}
+
+	if (send_size_set && random_size_max > 0) {
+		printf("ERROR: -b and -r are mutually exclusive\n");
+		return 1;
+	}
+
+	if (test_record_type && random_size_max) {
+		printf("ERROR: -t cannot be combined with -r\n");
+		return 1;
+	}
+
+	if (is_server) {
+		if (server_ip) {
+			printf("warning: -s is ignored in server mode\n");
+			server_ip = NULL;
+		}
+		if (random_size_max > 0) {
+			printf("warning: -r is ignored in server mode\n");
+			random_size_max = 0;
+		}
+	} else {
+		if (!server_ip) {
+			printf("ERROR: Client requires -s <ip> option\n");
+			return 1;
+		}
+	}
+
+	printf("TLS Version: %s\n", version_name(tls_version));
+	printf("Cipher: %s\n", cipher_name(cipher_type));
+	printf("Address family: %s\n",
+	       force_family == AF_INET ? "IPv4" :
+	       force_family == AF_INET6 ? "IPv6" : "auto");
+	if (random_size_max > 0)
+		printf("Buffer size: random (1..%d)\n", random_size_max);
+	else
+		printf("Buffer size: %d\n", send_size);
+
+	srand(time(NULL));
+
+	if (test_record_type)
+		return test_pending_record(is_server) ? 1 : 0;
+
+	if (is_server)
+		return do_server() ? 1 : 0;
+
+	return do_client() ? 1 : 0;
+}
diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
new file mode 100755
index 000000000000..37f26e21a7b7
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
@@ -0,0 +1,402 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Test kTLS hardware offload using a C helper binary."""
+
+import re
+import shlex
+import subprocess
+from collections import defaultdict
+
+from lib.py import ksft_run, ksft_exit, ksft_pr, KsftSkipEx
+from lib.py import ksft_ge, ksft_eq
+from lib.py import ksft_variants, KsftNamedVariant
+from lib.py import NetDrvEpEnv
+from lib.py import cmd, bkg, wait_port_listen, rand_port
+from lib.py import CmdExitFailure
+
+# Reading /proc/net/tls_stat is trivial locally, but on the remote it runs
+# over ssh, where connection setup can occasionally spike past the short
+# default cmd() timeout. Give these tiny reads plenty of headroom so a slow
+# ssh round-trip doesn't fail an otherwise-good variant.
+STATS_TIMEOUT_S = 30
+
+# `ethtool -S` counters on the DUT NIC, from the minimum set every TLS
+# offload driver should report (Documentation/networking/tls-offload.rst,
+# "Statistics"); mlx5, nfp, cxgb4 and funeth use exactly these names.
+# TlsTxDevice/TlsRxDevice in /proc/net/tls_stat only prove tls_dev_add()
+# accepted the offload:
+#  - *_packets increment once per packet the NIC actually encrypted or
+#    decrypted (mlx5 counts gso_segs, not records), so they prove the HW
+#    crypto path was exercised.
+#  - *_ctx increment once per tls_dev_add().
+# Missing NIC crypto counters remain optional.
+HW_NIC_COUNTERS = {
+    'Tx': {'crypto': 'tx_tls_encrypted_packets', 'ctx': 'tx_tls_ctx'},
+    'Rx': {'crypto': 'rx_tls_decrypted_packets', 'ctx': 'rx_tls_ctx'},
+}
+
+
+def check_tls_support(cfg):
+    """Require kTLS on both hosts and at least one DUT HW direction."""
+    # The tls module is autoloaded lazily on the first TCP_ULP="tls"
+    # setsockopt, so /proc/net/tls_stat (created from the module's pernet
+    # init) may not exist yet on a freshly booted host. Load the module
+    # explicitly before probing for it. Best effort only: with CONFIG_TLS=y
+    # (what the config fragment asks for) there is nothing to load, and
+    # modprobe may fail for reasons unrelated to kTLS (no modules.dep for a
+    # locally built kernel, no modprobe on a minimal rootfs). The
+    # /proc/net/tls_stat probe below is the authoritative check. Locally,
+    # cmd() runs without a shell, so a missing modprobe raises
+    # FileNotFoundError rather than returning a failed exit status.
+    try:
+        cmd("modprobe tls", fail=False)
+    except FileNotFoundError:
+        pass
+    cmd("modprobe tls", host=cfg.remote, fail=False)
+    try:
+        cmd("test -f /proc/net/tls_stat")
+        cmd("test -f /proc/net/tls_stat", host=cfg.remote)
+    except CmdExitFailure as e:
+        raise KsftSkipEx(f"kTLS not supported: {e}") from e
+
+    try:
+        features = cmd(f"ethtool -k {cfg.ifname}").stdout
+    except CmdExitFailure as e:
+        raise KsftSkipEx(f"Cannot determine TLS HW offload support: {e}") from e
+    cfg.tls_hw_directions = {
+        direction for direction in ('Tx', 'Rx')
+        if f'tls-hw-{direction.lower()}-offload: on' in features
+    }
+    if not cfg.tls_hw_directions:
+        raise KsftSkipEx("Device has no enabled TLS HW offload direction")
+
+
+def read_tls_stats(host=None):
+    """Snapshot the per-netns TLS MIB from /proc/net/tls_stat as a dict."""
+    # /proc/net/tls_stat exposes the per-netns TLS MIB (TLS_INC_STATS on
+    # sock_net(sk)). The test runs on a real NIC in the host namespace, so
+    # these counters are shared with anything else doing kTLS there. The
+    # strict before/after delta checks (zero error counters) assume no other
+    # kTLS activity in this namespace during a
+    # variant's window; concurrent kTLS users would perturb the deltas and
+    # cause spurious failures. Don't run other kTLS workloads alongside this
+    # test.
+    stats = defaultdict(int)
+    output = cmd("cat /proc/net/tls_stat", host=host, timeout=STATS_TIMEOUT_S)
+    for line in output.stdout.strip().split('\n'):
+        parts = line.split()
+        if len(parts) == 2:
+            stats[parts[0]] = int(parts[1])
+    return stats
+
+
+def read_nic_stats(cfg):
+    """Snapshot the DUT NIC's `ethtool -S` counters as a dict."""
+    # Driver per-record TLS counters from `ethtool -S` on the DUT NIC. Same
+    # before/after-delta caveat as read_tls_stats(): these are device-wide,
+    # so concurrent kTLS traffic on this NIC would perturb the deltas.
+    stats = defaultdict(int)
+    output = cmd(f"ethtool -S {cfg.ifname}").stdout
+    for line in output.strip().split('\n'):
+        key, sep, val = line.partition(':')
+        if sep and val.strip().isdigit():
+            stats[key.strip()] = int(val.strip())
+    return stats
+
+
+def stat_diff(before, after, key):
+    """Return the delta of counter `key` between two stat snapshots."""
+    return after[key] - before[key]
+
+
+def check_hw_crypto(cfg, nic_before, nic_after, hw_directions):
+    """Check DUT hardware crypto and initial key installs."""
+    for direction in hw_directions:
+        names = HW_NIC_COUNTERS[direction]
+
+        key = names['crypto']
+        if key in nic_after:
+            got = stat_diff(nic_before, nic_after, key)
+            ksft_ge(got, 1,
+                    comment=f"DUT {direction}: NIC reported no HW crypto "
+                            f"({key}={got})")
+        else:
+            ksft_pr(f"NOTE: DUT {direction}: '{key}' not exposed by "
+                    f"{cfg.ifname}, skipping HW crypto check")
+
+        key = names['ctx']
+        if key not in nic_after:
+            ksft_pr(f"NOTE: DUT {direction}: '{key}' not exposed by "
+                    f"{cfg.ifname}, skipping NIC context count check")
+            continue
+        ctx = stat_diff(nic_before, nic_after, key)
+        ksft_ge(ctx, 1,
+                comment=f"DUT {direction}: no HW context installed "
+                        f"({key}={ctx})")
+
+
+def check_path(before, after, direction, role, require_hw):
+    """Require HW for enabled DUT directions; otherwise HW or SW is fine."""
+    dev = stat_diff(before, after, f'Tls{direction}Device')
+    sw = stat_diff(before, after, f'Tls{direction}Sw')
+    if require_hw:
+        ksft_ge(dev, 1,
+                comment=f"{role} {direction}: HW offload not engaged "
+                        f"(Device={dev}, Sw={sw})")
+    else:
+        ksft_ge(dev + sw, 1,
+                comment=f"{role} {direction}: no TLS activity "
+                        f"(Device={dev}, Sw={sw})")
+
+
+def verify_tls_counters(stats_before, stats_after, is_dut, hw_directions=()):
+    """Verify TLS counters on one side of the connection.
+
+    is_dut: True for the local DUT.
+    hw_directions: DUT directions with enabled HW offload; other directions
+           may use SW kTLS but still undergo activity and error checks.
+    """
+    role = 'DUT' if is_dut else 'Peer'
+
+    # Echo mode drives both directions on both sides.
+    for direction in ('Tx', 'Rx'):
+        check_path(stats_before, stats_after, direction, role,
+                   require_hw=is_dut and direction in hw_directions)
+
+    ksft_eq(stat_diff(stats_before, stats_after, 'TlsDecryptError'), 0,
+            comment=f"{role}: TlsDecryptError expected 0")
+
+
+def stop_helper(helper):
+    """Reap a helper that is still running: SIGTERM, then SIGKILL.
+
+    cmd.process(terminate=True) sends SIGTERM and waits; if the process
+    ignores it there is no fallback and communicate() raises again from the
+    cleanup path, leaving the child alive. Escalate to SIGKILL instead.
+    """
+    try:
+        helper.process(terminate=True, fail=False, timeout=5)
+    except subprocess.TimeoutExpired:
+        helper.proc.kill()
+        helper.process(terminate=False, fail=False, timeout=5)
+
+
+def kill_remote_helper(cfg, helper_cmd):
+    """Stop this variant's remote helper and confirm that it has exited.
+
+    Signalling cmd.proc only reaches the local process, which for the ssh
+    backend is the ssh client, not the helper on the peer. Losing its stdout
+    does not stop the helper either: it ignores SIGPIPE so that a peer abort
+    is reported as EPIPE instead of a bare signal death. Left alone it keeps
+    driving kTLS (bumping the peer's TLS MIBs) into the next variant's
+    measurement window, or sits in accept() for the rest of its own timeout.
+    Match the complete command, including this variant's port, since the
+    netns backend uses the same binary path for both endpoints and other
+    runs. The anchors also exclude the shell executing the cleanup. Failure
+    to confirm exit must prevent later variants from taking counter
+    snapshots.
+    """
+    pattern = shlex.quote('^' + re.escape(helper_cmd) + '$')
+    cmd(f"""
+command -v pkill >/dev/null && command -v pgrep >/dev/null || exit 2
+for tls_signal in TERM KILL; do
+    pkill -"$tls_signal" -f -- {pattern}
+    tls_status=$?
+    [ "$tls_status" -le 1 ] || exit "$tls_status"
+    tls_attempt=0
+    while [ "$tls_attempt" -lt 50 ]; do
+        pgrep -f -- {pattern} >/dev/null
+        tls_status=$?
+        case "$tls_status" in
+            1) exit 0 ;;
+            0) ;;
+            *) exit "$tls_status" ;;
+        esac
+        sleep 0.1
+        tls_attempt=$((tls_attempt + 1))
+    done
+done
+echo 'TLS helper still running after SIGKILL' >&2
+exit 1
+""", host=cfg.remote, timeout=STATS_TIMEOUT_S)
+
+
+def run_tls_test(cfg, cipher="128", tls_version="1.2",
+                 buffer_size=None, random_max=None, ipver="4",
+                 record_type=None):
+    """Run the TLS offload test.
+
+    The DUT runs the TLS client and the remote runs the echo server.
+
+    ipver: '4' or '6' - IP version to run over. The C helper is forced to the
+           matching family with -4/-6 and connects to the peer's v4/v6 address.
+           Variants requesting '6' skip cleanly when the environment lacks IPv6
+           connectivity (require_ipver()).
+
+    The DUT (local) is the kernel under test; the remote is just a traffic
+    source/sink and may run any kernel without HW offload. Both sides run
+    kTLS because TLS is pairwise, but verify_tls_counters() requires HW
+    offload only in enabled DUT directions. The peer and the DUT's other
+    direction may use SW kTLS.
+    """
+    if cfg.cleanup_failed:
+        raise KsftSkipEx("Previous helper cleanup could not be confirmed")
+
+    cfg.require_ipver(ipver)
+
+    # Echo exercises both directions, allowing SW in a direction without
+    # HW support.
+    hw_directions = tuple(d for d in ('Tx', 'Rx') if d in cfg.tls_hw_directions)
+
+    if record_type and 'Tx' not in hw_directions:
+        raise KsftSkipEx("Record-type regression requires DUT TLS TX offload")
+
+    port = rand_port()
+    send_size = random_max or buffer_size
+
+    server_parts = [f"{cfg.bin_remote} server -p {port} -c {cipher}",
+                    f"-v {tls_version}", f"-{ipver}"]
+    if send_size:
+        server_parts.append(f"-b {send_size}")
+    if record_type:
+        server_parts.append(f"-t {record_type}")
+    server_cmd = " ".join(server_parts)
+
+    client_parts = [f"{cfg.bin_local} client -s {cfg.remote_addr_v[ipver]}",
+                    f"-p {port} -c {cipher} -v {tls_version} -{ipver}"]
+    if random_max:
+        client_parts.append(f"-r {random_max}")
+    elif buffer_size:
+        client_parts.append(f"-b {buffer_size}")
+    if record_type:
+        client_parts.append(f"-t {record_type}")
+    client_cmd = " ".join(client_parts)
+
+    stats_before_local = read_tls_stats()
+    stats_before_remote = read_tls_stats(host=cfg.remote)
+    nic_before = read_nic_stats(cfg)
+
+    # Both helpers run with their stdout captured in a pipe that is only
+    # drained once they exit, so the helper keeps its per-connection output
+    # small (see the note on verbose in tls_hw_offload.c); do not pass -V.
+    #
+    # On the failure path make sure nothing outlives the variant: a leaked
+    # helper keeps bumping the per-netns TLS counters (TlsDecryptError, ...)
+    # and would corrupt the before/after measurement
+    # window of a later variant. The local client is a direct child; the
+    # server on the peer needs kill_remote_helper().
+    server = None
+    client = None
+    try:
+        server = bkg(server_cmd, host=cfg.remote, exit_wait=True)
+        with server:
+            wait_port_listen(port, host=cfg.remote)
+            # Start the client in the background so we keep a handle to it.
+            # A foreground cmd() raises TimeoutExpired from inside its
+            # constructor if the client hangs, and since the child is not
+            # killed on timeout it would be left running with no handle to
+            # reap it.
+            client = cmd(client_cmd, background=True)
+            try:
+                client.process(terminate=False, fail=True, timeout=20)
+            finally:
+                if client.proc.poll() is None:
+                    stop_helper(client)
+    except BaseException:
+        # bkg.__exit__ reaps the server with a plain 20 s communicate()
+        # (SIGTERM first only on an exception). A server that hangs or
+        # ignores SIGTERM makes it raise TimeoutExpired with the process
+        # still alive; escalate to SIGKILL as for the client.
+        cfg.cleanup_failed = True
+        try:
+            try:
+                if client is not None and client.proc.poll() is None:
+                    stop_helper(client)
+            finally:
+                if server is not None and server.proc.poll() is None:
+                    stop_helper(server)
+        finally:
+            kill_remote_helper(cfg, server_cmd)
+        cfg.cleanup_failed = False
+        raise
+
+    cfg.wait_hw_stats_settle()
+    stats_after_local = read_tls_stats()
+    stats_after_remote = read_tls_stats(host=cfg.remote)
+    nic_after = read_nic_stats(cfg)
+
+    verify_tls_counters(stats_before_local, stats_after_local, is_dut=True,
+                        hw_directions=hw_directions)
+    check_hw_crypto(cfg, nic_before, nic_after, hw_directions)
+    verify_tls_counters(stats_before_remote, stats_after_remote, is_dut=False)
+
+
+# Drivers whose tls_dev_add() accepts only AES-GCM-128: nfp
+# (nfp_net_cipher_supported()), cxgb4 (chcr_ktls), funeth.
+GCM128_ONLY_DRIVERS = {"nfp", "nfp_netvf", "cxgb4", "funeth"}
+
+
+# The cipher/version matrix runs over IPv4; the socket setup is the only
+# IP-version-specific code path, so a single representative variant over
+# IPv6 is enough to cover it (it skips cleanly without v6 connectivity).
+# The suites below likewise stay on IPv4 to bound runtime.
+@ksft_variants([
+    KsftNamedVariant("tls12_aes128", "128", "1.2", "4"),
+    KsftNamedVariant("tls12_aes256", "256", "1.2", "4"),
+    KsftNamedVariant("tls12_aes128_ip6", "128", "1.2", "6"),
+])
+def test_tls_offload(cfg, cipher, tls_version, ipver):
+    """Cipher/version matrix over the HW offload data path."""
+    # The tls-hw-{tx,rx}-offload feature bits do not advertise cipher
+    # support, and there is no uAPI to query it. Skip AES-GCM-256 on drivers
+    # whose tls_dev_add() accepts only AES-GCM-128; keep the HW assertions
+    # for every other driver/cipher pair.
+    if tls_version == "1.2" and cipher == "256":
+        info = cmd(f"ethtool -i {cfg.ifname}", fail=False).stdout
+        for line in info.splitlines():
+            name, _, value = line.partition(':')
+            driver = value.strip()
+            if name.strip() == 'driver' and driver in GCM128_ONLY_DRIVERS:
+                raise KsftSkipEx(f"{driver} TLS offload supports only AES-GCM-128")
+
+    run_tls_test(cfg, cipher=cipher, tls_version=tls_version, ipver=ipver)
+
+
+@ksft_variants([
+    KsftNamedVariant("small_buf", 512),
+    KsftNamedVariant("large_buf", 2097152),
+    KsftNamedVariant("random_buf", None, 8192),
+])
+def test_tls_offload_sizes(cfg, buffer_size=None, random_max=None):
+    """Echo-mode TLS 1.2 across a range of buffer sizes."""
+    run_tls_test(cfg, cipher="128", tls_version="1.2",
+                 buffer_size=buffer_size, random_max=random_max)
+
+
+@ksft_variants([
+    KsftNamedVariant("handshake", 22),
+    KsftNamedVariant("alert", 21),
+])
+def test_tls_offload_record_type(cfg, record_type):
+    """RX setup must preserve the HW TX hook which flushes an open record."""
+    run_tls_test(cfg, record_type=record_type)
+
+
+def main() -> None:
+    """Set up the DUT/peer environment and run the offload test suites."""
+    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
+        cfg.bin_local = cfg.test_dir / "tls_hw_offload"
+        if not cfg.bin_local.exists():
+            raise KsftSkipEx(f"tls_hw_offload binary not found at {cfg.bin_local}")
+        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
+        check_tls_support(cfg)
+        cfg.cleanup_failed = False
+
+        ksft_run([test_tls_offload, test_tls_offload_sizes,
+                  test_tls_offload_record_type], args=(cfg, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.50.1

