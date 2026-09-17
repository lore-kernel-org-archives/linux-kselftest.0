Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D7346E51;
	Thu, 17 Sep 2026 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615866; cv=none; b=DHhN9fppGMKziEuhUJCmSfdkOXpgCkmZj5b8Vb63/7ny3EdNRtskeeyO/yFXZtld+F3BuaQAG9jflWIxn/253HEtVdCUlBJRFb9tBAcMiPnZ/KDWp534/rSg5y/1AuwloqTR3OCOAqWjOSWsjwLXseVgrh7IeLYDJbMfdZbaGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615866; c=relaxed/simple;
	bh=k2yfaNsdQ57HUm64GE5IMJsjU2Hh/RfKNW5Sqt0WGm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B8WZQ/CwnXZqGiabcjZmWMQaRe9hPt4YSKO0qwzJJ9W8W7+ZYpin4yPUI++mBv/lbI2sQyd4k9Dlsat/w/UH5DesMsw+fnl2MGLPKlE+6YTsrmNnGJWDGFmPUtIWlBdcl2KQWErRetmb+jRd/W3GRdFxxSmsg358GBMB8Vewac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 30fb013ab24811f19a56ed5b684f684d-20260917
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c013cf14-a528-4610-b0bc-dba51c07f401,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:32aea9ae5e820e38bd7052d617c89d6c,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30fb013ab24811f19a56ed5b684f684d-20260917
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2138142269; Thu, 17 Sep 2026 11:30:55 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH net-next v2] selftests: net: fou_mcast_encap: load the fou module
Date: Thu, 17 Sep 2026 11:30:49 +0800
Message-Id: <20260917033049.792209-1-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_ipv4() creates a GRETAP tunnel with FOU encap and configures a FOU
port via "ip fou add". Both require the fou module, which cannot be
auto-loaded.

The test assumes CONFIG_NET_FOU=y, which matches the default selftests
config, but fails on kernels built with CONFIG_NET_FOU=m. Without the fou
module, tunnel creation fails and the test reports a false failure with
0/100 received packets:

  RTNETLINK answers: Invalid argument
  TEST: FOU/GRETAP IPv4 multicast encap resubmit (received 0/100)  [FAIL]

Load the fou module and skip the subtest cleanly when unavailable. This
matches the existing fou6 handling in this script and the pattern used in
pmtu.sh.

modprobe is a no-op when CONFIG_NET_FOU=y, so default selftest builds
remain unchanged.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
v2:
- Dropped Fixes tag, target net-next instead
- Dropped comment inside setup_ipv4() per review feedback
- v1: https://lore.kernel.org/all/20260911100158.854183-1-fuqingshuang@kylinos.cn/

 tools/testing/selftests/net/fou_mcast_encap.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
index 70210d39fba3..5f84d58d3075 100755
--- a/tools/testing/selftests/net/fou_mcast_encap.sh
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -51,8 +51,6 @@ setup_common() {
 }
 
 setup_ipv4() {
-	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for
-	# these tests, so no module load is needed here.
 	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
 	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
 
@@ -160,8 +158,13 @@ run_ping_test() {
 }
 
 setup_common
-setup_ipv4
-run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
+
+if modprobe -q fou; then
+	setup_ipv4
+	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
+else
+	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
+fi
 
 if setup_ipv6; then
 	run_ping_test -6 eoudp6 "$TUN6_R" "FOU/ip6gretap IPv6 multicast encap resubmit"
-- 
2.25.1

