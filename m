Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911778;
	b=jL6eBDQ8iDOKSYUkqdPpNUQvg9+835HwvBUWstvpMfkbbcAnbvjiLhetXMyKOerWGOZI
	 RYXFAGvf2INyr3pjEzXXnJl5ixDojReLYmRuB9kMApXX9dVMR/qzZJ3G1eecmUJiv9Va7
	 IvWtavll4vDhkTJMCD+vLIp142rA9F2tS4rVUaTKcp53WgowsHiCfKvwO4+raVJHL/sfU
	 TlfW0OVwpz/MxjKA2KzkWW8dU7sBL6V/CaT20PqsRBF/VDsC+e13UJ0Yck+cmPdHeAE4Y
	 wlHDlzyRmo9cUdnknLYeyFOPpmmdbI9zZ/OKWPn+7qsZtEb2jM8ytCFRZTHaC00KVvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
	b=e9aor13HtoRZ5OgwXMMobFuOSNeaDtGjU2dwfjRkzUeRkVNI9Jc/TXtta8w/l527pcAF
	 2e4kyZvSSplXPWAwSV6kJzcHjfv7lwqYVVFFrawj4nECAH1TpaSvYBjPIEIW0zJuojiGV
	 8BLXKIvkgB98RiD0UUTbJirvzlvPu89FnCgGiEwyZJar4xGyI+M7zDQZtH9g33znhPAb8
	 nyoqED1Ma2/SPFkTWNjdyXjOeRnFSS7MX8GTkrQz3+vSFsEiyoBP+ET1hF1GXSyIyr3TB
	 DRZtXlSS+ptUBwBrJzcxioL/OUWldyFJYTrQjRxFAKFtQ0OgrikjkmYXLAtyhLDIkig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11C606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 20:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E11C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxBFD7eg
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2090620b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793911777; x=1794516577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=dxBFD7egkald1diEtbXOBXzH+9cQFK2KeCaFgwFJNeVqQ39GNskIoMvqgylgnntMH9
         o6cgkIhz7VeqRWc76fFeuaZBrUrsO0KbXGQDOo8UnmsNxd5DuGBZMTkVsx2LFZXyCFih
         xLmHM8Mx07KTStSbatLB7JBcE69i+TN4sfwyGum4R7QrkX6GMQsP7QDdZp7bkXe4WTSN
         kjH+OioEJh4aowCsawhV76CFmgsNb84NAEAQfXPTtwRjk+/N+4OfpAi+RPh6ypf7I9Ji
         LwRr227XUyaN5rK5df3trhjeaIYVx8XGIDVL5DDAgaeqxIBb9EXYuq3EuqROZW7d5HLq
         L0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911777; x=1794516577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAx7/usNPVJ7CoJVtZ280YQTJvtxvHPmbZ0zROmpUTY=;
        b=Q+HYJGljDtSBfIv8KxTZvZlQ8IC1Ff98CoG/UVWogCmLl3WCnc3BvL0lM3ebOnPPM2
         En8W9Q3pWwRf21Bg7wE2h+lFg3coPaV0MjOVfCCvZ0QnQtcV/6h8WLQbD1lwLfuOxuae
         SJfObFBwjLQMHaDBZqrwhV+1A3gs6TLplgaGnzZNxzfDUpGBGN4x14pvUztNtZVvHQWs
         h3AUvqzE30DhI0w1F1QwC4hIPoGDM1OAh4C6RcmjRJfI0sXl0i1EqsUPteKa27RAmCtK
         /VMsFMZgkmeOG2tDKtffrb0SsYa/13AzIwT72PuMW6qg9Fz+xPzv3ReydfdPsoj/LLz0
         ZEOg==
X-Forwarded-Encrypted: i=1; AKwUvBwG6WfCV3O1LM//5ZedCoIrERljbcEaGvPgL/w6769BW61CSCCJ1YhfIh3I0P0M4WiNoo0siB1DGIpt5atE/7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VD6xzvtNT3ZMirR2wzgcUDpxK1T+5dBJLpmdAhpHIWDnpLfTD
	WzmCLhusVRHmV5TP9Xk+DF9F3UvSYVVoAHUnSTknIUaDnIanXwCqFP/EQp1NYby76XfL3ryLKv2
	wgP3zEw==
X-Received: from pfbkr9.prod.google.com ([2002:a05:6a00:4b49:b0:8a0:70d8:a2ef])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f95:b0:89e:89f5:18eb
 with SMTP id d2e1a72fcca58-8b37aaa87f1mr220362b3a.15.1793911776710; Thu, 05
 Nov 2026 12:49:36 -0800 (PST)
Date: Thu, 5 Nov 2026 20:49:36 +0000
In-Reply-To: <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com> <20261102-halaney-scm-creds-thread-v1-1-0b4d75dbf35f@amutable.com>
Message-ID: <auzr1F0HNh1mazaS@google.com>
Subject: Re: [PATCH net-next 1/3] selftests/net: pass socket options to the
 scm_pidfd test flows
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Andrew Halaney <andrew@amutable.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 17:12:34 -0600, Andrew Halaney wrote:
> pidfd_flow() and leader_flow() take booleans that pick between
> SO_PASSPIDFD and SO_PASSPIDFD_THREAD. Make them take a zero-terminated
> list of socket options for the receiver to enable instead, so tests for
> further SO_PASS* options can reuse the same flows rather than copying
> them just to muck with options.
> 
> Signed-off-by: Andrew Halaney <andrew@amutable.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
