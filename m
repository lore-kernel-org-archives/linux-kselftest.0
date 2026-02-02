Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53BE23EA8B
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034962; cv=pass; b=GG/AX6nXl+w1UAcOLLWJm/s5S5FoQYL83JUmWZVf9mWU+ohamOjBAh1ZVtWTv0ACnfH9OgI9ffxmoDp8R8DlCtOZHsEl44baneNDyUFvYhwGDFevBpT81AsoWo91Q9ALbaxWv5QOjM0r9tpKh+2b+zMmYgWUTV1uMEmuu/zuV6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034962; c=relaxed/simple;
	bh=9pfwSnYRbuqMRB57vP+4N+UsP6yRFCNRCgCrL1+OKPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F48e/YhF93/qy1joU/Q8+C1J0QuDWevZducOkTL4ejIpi3ojlseXfE/HKF+lbnJLxOEy7Wuc+vr0jn5zz/mC48K6bUSh/ihU4BbhiQ5ij+djRo5OU4o21ud7SxfuFSqoW89TODGNc853JXURbBwOicUWFgjZjB1xPwc/EA5H+t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1KZL/wTg; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1KZL/wTg"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5029af2b4bcso23851401cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 04:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770034960; cv=none;
        d=google.com; s=arc-20240605;
        b=KFiWRQyzA96fFLEhdN4wZvmH2IvpQ893KCuFeFHZo9WaptByiHI+WuerQoMdeHNMqQ
         PF9Djb4MxWsLIaOtGDYYJIoTWX1XBsebGKm1PByy19VJoLo2KXpDQhKKHMlmiOIG1Q2I
         J+TPk7oWimbzuaDYEwKVoImK/iWEMReSkXeE6piV9/eI1TAgz6xYbDRem3of2IDD82lT
         8hIwsi9PdNEMvNsW+HhaA/s/hwCojl4+3q9RI6E4Nym82M1Cnq0zN+cqVV0d9C7IUP3a
         BeAIu1mno3tzdS9zoFqHlhmpYUooJUU5abmhx1SWxLVwwU4g06XRY6OzpgcwVHuizKid
         MNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9pfwSnYRbuqMRB57vP+4N+UsP6yRFCNRCgCrL1+OKPA=;
        fh=Wyv3K81bLCLv8AwIFH+alVyjNb4FwV/Q4UqUrb7iZHo=;
        b=Czvlo7cHBOaaLp+i2XW47xtf58QsjICFy8TEAN+TZuy7IVKVyyBsKl7sRiQHoM271X
         q7XEumMEtfTaBa0Uf8OcKDMYN+RquKQQxSGmLAfKEMhctdv9FFepQBoaQ4wFwhvV3w1H
         u+W4sktlO5GG0yn4GcTfCU1vUe8+YihM5srg6DSKAhQdUAN2pOosRjms6sunnW1WC/UT
         rRIMfWlMJuJWQ78O0i60TDhCgHSqBs2/3OfIH5gUecRxBg4ahvBX+PCG3Dq8Mg+71Bbe
         gTKWf3BkXdUP0dtELF7tTvJxJ4uQJZ1wfxbE9kgRaSRcAxl1a73olKz/yxlf4xG2HIWi
         xDRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770034960; x=1770639760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pfwSnYRbuqMRB57vP+4N+UsP6yRFCNRCgCrL1+OKPA=;
        b=1KZL/wTgAQse6U0No6nNXtbbo/oLIL90JB4EH8oXLM/7VVwimrmufuFL8rHuNgV9eq
         yRXJ0K3bpzXiajQ6vB2NVlRW4m0Q+kT1n4Zn3ml8x7RUEzfA0gfBzfVOi/jw0xgWaOfD
         7D4VMkLdB6VElXXGX9QPEXfwLYmJoGcJbpDTR5DgANgIA2QksNnaRBTIVdRWFgAC8LSY
         PfMRitsnmA+ENOPPWOdesjy1VjOpKMldC/AbNEyFzL3DOf5yKeC/3/2tr9feC2uB+gRK
         OXXTqruShJK7Sg/T3sNvEwyOJPFbY1ZDjxuzBLQFMUcje/KwbWOT7QcbSExzZa78cdDm
         QJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770034960; x=1770639760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pfwSnYRbuqMRB57vP+4N+UsP6yRFCNRCgCrL1+OKPA=;
        b=v2F6hQXc/1EA80diiz0CdLv9RcXtOjfk7bUj67uJLqZyTCg8ZD0zUiLZ9STvyZ+qit
         4qzZ1Aowy+H4+8RA7nEP3iFBPQbtK4Seo1rtZaJo71NlDI4AGa/JQsZkFI2haHnpC2al
         qqapl7yeg80oh6iQuE8mZj0GBLBZb03FAgYIZekpyS2eL1wJW2NIIre1/cLlwnu3dZqZ
         g7OX+QLrrmuk2DjUJTwr2ZkgesO3IABvGnN8oaV9ePCz/jhB/6j8m0/kLerKTdxrCT0J
         POExZPMcRzNymS8UGNhWmxMTlmpsZ2fQcdykkkjOss8gbkSHmp9iQgbChW0aQ50DMzv6
         BuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUosdyg3urmW7sOoNUiAIOTRHa+Itr1kGERUw3VNKEzs+nhfPtRJrekxMoImdInTpS219/OM5VTlsKIDwp0t3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CAhxP52tcUN2i+06MFFNG3e9ZNn2IoA2ORmlDf+4wKI1xVfU
	0ppy3z1WkhjOOabOS3Xgj+tMtTzSnQNN7FTHCrRgDSmIGSL9+k+q1O/5qT/A6bKl+8nsGYYGCWX
	EgedeUkr6O+W2+UmVBj4cLKbGRYZladrGz7wbYuIM
X-Gm-Gg: AZuq6aLbt6GhtPova9dgasbG40T1fmyUakwBhcQKAJZhDp/iBJZEyXCuI1WOdAZ+jYw
	sWAP6Vv/P27NMmThzOkYE4bfQkIeeGMVGcuisnUl8yEGoMM156124VAlc4Kgi+M6fNBPY5sy4o3
	8eTOOs9dOAmxGSDKCeWtMxFL007xXKaz/E0/U6vI1bZ3BVIVMitPCkbKCO0TadpDpGYILDIwN/E
	BUlh0+qKEgJyXGWr4AQWY0oltpxCDN4/0m6ZvzcfIrRjkf8mGqVRCbO81eDCS43XKoWhs7R8RdB
	gRc8Gg==
X-Received: by 2002:ac8:5a8c:0:b0:4ed:b83f:78a3 with SMTP id
 d75a77b69052e-505d2264074mr140685471cf.47.1770034959265; Mon, 02 Feb 2026
 04:22:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770032084.git.pabeni@redhat.com> <562638dbebb3b15424220e26a180274b387e2a88.1770032084.git.pabeni@redhat.com>
In-Reply-To: <562638dbebb3b15424220e26a180274b387e2a88.1770032084.git.pabeni@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Feb 2026 13:22:27 +0100
X-Gm-Features: AZwV_QgvBa-oT_GRK6FHEVAJW1yt1Df7ZjFVbgtcNuFODuwiXmakPwocOjt-MqY
Message-ID: <CANn89i+fAQ3fCvJwmCJ9gvN4Yx9Xms0hTMdPrJs_qLnNnZdL4g@mail.gmail.com>
Subject: Re: [PATCH v2 net 1/2] net: gro: fix outer network offset
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Richard Gobert <richardbgobert@gmail.com>, 
	linux-kselftest@vger.kernel.org, aleksander.lobakin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 12:43=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The udp GRO complete stage assumes that all the packets inserted the RX
> have the `encapsulation` flag zeroed. Such assumption is not true, as a
> few H/W NICs can set such flag when H/W offloading the checksum for
> an UDP encapsulated traffic, the tun driver can inject GSO packets with
> UDP encapsulation and the problematic layout can also be created via
> a veth based setup.
>
> Due to the above, in the problematic scenarios, udp4_gro_complete() uses
> the wrong network offset (inner instead of outer) to compute the outer
> UDP header pseudo checksum, leading to csum validation errors later on
> in packet processing.
>
> Address the issue always clearing the encapsulation flag at GRO completio=
n
> time. Such flag will be set again as needed for encapsulated packets by
> udp_gro_complete().
>
> Fixes: 5ef31ea5d053 ("net: gro: fix udp bad offset in socket lookup by ad=
ding {inner_}network_offset to napi_gro_cb")
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
