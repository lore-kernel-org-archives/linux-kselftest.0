Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.136.29.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319449;
	b=PL4I3I1Ge+ObdncZKgo6cqjJVHWdLLW3UVOGsZ7J/M35+UdWQamDB3n0gfZSFAk8gfGu
	 /EhiiqxA8ri2b4aLVNLxHm93n2ubSfa0aE+wfeqSJGf2cEZ7we8awrhEPSwFTE+6s0I41
	 fsM3XVxuC8wv4Rd+HKP5k+sM8/ZlRqeA9h5rtIJkiHEeBYcIibjkmE2rl+Th8XyvBziwD
	 RTv695rH6B8y6fcpn0hHLG4IhrgwGZWIuoPblornbDK61I38k17qFpQThIY2ZMbwfjYXI
	 rFozUaGlphBAG1LDFbLrFYWrjFE7k2mbAcBqhC7c8eWGJECYs+raWoYOWyr+dSYHOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319449;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Bm-Milter-Handled:
	 X-Bm-Transport-Timestamp;
	bh=WqTwGGW5CM2uHHn8bLrnNbQteeETOrwEgNcCrwmUibQ=;
	b=bTu6eiiNNynF7bse9oZsXrw23u3XSArYATVq6vnIl0WwrGjzdAKRamPUr3zPBxBEOpH+
	 wgoG8OBpUDYkjwG2icMfMT6Nu2bRrHMZB8uUxRpwIvOBiqRMxpnOdWRrx8mAm6R1njDe5
	 UZdYyOr3zD38CE9WQTwT+YgPig6NdAM+C8pLTUtUGM5pfNvq7u/7MewYRy4JFowA+gBEJ
	 7XSsnAnHez3pCPHdMT56jCvrQ8kUphBFU4Ipib2bcMykxP6IoW+mmDE9oNZw9jeSKIQSw
	 5sIcvGI9/YaNioy9ySFNttgXsoC7TmMZXb40IxLGNTxpbuay6lFtm+2PGwSqYDO6/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=proxmox.com;
	spf=pass smtp.mailfrom=proxmox.com;
	arc=none smtp.remote-ip=94.136.29.106
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0260A3813;
	Tue, 10 Nov 2026 14:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF0260A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6631A47DFD;
	Tue, 10 Nov 2026 15:04:04 +0100 (CET)
From: Hannes Laimer <h.laimer@proxmox.com>
Date: Tue, 10 Nov 2026 15:03:55 +0100
Subject: [PATCH net-next] selftests: forwarding: vxlan_reserved: drop
 redundant in_defer_scope
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
X-B4-Tracking: v=1; b=H4sIAEok82oC/yWMQQrCMBBFr1Jm7UAbQcSriIsk/dURGSUzhkDp3
 Y26+IvH572VDEVgdBpWKqhi8tQO026gfIt6BcvcmcIYDlMf1/aIygXdq5jZYW68hAzE4z6lMVN
 XXwWLtF/2TApnRXO6/B97pzuyf6u0bR9xRKugggAAAA==
X-Change-ID: 20261026-vxlan-reserved-tests-f2ceea83bb0c
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Petr Machata <petrm@nvidia.com>, 
 Hannes Laimer <h.laimer@proxmox.com>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433; i=h.laimer@proxmox.com;
 h=from:subject:message-id; bh=Ie6/k9NfC4SJjY+4P/R64ocofwlPm/PbLi7A3cujs+M=;
 b=owGbwMvMwCU2e2Iv83RDTSPG02pJDFmfVYLm15zY/yDQ3jUr6Oe02/+e/V/QXXLqhWXtlb+hY
 fdfW37r6yhlYRDjYpAVU2S5bL//66zeqXFGpzdzwcxhZQIZwsDFKQATCfRlZFh3trhBsCqHdefy
 Yu/k185HHHruLFiUqnNYZylTbMNyQWaGv6LVxfXcrJNn/w3e6/Rtvl8Sg7TqTD+Dg99zuS7YlVa
 cYgEA
X-Developer-Key: i=h.laimer@proxmox.com; a=openpgp;
 fpr=64D04F905C35D23EBE24D079FA418E647F2175D1
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1794319442481

With commit a6e263f125cd ("selftests: net: lib: Introduce deferred
commands") tests_run() already runs every test in its own defer scope.
So the per-test in_defer_scope here does not do anything. Drop the
in_defer_scope calls and the wrappers that only exist for that.

Suggested-by: Petr Machata <petrm@nvidia.com>
Link: https://lore.kernel.org/all/875wyo6b7d.fsf@pmachata.org/
Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
---
 .../selftests/net/forwarding/vxlan_reserved.sh     | 39 +++++-----------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
index 0ce264cc57f8..a273e1fcd26c 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
@@ -273,30 +273,18 @@ __default_test_do()
 	log_test "$what: drops reported"
 }
 
-default_test_do()
+default_test()
 {
 	vxlan_device_add
 	__default_test_do 0 "Default"
 }
 
-default_test()
-{
-	in_defer_scope \
-	    default_test_do
-}
-
-plain_test_do()
+plain_test()
 {
 	vxlan_device_add reserved_bits 0xf7ffffff000000ff
 	__default_test_do 0 "reserved_bits 0xf7ffffff000000ff"
 }
 
-plain_test()
-{
-	in_defer_scope \
-	    plain_test_do
-}
-
 reserved_test()
 {
 	local bit=$1; shift
@@ -311,35 +299,30 @@ reserved_test()
 
 reserved_0_test()
 {
-	in_defer_scope \
-	    reserved_test 0
+	reserved_test 0
 }
 
 reserved_10_test()
 {
-	in_defer_scope \
-	    reserved_test 10
+	reserved_test 10
 }
 
 reserved_31_test()
 {
-	in_defer_scope \
-	    reserved_test 31
+	reserved_test 31
 }
 
 reserved_56_test()
 {
-	in_defer_scope \
-	    reserved_test 56
+	reserved_test 56
 }
 
 reserved_63_test()
 {
-	in_defer_scope \
-	    reserved_test 63
+	reserved_test 63
 }
 
-gbp_changelink_test_do()
+gbp_changelink_test()
 {
 	vxlan_device_add gbp
 	__default_test_do 25 "gbp"
@@ -347,12 +330,6 @@ gbp_changelink_test_do()
 	__default_test_do 25 "gbp after changelink"
 }
 
-gbp_changelink_test()
-{
-	in_defer_scope \
-	    gbp_changelink_test_do
-}
-
 trap cleanup EXIT
 
 setup_prepare

---
base-commit: 6db9448a443afde26231aaed7b112ed17b33f468
change-id: 20261026-vxlan-reserved-tests-f2ceea83bb0c

Best regards,
--  
Hannes Laimer <h.laimer@proxmox.com>


