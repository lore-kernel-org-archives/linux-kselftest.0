Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601253163A
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178019; cv=pass; b=KwOLGpxSqOGXkMUiXg8pD2wluQwUN56Z0GNb69D9PsYfro3uIPsXyPMuY+UVppegD16+9F/fRyLdEbOn6LPaBXUJO+E0Y636vhuC4nnpsAhch2sBIQ6J0NsdqLpZS0bOpPTlET3oWSnIz7hyZkDd4ia/B2haGztNBfLNoUM8Gq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178019; c=relaxed/simple;
	bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0WlAnxu+hZkxQJqXHGkd9TNeQKAp043Y0kwGNghvO40QWLkCWWY6zgebHbj7M0BtKzGXTJqvvsAMI/PdWYb4+IhiuKsgp+A9I50fKOMTh4LmFwhuKKoyEW1DmJYpQ7oBeHD6t2NJxlycYBqDRYW70LY16tTRtZdahjo5wJj+wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm2INPB/; arc=pass smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm2INPB/"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7f4ea978572so158422a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 08:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178016; cv=none;
        d=google.com; s=arc-20260327;
        b=Ujyk+UEzO11kJwY/a+Xsm+w8GssqovBFDhe57zKJ8IK+aQGSs1LeJufWDItTuZmjIe
         uIMillLl4TO522SmgXxSUJkkJswYmGwdC80INBRYTtAXCbzm87Z41oXjl7KGZaKnu5A8
         CV1qJCRVxMLYpildV42ZrZ+0xaP/rGIbvoxwGL+r/09uGy7+Ohvt9WR9QMIKMCZpDrPX
         Us2xtlLK9CmFluX0zTx0HAZIPpQ980Rq7MjzUryGBwnXW1nzFZ098SEEnqfpDoUT3a9x
         F7BKl7H4RtkGM2OZOjqFFgoUIo+Y/UsRP0LN4MDEsAmXHRz7UKP0Vc4SGYGGP1CxJaj5
         8f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        fh=kRb1aZ00DrZaXOkzYkGtUY3jCZpjKaE3N38nZ/HQo3Q=;
        b=pfutO8SCtHfqrKJQN45p4vhZSncZ9LX0b/jv/g8j7pcnJ7zz7vDZQ/7Z/k2tqCXRMK
         JiRlfkr7Aj4yeFPdiTZTVmWO3z17BHUNj6YlKz/ObJuCd3O6Z2hFXsZpnn7BCm+9HARc
         a6J2sUvUfxFEY0bsL9jbBbUlGbSPY7LVc5bXFQFxAwCAesu+ViznN8FTrL4D+BIcY0eU
         apCDbLZ8HXKbLvWRFxPG5/rUhPhlwoGkdfXrEf+OGNvzDdttubwNU9OzZruqSu1HChGQ
         DFGN+5IwPgnDNdye81keg1zDwkXabqgLvKHTTf2epsN1kbDtKThsInNsKp+gnAwU0ici
         t6tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178016; x=1790782816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=cm2INPB/9rCqjGjznTx5zKWjrWfIWpnXs1FvzTdYqkVb88o7r5PsQtPn0uiuVPmnXC
         MX+tQKC46Md0kIf/xSfql3JI8jk8bZGaudWm+a8OI+3n0x80ECOAUxLnbh7p4BymQ+1z
         gGDM8DX+WamDE9uhQ13GCKBtV37b5dIVJh68fA7G1hIyak8/GH30PUmpcg8N8qzSuaJF
         Hlsw4VRBcntF8kMTGrBbWpCl+d4UbAkmLzRdn3qJUIDIqH/nulpMI2ezM8OoUKZ4540a
         w0l36sjehhvgGfijL8ne78bQImuJ3/DR1UVURKu1a0NYNGWDsySW8zpg1XkCX7ZPohuY
         X0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178016; x=1790782816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plBphVis8sYLOOrAsqWWkAJL0HO8LEBNGCFMlGRTMVw=;
        b=jAetsnRGvYGAo2VRuLfEecBt3PjRByzwBQo2/nfkBa79bSDLXelUXvQD3TUnenKiGF
         XCLxZ6KYX7k61IfMltr0nVwA2V0hxmXlVbyL9MOKLzspVs/tzZxK2w6qTfB7D0woeegb
         DqZNA7ZHPMTPQgmx/pUCXw1BH0YA2bWkviy28QlO6ihJCCKxptj6RKSAF1TCN95qnv4M
         q1+/7TBbZp2JuItB4R51Re0r31wpECRSTEFD+H66xoq5rmxG17tyRPFmArAaGxY0IBkp
         sfeAWDh21KPdm5jLF27Jc1QngvorCLwfSj7Ioy1lBBByzkdCkm20O57GPjkM/wOk9/0N
         1u9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDMwR23ayIYAmFyAa8Uj7X9/0kKwx78+rdGgtmTf2/Qtp7Jul+hJ/3ZqKS/sdW6WcHbW86Ir6IS6G1R/Rdc4k=@vger.kernel.org
X-Gm-Message-State: AFuF++kE0qdYCY6A7jp2y5RnC/71RGqkBVx9Tf8ns81fNB5ZMavHMUY9
	7ur1YDeYxLxTxCagtM3cxZTxlEoW731V+mPVaXklQGrtGXG8ufqv2/qfW/MX2DLrLLMtbPZ/BzI
	VuNaHB4AlOiLrap4sNySyCHNbxXPI4HE=
X-Gm-Gg: AYBFou0EI+ciRZDwY2GjO/ffhm+d93aLP84cCcEIys1UcmdS28/HPd2R7s9a92TR96s
	oak2t/cudLt6zB95FnR1MYF4YBblwYDhGnTKdjLTfTnTpL2RqEZAbqFCrGWU0pJ0/o0T1JqTX7i
	2us3HKt4rM1igbLgQemKGNtVeQ1rEfeKUvBt9faGYrkEjHM5mrXDIPJOkwAXi9EHQKAIEqkSLoi
	Qg6ViT62MxZOyL1lFbe/6gs0eHOrfvG4MHiiNlDj/Gk2jNgwsOZCEwUVLqvqJ+EXYXtrrZkQXDK
	i7wRd9MSQgHmRLm/xWCAgCbxUxjulw3ruhjMdnVgejdmewEQYOxomPOKLTES5Kp8aUDei7P5RTg
	G4B695g==
X-Received: by 2002:a05:6808:1a1b:b0:4c3:ef94:830e with SMTP id
 5614622812f47-4d5b9f9412bmr3726243b6e.3.1790178016141; Wed, 23 Sep 2026
 08:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-5-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:40:02 +0100
X-Gm-Features: AclHuK-eiR2fNKubYazj5gcFmudoFI1w_j91DvZRl7oxVpCmicGBPNhjY_7h0xQ
Message-ID: <CAGSyskW+HsE6Bp=95EMF5rWqKtoUAFp6CjH8sAFs0gYywuALvA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] docs: netconsole: document rate limit feature
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:11=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Describe the per-target token bucket and the two configfs files that
> drive it: ratelimit_interval_ms and ratelimit_burst.
>
> Spell out the two properties that are not obvious from the file names.
> The limit is accounted per message rather than per packet, so a message
> split into several ncfrag packets is never truncated by the bucket
> running dry halfway through.
>
> List both files in the target parameter table too, and qualify the rule
> underneath it. Only a disabled target can have its parameters updated,
> these two aside.
>
> Note in the message ID section that a message the bucket discards never
> reaches the counter, so those drops leave no gap in the IDs.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
