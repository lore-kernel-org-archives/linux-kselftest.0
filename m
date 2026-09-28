Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2583446A7
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 02:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790562969; cv=none; b=hpS7Cbr3aPF85+wMYIs1hW9sj+TsHSt+TE8A9GB30lUSCkErdxFRUxOCko0C0i49IelFQyrK/Lbk1/2tcTSSogUlm6FNGQrMAJmPfL7vdL0aayR41aeo56UmubqdAEj5IqXwPq1a7sfv3xfVhxCKUslluR908TEUuhEH83insO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790562969; c=relaxed/simple;
	bh=OUtN1NPk1mRcfZkghFoTTbHusGeyv7h9M8UBOmmvCtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8b386+wck2hNq5xvyyfbyBizbs9jJSjsg+5W19CAQp1S2VpMl0beSKLaVLS22swsszKa3BHx+kPJ0Cysg+J1A1hjD3BnfptXHWUrfYESKmOFaX1eG63ZU32hXpV9uUL7EOcTQZzNmKObUTic5BCT3wWp6FTS+1zU3GLfCT+nBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ExIenBAr; arc=none smtp.client-ip=95.215.58.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ExIenBAr"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OUtN1NPk1mRcfZkghFoTTbHusGeyv7h9M8UBOmmvCtc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790562964; v=1; x=1791167764;
 b=ExIenBArV7FedfoeAA9QxeR4kIbQmTaySFLtdu8yio8xOiYmZ8QAsN71JpQ7saBgfEcZjTsR
 PAX6x7qyfBTe5JcXlM1QWboqGU5Vzivon4lPuWUSfpKyBg7+3T3GZ3/oPlzBQiSaGzujPDSklR8
 RvQm/Uc5V6uOwnK/PzOQar3M=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9cace0c6bcb29ea3;
	Mon, 28 Sep 2026 02:36:04 +0000
X-Mizu-Trace-ID: 9cace0c6bcb29ea3
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tom Herbert <therbert@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 2/2] selftests/net: check auto-selected port with reuse options
Date: Mon, 28 Sep 2026 10:31:42 +0800
Message-ID: <20260928023145.301855-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928023145.301855-1-jiayuan.chen@linux.dev>
References: <20260928023145.301855-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use IP_LOCAL_PORT_RANGE to limit a socket to 8 ports, bind 8 sockets
to port 0 and check they get 8 distinct ports and the 9th bind fails
with EADDRINUSE. Run it for the four combinations of reuse options on
the sockets:

  none                         (existing test)
  SO_REUSEPORT
  SO_REUSEADDR
  SO_REUSEADDR + SO_REUSEPORT

TCP passes all four. Before the udp fix UDP only passes the first
one: the scan hands out a port already taken by a socket with the
same reuse options, so fewer than 8 distinct ports come back and the
9th bind succeeds.

  # ./ip_local_port_range.sh

Before:

  ok 13 ip_local_port_range.ip4_udp.exhaust_8_port_range
  not ok 14 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseport
  not ok 15 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseaddr
  not ok 16 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseaddr_reuseport
  ok 49 ip_local_port_range.ip6_udp.exhaust_8_port_range
  not ok 50 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseport
  not ok 51 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseaddr
  not ok 52 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseaddr_reuseport

After:

  ok 13 ip_local_port_range.ip4_udp.exhaust_8_port_range
  ok 14 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseport
  ok 15 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseaddr
  ok 16 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseaddr_reuseport
  ok 49 ip_local_port_range.ip6_udp.exhaust_8_port_range
  ok 50 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseport
  ok 51 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseaddr
  ok 52 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseaddr_reuseport

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../selftests/net/ip_local_port_range.c       | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ip_local_port_range.c b/tools/testing/selftests/net/ip_local_port_range.c
index e6834a6cfc8f..3d32b33cba46 100644
--- a/tools/testing/selftests/net/ip_local_port_range.c
+++ b/tools/testing/selftests/net/ip_local_port_range.c
@@ -301,7 +301,27 @@ TEST_F(ip_local_port_range, single_port_range)
 	}
 }
 
-TEST_F(ip_local_port_range, exhaust_8_port_range)
+#define REUSEADDR	0x1
+#define REUSEPORT	0x2
+
+static int set_reuse_opts(int fd, unsigned int flags)
+{
+	int one = 1;
+
+	if ((flags & REUSEADDR) &&
+	    setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)))
+		return -1;
+
+	if ((flags & REUSEPORT) &&
+	    setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one)))
+		return -1;
+
+	return 0;
+}
+
+static void exhaust_8_port_range(struct __test_metadata *_metadata,
+				 const FIXTURE_VARIANT(ip_local_port_range) *variant,
+				 unsigned int flags)
 {
 	__u8 port_set = 0;
 	int i, fd, err;
@@ -313,6 +333,9 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 		fd = socket(variant->so_domain, variant->so_type, variant->so_protocol);
 		ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
+		err = set_reuse_opts(fd, flags);
+		ASSERT_TRUE(!err) TH_LOG("setsockopt(SO_REUSE*) failed");
+
 		range = pack_port_range(40000, 40007);
 		err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE, &range, sizeof(range));
 		ASSERT_TRUE(!err) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
@@ -335,6 +358,9 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 	fd = socket(variant->so_domain, variant->so_type, variant->so_protocol);
 	ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
+	err = set_reuse_opts(fd, flags);
+	ASSERT_TRUE(!err) TH_LOG("setsockopt(SO_REUSE*) failed");
+
 	range = pack_port_range(40000, 40007);
 	err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE, &range, sizeof(range));
 	ASSERT_TRUE(!err) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
@@ -352,6 +378,30 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 	}
 }
 
+TEST_F(ip_local_port_range, exhaust_8_port_range)
+{
+	exhaust_8_port_range(_metadata, variant, 0);
+}
+
+/* Auto-selected port must not land on a port already taken by another
+ * socket, whatever reuse options both of them have, so all 8 sockets
+ * must get distinct ports.
+ */
+TEST_F(ip_local_port_range, exhaust_8_port_range_reuseport)
+{
+	exhaust_8_port_range(_metadata, variant, REUSEPORT);
+}
+
+TEST_F(ip_local_port_range, exhaust_8_port_range_reuseaddr)
+{
+	exhaust_8_port_range(_metadata, variant, REUSEADDR);
+}
+
+TEST_F(ip_local_port_range, exhaust_8_port_range_reuseaddr_reuseport)
+{
+	exhaust_8_port_range(_metadata, variant, REUSEADDR | REUSEPORT);
+}
+
 TEST_F(ip_local_port_range, late_bind)
 {
 	union {
-- 
2.43.0

