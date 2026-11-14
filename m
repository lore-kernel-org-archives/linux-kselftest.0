Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637353;
	b=E1k4lqgD+BbGcON/P87/t2Kswi0nNZCvHsbnoSdI3ZxqNtqSZoUY7Kr/vVW3k1X9/gvM
	 RZ6U3n4Df1EY70mT6Kr5Ttcd0oA4knwmkzRBKjXWRGSa0PWsKbeyUtOWlHpqjIixlTZP+
	 divym1iQA8FpeJuV2eZd/FlETqeFSX3bAHrGL12cGNhJBSdNHDQeV5VwgTOrh5NYPw1Ix
	 KvldHbSsqedpzz5eM5ZPXCgTKtZDwabP9CJKFfm1Uh6FiLx3Fgh4r3dJJCRPtxeL+UbQC
	 DQFrYzwzf3+ypmXFUnDIHn0+zGpZdqVzQPW2deiNedGzuT3wWXis9qz15iz46/2yKvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
	b=IvfKb2FK2mLI3ERw1L5gNIKM2T8gSWixNsNWzjS4FSr2J0TZPnlR6zlBGvjSPhWepaEX
	 1ngxNEjGjNijpohvDI8/+hoJ1LD0yylKTRt9YxYf1vHlvsMOEVRnzxljOvSh3RvJbbEDA
	 AAvVSRU7j2P17E6Q1qSj14I+Y4E+mwPFVoXpoif2Ny5v6OGDTn26/x2briu4tZedyx7SB
	 TU6ZB0KlZwrlFR+AJu6bIlNQDQLfIAWBXjoeDVGdMswkyDWDdxqxwyq4v//ccU511smdE
	 aeX9qRNaRwA5Yp5YwhYh6M4AT2MxPTj2SE5fz2KCUxHOdkDkzmnuAD38FcsTD9X+jRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMJFUWim;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BD606A329
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 06:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9BD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mMJFUWim
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b97460a133so1177630b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637352; x=1795242152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
        b=mMJFUWimdqfkp4EJbS3j07OIyHMSPjcmBn5T4H4u3G6CfdkQg7do7nYlqgilY03S2H
         /SI4eTidz6FAlIz/hn+/Ox/47OjRrNQSbDNszCmAN+0tzFR3IJNH5F6eEecioZAenTkP
         OjqMuD36Dz6M/OXCNTijKKaB1UmkUGXV/Bca9LZDgVvDo8aNGDQcq7kbg0i9Y49XkedY
         CVH37XGJTStX9gk6abeZtqcwNBsD7tNWOZXzlfIBnguxddWQURDpljblDA/Q6ln4ZcR3
         5Ln4LMRrffERmhiBN4+jMQ6qiYRW2pl52L/NLOwu4LppLLygxYLDcYJ0J9hXDd3dZTZk
         PoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637352; x=1795242152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyLpXKnKTIyQF0OFuEovgw/bxqguxRHqnAp90g8bfao=;
        b=rrim6QwqlUAnrDGwQ8NC5oHDOihFta9TGnDIba3E5avfUD5Zo+xKDq83A20sYSJGDK
         bYfQIA+Bq5KkJ3a3X2bPVHTZDX/1XUnQeMqLFknqBjjrpjgFB8AXKiiKPtvcCior+NHS
         arO9UMCOhOCJfJ7GEJ5qgf+fj97R4AMEDfFo4BOB24dh6Mppb4jyExsWUo9/19rh6ZCf
         KJ3ni/UOBSIp+HpLf0lNtl2tJZoWBw1dBnY2zanfiAoMLi24609iCMD5wUWhh//GrtFJ
         zY+79h08/HewVCDqM3Vu/J1Fe5+1bi2DawTvAL98cZXRUesI01hckA47Jn88q23jat9y
         bloQ==
X-Forwarded-Encrypted: i=1; AL+hErHGfD0g42xGWqQ0jscsAZdU+gy9kw/3x36GxmtgyGbMDvsfgsc/UB09XIO04ewudbkmrNryXfXUR10l78+ufl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ec+vumXzhctLNhNfZKaCWUKbW+q3Voeiw2Ah6dkTE+LyQtF6Y
	tnw38SUVtcPcAhqktVbJoFDZc6VYM6gkWu8k1ezwL6GrgmFEpFWVYlmXKtWjKV4zrr34p0PtREz
	wJoD9zw==
X-Received: from pffj8-n1.prod.google.com ([2002:a05:6a00:c2c8:10b0:8b6:c93c:12fa])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a8:b0:88d:3f61:20f3
 with SMTP id d2e1a72fcca58-8beb80023bbmr4277418b3a.54.1794637351416; Fri, 13
 Nov 2026 22:22:31 -0800 (PST)
Date: Sat, 14 Nov 2026 06:22:30 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
Message-ID: <avf-GWBmzjHr5agk@google.com>
Subject: Re: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:58 +0800, Yongjian Wang wrote:
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=2) has
> no selftest coverage.
> 
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
> 
> The SYN offers timestamps and the scripted SYN-ACK declines them.
> This also checks that MTU probing uses the negotiated header length
> for the initial send MSS.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks
