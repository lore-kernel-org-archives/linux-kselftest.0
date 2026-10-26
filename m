Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979506;
	b=Iju00OuaSqXBxESzxFEvdkKCh2wAOq1eT0L4dqpzoQKpv9jfPJDu/f+E4gKwEdBLe0fZ
	 nYlaoewpT6Azdb6aoAMTeZ6EwFfWvxnLhSAjBxYL05s/RQ9KHmWGiKaPlXzLikuDyMY6f
	 M1+plvmnStKF/kpOp/yk++5CRVey1+F3ZRerXPVE3IZ2SY8tiCgkTZrY5XWimOuYuQ1lJ
	 I0aM7hXtLB+j2M1Oe9dOfJACMmZj19apK5S3HY4mjnZ4X6NhRCebo7qe30B6PW0+l5ZdR
	 eS0u/q9J6z98zjfEuzveXJLUcOKLH8N8jFgllcbTe/l0IDUgHHc+wh/iDGxnh0IrTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
	b=BANZAYvfHFAl9DdOFBreSP8SwgTGUaKkqh9QaFNXg38FrMAVbz0vcE/alhQoJRvGw407
	 tsdpDfreT6AvcfCQuluw0HMlX4DZBKlHYT40P4vKchnyEyPhaqLq9jsq88Yq/wR1grP5v
	 b/V0pDxxtIUE7O8doGTfFQZ6JOrsRzkebDGeGm3/uyfXUC/drf/wS+v408ksH4ZZVkhAA
	 3xMFi6Kw4zKZqGF5j9yWn1zBOQ6U8K2yfmrACPkxgSLFiXswBABJ8Q/L+fiNm+mRhdeEY
	 C2DVPHYFlZ7CDmUZbr5iX9qqwAQDZaoiwzx4Kh/J483tozeHeiakp5m0mN+7BYIQrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpYYbdm4;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F812606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F812606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpYYbdm4
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1268671a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979505; x=1793584305; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
        b=kpYYbdm4UIaNLa+4gA2O6vViuDhEEOp89PGqsr6EZIpTsN4tT9rOukWJvOxKhiMzeL
         GZsL88QdGFZkEGpbWgmYAFWisgtS4+VmFYBxz5F/QASaNM18840QlkwDndtICLSkDsYT
         +wm+sqLmhdtZ0wQYO/YYpFSkRwbXYA8hTeJsttvMdEb3hJ17KHaxACnHIddAhMAUVsc8
         zMiQZ/e/rOloj5PbH/wf2fzd0LKgnBXs3jpJ0hLVcoXa7yWfqzFCfpgz9PHDRvw+ZpKY
         9dQj8TE8BR25EYre0sIPa9V9z1wBOa6KnuohoN8g3q6QdscMbq/p2/JPiJeBQ9mgjIk+
         1qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979505; x=1793584305;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
        b=NTNIBo9lrYqDf0RHPvhuoPa7TQC0K2Fvhe8abFwqc1hN3Xbr46uz1sUyfa1ZOBfidE
         Yf7NevxWf143I/V31gh4HzcQ34xzjYO8GHEGml4Bb8FzcLkPz4TkbT5oEreUB4KF90E8
         eyeZmOrXuZeGGx9SfvkXzRZc6uNFHNUPvOo9A6oDzL4EHf39LK0QGPettNmr3zINJc4X
         nUuWR2771+bt4paAzkmNUos1BAX7fD4AZw1OnUg9gAqWCuZOxa3zIZJ8ANGVzQxoV8Q1
         4D5gm3s9sstv9ew7/1IE6KA8CBjn4Qd4WYu9jRrQRelUE42uWHnnku08uns+6U4XlzSY
         ACug==
X-Forwarded-Encrypted: i=1; AKwUvBzgFyphk7pTmm46wp6f7SGfZXEZdklYwFhUTA9PW3rFmjHjuKT4AvgBujGQzgkTrm7vU659stJCM/QjQr8om38=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEUhpRbOwYS8u3pLqOkUMfpnO357fmPyRI13uNjNNA8cH4U+sP
	i33Mcz4ucBM1FjCs8SDgczKUlWBzThJi3HAwbAgE35HKetEx+YD/sGe/
X-Gm-Gg: AYBFou2e4J6EKF8Fm6j21bljRyQHDxTJeZ01IObA43Ee+Pp1cl72UtiB+59Ds0gygPt
	aMFd/nSxvZLUgiekeVqwSMlZKPrKYSwn7mA1377YbS0IMHagrYJx0Ne3WxV5MYcxfAsv3K5ER7N
	Wzkvba97BZ8cAPl6TGrwemDY5T1n7vibIdRmultPTS1+1tccnSrpaWwKvV+TrN5mW5iBpA4C3pz
	sF7NwA/uVRvIs9Hy/5q4FTUIs8gu1ypD7guRK/hE9ENub37U/uQ6qBtvr+JbagagMUyDmnf7ADa
	UAbZvZDc4ZwDSXSJL3qJQKxy2rB3xdcL2Jyia/D1eWzbIhKD5N1eHPZ6h1aQ0V6oM6rAi7QBs3F
	cY24qzMhoBepz40y7MnlNQ7xx2SFNEJynNkFuXfsUSbyAZN8Au3y6HLz/wNQOUU7MwFRg5OJEOG
	8fKBccIGF0VibRh7XMi7SRwMZVqBph3g78KkS7hU15ID8rHx1YLEBJGiAQO/kEqDmIL3VdKsR27
	UEr2bwkhBWHfUmg3ru7N1OC4q/O1vyiztfqWIUWB2TPl5zl+7k0+K4WZvYbHdhm7zmTt+/lO0os
	RHH2j148E1PUXK12r4cVCz1hjJsw+PrWtDoBnaNrYp63mortCfybgJdPyJvl4Q==
X-Received: by 2002:a17:90b:17cc:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ade9b2ff58mr4868899a91.8.1792979504834;
        Sun, 25 Oct 2026 18:51:44 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm6281205a91.0.2026.10.25.18.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 18:51:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 01:51:43 +0000
Message-Id: <DMEE6SW3UE97.2DF11HBEBKYYI@gmail.com>
Cc: "Geliang Tang" <geliang@kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Stop reporting EPIPE on
 zero-length skb redirect
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <kernel@eliskeggs.com>, "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Cong Wang"
 <cong.wang@bytedance.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261025-sockmap-bare-fin-v1-1-bb8feae7c4a7@eliskeggs.com>
References: <20261025-sockmap-bare-fin-v1-0-bb8feae7c4a7@eliskeggs.com> <20261025-sockmap-bare-fin-v1-1-bb8feae7c4a7@eliskeggs.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Oct 25, 2026 at 04:41 PM Eli Skeggs via B4 Relay <devnull+kernel.eliskeggs.com@kernel.org> wrote:
> On an ingress redirect, the empty message is still queued as before, but
> the target socket no longer reports EPIPE.

That leaves the target broken.
Nothing dequeues the empty sk_msg. __sk_msg_recvmsg() sees
sge->length == 0, returns -EFAULT and leaves it at the head of ingress_msg.
tcp_bpf_recvmsg_parser() finds FIN in is_next_msg_fin(), returns 0 and
does copied_seq++ on a socket that didn't receive any FIN.
So every recv() on the target returns 0 and moves its copied_seq further
past rcv_nxt, and the data redirected from other sockets stays behind
that msg forever.

[...]

> -			if (ret <= 0) {
> +			if (ret < 0 || (!ret && len)) {

Lets skip empty skbs instead. That covers both directions.
The socket's own FIN that goes through the backlog is not queued either,
but SOCK_DONE check in tcp_bpf_recvmsg_parser() returns 0 anyway.

Something like this (compile tested only):

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index df385a5..a5003c7 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -711,7 +711,7 @@ static void sk_psock_backlog(struct work_struct *work)

 		ingress = skb_bpf_ingress(skb);
 		skb_bpf_redirect_clear(skb);
-		do {
+		while (len) {
 			ret = -EIO;
 			if (!sock_flag(psock->sk, SOCK_DEAD))
 				ret = sk_psock_handle_skb(psock, skb, off,
@@ -735,7 +735,7 @@ static void sk_psock_backlog(struct work_struct *work)
 			}
 			off += ret;
 			len -= ret;
-		} while (len);
+		}

 		/* The entire skb sent, clear state */
 		sk_psock_skb_state(psock, state, 0, 0);

pw-bot: cr
