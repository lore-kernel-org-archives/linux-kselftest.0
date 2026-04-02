Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C503822A3;
	Thu,  2 Apr 2026 21:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163615; cv=none; b=MUFmvrzDM3+oAJtIdPn78zUKhK2HqFNt7upKD/oVe3Y4NFT9G5Abp7Ggp+pTotL2g7VLA5PUDJ5hS9wa4gDR2Nmiogd66k2NiBflL6HmxKuEZ3yhNS1Q07ByxJpyDuMdRhPX/OceLg/yclmhmh0Ou+c1MMONDaYCg9O0G5kE1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163615; c=relaxed/simple;
	bh=Kwonxd4My4phZQcP8XSzrvWSd1DdON78x4vw2iUsnro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j76F5w1S2hmaHyNslH7EV4su9hDA3mr+CkEnGyyazeA9dExmreHV+B9xvIWi3VFjZaprLQ9mxVD/7rKOjqcEvJ4mkeNlS4ejIQYTQKiO357SJzl29sph/xVohXcb4zOm1wLp5d263ow27oWxEVSy0SH5RDDAAur2GhWjPum0Htg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXUnoIRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXUnoIRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7A3C2BCB0;
	Thu,  2 Apr 2026 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775163614;
	bh=Kwonxd4My4phZQcP8XSzrvWSd1DdON78x4vw2iUsnro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mXUnoIRuY+4dEhvO/HA/TEXATH2n0edqgGwC/FyL0VjtEX0HKqtFFFiGC4eQzmGb4
	 v3iunscfN9DHCCN9AVjMPdm+eNeQrr6Yqqyk27+2KIYlfmmmyAhif9PyuDkkYFDiY/
	 qhbjIoWHX+IYEaTerHFJz2lJCVz3PQgunNCzlHKwYofAgOl/8cZNbuAewAQT2RFVfH
	 tPosr7YJvjpBgelBkj0kZwiFVh6fQAWoiOoC402EiIQj7P7wD/lHrbioqnxCT0dZtD
	 fPp3wa7kFDUuwcS6xyZI77AKULuquY0443Oyn8Qr9LcF5uvn2EeAC8Ullt83E9XaGP
	 URb0gxpKkQGeA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	petrm@nvidia.com,
	anubhavsinggh@google.com,
	richardbgobert@gmail.com,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 7/8] selftests: drv-net: gro: test ip6ip6
Date: Thu,  2 Apr 2026 13:59:59 -0700
Message-ID: <20260402210000.1512696-8-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402210000.1512696-1-kuba@kernel.org>
References: <20260402210000.1512696-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We explicitly test ipip encap. Let's add ip6ip6, too. Having
just ipip seems like favoring IPv4 which we should not do :)
Testing all combinations is left for future work, not sure
it's actually worth it.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/lib/gro.c      | 23 +++++++++++++++++-----
 tools/testing/selftests/drivers/net/gro.py |  2 +-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index dc8638d5d74d..b99c0f00b8fe 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -96,7 +96,8 @@
 #define ETH_P_NONE 0
 #define ASSUMED_MTU 4096
 #define MAX_MSS (ASSUMED_MTU - sizeof(struct iphdr) - sizeof(struct tcphdr))
-#define MAX_HDR_LEN (ETH_HLEN + sizeof(struct ipv6hdr) + sizeof(struct tcphdr))
+#define MAX_HDR_LEN \
+	(ETH_HLEN + sizeof(struct ipv6hdr) * 2 + sizeof(struct tcphdr))
 #define MAX_LARGE_PKT_CNT ((IP_MAXPACKET - (MAX_HDR_LEN - ETH_HLEN)) /	\
 			   (ASSUMED_MTU - (MAX_HDR_LEN - ETH_HLEN)))
 #define MIN_EXTHDR_SIZE 8
@@ -131,6 +132,7 @@ static int tcp_offset = -1;
 static int total_hdr_len = -1;
 static int ethhdr_proto = -1;
 static bool ipip;
+static bool ip6ip6;
 static uint64_t txtime_ns;
 static int num_flows = 4;
 static bool order_check;
@@ -1125,7 +1127,8 @@ static void check_recv_pkts(int fd, int *correct_payload,
 
 		if (iph->version == 4)
 			ip_ext_len = (iph->ihl - 5) * 4;
-		else if (ip6h->version == 6 && ip6h->nexthdr != IPPROTO_TCP)
+		else if (ip6h->version == 6 && !ip6ip6 &&
+			 ip6h->nexthdr != IPPROTO_TCP)
 			ip_ext_len = MIN_EXTHDR_SIZE;
 
 		tcph = (struct tcphdr *)(buffer + tcp_offset + ip_ext_len);
@@ -1187,7 +1190,8 @@ static void check_capacity_pkts(int fd)
 
 		if (iph->version == 4)
 			ip_ext_len = (iph->ihl - 5) * 4;
-		else if (ip6h->version == 6 && ip6h->nexthdr != IPPROTO_TCP)
+		else if (ip6h->version == 6 && !ip6ip6 &&
+			 ip6h->nexthdr != IPPROTO_TCP)
 			ip_ext_len = MIN_EXTHDR_SIZE;
 
 		tcph = (struct tcphdr *)(buffer + tcp_offset + ip_ext_len);
@@ -1700,6 +1704,7 @@ static void parse_args(int argc, char **argv)
 		{ "ipv4", no_argument, NULL, '4' },
 		{ "ipv6", no_argument, NULL, '6' },
 		{ "ipip", no_argument, NULL, 'e' },
+		{ "ip6ip6", no_argument, NULL, 'E' },
 		{ "num-flows", required_argument, NULL, 'n' },
 		{ "rx", no_argument, NULL, 'r' },
 		{ "saddr", required_argument, NULL, 's' },
@@ -1711,7 +1716,7 @@ static void parse_args(int argc, char **argv)
 	};
 	int c;
 
-	while ((c = getopt_long(argc, argv, "46d:D:ei:n:rs:S:t:ov", opts, NULL)) != -1) {
+	while ((c = getopt_long(argc, argv, "46d:D:eEi:n:rs:S:t:ov", opts, NULL)) != -1) {
 		switch (c) {
 		case '4':
 			proto = PF_INET;
@@ -1726,6 +1731,11 @@ static void parse_args(int argc, char **argv)
 			proto = PF_INET;
 			ethhdr_proto = htons(ETH_P_IP);
 			break;
+		case 'E':
+			ip6ip6 = true;
+			proto = PF_INET6;
+			ethhdr_proto = htons(ETH_P_IPV6);
+			break;
 		case 'd':
 			addr4_dst = addr6_dst = optarg;
 			break;
@@ -1770,12 +1780,15 @@ int main(int argc, char **argv)
 	if (ipip) {
 		tcp_offset = ETH_HLEN + sizeof(struct iphdr) * 2;
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
+	} else if (ip6ip6) {
+		tcp_offset = ETH_HLEN + sizeof(struct ipv6hdr) * 2;
+		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
 	} else if (proto == PF_INET) {
 		tcp_offset = ETH_HLEN + sizeof(struct iphdr);
 		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
 	} else if (proto == PF_INET6) {
 		tcp_offset = ETH_HLEN + sizeof(struct ipv6hdr);
-		total_hdr_len = MAX_HDR_LEN;
+		total_hdr_len = tcp_offset + sizeof(struct tcphdr);
 	} else {
 		error(1, 0, "Protocol family is not ipv4 or ipv6");
 	}
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 73436d16b40d..ee95144b73ac 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -313,7 +313,7 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
     ]
 
     for mode in ["sw", "hw", "lro"]:
-        for protocol in ["ipv4", "ipv6", "ipip"]:
+        for protocol in ["ipv4", "ipv6", "ipip", "ip6ip6"]:
             for test_name in common_tests:
                 yield mode, protocol, test_name
 
-- 
2.53.0

