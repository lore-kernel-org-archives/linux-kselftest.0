Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793109845;
	b=2XMRBEyw16m+1CGClmhzZ18cOcUpO/cxXPRn92Nhx600f/Q/yGGx1IhOJyGeMXFD6iHL
	 bbtxb5DdtpkiD13xHocyxZ+EadB5OJJHG1GXuaRfQuRLBTQN05TQhfGPj3cPJnGkM9jiE
	 /n2wdx2BpEwiNCQgUkX957Z/gZgPp3fnXRGRg1Uc+b3L8uemXrSfCDlZYz1DgplauCVXm
	 odODwQysPucdZ610Sxd7/M9CzcNV2SWWqAHc16BcEEN1SrWtEBHATn0fWfc/x4og4cpp2
	 9dE+TPgncIra5dh8oZwThx/GTyjhUEBRU91K6pDWDZDNMOkPHdAPXSZHzeseqMf6FbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109845;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=COJ9uoO7MqU4KGm1MUXzqGQ7EjHssYcGVM/0aDDslQE=;
	b=sJv+EAJigUauCld5gSZK3uw//hB7kH1CFRPxtcaqxzASyFRlL3K3/6f3cDunn+w9kVy3
	 dcjopytfOPjwrAf1w1/tvME2tRk1A9ZBZ1t+GfQEJ5fHY4tTKsB4DzyRSwuWXUTR0uebO
	 USaQBfAwJGJZ0X8519OcXNH8FUbyeuveqW9gyp/3HOU//vh2UlXGYv7LqLuZ9Jt+UGl6A
	 ZIsUHXwS/DBv9WkIBUqQM2qHdiBxwWJ78hubNZ/Id6SwIQdDiUDM/9BexzCnJw1RFQOmh
	 /BdrQvdkIgdSMZDv20s9yfGXFLw8BRFk7VzgzWcyuhe+DxfT2b8fRKGC8m3fooQkhCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WNQB/lKa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E57606A323;
	Tue, 27 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WNQB/lKa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793109844;
	b=FB64uTPU6yNHLn6ieDlw+oepjOrtfPUoZs6kysQDHgj0+cDBUUTQC6qwZxRQbar04NcQ
	 iwH6cLiLu1HFed1cVqMYjJcJvWL6YMGTHbOjYl+BbjHiVWKRdRP2UUB2AIfb2uDOb6pyF
	 TSFncQJevhnKFYm/hgKXXLXN/6rXHPaEPOUHfDl0pDv3Dk0YA9gRkFSbifRhsf+mGEkS2
	 qSxnjVvLEVDNYusHR5jsRbMApbRgeDsvWG/7U4lrsw96i/PrbCG8NVPYX8hVhNP5+La42
	 6KyfmHevVqesDalSDI1OW2wMELBIosOV8Frzxq3fqt0UHafdl++ZpXch6qpTHe2jsGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793109844;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=COJ9uoO7MqU4KGm1MUXzqGQ7EjHssYcGVM/0aDDslQE=;
	b=wRVAl/67htOmp8LIHLF/34LOuwDLDExSJzl/JADq6Dhx4yYBEHjxqTco4+HTO4W+3PcE
	 wrkUjEoJzFGRdkkGAx0FbpOQri/dCJ/BaBtvyAhoQW00ovOnSyTp1GLX69bIfKcyMdbsS
	 P7O0ez0KyWr7Ushud5LoHJxS+SuZCj0WmX07F1eI3/ZZz3Xt/FltMwhuZAuiRYk5C+IE0
	 XcMeJSmWrKGiEpSpK2TXM7TKvBog9pGNIRGV4EFwRT1mbRF4BcffeP5zZt5hsm8jtkp7H
	 jXAh8RpOmrHuaT7UzU1BKPzBntKkDXGBSPYKKoNkaAitJTulAqgYwccoVp/z8ZDt+3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5D701F01829;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793109844;
	bh=COJ9uoO7MqU4KGm1MUXzqGQ7EjHssYcGVM/0aDDslQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WNQB/lKaECOqYSXayXr6ulokARJ9X5SRHPz6pV8++SJDvgM8HttYXBgnswUfr4LeT
	 VU8/kNOy+VU79pqOV37RcgQagXRXXAVX4mp6iuj+4UbYRc4OzVgoqEFFmXPkeDDTRO
	 XEzqJMvazjduFfMWV/Bdk3qyR7HH3n2VqdfjlKI1jeINR9XnUesdr139XTirpI5YxZ
	 we7O2iXe0S8wMXW/8F4FdJ1zIM3Z0qEpxvArgshpmzLGeOQmc6UffTUNZqZt0apEZt
	 4fUkCHsgs/KogCLuI7/xN1wMhEyfHzEwjSbu1gntZh1yl/ggoZtWkPZYL4hEwHfe13
	 C93WXP7/wNmBw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4BAAA450FD;
	Tue, 27 Oct 2026 14:04:03 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 15:04:01 +0100
Subject: [PATCH net v2 1/2] netlink: check sk_rcvbuf before charging the
 dump skb
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
Message-Id: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com>
References: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
In-Reply-To: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=dxWm9SYpOxRZ7FCUM9z5c49PD2TEyVD2AQsd/JcdWfE=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqwH64NYJ2yQ3ry27o2cgkP4okyx2vztxtmxd59p1dU0Z
 vMvbQ/sKGVhEONikBVTZPE5+7iHW/Hjjv8Pd1yGmcPKBDKEgYtTACaiXM7I8PPHlgPt13WfL+i4
 vz78x/3Ch64Z0eyPczjnzJab/vjjpqWMDP0RC0TP6ey5lFrdwlfE/GrOFC3u2694HWzs7F49/DL
 xAQMA
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com
Content-Transfer-Encoding: 7bit

From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>

Since commit ae8f160e7eb2 ("netlink: Fix wraparounds of
sk->sk_rmem_alloc."), netlink_dump() charges the dump skb first and
queues it only if sk_rmem_alloc is still below sk_rcvbuf. Commit
a215b5723922 ("netlink: make sure we allow at least one dump skb")
added an exception for an empty socket.

A dump that starts while something else is still charged to a socket
with a small receive buffer fails with ENOBUFS and stays running.
Every recvmsg() retries it, fails again and sets sk_err, so a reader
that peeks before reading, as libnl does, gets ENOBUFS on the read
after each peek, never consumes the message at the head of the queue
and spins forever.

I hit this with "iw dev wlan0 scan" hanging at 100% CPU on an arm64
board with a 6.6 based kernel (iw 5.19 sets SO_RCVBUF to 8KiB). A
kprobe trace showed the scan dump starting while the NEW_SCAN_RESULTS
notification iw had just read was still charged to its socket,
because iw had preempted the sender before netlink_broadcast()
returned.

Check the limit before charging, as before ae8f160e7eb2, which also
covers the empty socket. netlink_recvmsg() continues a dump only at
or below half of sk_rcvbuf, so the skb is then always queued, and a
dump goes over the limit by at most one skb. Refuse a skb that would
take sk_rmem_alloc past INT_MAX, so the wraparound stays fixed.

Reproduced on net in a KVM guest with a userspace reproducer and the
selftest in the next patch; both pass with this fix.

Fixes: ae8f160e7eb2 ("netlink: Fix wraparounds of sk->sk_rmem_alloc.")
Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 net/netlink/af_netlink.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index a904dc3bc..4129e93a9 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2318,9 +2318,13 @@ static int netlink_dump(struct sock *sk, bool lock_taken)
 	if (!skb)
 		goto errout_skb;
 
+	/* Check the limit before charging the skb: netlink_recvmsg() continues
+	 * the dump at or below half of sk_rcvbuf, and the skb must be queued
+	 * then. Keep sk_rmem_alloc at or below INT_MAX.
+	 */
 	rcvbuf = READ_ONCE(sk->sk_rcvbuf);
 	rmem = atomic_add_return(skb->truesize, &sk->sk_rmem_alloc);
-	if (rmem != skb->truesize && rmem >= rcvbuf) {
+	if (rmem - skb->truesize >= rcvbuf || rmem > INT_MAX) {
 		atomic_sub(skb->truesize, &sk->sk_rmem_alloc);
 		goto errout_skb;
 	}

-- 
2.54.0


