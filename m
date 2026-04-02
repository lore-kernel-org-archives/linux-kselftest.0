Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27511361DB4;
	Thu,  2 Apr 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163612; cv=none; b=UihAB5m/LwBLY7ISCnsSqCN5tllzhDqyY8bF9/MRIkQcdk78jE6gDc8Cu5Ug0D1rve75bq0e6J7owro06AZhwoiqQlLjHYQq/7LS2Yp2v2jKbbjwuKmpEEV+450DfBXiH77tUBUDin/LPx5TrHsuwo/a2BbpnRQHxGFqxIZH9jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163612; c=relaxed/simple;
	bh=RbcZEbvD5VzE6rysOF8KEkV9Ce67Yl+NLmM/KUllj1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/FAHDRGrRlYSXIu+a+MFWKW3Nd9zRlhG9PkNXtrene92cE4yJTKz7sbyZ3BVAUOWZs6FDeAJR4O3xUbNnU4pzTNjiiv3BFFNspOnkEVCRtlinkwlQ0NPjAG8+vVKr6wlyrxcXgV45so4iCyLTs0x57zcoYO8a3qiCCftqI5a38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bw1Sq4tM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bw1Sq4tM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48179C2BCAF;
	Thu,  2 Apr 2026 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775163611;
	bh=RbcZEbvD5VzE6rysOF8KEkV9Ce67Yl+NLmM/KUllj1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bw1Sq4tMALkF4I9HWpe/ie/eQIqU5f3SUScTbsZT4MWUhC+siHsKR0VeWnBswbZgn
	 jlNM4PivRqIMxDn6jAbNroTq+3XKPyzCSb5j3pVIX7LzoDxR8kxEBKVJ/qIM2SWOfM
	 MFfNWfnN41O1PQrHrfsqbCSMnKuk08sFkDUMu1YAenZX+GIO/ABjIQrHz8KEmKysN2
	 hWL5ToU1YxvS1yYW3+6iPMW4pwrZZIjLkRSZOBop8x//gGS5Si18zsahSLqkvKC/Vj
	 uh2/d1XsQ10Yx9KvICtoowdpZpV1/VuDAUrk/tTmMUfquCCTrvOM3EWlAPgMzsxFdg
	 M7UHX6eGlj/pw==
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
Subject: [PATCH net-next v2 3/8] selftests: drv-net: gro: always wait for FIN in the capacity test
Date: Thu,  2 Apr 2026 13:59:55 -0700
Message-ID: <20260402210000.1512696-4-kuba@kernel.org>
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

The new capacity/order test exits as soon as it sees the expected
packet sequence. This may allow the "flushing" FIN packet to spill
over to the next test. Let's always wait for the FIN before exiting.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/lib/gro.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 27ccd742615a..f05398c18e0c 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -1154,7 +1154,7 @@ static void check_capacity_pkts(int fd)
 	memset(coalesced, 0, sizeof(coalesced));
 	memset(flow_order, -1, sizeof(flow_order));
 
-	while (total_data < num_flows * CAPACITY_PAYLOAD_LEN * 2) {
+	while (1) {
 		ip_ext_len = 0;
 		pkt_size = recv(fd, buffer, IP_MAXPACKET + ETH_HLEN + 1, 0);
 		if (pkt_size < 0)
@@ -1167,7 +1167,6 @@ static void check_capacity_pkts(int fd)
 
 		tcph = (struct tcphdr *)(buffer + tcp_offset + ip_ext_len);
 
-		/* FIN packet terminates reception */
 		if (tcph->fin)
 			break;
 
@@ -1189,7 +1188,13 @@ static void check_capacity_pkts(int fd)
 			data_len = pkt_size - total_hdr_len - ip_ext_len;
 		}
 
-		flow_order[num_pkt] = flow_id;
+		if (num_pkt < num_flows * 2) {
+			flow_order[num_pkt] = flow_id;
+		} else if (num_pkt == num_flows * 2) {
+			vlog("More packets than expected (%d)\n",
+			     num_flows * 2);
+			fail_reason = fail_reason ?: "too many packets";
+		}
 		coalesced[flow_id] = data_len;
 
 		if (data_len == CAPACITY_PAYLOAD_LEN * 2) {
-- 
2.53.0

