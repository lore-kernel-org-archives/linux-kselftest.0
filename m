Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62C37BE7F;
	Thu,  2 Apr 2026 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163611; cv=none; b=MQClRQ/u/knwjr+8oryAegHK4dx2M1gg3LWgBCUhI1rI0Kdwh9tbHS6fAl5EAI7+DF0xeyddUJKgxct7Ax6fnj59W9xL5KOy1uJK+h8c84GNvRH2hsSVnQQbRgCDPtWl6kvwccpT8TmIxJ8UBau1aRManbjmCn6oGpPIfv5fNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163611; c=relaxed/simple;
	bh=nyXWWdLpKVrxz9WCZV7E0Iv9P2IG1bKGFpdoW/2TgLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+0RX3MSHAXzLUj21sS5X7QynDaS1wC3TMa0f2qaJhtZuwPO56wQp9jVYrbr3aa+QDSL91FZJJzvv4dvZhv9uapM5kW+N2CUrvOo5bJfvbapeWi5NnYWvc0+HNAWjDD1aMYZWUVEms8/VmRdK60kzkMIAQ4oBF5pg+XJWYitv3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVD49D7a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVD49D7a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83987C2BCB0;
	Thu,  2 Apr 2026 21:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775163611;
	bh=nyXWWdLpKVrxz9WCZV7E0Iv9P2IG1bKGFpdoW/2TgLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVD49D7aHoLp4jR4ZiHckwohtRxF1hvLREJSmxrWY7Ve3aVU7FTmV8j/mgPtxpddv
	 AlsAazqTxqowaHM1RbOhpSpIS6y+Pk85GOYzOu6ykBnyl3oRJiaSyeBtjTgkvAU4we
	 rMVxTxOGjdjIPiGqTqZ8b14lMhfg8DLAiYyng7x0l6f5HG+Bou1PezQPUMYylClVFR
	 U5soVkmSaKaZMpojoK/yNv1GLm0OKPpQmX85EOUBb1FJTf0bNfEMZdcw0A2h3ICqfP
	 eqHncaHT5JQ//ArSD3sBXSJzqZfQvvvaYaaIsdXPBJhs8oCfrg+Lvw1hGXWP0g2f0+
	 lAEcWoPhuZYlw==
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
Subject: [PATCH net-next v2 2/8] selftests: drv-net: gro: add 1 byte payload test
Date: Thu,  2 Apr 2026 13:59:54 -0700
Message-ID: <20260402210000.1512696-3-kuba@kernel.org>
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

Small IPv4 packets get padded to 60B, this may break / confuse
some buggy implementations. Add a test to coalesce a 1B payload.
Keep this separate from the lrg_sml test because I suspect some
implementations may not handle this case (treat padded frames
as ineligible for coalescing).

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/lib/gro.c      | 12 ++++++++++--
 tools/testing/selftests/drivers/net/gro.py |  4 +++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
index 4d002af4a7aa..27ccd742615a 100644
--- a/tools/testing/selftests/net/lib/gro.c
+++ b/tools/testing/selftests/net/lib/gro.c
@@ -10,8 +10,9 @@
  *  packet coalesced: it can be smaller than the rest and coalesced
  *  as long as it is in the same flow.
  *   - data_same:    same size packets coalesce
- *   - data_lrg_sml: large then small coalesces
- *   - data_sml_lrg: small then large doesn't coalesce
+ *   - data_lrg_sml:   large then small coalesces
+ *   - data_lrg_1byte: large then 1 byte coalesces (Ethernet padding)
+ *   - data_sml_lrg:   small then large doesn't coalesce
  *   - data_burst:   two bursts of two, separated by 100ms
  *
  * ack:
@@ -1296,6 +1297,9 @@ static void gro_sender(void)
 	} else if (strcmp(testname, "data_lrg_sml") == 0) {
 		send_data_pkts(txfd, &daddr, PAYLOAD_LEN, PAYLOAD_LEN / 2);
 		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
+	} else if (strcmp(testname, "data_lrg_1byte") == 0) {
+		send_data_pkts(txfd, &daddr, PAYLOAD_LEN, 1);
+		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
 	} else if (strcmp(testname, "data_sml_lrg") == 0) {
 		send_data_pkts(txfd, &daddr, PAYLOAD_LEN / 2, PAYLOAD_LEN);
 		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
@@ -1474,6 +1478,10 @@ static void gro_receiver(void)
 		printf("large data packets followed by a smaller one: ");
 		correct_payload[0] = PAYLOAD_LEN * 1.5;
 		check_recv_pkts(rxfd, correct_payload, 1);
+	} else if (strcmp(testname, "data_lrg_1byte") == 0) {
+		printf("large data packet followed by a 1 byte one: ");
+		correct_payload[0] = PAYLOAD_LEN + 1;
+		check_recv_pkts(rxfd, correct_payload, 1);
 	} else if (strcmp(testname, "data_sml_lrg") == 0) {
 		printf("small data packets followed by a larger one: ");
 		correct_payload[0] = PAYLOAD_LEN / 2;
diff --git a/tools/testing/selftests/drivers/net/gro.py b/tools/testing/selftests/drivers/net/gro.py
index 10da5d4bee9b..73436d16b40d 100755
--- a/tools/testing/selftests/drivers/net/gro.py
+++ b/tools/testing/selftests/drivers/net/gro.py
@@ -11,6 +11,7 @@ coalescing behavior.
 Test cases:
   - data_same: Same size data packets coalesce
   - data_lrg_sml: Large packet followed by smaller one coalesces
+  - data_lrg_1byte: Large packet followed by 1B one coalesces (Ethernet padding)
   - data_sml_lrg: Small packet followed by larger one doesn't coalesce
   - ack: Pure ACK packets do not coalesce
   - flags_psh: Packets with PSH flag don't coalesce
@@ -289,7 +290,8 @@ def _run_gro_bin(cfg, test_name, protocol=None, num_flows=None,
 
     # Tests that work for all protocols
     common_tests = [
-        "data_same", "data_lrg_sml", "data_sml_lrg", "data_burst",
+        "data_same", "data_lrg_sml", "data_sml_lrg", "data_lrg_1byte",
+        "data_burst",
         "ack",
         "flags_psh", "flags_syn", "flags_rst", "flags_urg", "flags_cwr",
         "tcp_csum", "tcp_seq", "tcp_ts", "tcp_opt",
-- 
2.53.0

