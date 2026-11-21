Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257289;
	b=ib5mMmkqtrhTtwRxBZrZHGedUjE7q04RCLWxAf4wvA6AK9NMnTEgZ7DIIbPNOVMT8QWw
	 zcBif7bIBCQ/Gbb/FYis6n90TrxRxc25hooGbQjmDp6hWdghRxhe1SotfGs5dLtLGzhgC
	 wWSPHzHQgtHoaHKIbQGKlpdNQnHHN2BICnQi3NAyY7Ryqgt8HrocZAHSCJEmu1MBuEK7Z
	 9s9g9hLYjyBFYwaTtm48U8oLOQbp4/JTnaveEJjjcEqTg72XNUMcOY+ovho79XoHgBO0n
	 8dw3dwFMnu985PeM8ak296wPrJ93aY1/QWOILaxFp/2Zw76NqDWZDuUJmJMhY4TT8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257289;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LPFZQcCTi6LQtpkv23wJyXGegy4F2oEOqrAD0zlfT+0=;
	b=MLHd/ppV/nzwLeAsVnCW9BuVEHgdrSJAyG+6U5HZtEMvVPDyA3fsYWYfrxOUnwgSS/wM
	 scqHspHGAxg6VMST4LwA2JENitMYL2sk9E7N0FMUDTud4XObJHcTVbUMK64GuhW/9Wodr
	 IIbXZtAMdmvvwh4uOhlxJGbk6lCBn19SfwOuKBVIDtmRQBrYb4lCVSp7ZKxoICMJBYjKY
	 2ojZYoSydL0NRMZJD2RqPgnW5TUjoJ1y15dGch7Y9EjfAB6sfUGKGNTf4yM6JD22qeHVR
	 WgqFdyJRfvD1MGGKqJVsG5MLriNLqdHw3xWFVe6EMOCU9IZ+jPobmYCknM83drRVYdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uvB0cGD1;
	arc=none smtp.remote-ip=91.218.175.253
Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B12606A331
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B12606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uvB0cGD1
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AYqpTYvRuEBRpQb7WDgABr+Pg0aWSiLgEXSmi0Zru54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257286; v=1; x=1795862086;
 b=uvB0cGD11aEC5FaXz9KFFNJYu6neePNb2tHrna7/Z296oWSKuiIa2WE0+5gc8qtjdY1ltu1x
 1sJjJH+Imet0sXCuQ/qf4h9ofp1XCN9IWhWK2uzhAPF5hPReSwKDHr0D2jAoiQkWSI3LJotq+4D
 WxkM3sFpVNTvQFdOhJnHiw0Y=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92dc6a10f9544e2f;
	Sat, 21 Nov 2026 10:34:45 +0000
X-Mizu-Trace-ID: 92dc6a10f9544e2f
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 05/11] bpf, sockmap: Fix concurrent senders on one psock
Date: Sat, 21 Nov 2026 18:30:06 +0800
Message-ID: <20261121103222.88209-6-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcp_bpf_sendmsg() keeps the state of the current send in the psock:
the verdict in eval, the byte budget in apply_bytes, the redirect
target in sk_redir and the message being built in cork. The socket lock
does not protect that state all the way through. tcp_bpf_push() drops
it in sk_stream_wait_memory(), and the SK_REDIRECT branch of
tcp_bpf_send_verdict() drops it around tcp_bpf_sendmsg_redir(). A
second sendmsg() on the same socket then runs with the state of the
first one.

The cork is the worst case. The SK_PASS branch pushes psock->cork while
it is still attached. When the push sleeps, the second sender picks the
same cork up through psock->cork, appends to it, runs the prog on it,
and on SK_REDIRECT frees it. The first sender wakes up in
tcp_bpf_push() and writes to a freed sk_msg. The other fields are not
freed, but the second sender sends without a verdict, or with the
verdict and the budget of the first one.

Plain TCP has no state of this kind, and two senders on one stream
socket only get their bytes interleaved. There is no use for it with
sockmap either, so refuse it. Mark the psock busy for the whole
tcp_bpf_sendmsg() and return -EBUSY to a second sender.

The second sender could wait instead, but that takes a wait queue with
signal and timeout handling. Concurrent sends on one socket are rare, so
keep the fix simple.

Redirects to another socket go through tcp_bpf_push_locked() and
bpf_tcp_ingress() and do not touch the target's send state, so they are
not affected.

Fixes: 4f738adba30a ("bpf: create tcp_bpf_ulp allowing BPF to monitor socket TX/RX data")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 include/linux/skmsg.h |  1 +
 net/ipv4/tcp_bpf.c    | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/skmsg.h b/include/linux/skmsg.h
index 276692e060d53..98f71c6d0af73 100644
--- a/include/linux/skmsg.h
+++ b/include/linux/skmsg.h
@@ -69,6 +69,7 @@ enum sk_psock_state_bits {
 	SK_PSOCK_TX_ENABLED,
 	SK_PSOCK_RX_STRP_ENABLED,
 	SK_PSOCK_STRP_DONE_PENDING,
+	SK_PSOCK_TX_BUSY,
 };
 
 struct sk_psock_link {
diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index 7191b95c7b1c7..077b65927ac8d 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -602,6 +602,16 @@ static int tcp_bpf_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 	if (unlikely(!psock))
 		return tcp_sendmsg(sk, msg, size);
 
+	/*
+	 * The verdict, apply_bytes, sk_redir and the cork live in the psock
+	 * and span the places where the socket lock is dropped below. They
+	 * can only serve one sender at a time.
+	 */
+	if (test_and_set_bit(SK_PSOCK_TX_BUSY, &psock->state)) {
+		sk_psock_put(sk, psock);
+		return -EBUSY;
+	}
+
 	lock_sock(sk);
 	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
 	while (msg_data_left(msg)) {
@@ -677,6 +687,7 @@ static int tcp_bpf_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 	if (err < 0)
 		err = sk_stream_error(sk, msg->msg_flags, err);
 	release_sock(sk);
+	clear_bit(SK_PSOCK_TX_BUSY, &psock->state);
 	sk_psock_put(sk, psock);
 	return copied > 0 ? copied : err;
 }
-- 
2.43.0

