Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07CF3148B4
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 02:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790562723; cv=none; b=UEIr+K+YM/cRp8D3b+N8xZduhKQ2Kz08y+YGE+WetfzcoXVrrQjm6l8P8sHEpHKmIBKauEDAFcLdfKweZBqe7FaxTDuyhHjRQm2AEDJti37lrLWg8iWj0NETkUQILMODFfuwuYR9ATKzimDJ4B3i/hENBQxisWVRrz4pkSCmzx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790562723; c=relaxed/simple;
	bh=DW9brMfjxEZ4LdnlejE7w4LKans6SXlOOKLWOzSQBzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiikjbAZxE/ITJ2mEJfdC3Juhr8Un3iP8P7ZU2IWQ+HuNjZ3Q28q9+yE4+rgGmPqzH6dk6NMMYS9+0/x59TmFdlhLqQRWJGc2iLTE3uZJsX5Epx6ISRXKwnAPyylGuSk6/jqmm7O17UjyI2W8WsPrmZDsluIwuqYoqb5UhvuuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=axZFeV5I; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="axZFeV5I"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DW9brMfjxEZ4LdnlejE7w4LKans6SXlOOKLWOzSQBzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790562719; v=1; x=1791167519;
 b=axZFeV5IamO0XSgeQqlAUuJbr7x1pK4QugEwW81NJdzqqtspTl0zVUTGIrbxFCiuxoL+24h1
 wr4cr3axku9eYKlJn9x25n/xpKtreiagPbAyl8ltQ+RLPcuBm4OKWywo4i2MeBE6STIA3qpJJBS
 797UVxSNEodJvcbFBp0koLWY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84bfa35f4903e19b;
	Mon, 28 Sep 2026 02:31:59 +0000
X-Mizu-Trace-ID: 84bfa35f4903e19b
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	stable+noautosel@kernel.org,
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
Subject: [PATCH net-next v2 1/2] udp: fix auto-selected port colliding with an existing SO_REUSEPORT socket
Date: Mon, 28 Sep 2026 10:31:41 +0800
Message-ID: <20260928023145.301855-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Observed with two independent servers in the same process:

  fd1 = socket(AF_INET, SOCK_DGRAM, 0);
  setsockopt(fd1, SOL_SOCKET, SO_REUSEPORT, ...);
  bind(fd1, port 0);          /* got 40000 */

  fd2 = socket(AF_INET, SOCK_DGRAM, 0);
  setsockopt(fd2, SOL_SOCKET, SO_REUSEPORT, ...);
  bind(fd2, port 0);          /* got 40000 as well */

Both sockets end up on the same port and join the same reuseport
group, so each of them takes part of the other's datagrams. The same
port sharing happens with SO_REUSEADDR, without the reuseport group.

udp_lib_lport_inuse() keeps the reuse rules when it scans for a free
port: a socket with SO_REUSEADDR set, or one with SO_REUSEPORT and
the same uid, is not a conflict, so its port is never marked in the
bitmap and the scan can hand it out again. Those rules only make
sense when the user asks for a specific port. bind(0) wants a free
port and has no way to know whose port it lands on.

TCP already does this: inet_csk_find_open_port() passes relax=false
and reuseport_ok=false, so the scan treats every port in use as a
conflict whatever options the sockets have. Commit aacd9289af8b
("tcp: bind() use stronger condition for bind_conflict") did it for
SO_REUSEADDR and commit 0643ee4fd1b7 ("inet: Fix get port to handle
zero port number with soreuseport set") for SO_REUSEPORT.

Do the same for UDP: ignore both options during a scan, keep them
for an explicit port.

This changes bind(0) for SO_REUSEADDR sockets once the port range is
full: it used to share a port and now fails with EADDRINUSE, like
TCP. Sharing a port on purpose when the range is full is a feature,
TCP has net.ipv4.ip_autobind_reuse for it, off by default. UDP can
get the same knob later, this patch only fixes the scan.

Fixes: ba418fa357a7 ("soreuseport: UDP/IPv4 implementation")
Cc: stable+noautosel@kernel.org # bind() behaviour change
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 -> v2: also fix reuseaddr suggested by Eric.
v1: https://lore.kernel.org/netdev/CANn89iKHH1s+kXqBXVKmDxmELU0fL-SwU4N8qHRUJjaNECMt_g@mail.gmail.com/
---
 net/ipv4/udp.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index b3887c42adfd..cc7f8a4e5f2a 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -139,25 +139,26 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 	kuid_t uid = sk_uid(sk);
 	struct sock *sk2;
 
+	/* With @bitmap we are scanning for a free port: every port in use
+	 * is marked, whatever reuse options the sockets have. Without it
+	 * we are checking a specific port and honour the reuse options.
+	 */
 	sk_for_each(sk2, &hslot->head) {
 		if (net_eq(sock_net(sk2), net) &&
 		    sk2 != sk &&
 		    (bitmap || udp_sk(sk2)->udp_port_hash == num) &&
-		    (!sk2->sk_reuse || !sk->sk_reuse) &&
+		    (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
 		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
 		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
 		    inet_rcv_saddr_equal(sk, sk2, true)) {
-			if (sk2->sk_reuseport && sk->sk_reuseport &&
-			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
-			    uid_eq(uid, sk_uid(sk2))) {
-				if (!bitmap)
+			if (!bitmap) {
+				if (sk2->sk_reuseport && sk->sk_reuseport &&
+				    !rcu_access_pointer(sk->sk_reuseport_cb) &&
+				    uid_eq(uid, sk_uid(sk2)))
 					return 0;
-			} else {
-				if (!bitmap)
-					return 1;
-				__set_bit(udp_sk(sk2)->udp_port_hash >> log,
-					  bitmap);
+				return 1;
 			}
+			__set_bit(udp_sk(sk2)->udp_port_hash >> log, bitmap);
 		}
 	}
 	return 0;
-- 
2.43.0

