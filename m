Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792754770;
	b=EbHMJGGH5yJ5WMRO44LRdE4KpXeU0c34n+PnaCXc1Fb/ZshFkBBbgOcYIv8fULuTltsW
	 HcendgdSlUj6gsDPPML/pGrUzvRnHgRzM5HJxWWi+/gbiufCe5v8EjqO3x/LQDQTEbVcF
	 T+V7yny4nSdmKCSdKRWeNI+6wSwkAsZBSkEkTSWFDBYw1MbC4r7RJkiUWGkxOfoOp1CPa
	 RvgzaLMU/sOno3AvDo28KYv80h2kMb14JYQqzh2rRpNsuPorFjZQFassYYMjU8bzWt4o6
	 sPeOZ43AlulJCGR11mQReC7rjDOEOUk3e3IgoMixc3b+gF/0aOtvEM+GTtxh/CCSUXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754770;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m3L8EXlPHb5J1kGsbqjDR6RwyzNa2wuhY3sau14O7rw=;
	b=CWQdHAypy+1r0Zt5Pud5mdBTiZtBfEC7kWCrw1rM4ZDqif1An4hHaK/AvcbVxRhZXnln
	 qXAaMaaCYCP+DRFJcP+CjOq8rzVJX4FrzwcuoLVRqtWqP7LnmPbmpbXZg4QYT5ayUhPxL
	 a2SZCGegTbQZ+le1QgzdO/VTKjQ4P/Edc7bZsjc9DmqJUipGiW+LSaeyR9WIDVVF/ZYNU
	 TTiC/A1mDAVAqsBvqkrvPUdDn5JMODaOM/NaYalRsd6FUpfrbYAGSeOjDK9O9G/WuxZlA
	 aIbkvJORXbyjBF3Ipc8yc+HMH2tKn36k4tk0HuLT0FB/7eGeCXkoaq5NJmeuibolhtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbVQUPG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C510606A31B;
	Fri, 23 Oct 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbVQUPG4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792754769;
	b=aY4P3DtySF6E2M3pCX4I43QNG/4KKM5xoayZk7Qh9Qvke3BFjSJNtzaYfNQGvXb0uuPf
	 tkqHqUQ6eqZX8bbYs1e9CbNZ3zl6Eq5vLSGF59fGIjn7cWwAyiKPK/wG//aakYe1GOOZm
	 IpNdV79Yhr/nGDVuInRDcPXpDrpPVY2ZMN+8LDXiRCFq6j7b8ru5JhbSouMUVj9xIWNDT
	 +ddMUhmCPqMtXoVJ8gFuURpcTS7cc663hxt030hGUcPEI9H769feACl8OmB9tABwTy35I
	 xTFxayw24fsFUCkBdIEjjVHSfa324sUt1qxlL1gq5sl5oZwXhSWJwissE6jYFAqJ6/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792754769;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m3L8EXlPHb5J1kGsbqjDR6RwyzNa2wuhY3sau14O7rw=;
	b=kbw3HNq05OI5cOxkgE3TJ1dABkzMN/n26+OtSkFEAlU9/gkbTT4yZqbU+5OpNTukRDSA
	 Ju7m/l5b/xHPpNhqtOabGlQY8hlWclfHwd7NAKKVHDbz6uytteKdVpyougLmKtrkkbFeT
	 CU9SQMDtEbCaadzsO7Xj4uKDTE7eMIM6Zh6IDgnbPM6j45iIPKwY4Vw92fnFe/gkAJ7lG
	 27jrgmHsrih68vNu/HsyObavpTyEYsaBk/XNWuyXmrySnMb0UYhBss/jkWqJ/PdSWRv8T
	 Gg0qbNV2lOvNC6R+JL+HpZKoi4VTZRZreKVvuZmdBLj39bd4is5KZCWbYj4zlNrLoTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FBBD1F01828;
	Fri, 23 Oct 2026 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792754769;
	bh=m3L8EXlPHb5J1kGsbqjDR6RwyzNa2wuhY3sau14O7rw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EbVQUPG4m9yST4lPaHDSHyXty2mo4Pfp+ovUYCxOcj1sod+mQ7RhsbHIpK7MAX3X2
	 cAZV1UFNdJctI5qFV+XKjky0/4/OW2j8ygVbbh1HdtHoZQnaifg2fGOusf6JcOHQDr
	 ZcbuIfze1kModTEnVHGQLgMXDlRdLKvMsGlQiDJpp+gWwidq1Z78wrp0hBPBvwst7n
	 fp0eRibJxmcK9MtRN3vwROi0ut/I+TKFUuksyyQ51s9WEE4+BwpqCECMd0QgQLrMd5
	 TZ/TsGfvNP6pVJ6IGzNj+GdjEMYnVsJanT66UfXwiXzKwFpHj0kmydq6MgHVgC1tVX
	 pAaHj1W6GUSlQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 92CE7444C2;
	Fri, 23 Oct 2026 11:26:08 +0000 (UTC)
From: Jhonata Poma-Hansen via B4 Relay <devnull+jhonata.poma.gmail.com@kernel.org>
Date: Fri, 23 Oct 2026 13:26:07 +0200
Subject: [PATCH net 1/2] netlink: retry a dump skb that does not fit with
 the minimum size
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
Message-Id: <20261023-netlink-dump-livelock-v1-1-478214a635d2@gmail.com>
References: <20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com>
In-Reply-To: <20261023-netlink-dump-livelock-v1-0-478214a635d2@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 Jhonata Poma-Hansen <jhonata.poma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=jhonata.poma@gmail.com; h=from:subject:message-id;
 bh=wpiSXo5U0PAbR1oO+UlU/ssinpjnck+7Z7pQkTuLTv8=;
 b=owGbwMvMwCX21S6Y7aK9oS7jabUkhqzbLv4TN7/T0dzqESTLuX5WpoopX9pVz5DKved6xaR7j
 x/ReqfdUcrCIMbFICumyOJz9nEPt+LHHf8f7rgMM4eVCWQIAxenAEyEj53hF9Pm395xN2rPsbas
 n3ZZWjZEf0/StDndDSGNKTeWfthwbSIjw8q23LKf0QdzH/J/F1dOWVp2kEHm+M/NNYr9m+aofwh
 5ywIA
X-Developer-Key: i=jhonata.poma@gmail.com; a=openpgp;
 fpr=4CCDE38C0B21F1B8FFE1B8D3F53E5306D13F312D
X-Endpoint-Received: by B4 Relay for jhonata.poma@gmail.com/default with
 auth_id=1288
X-Original-From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Reply-To: jhonata.poma@gmail.com
Content-Transfer-Encoding: 7bit

From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>

netlink_dump() sizes the skb after the largest buffer the reader passed
to recvmsg(), up to 32KiB. Since commit ae8f160e7eb2 ("netlink: Fix
wraparounds of sk->sk_rmem_alloc.") the skb is only queued if it fits
in sk_rcvbuf, or if nothing else is charged to the socket.

A reader with a small receive buffer that still has data charged to
its socket when a dump starts gets ENOBUFS, even when a minimum size
skb would fit. The dump stays marked as running and every recvmsg()
retries it, so a reader that peeks before reading, as libnl does,
never consumes the data at the head of the queue and spins forever.

"iw dev wlan0 scan" hits this: its socket has an 8KiB buffer, it joins
the nl80211 multicast groups, and it dumps the scan results as soon as
it has read the NEW_SCAN_RESULTS notification. When it preempts the
sender, the notification is still charged to its socket until
netlink_broadcast() returns, the dump fails to start and iw spins at
100% CPU.

Retry with alloc_min_size before failing the dump.

Fixes: ae8f160e7eb2 ("netlink: Fix wraparounds of sk->sk_rmem_alloc.")
Signed-off-by: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
---
 net/netlink/af_netlink.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index a904dc3bc..b750e79fe 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2318,10 +2318,21 @@ static int netlink_dump(struct sock *sk, bool lock_taken)
 	if (!skb)
 		goto errout_skb;
 
+retry:
 	rcvbuf = READ_ONCE(sk->sk_rcvbuf);
 	rmem = atomic_add_return(skb->truesize, &sk->sk_rmem_alloc);
 	if (rmem != skb->truesize && rmem >= rcvbuf) {
 		atomic_sub(skb->truesize, &sk->sk_rmem_alloc);
+		/* A skb sized after max_recvmsg_len may not fit next to data
+		 * still charged to the socket, while a minimum size one does.
+		 */
+		if (alloc_size > alloc_min_size) {
+			kfree_skb(skb);
+			alloc_size = alloc_min_size;
+			skb = alloc_skb(alloc_size, GFP_KERNEL);
+			if (skb)
+				goto retry;
+		}
 		goto errout_skb;
 	}
 

-- 
2.54.0


