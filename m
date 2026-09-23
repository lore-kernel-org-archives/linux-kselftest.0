Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFB414415
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 06:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143577; cv=none; b=M38JoQ2lu3GKT3T5IRALT6J/JiutpmBCQJ0QMfpGrgKgB14LxoEGFJcUva/MBqPTu0vsxS8mYUPsdQMriQCVL3eV9sRhB5M7n/dcq7BIkqYE8rudzDhbkWEh9bYgh6lOH/zHiGoGrV5FHflSzYiDQ61KDnaJAI+yCa9yRPt8Akw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143577; c=relaxed/simple;
	bh=XdKXz+ux0PexVX3nnKa4V0T4ew+itOjV9Q3nU5kif94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlAWeXHybcVAl0NF8AQayBbS/cbgpzS9A7BhVUlzltOGYwuhB3CwARa9AkkE9p2frJdI0nThZbBJIcduRhte2g2agdVPLuy0nu9MJ3asYZevaLY5jWof33CSdrtjcQz5p99Psjp1f5Yqfi6/D0xiJuhyXrn1AQbGrfP4rMXjc8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dycMvKCC; arc=none smtp.client-ip=95.215.58.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dycMvKCC"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XdKXz+ux0PexVX3nnKa4V0T4ew+itOjV9Q3nU5kif94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790143573; v=1; x=1790748373;
 b=dycMvKCCXJyv8hwxr04HjHxlkZTx/NpI1ZhtGQlypXK0OZYFceet0JcPfmoEK9ycl54VhM1z
 iyK3FMWKN7vP3alsVtltaJbugT0/ncPEBX8qDKObrFr2bw+XShXGkZJ1pPFCf/h/61x9f1JeiRd
 QKXQKtp5AVO/WZSzNVkXxVfk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3b5c51dddf773d3e;
	Wed, 23 Sep 2026 06:06:13 +0000
X-Mizu-Trace-ID: 3b5c51dddf773d3e
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
Subject: [PATCH net 2/2] selftests/net: check auto-selected port with SO_REUSEPORT
Date: Wed, 23 Sep 2026 14:05:45 +0800
Message-ID: <20260923060547.118748-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923060547.118748-1-jiayuan.chen@linux.dev>
References: <20260923060547.118748-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use IP_LOCAL_PORT_RANGE to limit a socket to 8 ports and bind 8
SO_REUSEPORT sockets to port 0. They must get 8 distinct ports and
the 9th bind must fail with EADDRINUSE. TCP and UDP should both
behave this way.

  # ./ip_local_port_range.sh

Before the udp fix:

  ok 5 ip_local_port_range.ip4_tcp.exhaust_8_port_range_reuseport
  not ok 12 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseport
  ok 33 ip_local_port_range.ip6_tcp.exhaust_8_port_range_reuseport
  not ok 40 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseport

After:

  ok 5 ip_local_port_range.ip4_tcp.exhaust_8_port_range_reuseport
  ok 12 ip_local_port_range.ip4_udp.exhaust_8_port_range_reuseport
  ok 33 ip_local_port_range.ip6_tcp.exhaust_8_port_range_reuseport
  ok 40 ip_local_port_range.ip6_udp.exhaust_8_port_range_reuseport

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../selftests/net/ip_local_port_range.c       | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ip_local_port_range.c b/tools/testing/selftests/net/ip_local_port_range.c
index e6834a6cfc8f..04feb702fff4 100644
--- a/tools/testing/selftests/net/ip_local_port_range.c
+++ b/tools/testing/selftests/net/ip_local_port_range.c
@@ -301,7 +301,9 @@ TEST_F(ip_local_port_range, single_port_range)
 	}
 }
 
-TEST_F(ip_local_port_range, exhaust_8_port_range)
+static void exhaust_8_port_range(struct __test_metadata *_metadata,
+				 const FIXTURE_VARIANT(ip_local_port_range) *variant,
+				 bool reuseport)
 {
 	__u8 port_set = 0;
 	int i, fd, err;
@@ -313,6 +315,11 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 		fd = socket(variant->so_domain, variant->so_type, variant->so_protocol);
 		ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
+		if (reuseport) {
+			err = setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &(int){ 1 }, sizeof(int));
+			ASSERT_TRUE(!err) TH_LOG("setsockopt(SO_REUSEPORT) failed");
+		}
+
 		range = pack_port_range(40000, 40007);
 		err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE, &range, sizeof(range));
 		ASSERT_TRUE(!err) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
@@ -335,6 +342,11 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 	fd = socket(variant->so_domain, variant->so_type, variant->so_protocol);
 	ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
+	if (reuseport) {
+		err = setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &(int){ 1 }, sizeof(int));
+		ASSERT_TRUE(!err) TH_LOG("setsockopt(SO_REUSEPORT) failed");
+	}
+
 	range = pack_port_range(40000, 40007);
 	err = setsockopt(fd, SOL_IP, IP_LOCAL_PORT_RANGE, &range, sizeof(range));
 	ASSERT_TRUE(!err) TH_LOG("setsockopt(IP_LOCAL_PORT_RANGE) failed");
@@ -352,6 +364,19 @@ TEST_F(ip_local_port_range, exhaust_8_port_range)
 	}
 }
 
+TEST_F(ip_local_port_range, exhaust_8_port_range)
+{
+	exhaust_8_port_range(_metadata, variant, false);
+}
+
+/* Auto-selected port must not land on a port already taken by a
+ * SO_REUSEPORT socket, so all 8 sockets must get distinct ports.
+ */
+TEST_F(ip_local_port_range, exhaust_8_port_range_reuseport)
+{
+	exhaust_8_port_range(_metadata, variant, true);
+}
+
 TEST_F(ip_local_port_range, late_bind)
 {
 	union {
-- 
2.43.0

