Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636891;
	b=Cl4EJ8X8N65Ldpgs0b9bSgNprUkn+dBbgHe41EwE/yQ6J92BKxGsrniixp1iBu2OOeNJ
	 fPcudOpSuBP9tM6dmaFi7EB+50ngEG10RbGuDFF9F8yh32v057fB+xGBvpWAID+yY18E+
	 UDLd78W2lxwKDjgR2aNyZld/7sBBGcygaTGJ7Inl7PlWMTcm/3ve2OkCm6EYaGTvc8pvQ
	 XixFyPUq9U+Ltv3eP/gGFjB8NOYMSO7TADSemXQ4CF76QZYhrn2O4HajqK48s95BH9u1o
	 WfhhK0y3YGRGndi4xNo4MiOI683a16DjAhT9rehftIqGl6ztVakFYwVuTsCUD8OgEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
	b=LZOyRbFOGqIt4v0T7qT6ezA1QGqVsqPDr/aDdcOJ5mn0Jzjb3PuHb229bOQDXqMAVM8k
	 h7RlS1zOhviWdGSND2gmvKjB8weGG7VRceS9BWUAT/mFKQZPhDMOiVPQUplBX0/f233hc
	 ON+WE7+KC7dEULNmIxwm2jqvMJePnQ3HYpZ1GgiTP8xZhMxUF9hDRROveeT7Ffo/xwgX9
	 saesdmCvltcCk0R5zVOwzPUepR//wHnk2Gvig+fAa1Eu1vLaSeIX/DQDikOYlA9tYN8AH
	 nJeum6Nk8/nwCbtbSijnuFHqAXTWB9Rqxpn+CwmBP4aAqye4Ncf0r7ET8R2p7ZQzfNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD1606A330
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 06:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AD1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAXItUB6
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so2047181b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794636891; x=1795241691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=AAXItUB6nLo8Ld8relHkMakJMmcuRNIsknoR4+BEM4pSV8B6NMLHbLLbDWU9hi9tNb
         jgdzHxKTj5/DbNttUCWS/1H0D+IQKlezeFugNBvN4aDY/BrH5cd7Frj3L9D7yB0ULnfJ
         OR9HjF4GH6UYfG8ZUTCfjJwfE0Cql/Wisd9i4Ndx1F/bQqjp5kwVkKvYFV6WZ++sB7LR
         NTbv6uW33BsKh6oOwCVC9D2uSV3X851/fTC7Q0G0wly/pQF/ZlmUp+qZy9Q0qh/OpQ7C
         28IB8ztcs5lZfX3WXcO/lhJIl1bE3fnuMYrEiVXQDSWtzek+YrI2BeCzD44YzcKvERsG
         ++nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636891; x=1795241691;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcRT1KXRxMVMkbqC0U3OtsyJos+rmMAQkFnzvfRCjWY=;
        b=FYKnGRp+eC0uP1HJtdpETOy4uuzp/SM8VFA3X5fFwHpuYlnk4WYu7nP8qAEVBTPmLv
         2PDHYUHicuvOP3vKk00AckR6gBwIGWrNr2psxsluPZA62IIQ1h1sguNoIwKtLbCV1pCF
         WDqrZjN+hPIdij37SzPgvulJ3Oqs5RjXq7QGEQuNNKnC3iDozeUlM3Q6q6ccMdwFvnRD
         wl9W/u+XJMdMuECcGUlxjH7/eh/mHPVZI3jOeigSL9B2zu1hc5xw5edU/3ztvguJPofW
         Y7URoVq13MU4SnWK8TxqRXMw5y/4q9WqrF8Ap7xTIl+/eNtehYmz4IHn0l+jgP95Sl/q
         a+sw==
X-Forwarded-Encrypted: i=1; AL+hErF8oN+WQOFbevqb05QPpQHOVOJddUYebQwk/hiEBbAT0ai4NCXHyeyLxuvkLtK4Fb93UCBbm4Q6HyVDf2RMwn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CJBR8rUQcIr0hydDtlC9UewZ1lJDYQkRWSWEOt7XobCekjosX
	obdwBKzuTSVGHRJNL7R+qcSwhEOwui7iasgt3ZaJ2E3zjOTPpufpo70XzdNJIUr3FDWlZ6Dhc+C
	c8Zg9hQ==
X-Received: from pgij8.prod.google.com ([2002:a05:6a02:8408:b0:cd3:da0f:7741])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:888e:b0:3e2:7bc3:9bde
 with SMTP id adf61e73a8af0-3f7a83b8ec2mr4021901637.59.1794636890522; Fri, 13
 Nov 2026 22:14:50 -0800 (PST)
Date: Sat, 14 Nov 2026 06:14:50 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
Message-ID: <avf70FWg6nSW1zhX@google.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:56 +0800, Yongjian Wang wrote:
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=2, as an active connection does.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Somehow this series didn't reach my gmail inbox.
