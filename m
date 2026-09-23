Received: from mail-oi2-f35.google.com (mail-oi2-f35.google.com [74.125.231.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991A33AD52F
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134958; cv=pass; b=M+Q2YEAeSweyyZvY8oBm7D2yYW0y0ySPCKtr33k9zL+HYQoNN00XeZGudb3aRE9dEQatC10lkpKHVlhPzwopwFv69TzoLxSTMVEO4Qm9UagNv4+is1HORz1MQFffLMag4ZhNer+wajH+p3Jcdy8Dmvx50zRPm0tcMnpdURdjGdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134958; c=relaxed/simple;
	bh=RRS6qEKxH+NimVpjKf06V/2sQCHRd4tVB6c5u/RsNs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5OT1U361NWRZorTYzTx9wASAfgM+zAM0chf3LLLSrHSL1ddsVEeexP8phfJfjKRmoXfpx78GzvieViYARpjqGHnRmrEtDSt4YPimzJMpghkRDf7mBTDQ+Yux4C36mE+zKuj2HMwtbpARvdrVjzmFln8kAeB1znocZtXVwIrhjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7i14aG2; arc=pass smtp.client-ip=74.125.231.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7i14aG2"
Received: by mail-oi2-f35.google.com with SMTP id 46e09a7af769-8055dcba0a5so136236a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134955; cv=none;
        d=google.com; s=arc-20260327;
        b=QVtfuv4AiuUilMSkh6m0qjkAFuaM3Ba5phAMfRKZ1kEeTK4RYUWta6vmwuyM/n0DNl
         XBlIqtU2U4Wu+R9ix7+BQHxI+QnKnqn9sCoslaIdW8oGC4cb06Sx+ZmD7khlL1werSeQ
         bcetO0iwNqpGacDdwRJ2kJttvcYTjTvFtWtcy5nJ6w6WQAz8KSB2yQvwXIrPr07mJcIs
         eZ79iJy2B6IbK2dH8jMVwGV8K3VheDtZHgDXJwiCU3BZK8hmSxlJ6eOHbv6/cyQmuoXK
         Ry8LcTvkARS5OZdK9Cw0QITh7tSQ/SmgZxqUPcP4aiprcdKAmXarE1oJvrc1lgAI8LK8
         Zv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        fh=Ib0qpy19GYrCZ4wKMj+OYtbBkM+Pe4zuBRTavpLDyXM=;
        b=B4pW9jSNjtAqEG/VFVhIhvjjGrpdL8SQgMNkhLPuxK1I4aFy15Bi4yaa+biNyVhIEv
         yB6ImZ37m4yzAyMgMyYoIm7c/zhwSTsretHQl5RRR90x11y2JTbrKNdF297JyQDLzv4M
         9N5o6K/NN/H1SXWICTbxt5zsjyYBtrXljVRJa38ycA7WiH0Vfu9qf09yr8zkHPnmHMLe
         SREX7ODDpeAN0Hxadb4RHj2vTHwZ6vdbJcy7rDRUuyL4jOJbRmdj4p3WLvot/70ioglQ
         b/juAefbJg5VrA1zhBXDGWwyqgFlsy1dfFK8Q2BCug7SKDHDHSVoxWTATlNq1MAXYgZR
         kyWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134955; x=1790739755; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        b=C7i14aG2bdgWqlopi+nQc6ZicQsDdeRNbLRI4NoCJsTi5CbKDln6oThZL7YI/ECfeX
         /2dMbXp6OVHkwj/KS4P8IFVrkdD31J3A5fplmByd/FkPwCLQxsl9bYLvk/yy1Gj9Y9qz
         HcKm8LlyC2xDeAKgLNADlIUHQ1ChrpWMN7nHrZeG63A9sctwXxekAQQ2BoI+UpvUwSiI
         k/OguCoTP+huCPmOLX0rUeZCEdgjM5UjaXifFevmz7h9qlvmPkzMI5/GkQS1wl6277AK
         MNS4Ezr0V43VHo5Hx5sqZ5B2jTVAHsk367MmZd3pt2sGUOBVo+HK2nRJtrVaL32+CCgn
         mdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134955; x=1790739755;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETl0dM96QJlv5nuHoins0eKTRLoHFkMO6xGH/oLfeCU=;
        b=y2phdHd6UrCjaY+tTRla5L4gctjjI3U72dYR4dRnS812zIrdNs9ljMsdJ4xcpEbKfP
         QxC2r6h1AVZbbe3NAcNbDkV0sMoK7uKBX8PzHinXyBt9xV2NLJGy0hCjw8ZyPFDBTncC
         ldNhwe2uy0MNNAROQt6Sba9VSF/xYtN2rkJ8PfHm8sR1E3KVidqyaEc8+xTpc0mFWtFF
         jhaEolkmXdOmo5iUWZwwUOhlpigCUrasSwmtbG6hFjBkGPFN2wgZUFieY0ccx+N0Pxwp
         gVADEfSFQTqRYyCGlPFlIJd6768LWJciU5CU8JYumcGMgMXCFR6FxBjlOrDwfBoeO9c1
         aerQ==
X-Forwarded-Encrypted: i=1; AKwUvBy05TFFYcZz8Yd9BroVSftRgDFjkpixCloWNEX+xOr6SFNJpqTAOeZVLWJGX1FoTQqK+Z9YRm1P7ecd6KSRowg=@vger.kernel.org
X-Gm-Message-State: AFuF++nU8DVKA77rJ2G9CbjPisYWHZIEmR8RnQOpFskUTp/6jk4Ji6VN
	Z6n8Rr7+KiSz9zyPBg5qjxsTvkx2jizdPTn0oJStVg5sQIUqxScg4CCFU2HNk5Oa3DgYeojvz1i
	EkZMLTiFMebEDXqT4bxO+8kFRuz8jL2Q=
X-Gm-Gg: AYBFou16LDzogmGC0N3SYq6K3phVgZVqGej468qU2EPRTGeTbbc7ItwotzXHRJNLJLE
	v47lqKuihu3ssun9zv8DcQiRWLMFW7MrC4Wn3wwE6MUulX9phubOwFJnBnl0pCME5MT7aKt+k63
	hhKvtCL1UGvkqets8FTQvH0ijL6UEwYQiAj49mAOKDKR+T+n1cg1TG0hFA/y4tawKsSJOI4ukHG
	HKtv45dl9OaYYAe0G8p0RkcG7iVVVEEFJbyoXVKdCt9hSuSgK8cc1UCImEyFonn1RNUC5fOAiO+
	p39c7buk9NiGLEuauA06jQ1G9k3HqWIG95cLtw2SPSjjMf1a+zH5h8G+QdRp3YBGLE0RS+HSCh3
	WZ7dq4H7x1DnJ+rZMGEpiWWXi6ucLSZWdrKDj7HBpKcxT
X-Received: by 2002:a05:6830:67f7:b0:7f9:555:1def with SMTP id
 46e09a7af769-815fa7a1a70mr1301644a34.11.1790134955518; Tue, 22 Sep 2026
 20:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921235951.3214-5-sigefriedhyy@gmail.com> <179012275175.2160803.16091441325063775173@kernel.org>
In-Reply-To: <179012275175.2160803.16091441325063775173@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 23 Sep 2026 12:42:21 +0900
X-Gm-Features: AclHuK8TXSgkkQWPa_o2Ozz0Yhcd3LUGBcSyKUw1APvq-PmiuvaOCRWU4_ZVJVI
Message-ID: <CA+7S2vLn07uAcPQTV21eXOsCMmG6EVOaM0NBAkRtHcmeLZf7yg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [High] dev_mc_fill_addr() (net/core/dev_addr_lists.c:1210) emits
>   IFA_MULTICAST with `nla_put(skb, IFA_MULTICAST, dev->addr_len

Existing issue, /proc/net/dev_mcast prints the same bytes. Should be
addressed separately.

> - [Medium] dump_mcaddr_l2_check()
>   (tools/testing/selftests/net/rtnetlink.py:113) issues the new

This is WAI.
