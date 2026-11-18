Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034161;
	b=EAsgwUe7iDNADFw3jWetY3BKV4mdpy57gA/328kpiLoS/mKVDP8Wryl2+O+MEmgooZHx
	 fwNqzcsBCU7XtcVEX4LQktErKW5P7RpeVyDRlDi1ZtAD6HxA56ZC7RHLkBC5DW9uLPQ7+
	 zPHz8U/5OcSfFtp9PxyP50DEkNxKim7XKyzbDe+eD9ghgg88t8hNeWxZEHMFPfkqY4qVR
	 /3dHEn0RnSp4KzeuFWlyl777q+kGTRoSScAbmgXug051m8T0YwxlYfH37HEU27kJzfjOd
	 xktf3rntuBl/Cv2wNptWNyG0DfqBPCjfQ8Khm3dsq+REDirhc9dOCtAsoMYINvZsYgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034161;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=aFuWMoz82HMnoLNvtMfPFgB6snl13AtaRt+tp+1eHwo=;
	b=jiRIsn8+gNULm2FL67+tCkuLse3c4WCAbxq2Pf8v8g4lLCaHmWo6Aj4XtyXzyXKKoMMX
	 xDBGQ1TL2ETy+m3nVR4zTTeNHLRyVWJ+vMIKOgrnr33BjYT+pIXUI1aSX7vsidu5aSEN4
	 WqDKe3ZSSKDdXJUNTgfh541cg9osM7dOmnllta7hS7BMvjibmukdO0WJpqqv+0scncCef
	 2vtRONidthrChvJ/bUveWerW2OJbZRBS0m2HYHhQV3UonF8g3rlsUYkBQTr6dv1NjAGX3
	 +Wp95R4mtWATQnu9z7KiAE7Yeku6Wr/YSUNvk6/CXAAsLFEINpwFz5Cev2Btzu3l4+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzyGSikA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE4606A31C;
	Wed, 18 Nov 2026 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzyGSikA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795034161;
	b=3DWq2SrwnVpZEVmKwDUEQKWeEzhYGDUgi+8u9lGDewJGuYVtCGX2myHkSvgHl1Auen+1
	 4HYclmJUFs4VGzv2QU0APQTjRTQk+BmlhOp/lpbUz+N4owsYtojXwkICEpRJkdGa3t7K7
	 lYmFAf+MKZKq3IwbYjTbnCunOxDHaT6Q5tfkW0qUBjDvmayG/jkRBW0vIRfKV8TaMTLK6
	 EHBm8CiGTDsM/GXX1ElQfOtyr2YqOyTjRKPaQGXIP2v9Q5Qb/0vkTiDSlhaqsrSS/m4ob
	 SnDjBEZS45LIqbYWtSWj3WTs1XtU5N8TCvDXW9njjjiZa8Y3xoUqFbso9tkf5/mTKRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795034161;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aFuWMoz82HMnoLNvtMfPFgB6snl13AtaRt+tp+1eHwo=;
	b=MS//hcu9lPdoUbdrCmCyvWU1XmEsiHx5eWb4EvdghNl+OUokSoR/Eh8Wm6Dch6E/25iW
	 yQf+IePR1miOKfn58lYV73efy6KZgusdQmMm97T8mqgAcSbEDn66+eQqg7oTjz/+ApbW5
	 CwXZeUm0KBnibIS47wyCsbPpxCdocKF3TWb6h5pQCmM7WXuTPdt961pYqT/M9XQLt41H2
	 3PjQOMDHJPmOlgvr0lYD9OZ1veBZe2hcSryPFI9nv4g1eK6/vVeE8RdAn2fBtIim+oq+6
	 +zpxYZXMyZYlP067OmVyEOJa3NFwK3BXh81p3tzRmlloLTTNJktZolmGaIcUQrneP4Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBAAE1F000C6;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034161;
	bh=aFuWMoz82HMnoLNvtMfPFgB6snl13AtaRt+tp+1eHwo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hzyGSikAfVyV15dngxufMbyW+JbR/3e8GkFlrRC5DH7DTUZiwBA9smVmnbxER0h/2
	 9IDzeE+/EEY+sd8xYJU0m3PM4bM4nXPRbO6SlXIUjgwrvl1eJFZE4zLg3Muq8TQY2v
	 YDTt++pTkCzh8g0wwzSSIvY3PwVRPa988QMeFdA8B1JkQy9hRaqhG31VSxLvKFDvI7
	 nss4W5AghIrHu8oq9oMkTcRkZQSefbuhGooC3Jh0PZG+U7BCSMPRPN5fRA/sToon5+
	 iCSQgtc0+VC2EkqjEDKnAflpf56+cpj1rXjCxK8LQ7UicN1q2nGutRtMFtP1MO73gh
	 RM7EalioDZi2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A1BF4AF76;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
From: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Subject: [PATCH net 0/2] tls: don't hide a queued KeyUpdate from poll()
Date: Wed, 18 Nov 2026 17:35:47 -0300
Message-Id: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ7CIBQFr9L8tT8pLGr1KsYFhVf9llACtGqa3
 l3U5cxiZqOMJMh0bjZKWCXLHCqoQ0P2bsINLK4y6VZ3Sqme11ZcfAYuPnOcvedo0gTHE95LdKa
 AtTqe9NDbEZ2j2okJo7x+jwsFFLr+ZV6GB2z51mnfPzRA006KAAAA
X-Change-ID: 20261118-v0idpwn-tls-poll-parked-keyupdate-21792b8cfe6d
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Felipe Pereira Stival <v0idpwn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795034159; l=1813;
 i=v0idpwn@gmail.com; s=20261118; h=from:subject:message-id;
 bh=DIS1qpGeSGsJAZlzQeuErG2MWJN2BgtKvOVfJIEtLu4=;
 b=oamRd5Y6T31xLNPKrToNJ8oIMDJqzpC85j6F6RcOJIa758qXllk7jhlCBwJ1yjMpdArZTga56
 gd5sFCzdTuVBR3/E6WVpdX6/dE8AH0cj8Qrj6zspgATfD7V/ToXYRQU
X-Developer-Key: i=v0idpwn@gmail.com; a=ed25519;
 pk=dy+Py1JexopmEarZT58aUO9PMt7zs+cB62CS+N7NWTw=
X-Endpoint-Received: by B4 Relay for v0idpwn@gmail.com/20261118 with
 auth_id=1562
X-Original-From: Felipe Pereira Stival <v0idpwn@gmail.com>
Reply-To: v0idpwn@gmail.com

A kTLS reader that waits for a read event before each recv() can stall
after the peer sends a TLS 1.3 KeyUpdate. I ran into this while testing
a kTLS patch for Erlang/OTP.

Erlang does one recv() per read event, with level-triggered epoll.
When application data is followed by a KeyUpdate, one recv() can
decrypt both records, return the data without an error, and leave the
KeyUpdate queued. Because a rekey is now pending, poll() no longer
reports the socket as readable. Without another read event, the reader
never calls recv() again, never sees the -EIO for the KeyUpdate, and
never provides the new key.

Patch 1 keeps the socket readable until the reader has consumed the
KeyUpdate. As before, poll() doesn't report records after the
KeyUpdate until userspace provides the new key. Patch 2 adds a
selftest, which fails without patch 1.

I worked on this with an AI coding assistant (Claude). It wrote the
first drafts of the code and the commit messages, and I reviewed and
reworked them. I directed the whole process, from tracing the missing
read event to tls_sk_poll() to checking how other kinds of readers
are affected and testing in QEMU/KVM.

Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
---
Felipe Pereira Stival (2):
      tls: don't hide a queued KeyUpdate from poll()
      selftests: tls: add a poll test for a queued KeyUpdate

 Documentation/networking/tls.rst  |  7 ++++---
 net/tls/tls_main.c                |  6 +++---
 tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 6 deletions(-)
---
base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
change-id: 20261118-v0idpwn-tls-poll-parked-keyupdate-21792b8cfe6d

Best regards,
--  
Felipe Pereira Stival <v0idpwn@gmail.com>


