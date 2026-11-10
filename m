Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291565;
	b=y9dfxdupxxTQGBXeDjJMlOYZQAYlS1yTzI3SzZ53P+WTKZVlxJ8lLeLAvgKWEMA5R9+U
	 zspYKhpWm90ycjDaLAq+5+i84dWbisTrBSgyES9YAQ54zuL7ZeD3d36pd5lXeo8M+I7i6
	 nie90Na3ttHK2H4eW2ANM5DSjGVeyLXW8M6az0MggDn+D0fdlCOY5dcxWtRDe25ulZ7ZT
	 TW5FG1PNEEAtoGWcWZbi4TjvrPRxeTy+EHr8kpjgq0E4wKPM3R3mjfwd8xdcToBGKEZRG
	 /s6BFXSVcWIUo2az0St+CiD0SU6RMJtC5D+OCruiZmEmZ39iKHHewCJ7Xb9z0z3JC+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
	b=4nfF5QzskVvDctPvWY+8NhGglzEWVFkzl1i+RPw6kD5YK9xy4FinJtOeRZ73O95V+OGd
	 T/31xrlgb72VJExw0XOsXqActWCE2Qs/rnA4XUbfZFfqRpouTdcS4LPNFso5eUGJXOwkN
	 Rj7FUIZF9RgyzJbWX3yWif/hCiG5XMylWH43H8ZTbuvPUL4lGRPacLkTKIh16ZhN53VZC
	 B+FnuDs2u0Ll4fWRwP9Wx9cgmruGgQcumaedp5Vg622hgcPlV5o9mhuTZnHqTYF5z92cn
	 xkC7jOdTo4/wUjyWaPKceVJAkIB5uJgp/hBegGgPu2yHFM8CFsLxRi5uWeIQN4ANd+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APu2H1+i;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46AD606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46AD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=APu2H1+i
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed077a15c3so17378595ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794291564; x=1794896364; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
        b=APu2H1+ik7IdrBZIaZnEAQ9+N/vfJh04TDRCzsHQ8gApRVTdpiv6gdKBgnRm7U1u1P
         rkWSVBvKS0W6rC1PT1UNWRystkglBP30yLl2qF06gAD7fRKE3+djy0NmJVpEZPl0L+gK
         VC4LMl6eLCvXzzakLrUoVPzl6rYBz/Zns59XG82izZuoGJ7Cx2YHcEBq3j6SzF9D8GmQ
         k2oHWnhoZkv19hgyxY/n3kR0kyZfMjH+ojxms28aMAK+PPXBm6U0+hvwp0dW1VME3fBQ
         EzFfGS8cLsxp72jmVmza5ieolAUgaR3Srk0Ct+CydekD1V7Ysn7nx6qc5JTTqnvoETT3
         OwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291564; x=1794896364;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmBZxzjd9nmob9hw3BrOGPAN+eHGNmyepihG+CN0s8=;
        b=zoONmM35AwFPBRO3Ww2ikQnl8SFL5O1y8/U7iO3YcsjxwaoCoVDRmIhi/8OMVgu+Oe
         nc3S5YYlhpkLe0O3rZBIhTHSiExmwVDfRlg7GRBul+7mIH2DFohW4gwZ718xDWCdBgUa
         ArHxxjUIH5D2UfMadZAGel6OVs2CJtNPrUkunv+zc7L3D81Ug/xlFJp/lCU9pZ/YExpz
         Jpn9OEzkQWcU+Edo1E/sNyJFls7fCseiFqrcuzuciwmxcermJGdVILop3SFG60Xxn94S
         MpGc+j4p4581SRmNunDI2tRk/fqtjtb6GPbA+M3VWgKaoucj5OAo25a7HJ6RZRwLqGc7
         lejQ==
X-Forwarded-Encrypted: i=1; AL+hErF0aAfuw6J7JL6Xze4Is6OFMw3Iw3IIuiRfGSjVWnbezVti0RkK0Kldubtyo5r65QSIsVPhKAbHp/yQQMzizUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z92EDFRV7Z4UGoG7idWM+q3A0r6YKxa37azAhruKgnbMfF99um1
	0hEAj2uGAY44VdTCAIeZSj2rg3Wj1AJcksKybXJf7uf0yAE/vajLVYUQL35M/ttO8YLLym9FSOT
	linlctA==
X-Received: from plbbi9.prod.google.com ([2002:a17:902:bf09:b0:2e9:dea5:138])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccc9:b0:2e9:8b88:f1ee
 with SMTP id d9443c01a7336-2edb91f89fdmr17283405ad.35.1794291563898; Mon, 09
 Nov 2026 22:19:23 -0800 (PST)
Date: Tue, 10 Nov 2026 06:19:23 +0000
In-Reply-To: <20261110-mtu-probing-series-v3-1-dedfab25d641@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com> <20261110-mtu-probing-series-v3-1-dedfab25d641@gmail.com>
Message-ID: <avK3FGrs1ca2e-BT@google.com>
Subject: Re: [PATCH net-next v3 1/4] tcp: initialize MTU probing before
 syncing MSS at connection setup
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, horms@kernel.org, ncardwell@google.com, kuba@kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, 10 Nov 2026 00:44:35 +0800, Yongjian Wang wrote:
> With tcp_mtu_probing=2, a passive connection starts at the full MSS
> rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
> call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
> With tcp_base_mss=1024, the first successful probe can therefore lower
> the MSS from 1460 to 1242. On a black hole path, the first reduction
> skips 1024 and goes straight to 512.
> 
> The issue surfaced while developing packetdrill coverage for MTU
> probing and comparing the initial send MSS on active and passive
> IPv4 connections.
> 
> Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> removed tcp_mtup_init() from the passive setup paths.
> Commit 27204aaa9dc6
> ("tcp: uniform the set up of sockets after successful connection")
> later moved MTU probing initialization into tcp_init_transfer(),
> away from tcp_sync_mss().
> 
> Initialize MTU probing immediately before the existing tcp_sync_mss()
> calls in the IPv4 and IPv6 passive setup paths and when processing
> a SYN-ACK for an active connection. Remove the late initialization
> from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
> without adding another MSS calculation to connection setup. The
> crossed-SYN path already uses this order.
> 
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
