Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA33E2D0617
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248058; cv=pass; b=Z+Y4n8lMKfNmq5eEwiHfFTdxf876Tjn2bD1bnibu1qfFmC2r/bYTi0YBMP6b727OEy3Mrk6k8QO6AB8QG2f+LqwXH9a7VlGSsIV1DDsOrvWLaN9KSyw7EAOrbZ6rQJiCgUYHZ0Oa7Zz3Tsj8zi1VaJmE7FGDLwmi3SGCZ/8RTBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248058; c=relaxed/simple;
	bh=WlUUULkXecDA3FrqNMgGGTCq58pBRHG2vpFkFbVh+ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP16qWsuPDCTKdl489rNC1GvZEylcA+89uNGNVzhliSLENEZBcg853VlZ3+sCcXcYSPeHV2m0mkN8rGnykSdNpuS75ZVV2F23k/lebhppLnmhzTs+V2L+gzLT+d39XEzmPuaB6kVTi6k5wONzNnMrjGEhgSBLi5N+Gz0QjEAmCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwETqH9c; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwETqH9c"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bcc6500a7dso872488e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 17:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248055; cv=none;
        d=google.com; s=arc-20260327;
        b=hxIOE26T2Yi/kWGci9diqd/Es2jD+20qpA6q7PpWJFP2hsV3QVCEnYyBQ2hrNOMtGg
         ZKfVQSEP2Yq/6OC/O5mABIwoUuZDYxUAlkUMRtkaOXj87oTwwoFm4SNwHQHTUN3GIfPn
         m7Qcl8GRBjSs0juAxCpt9WIGvsJg/k07gqkgMRjmMmdykzjHCV7tvrKW1cpzZZHvxg3d
         qVSELvUgHceTELZoB65zK310phlrQd5XrsoYzoSwx0viq9JUfbBM8BfRKfk53lnbqNYk
         /zekgwD/sxoRG24fNygRPBmQd1gBDukfqqAa6cKpVeuDcTjOxYd53Jn336TwYHAtNCng
         hHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        fh=+V+je+nKXXu04r0R6EYusvOvuQthDfAkJTJv380Ue9k=;
        b=UUGTvkGGuYrVcwJVbCBCZQmjyyBUZ7JZKDwEWvXlomP3QbdOzBNRm9JMwnIv/LHUBw
         qVg+huzia5W/9ScBQxGlgUeBpHlvXNKiKXq92GsYNvYoD4CSPaR5pORjrVWWxa0I2KFR
         lOPz4PvgzyM88lQbEjbbWPxKqdCUkId786wzI9JlochgWr1V+8Hp2bH9YeJCK9LpgFCF
         Ga9Rzs/61sPDY0IoJYYxm+0cQz1V1Me0POWuWdxm8dGDVOMCN/0v/YhNT9nIya//qWo2
         BPew5DpCUTSbevt+zOlXZzVGfOzpy32W/JkcHUEHUfKrdJ4CU62g9CotDKEyo83vo3cJ
         WaSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248055; x=1791852855; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=fwETqH9cxxal0fJoOC1pqQuaG+wbRKB5K553A9Fkx3ZoWA8SwJ1hDrPM+4fb8QJB7o
         4uNMGAZFjR+vPB6KRJAuURlA76KVw+IkwbddHQLJtv7Q6kn/0jT2oo4d2WaWUsxtfb1g
         gB1WgFAD+ARVT6SNvae4SOND8I9R4iEc5IwKtgXwPAN4nbqv7D/ojylJAKeGEY3F8XPU
         SfaOK7Vstxy6/Z3o6VvOG0ssIH5Cyyhu03PRzDYyinx/wXqWldkzoXhXpgT+7qa45epP
         No/XJS2lLa+Kh0ZQPg8Z1Q0XKZCWF+ODEQeT20C4jlRLjABHtUdtf5HHbWHTBqkQA92Y
         FjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248055; x=1791852855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=xneop9yk2jYptd6fF4ZEuzkDKki2gU/J/wl4O7vqsQHvy4KaFPF+jVILm6ztXh711P
         fxTe4qY56B1KOPneW7ylf+aNr6TcMfCHTqwoWZ+sSQzY25HhTn0W3S4gioBmGuoA0OgX
         ToKsemUanlsMm1TyMshKg50uKF1PSPKLqcSzEa51ND36JNxN+9yV9nC7MlK4sN/lPibw
         9Rb136s7S/f9MAFJ+oxnb1t8nA5ped44kWkb2eRAqWFlGaAHh1YxHHQAC5CAP6Fk2dNH
         wAKEakGSAVHV+54tB0nvIxR6U41M7ZaBEF/VfHOYBU6r5b2jJGOhP3GEB0pjQ0mQD7uY
         12ZA==
X-Forwarded-Encrypted: i=1; AKwUvByLumTzrSE97st0IpT8dUzZh9oQ6g1+54NP2vLiTcHs8vAtHIFxl2MhXSEAM0q4OjHqnZs9a2Xa3/iNMV0zZoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQpFVrbpkvZuIXbmCCaakhZxdxrMK5yTQT2UEnp2q0GlctH9id
	cJKgE+mvQHQpD0neDRcToRZ+vqVJpHsXExfjmOkBXW/Vzd97dsR1PP72o7vzQM7vs+oN5am5cYE
	7LyNa05u0h4HPUhO5J0am3u/WAAW3m5c=
X-Gm-Gg: AYBFou22c7dJkbrplCwiNJPZ7qjD8JWDntc2YQVEjLlZc7Y+6Oj97pOdFxsWBDAO2PZ
	0X7OiTC/c8MX1HHokDL/VrpmsXBlW3CDPmi/eVFiLXOTAgB10vp5bmWsMLASzCrOBxuSxnwakXR
	1/SNFSxKSXmztkifqEevjMoj0uS/lvQFHFYKMQmGuF//TnP399pelBQw46ZvdAhbtgPG5PWzGMK
	W/BziuVoVbU4cOpEDrQvidfDbSWlJjOzVb8KnHCuC98Vkcps7YUmTZexrl5zlO/N8eRnO9xdTAL
	v4OOyIPz3+6Q5XH8EqeGerKRQaoY8t4LdoxaX3Qm4lauSeWphBpU/+IifoKtDjnalkNVd86TFte
	cVZb+cNSzBqIE
X-Received: by 2002:a05:6512:8345:b0:5b8:e716:64e3 with SMTP id
 2adb3069b0e04-5bb9bb05b58mr2911017e87.31.1791248054559; Mon, 05 Oct 2026
 17:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com> <20260924011554.3494-3-sigefriedhyy@gmail.com>
 <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com> <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
In-Reply-To: <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 09:54:04 +0900
X-Gm-Features: AclHuK8fWL_vlv3-mm3wzWj5P4aeBqPD8cwdje1eUbLrdaL3n_CnWcUcb1-y-B0
Message-ID: <CA+7S2vLwtrKyMcZ4YkKTetnn4bMrg=BP6sjYa_R8pbROhTGrRQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
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
