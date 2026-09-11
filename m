Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1D3F4831;
	Fri, 11 Sep 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120937; cv=none; b=K2aXZUrzIPN9mOA9YhTLkGzyXb1nHbWiYTYIRgdbRhziljjFOrhF8y3YUy+VQnGR2SDMp51ACw4fbBZTu5qO0Sl79LAr1+6TKJYDiZHFEx7JufVnRzBAizZE2YxjQjXKFU9S5jvJ5zrkNdFp5aviXFT6am4Qlj78NyIficFeWFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120937; c=relaxed/simple;
	bh=Ap6Qzh//tgwC9TM/BwK9j1bmQLM5lt5in9O/jOI+FVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p4gyW50KzRHZBtxdTG1DcQN20zz4YUw0nbGxes29IcA1iVpBkhmz7/zbqTQQJoZPqvhLRAiwzgdUa88vvvmR8UPrV4fz32C1OHWvf2SNL6yLLC0QX/qRbJIztH9PybNPjXTeh0qrm8p7PA07w7Bth2zLfvlAeV0PRG/SVzep7y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d750eb7eadc711f19a56ed5b684f684d-20260911
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:819c808a-b307-4357-8807-6cad48e8e97a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f324815990e8e8d85fd95d500e816260,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d750eb7eadc711f19a56ed5b684f684d-20260911
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1742510889; Fri, 11 Sep 2026 18:02:04 +0800
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
Subject: [PATCH] selftests: net: fou_mcast_encap: conditionally load fou module and skip IPv4 case
Date: Fri, 11 Sep 2026 18:01:58 +0800
Message-Id: <20260911100158.854183-1-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPv4 FOU/GRETAP multicast test requires the fou module to register
tunnel encapsulation operations and the FOU generic netlink family.
Since there is no genetlink module alias, the module cannot be auto-loaded.

The test previously assumed CONFIG_NET_FOU=y. On kernels built with
CONFIG_NET_FOU=m, setup_ipv4() fails silently without terminating the
script, causing a false positive test failure with 0/100 received packets.

Fix this by trying to load the fou module before the IPv4 test. Skip the
subtest cleanly if the module is unavailable, mirroring the existing
IPv6 fou6 module handling and following pmtu.sh conventions.

Only module load failures result in a skip. Any other setup errors still
report a test failure, preserving test coverage.

The official selftest config enables CONFIG_NET_FOU=y, but many
distribution kernels build it as a module. modprobe is a no-op for
built-in configurations, so existing CI behavior remains unchanged.

Fixes: e5382133c51c ("selftests: net: add FOU multicast encapsulation resubmit test")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/fou_mcast_encap.sh | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
index 70210d39fba3..d94c19237daf 100755
--- a/tools/testing/selftests/net/fou_mcast_encap.sh
+++ b/tools/testing/selftests/net/fou_mcast_encap.sh
@@ -51,8 +51,6 @@ setup_common() {
 }
 
 setup_ipv4() {
-	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for
-	# these tests, so no module load is needed here.
 	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
 	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
 
@@ -160,8 +158,17 @@ run_ping_test() {
 }
 
 setup_common
-setup_ipv4
-run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
+
+# The fou module registers both the tunnel encap ops used by "encap fou"
+# and the FOU genetlink family used by "ip fou add", and neither of them
+# is auto-loaded. modprobe succeeds as a no-op when CONFIG_NET_FOU=y.
+# Keep any other setup error as a test failure rather than a skip.
+if modprobe -q fou; then
+	setup_ipv4
+	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
+else
+	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
+fi
 
 if setup_ipv6; then
 	run_ping_test -6 eoudp6 "$TUN6_R" "FOU/ip6gretap IPv6 multicast encap resubmit"

base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
-- 
2.25.1

