Received: from mta1.migadu.com (out-233.mta1.migadu.com [95.215.58.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9F3955CF
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143570; cv=none; b=VqH2dePijgIekPLrsPw02Yot7xBn1dbThZDfC0Nl0zUwDzxjol9WQ/+m7sEhiU86yPiw4tbg/ikzbNN8resNWcaYb+bV2rF7dnTJnjA9xpOkKyGptHQk9P4HDyBKdmKXn2e2YITIWC3UUdvZkLaC8262zB4P7apLFHLTo1nE7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143570; c=relaxed/simple;
	bh=pilOl5e/3dVl2lca+0EWmcx6Cmwat/rqKsEwX4t7kXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMw7hbmj83KOX/WIhJm2W+TV98TIqtD+SD3Mdp7Pmna2A+mNdtmmrGo6U2FTjfJW7dTzT8srMFvpl+gMFnBxiEB9vn7GB87Pdg8sfVeK0vrj0ifMhKQtrDxfyVZPEWPLIrTO2mxI2fMOgajwjcn8uN8lMbOfGaZO+S20pFmEwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X3T4Z6HT; arc=none smtp.client-ip=95.215.58.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X3T4Z6HT"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pilOl5e/3dVl2lca+0EWmcx6Cmwat/rqKsEwX4t7kXA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790143565; v=1; x=1790748365;
 b=X3T4Z6HT0SB2PhxofBgIkrrxsOBC+IQIe7G+Xq4sdHU7ZJ32+QZ4ecGJGmNHXFgrI5NUq2i8
 9fZptL/yDgnXsJF9e5L6oNtfVWWu4g+clwlIN2Eb3B0TCzsh1wlLI2t5dAJw1rkBD+nk+yhrhGe
 56pKCeuHmM5WMH4Q0K9xdH7w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7abf9dd7185b6fe;
	Wed, 23 Sep 2026 06:06:04 +0000
X-Mizu-Trace-ID: f7abf9dd7185b6fe
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
Subject: [PATCH net 1/2] udp: fix auto-selected port colliding with an existing SO_REUSEPORT socket
Date: Wed, 23 Sep 2026 14:05:44 +0800
Message-ID: <20260923060547.118748-1-jiayuan.chen@linux.dev>
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
group, so each of them takes part of the other's datagrams. TCP does
not do this.

udp_lib_lport_inuse() keeps the reuseport rule when it scans for a
free port: a socket with the same uid and SO_REUSEPORT set is not a
conflict, so its port is never marked in the bitmap and the scan can
hand it out again. That rule only makes sense when the user asks for
a specific port.

TCP fixed the same thing in commit 0643ee4fd1b7 ("inet: Fix get port
to handle zero port number with soreuseport set"): reuseport is only
honoured for an explicit port, not during a port scan.

Do the same for UDP. Mark compatible reuseport sockets in the bitmap
during a scan and only skip them when checking a specific port. Using
bitmap to tell the two modes apart is not explicit, but
udp_lib_lport_inuse() already does that for the port match itself.

Note that this still collides when both sockets also have SO_REUSEADDR
set: udp_lib_lport_inuse() skips such a pair before it reaches the
reuseport check, so the port is never marked either. That is not a
common setup and is left as is here.

Fixes: ba418fa357a7 ("soreuseport: UDP/IPv4 implementation")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/udp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index b3887c42adfd..61cb1e3f5d93 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -147,11 +147,10 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
 		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
 		    inet_rcv_saddr_equal(sk, sk2, true)) {
-			if (sk2->sk_reuseport && sk->sk_reuseport &&
+			if (!bitmap && sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
-				if (!bitmap)
-					return 0;
+				return 0;
 			} else {
 				if (!bitmap)
 					return 1;
-- 
2.43.0

