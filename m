Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964FE2D73A6
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248106; cv=pass; b=bjV0/mF05cCQys4uVy3UxZ9l/Yzc6MLjXVRzEMz23BN0cG/fd0oRZlbw0a8kzt9osv/3g4W+uKdeAQ8W9bPWEzk9JrVIuVeYICtekSOWyBf9gIwjfRJVyzp2XdnfuC3FPorxuLysNVamnpPWDhzaC0UWDGh4Hn9YxKFl4u55gVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248106; c=relaxed/simple;
	bh=WlUUULkXecDA3FrqNMgGGTCq58pBRHG2vpFkFbVh+ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtN7HQ/4SPM00YDvwEpWq58gJaQxnKg0VdoeuUiHOxjzgoHmPzD2zGlExLkfPvnCvOlUevPgkRfPk1zV6M+7SWmef/QHtSjZMnlde+mVxJZOU7la9JgCw/eBE6nQnjTfGDFIcD4s/N0B1r8YfGqIQBkaG6HRjbmSQHNnes1HqHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bW/qOGkn; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bW/qOGkn"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so29809831fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 17:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248103; cv=none;
        d=google.com; s=arc-20260327;
        b=MnaTQSZ25rztfI1cRM/BcFn26pupWF9PMLgPJJ6fEggO0Y1+6JN7+3afuDZUPwXhU5
         HKolTfZJU0Yc54DyDDJ6N8zaVfMB4k1yhlpzHnvbV/GbghnY7MkNUjJIvf/5CdeEjWVL
         1tbXNyqa8NcKT43ffAHpzBLO0ADm9EMtYIA+BXDT9GAl5DGO0uKgfqumFww+yHMU4rt7
         X1pe9bAa07jaNfP1zUp4SpLWX9mFbkuCWK/kgGGuaPASFkLA3VGZyqQSR4eP+k7GXd2q
         zvcyZAXmG7xmh0RnmNd/9200rSEOHruGBBw3tFHfHEh08bAVvXkk/YP2D0Hjy9OjrIo7
         LVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        fh=xN+GhR9GkUjk0ZWz9l9SvG979Vurm7VfiYQ1pMKXTCM=;
        b=rPHHuR6ud8E4GTwD7/UIKl4SqPmQ223/+kvGcMXET4IH1r96hrY9iZu5mmxmyD1RGq
         lrZqnlMjPxPFawyURBEXuxiDxMe1G9fRGCEWXbYR/yqbWt6LZMxe+lBZNQptoll7glxY
         7t9pdDs+PMeWBO2s2EeB+xE4P1r22tcccLFmH3msTNcJqFdYA9PJg1guIA6Gpf6e7x+7
         PYNwA4VumQfqoKAXEBs8cOHiyD94+6DgUXYu3A6dulvHYups3lGWFUl4n1Ug9CugrtDX
         RYUxMON3KR1Zc4bfTv4ncxkGnqPVucI3fUeDJZZiDdpQ81Cq8rs2pE0eLT7CriWwih4/
         1uSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248103; x=1791852903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=bW/qOGkn8Oq3ecnO3iORBbazJd2D788Dq6dJ3XWYfSdzJ6LwitRqTlwk46xelWflAV
         gbFGss68KaNVq7/giUy8G1imnN6qjgFYeGlGP4GkDjeI8mHeQmcGyZgO4DR8xgQBojFd
         BKAducA6nlvACC39vidsPLdmEkBBidl4l2tNV/l5BL7wKH5f6DmhVfHjAJLGGC/tuXxf
         XPSg+NTKeoCQzyOfEj2Mr8SDCLinsVL+iKUdl+/XWcioaKkJhM5Lz5jlM0d6+rFN5Eup
         dsFU9EjsHCawKIEUoxk67BFgonn5q5/8iVgi+JTenRCQhQu2rV7HNn+TLaxFHZFC3alU
         N2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248103; x=1791852903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=Nv57X1ua4BM4em8VvZRiOQ1qxGwkTY8NhCWWpofv6oTZ7y5U602uNDAdByASeRNTVJ
         d4DVPQ8OvMDmBEvzFD8VQPdBS1CIeNADLk5glk99KIEgD3vNm8nru9TIva8NkJlytPu8
         AIBeuwCdar4gDAMo7sPIgho3lWJsmchl7zHweaL0MDIIp+nudW6e49IPtIjfd4liMCna
         6nfNG/twA4fps8gLiYcUlDp47MvFodR6bVzfsA+h2LqEz3bTgCDR+Le0IfR0Xxvpxt7G
         UoewcbLaMM2QhePVwiOIcptIOV+q0MWPPHhxMNEcJsoVre+6O+hX3mcOlig9LZO2MngX
         gRuA==
X-Forwarded-Encrypted: i=1; AKwUvBxHLvKeLT8fgoBkSQuvvbp9egemcGrFE3hfzMOi7iEbbTi1DKxaQuRcMZa5ilFXlEOAWmrVQ/vV8oQlN2TKL/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2+wS4+4No63UDlaAvo+RIFLHUd24lWYrBbMrgiFhRpA4cLHIk
	sUaEsixJDggyDtjdtnLSg6kuuk4tfEDwyXAkLIuGEESdPU7nCXa0FyFIsgk4hkTo3eqo8azDHeW
	X2Q4U7A5evm87GshAucX/4AzZGLXbD3E=
X-Gm-Gg: AYBFou0ArX0XxqHycm4MF+AAcyZGjEJYCXfRPKG63cKTiD3mQI6/gLiBnjgRNele8M7
	AuVr7HVjMTHSHSG1qhOVpt+SEcfNrWbBQp+0+mphg7Lqh6pI39pdeHj5YgFBKf8w1RK9kV/VTDH
	PrGPIK1+AmLwVVtBqWr+zfIaG9GX9gnPQoVxbqIaC66QnvmjSVmDuNhjL1BnfIW/H7hILFIX2fA
	Ll1sUqqy4ECmsoS9cqlXUD3rcT5Y3/EnkfFzRWj3upyrwOMCZoOvjsYw9nlbKsIxjAKVQluNT/W
	PuuUIcy7KBqq2mkuiTKst2Nlxd4z06eTmTBpCOAr5aG0lBnBewZasYX5roogJ+zMOHcInLZtk88
	r9+HkohYOseKKgP4Cm8kzk0A=
X-Received: by 2002:a05:651c:a10e:10b0:3a6:48ab:7973 with SMTP id
 38308e7fff4ca-3a974f7c448mr16424921fa.26.1791248102355; Mon, 05 Oct 2026
 17:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-4-sigefriedhyy@gmail.com> <20261005164905.3d5b6749@kernel.org>
In-Reply-To: <20261005164905.3d5b6749@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 09:54:52 +0900
X-Gm-Features: AclHuK_fRzWbaSoo1jAzXFCqAnGNXFcKoa-i0NxMDceG-eS6OpMe7FREJUP2sdo
Message-ID: <CA+7S2vL2n+XTZHoSyitmQy59tAnKjJvErvZw-PdKaMx4-Deq6w@mail.gmail.com>
Subject: Re: [PATCH net-next v9 3/6] net: add a generation counter for dev->mc changes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > + dev->rx_mode_addr_cache.owner = dev;
>
> There's no need to set this?

No, only dev->mc is looked at. It was set for all the lists of a device
after Nicolas's comment on v7:

```
  There are several lists owned by a device (dev->dev_addrs, dev->uc,
  dev->mc, dev->rx_mode_addr_cache), the name 'owner' does not reflect
  that it is set only when the list is dev->mc.
  I wonder if the name should be changed or if __hw_addr_init() should
  be updated to always set owner when the list is owned by a device.
```

v10 takes the other option: the field becomes mc_dev, set for dev->mc
only.
