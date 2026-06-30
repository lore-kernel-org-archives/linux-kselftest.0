Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C730544B693
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852665; cv=none; b=Qn1oaOuZIjeC5jwYhz2/4d0Hf9P95eJ9xVykgZ8C0Z8MpkaYlqkzc5tprFjaBgUYY4Cr5IhP9HQwXDm/8jIMmQG7kmqVbr9OgZxdlBA/rXEq35UtnoxvGJlgL6nGVY8oRljIp98Lnsks5p42HTeXaqSu7sAT3J+8RLmLDX+WKpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852665; c=relaxed/simple;
	bh=9eRiyZzxLrtoYjnXIPP2OfGBo8eFMn7rPbbU+dGCphY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBE9URI9yFVIi+ZOEFMsMLpGdarLlC+0ukTxtsuJY/toJpa66YEDEgCfb7w2esZ8OfNqO11vY70U56CqjN+JOLaJePlJ5/vNitfsLW1F4ved8PwKSdp1bnFVRTijkUk3Pz0vjcAaJjqA4eJUenBQ/xLD3PVtXAUdlTK98MDHR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgcD2L+h; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgcD2L+h"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37fc01a7835so2002621a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 13:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852663; x=1783457463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ksGOdAvrWVQOc/6CEjrG1hzk2bKP0wufpP0CwkmqNo=;
        b=mgcD2L+hav2B/mkWsuviNSjca04X3W6uZ4tegXWTjbNDM0efnVGiMVgbVfKlt0VwYn
         MfYiFdgqMlYhlB6gVEfCZ3yEANbdJLUfogZDlU77xuWiE22w/Y1FB1RQabJbVCUleS/W
         JZW5KlmXNKv+wObKKyBrxGHgsePDV4OKxPSoVtHmwioalq0vUNVM+0kBEefJGsw0TmAu
         iPTl+1tJ/wObMDzu+1o6wSjj2KjDZJAZIE9Xd8lDuiEZa0T7dfeMbOpYMytWMDTzaV0o
         vYfXg3leMAID8npboUqEj2oLE6e+NdvkO0aOo6FZ3xF/H3WXubm1P6EnkhwJzyzmJ6aJ
         2ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852663; x=1783457463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ksGOdAvrWVQOc/6CEjrG1hzk2bKP0wufpP0CwkmqNo=;
        b=XFgVWn6uJmb3IBBiYIvS4m6krn+0/0Zvr7j0QCiJHloEhnzVfgUZ4efKfZi2tTGAXX
         fGfpzRlLUy9nkCjobAMZBXmYTOamGU7pGddrCnND6CEdhIXyL5iELZDJhrtKitC9QB/5
         MIWmKut30mqMadweFwwKIrA4v00KlTtkzOOmb3rAxm0AEHygz8uxqzhW4/HJCCZdqHvL
         gKQhJGspefbgcF96oCeHcIqAhlUjCh7Hbrujzj6/sdrPNP1Wiz0SUAfbAOMmwhAY56s7
         zA0hJDlP6rh/I9IRjBN3Ie9gQjJXX6CX4OTW5KirkGoYvco97yEDde+Pu7q6OEhxwCJo
         p+XQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpmmfh24jOxtMEKJoJijfvvqUzq4QXy3Wx+GrkR4QrrnIJ9pvhG3Zx7dwkqfHPzWz5zG6ueWpoghuGwRmkwpMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3FJL/9RwvtjDcik+UcGazmDi+1uXWS07cY0HM7Vpemj4IEet
	lKgM3cpfjcEU0Ltd9zT4Zwf+bWbDDYF3Rwuw/s+z4gbZ3fJjTDdDBLIV
X-Gm-Gg: AfdE7cnTgmPjUp9IJKVrBrBmeO7+8W5l2AKkOXAaon02ZyatLAljxF3/38xwLr96mVy
	artNIg9cZbGPn4aYB5TVHv8fbjh+N0sncAQ0WZr4a4hh0GnxoiQ0UKFxJrrj2WsDIdKNMM9KGQr
	+SFQLnEXEVr6eP94c05NgY217WJBMm0izZ/OLWokt2fHbgmmYlL3IEcQkk3HK1+MRJgA5OHLVZP
	SwOlQ9UuX88mh5oxfKxXhShvd/c9mdW0sWAateCnTx/8JMjCPkf03C4+G+eLhPOcbtJ9sVrEFPY
	2TBpBAYLV2wwzIbMhCgWcW+HsgMYD6Z4xfIkVybqpZUOT7y3GAlr9OP18T1+ECcafRW85IyHHuA
	ygVwiTTgy2HQlqBa29kz3LUxXzuEuZSdkT7lqY769xoJVNTyxbEeCVMESneV3HUy5UlKrCJN/Yp
	i+uBi5YX/5BoHv4CsZTnrTXav32RXEyLXBxV/i1PTSTyJamjPnXrs=
X-Received: by 2002:a17:90b:224f:b0:368:83e6:ca95 with SMTP id 98e67ed59e1d1-38052388689mr4254366a91.0.1782852662945;
        Tue, 30 Jun 2026 13:51:02 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382ba1ccsm20322305ad.66.2026.06.30.13.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:51:02 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 1/2] bpf, sockmap: settle copied_seq when a stream parser is removed
Date: Tue, 30 Jun 2026 20:50:34 +0000
Message-ID: <20260630205043.184894-2-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630205043.184894-1-rhkrqnwk98@gmail.com>
References: <20260630205043.184894-1-rhkrqnwk98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcp_bpf_strp_read_sock() rolls tp->copied_seq back by the SK_PASS bytes
parked on the psock ingress_msg queue; tcp_bpf_recvmsg_parser() repays it
as those bytes are delivered. When the socket leaves the sockmap they are
purged undelivered and nothing repays the rollback, so copied_seq is left
behind sk_receive_queue and the native tcp_recvmsg() warns:

  TCP recvmsg seq # bug: copied 66913561, seq 6691356A, rcvnxt 66913572, fl 40
  WARNING: net/ipv4/tcp.c:2733 at tcp_recvmsg_locked+0x2d0/0x1270
   tcp_recvmsg+0xba/0x340
   inet_recvmsg+0x7a/0x370
   sock_recvmsg+0xef/0x110
   __sys_recvfrom+0x132/0x1e0

Settle copied_seq to the parser's consume point as the socket leaves the
sockmap so it cannot trail the receive queue.

Fixes: 36b62df5683c ("bpf: Fix wrong copied_seq calculation")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/ipv4/tcp_bpf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index cc0bd73f36b6..918f8da02c39 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -715,6 +715,15 @@ int tcp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore)
 	}
 
 	if (restore) {
+#if IS_ENABLED(CONFIG_BPF_STREAM_PARSER)
+		/*
+		 * Settle the copied_seq rollback for the now-discarded
+		 * ingress_msg data so it cannot trail the receive queue
+		 */
+		if (sk_psock_test_state(psock, SK_PSOCK_RX_STRP_ENABLED) &&
+		    before(tcp_sk(sk)->copied_seq, psock->copied_seq))
+			WRITE_ONCE(tcp_sk(sk)->copied_seq, psock->copied_seq);
+#endif
 		if (inet_csk_has_ulp(sk)) {
 			/* TLS does not have an unhash proto in SW cases,
 			 * but we need to ensure we stop using the sock_map
-- 
2.43.0

