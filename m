Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33002E7366
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639177; cv=pass; b=AisrttngSN5QJFuKqzQ1MTruOrLIJ+lEOL5QORIoSdlgX8muspKvXDkcI898AuVZ+HMOvmbOrgHbjM/ZH5wCBHBTEZAP5kQULWCvtEaB0t3HNYO24/qT5zs+sxnBwbFDJgzjPBn6fsFo9LMM76Rkc3+T/fo6lroOUNM6MhlB+ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639177; c=relaxed/simple;
	bh=mtsamemj69B3iRndW+JReJ4MdazWwyBzoeeClqSsfHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4G6bzSIKm5Z9JghcvkJI0s4Dym7fy7oGlK8jDgYUygl0AeXbNBKacBj+m6EcPPx5YYRTowuCCiiWypKjlvAMaJty54vaBO0VNkdLTbjw11ua4DrbCBteX+16yfvalkrYPTHZqox0PDf3ghIFe/B0MtrzUzfB/bxpPI4LHp2+tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th08GXw0; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th08GXw0"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a9ad623098so5940991fa.1
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791639174; cv=none;
        d=google.com; s=arc-20260327;
        b=G7+FUYW0c6dTgz5hzsLyGafE8YrvN5VEPY4jIYuUO7aORdkl8wKGyiFnx02is6Mye+
         P0VVPXIBaJoAPldrPWpCTcuYwu7p6qWL9bswv2ub/XvfGKz4JvFIp8U6RlFzv50iMxXV
         9Gr/Se0yt2TE+ZhyAXp+FyseW0Wa5U0LbVX1dWhnTly5Qt8cl1rH5npBU6MPXB9fipFY
         227gSAPnw0M10v4faZEQrz4XX13t8A4OdTGlPuNcJ17fR16mYdrZL672yXQm8Orpa51h
         YRD4fHhkrGiLoQSoIJ8oTHOzw0Mqeb+f2kkWGY4Qy7pq6NdChAbx/5fpmS4LuJzeK9Lg
         +G9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        fh=oU28ngzyxWBcMCoccAY1W/zGr8HAIURlLo9SIQmB1wc=;
        b=oAm7IKoEScqoeVWekE5y32dp3JrPf3DNZ9itL4V5vUGtwKdNS06jacx7bPqF2auz6h
         p4/6OCitIxPawOXXePiZOjLPoYsouKIzQcHLI3YByC25OG2CduJkGDn8G/ejFrtCZYPv
         7DCjW3CSUp0enK+h8jdoSfcbJEaM24rMw99hwklTkShcaZy8Posik4ahMMBK2eJOjOqN
         ZNtKBEinhEbkYsmNnQB22g2SH7iXt9dJBVZPTKoh5HvDyuTozLf/ZVg2spbRxFXE1vDm
         knObA2hr5B1OIAPVZ03BXM8m4/BkTqXBaRf+EmmbOC+nhFPiPNuWTKOSVSmbQmKI4N+r
         IyhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791639174; x=1792243974; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        b=Th08GXw04g5oyZOZrcolN6lkThyeSPl0uFs26ILwRvrekmRRyU/ak6jLJM+6GPYtVy
         wjg5O0m+/GNnWrRGiPlZYAUiw15NdoT5TwXam9XdcOhy/rQNY/29Tqr7AtUtnZJoVp+U
         Ml6ezJ1q2rFvqi8kWNoiYmDTpJF+M/esoF+IaT+vimu9y8wu+kayoSOJ55OkDQSei1W7
         WUDnx2hR/Zs1EulcVkkhMUt/ExN/VC3PJpXCZ37leVxP5vbP4ssU6AsKvKWIUablkjCf
         3EwdwDIwaLNqQ+9gOH1cA0n13/pW55YRnhaaPylYTl3dTZ/0gTzMMBStVWX58ZZ+3yIX
         2OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639174; x=1792243974;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pYVu/5x8kOjkfB1OLFe4Wb0FAXv3rimBPK2ZUX360S0=;
        b=MZqca813Wsj0LKJ0SerpXHHCjphgPKbrrcbphO7K1X/z8dUDE3TFlCla7LYifkLqzd
         Lhzdu2ADEBCPwmXDmFIminxDZK7IsTUP49QdbDe7tzDSUjqc6tVXKv1TiIHBVb19LL5n
         Cs5XWWd/sGHQR7FID7n9v2/ztFAX549Q9Wh7R52zhammJmXe5RgwMB3bnsEteg++th1p
         da/wIvaRjc5zUdBhKP+gAjB8Ake4hKdj7hiqM+KSJw7jIDCzDMWFEDy1qQuQ4qe0wAUk
         3ckMW7TADgWzzlJlPQ+ohf6q5lAueYZuZEpYt5YefXTqz3ojI4kD7Sonu+t3wZTmUxk4
         iUhA==
X-Forwarded-Encrypted: i=1; AKwUvBxOtwTlNeZ26sA2AR4cOBs8UBL2eQiyRoyJpP8qe/j9xHyNzumWTtQq6CusZuNNBypRlP1i17JGd6urp2/+zww=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7qIwWdLn9EJjHKLus7KTiUFFAPohqLke7ci0OK0RZbcHFh47Z
	zHwCbtUP+2KGAi6glUIxFCWIkDtABuQaJJdqccN1/FO4XXo/r1XDzApQvSjAiennXnFaYu4NYHG
	WjSxdZQv40S0/rxGpTBzETyMyhuAB4gs=
X-Gm-Gg: AYBFou1QW+EEpXWcbJtwo36j9BtjFThjTGw7btp5R0MTNBFlNTXZ73eWhZIZNSa2gqw
	5EJPJXf0bQIgkdZLPrcnvaZARDlvkY92pztBrRWrn1S258bqum3TBgKKESODToHCL+jugamG9We
	XtKq2i5E8RKtqPAj293LDRzUi94Ooa1hAy9cxbgKjsj789jv82spdmfKQXfMmSVZtPf60dbEmUP
	m9y3NO4ZKC0H0vVvYhTCNcjBRIhVNPg/Q3eBnYXCHIfP6RN2bdXmVgj8TYi2UWu2nF7vueImRn7
	8mSs5rtQqApa55WhHl8jozTBSbbFFJ8Lw+LSf8d/xUp09zuDfx3HAFQ28s4QfmQ+MOudX8VfCNi
	b66hrEbgYshWum4ZT6+CHfSUW5+R+hX0/4upVs0lQiT/lDepjL9nShqOH
X-Received: by 2002:a05:651c:144c:b0:3a9:707e:ad9c with SMTP id
 38308e7fff4ca-3a9c5399cb7mr11669841fa.4.1791639173378; Sat, 10 Oct 2026
 06:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007115821.11332-4-sigefriedhyy@gmail.com> <179154713053.434549.11454657718901075006@kernel.org>
In-Reply-To: <179154713053.434549.11454657718901075006@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 10 Oct 2026 22:32:42 +0900
X-Gm-Features: AclHuK8XHLLXtzmhhgPNwPEtq6aAUTQyZKtjE1IommkdRmUGkoYJ9BfWJQP14DE
Message-ID: <CA+7S2v+=pQv4OGqcK5Gw=ZdnQJ9FAhsYXwdbichThiTd4sVH7A@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/6] net: add a generation counter for
 dev->mc changes
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> - [Medium] netlink: AF_PACKET multicast dump misses changes due to
>   reading sequence after loop

This  seems real, I will send a v11 patch, will sample before the
walk, and once more after it for the
NLMSG_DONE check.

> - [Low] __hw_addr_changed() (net/core/dev_addr_lists.c) does
>   atomic_inc(&dev_net(list->mc_dev)->dev_mc_genid).

Same as every other dev->mc writer under the address lock, nothing new.
