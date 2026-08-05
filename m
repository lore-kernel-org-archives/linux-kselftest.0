Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5DD4156D0
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926482; cv=pass; b=vBx62SDAb2/k4R50dPlWP3dGFDx446nLgaKZITyv3lKFhyvf+/oV4dcq2U8z89RN4wacg9qXiAPeTAYkPPtnHU12n8d1+poYjW7GSZt0wrWFjpYP21fCaPJgSvUyTw2mQGXhj0zR+sCqbEa4zkz2oeoQF+WINAtwDdZmfmGvBYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926482; c=relaxed/simple;
	bh=5niBt8DyKkV5MwxSbrsZ3eqRRMmoyzmdPFe+ZCtEli8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9LzNFJL11J/p9lj3nnjgK95OA3hVu/+gsAjmYhfPcn7s43TPtuRfyVHkYWm3Meoot4V/zHfFV7EnzE3NazT0PayjE2pLYlieKZmX8U06DalwbCeUAwxsLsXopyr51gWuHgWvjlllhF85fd31lumvayDwFUf2VRRgljn497UFa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPSABqIG; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPSABqIG"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c86945164so7374591fa.1
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 03:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785926478; cv=none;
        d=google.com; s=arc-20260327;
        b=oDWtLkj7ljQRId7QU8DDaUmgWizSkMK8K3iTzO5gglWrT1xUUKioV6diEvL0XXdzVf
         H1gtqIrFk33JRiQR3aokLgNOGTHW+6Yfq7xcZbqKIhe1GfvgggEk6G+EFMF4Tm2/sCWV
         yqPgzkaKmK7BvwlgKGn+/03KHWW973pzZGMog6dx850uVyZFgRHSpcsCkKdjXyO8L1UP
         ctdgUIg9y7M2230jvtobYG99qG1e0+yg/B6WlzL6VL0cQ3tG8cJwLSQrliJkdHGr5oac
         2NUWgZmEHzjHkqGv1mOtioH1QGckZT5Bv16iS9QffT0+KTRJp0zwAR7gO7Ag0xFcc0pp
         Hz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5niBt8DyKkV5MwxSbrsZ3eqRRMmoyzmdPFe+ZCtEli8=;
        fh=R9zYem+XCOIDt+fHeFn0djb0VZjqBpHvhRMGppCSbJg=;
        b=WdnjzLBi3JkaAS+PBnkaZu9XC/I6DKMw2JNh7JYpJJcGiqFOk8WRiwkPpoSwthisu5
         Me41ktY+qZ3SVLsB+Qo816OFEsx2/TGKR2KrILXV9zKhwj9MI33XK7B69oUt2ouRH//o
         8a3df7d9p8fST0P/ZRp6w2axLClNkkaxM+KcW7/5kJfpid/oCWUWWJRIqIKKc6WPBxvY
         OPsxEZQcA6GKqHUsMlQTMdnzf6xFOgo5vu2WaPInuu4YRdJY/F2+i2WQ2N1dUhBY/foE
         i4Aczh/WrOulvfM1d/rJ4m2zVS/LXajsmQrWvSl+oN8xFevNXrIZsBKcfvvsWsxLSRhf
         ZVAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785926478; x=1786531278; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5niBt8DyKkV5MwxSbrsZ3eqRRMmoyzmdPFe+ZCtEli8=;
        b=qPSABqIGps0T6TKTjNDT4h28762RiQMmdmQiZcjqtABYlDnnIhj+j5rYozCj4RurXN
         UrNLziAORRnMfleTLqEnj4EA28Atu9GluXGZma3Pu+aNs8igXtVJCrV6Y/Eg5FeVOncu
         5qkLYsxKElvyL/Z8RLZWhbokmu5ved1m5zE4B5E/bElfAfUu8/AQJCAptPh68Qg8O2zi
         MTAZbvbWR/cx3cOOkvA63+x75vkRpGF+8cuQ6K9w27tjx6NIUOrJnb1pqc1O8zwp3LWv
         rS8VlOomIeHwgzKeM7PeZvdKkybuVkYzCm6t1Fe9m74zLgrAf0bB93+Ol6byjI4ukC18
         UEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926478; x=1786531278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5niBt8DyKkV5MwxSbrsZ3eqRRMmoyzmdPFe+ZCtEli8=;
        b=T/QORs0JlSoRIIs4Jf6D/ExLn40inYkTyUCFg1VXB483+NQlCPgGyI4s8kry0cTT8H
         sYbPcWJ5gshvvkZr8TtHSYx77BeC1jn4UQc9Fs0Fge1UjsplZeF7QVeAdzmeZDrHRM0f
         ersqfwD8vKQfjH7N2Dt3xD2ET4Mt/SL8IbXKe+0YxfEUBCi53ggMJkpELFr95IIeWJIh
         U1t7Cd8etiRwzVDKGhTtG3oGpcGO7bV7wed5nBXSuux4i5tgivK4e56RknRu6hrJNsIo
         iHTFoQxXjwhPa2eYLAMfCmKtxlv2BHyZ5k+L8N5YyJXHSH3VhxXoEDlYPVwGV9Dj8ug8
         oHvw==
X-Forwarded-Encrypted: i=1; AHgh+RrJTyhsXtlYO8fHGqEv1Jvbm4N7RWJg89ctX4NhMotpIiCSJj2vB9xqym5lIPvjvI437/WkA97rxZVL64ZW4/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWb32aun7EZqCUuENP4s9nHnNJxs0LYwOCIW+Z88c4phrDCFN/
	lUD+KpezH5oto/XrbB/tXrCz8Ys06r/gJhKTpUW/UwJFZuKJLN6V6245COyF4M4F0mf6mGSovqi
	R4hR7xifnGukefsyJ7AWj9/zc+eFvsIU=
X-Gm-Gg: AR+sD13eGlaiMTKxshhr09r1YYaUFXOPDFcB7QXbtFOU9vDVmMf7+FEx6A/+ED0T9fh
	7YBvhGZEcMeIGvABlsBosCurjPilMHyIZ13SpYPUDmaI+bXvC5fxaht72B5n8aicshsRYqMH+eC
	JYOh1ghK6Z3+rEvG+cghfdSSPz8FKYcuPlDRI1xWlbmdS3JtO/rQjMkDZPqwkbutDmmfoCB+r1U
	/bt5CeToI52fVuBT8LLgMG3HEVJXbr3lzI728lScEzU1pRx/su0ychsM+lnfUDJzY/Sl2vhgZR8
	INox/2R9z9mcNYYjWN3hbtuol5XSZols0FAktfzJhnkUWALd2FXeZCkWC/NNmb4IY8syq7Wg73m
	ife/YdsarXUojIfi5TPB57MYxyph9gpCVOCoL5Hwc5DTd6g==
X-Received: by 2002:a05:651c:a20f:10b0:39a:fa7c:b152 with SMTP id
 38308e7fff4ca-39fbb1a6880mr5507661fa.4.1785926478218; Wed, 05 Aug 2026
 03:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
In-Reply-To: <20260804014714.4362-1-sigefriedhyy@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 5 Aug 2026 19:41:06 +0900
X-Gm-Features: AUfX_myaYvRXHpMPIXlPqkonD5M3Gijs2W5bvZsdGfZVgRcOCjHXYxfLchXmdwU
Message-ID: <CA+7S2vKRASitG1pK_RPG1L-hDsJyev1q-+ViRhCppBg9aFuZvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I checked the sashiko's comment:
https://patchwork.kernel.org/project/netdevbpf/patch/20260804014714.4362-10-sigefriedhyy@gmail.com/

> Should this new UAPI attribute also be added to the Netlink YAML
> specification?

> Is this new attribute missing from the netlink YAML
> specification?
> should this new attribute be documented in
> Documentation/netlink/specs/rt-route.yaml

> Is the del-reason (RTA_DEL_REASON) attribute missing from the YAML
> specification?

> Is there a missing patch in this series to actually report the
> deletion reason?

> Does this del_reason actually get passed from the deletion path?

These are answered by later patches in the same series.

> This is a pre-existing issue, but could this RTM_NEWROUTE be emitted
> out of order with respect to an RTM_DELROUTE?

Not related to the current series but might be worth sending a follow
up separately.

> Should this new enum and its entries include doc properties to
> describe the specific deletion reasons for the uAPI documentation?

Agreed, but it is a nit. If I need to send out patch series 6 due to
adjusting later review comments, I will include the fix for this
comment as well.

> Is RTA_DEL_REASON missing from rtm_ipv6_policy and rtm_ipv4_policy?
> [...] Should it be added to the policies as NLA_IGNORE or
> NLA_REJECT?
> Will the new RTA_DEL_REASON attribute be rejected if user space
> echoes it back? [...] causing an ABI breakage.

The comment seems wrong. The attribute is kernel to user space
notification-only, user space code should never set it.


Thanks,

Yuyang
