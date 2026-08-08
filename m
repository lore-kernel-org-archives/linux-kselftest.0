Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55922A7F0
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149397; cv=pass; b=BdSekoAFo/ub4CQj72VNetDbINxT/dAXhTVa7U7/mbgFYg4XzDoD0en/z/GckCIPeG4aVgI8OlSbPdTW9P9l5cm5Y4guxCqw9yNApQJlUkqaP2Wbcbzwk7lwaOnr7yWw21ZA1n1rJVP0VF4jy8i5TOgLFRFRQXPfyQ2A6cFc9lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149397; c=relaxed/simple;
	bh=yebjqZBPrW/dDD47/Rf4D0u98+RmazqLXCvYFxedQBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jq/DsZxNR/SnQqeSpHmyoDPrVX2u+RwzC5jFoPlOPA7lCptq9ypvpTbV6cnHCQdnYpMdeo/CI2U54XFwEeN9Hiq2df6XZwui63r9NyuKpz3eJGeiwgEDqKZuTqHsmJm9glPbFdXdrXjygA9At7SMH0M+CW4LAUyalUg1rmk6XNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqrU4NEo; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqrU4NEo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so83599e87.1
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786149394; cv=none;
        d=google.com; s=arc-20260327;
        b=mTdQ/RYC3KNZ3IEgN3sv4isspTTUECF3RWWstA6s7z1V2WrJItZsosuzKyFPruvcnc
         s0bTKKv2k8FaLBVQehi4F0NlYfzgarVwJHwFy1Ky+DY0ezCQrcZQziH63ltESxVINvla
         CFU5JiuKj7M7OkJ/Bz/MBGXnAiI1ULahVrJVjjqq7dToNPJOAyaoYZMR5Us2Z4/jZnYF
         tfj16qzor2II335Pi018Is40fxDSffmTbVvfqqncpsmnYu1dMe1nFPYssm3qdBiwgMDH
         qp+kN5DdnZD/Yvmh3TjUStVZ6tWeG01XZyvGs7ghOSf0JY8LGb3W1DeuhM5nMpmcWTuW
         jT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yebjqZBPrW/dDD47/Rf4D0u98+RmazqLXCvYFxedQBQ=;
        fh=U8ZTAKRlfudEaEq1Y3mdsSzh5nWPpCWRPwIQZAQUWtc=;
        b=KZgtn/ap6Ca5iveXfjr7dJ0AshTww06AP3tdDDBXEjeHR9Q58a3apjVB7si1GmsKjh
         ehJLGD2TxmiP/Ip/TwiRPXYPe1FjW3hB84n9W9eF2HUAqk5iNZCh+Ai1y04bloXELWSx
         6HUK0sD9UaVfWGcHpsDClzMyi57kCQtlggFAaEN6JogCgAYiYHbFYu1eeAIYUDKhLOy6
         EXHzKulF1loUnkm51aqhuZquDru6cIL/MwdvOj4AU/S2ZEvsSG6GX0Kp7HDi0aCyLeou
         hVUgTVmRQDouxabO3QlRn2Fmb6UFn0WZP8fol29YOF97102H11NJcHbLnaMt2Asd8/Aw
         OGOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786149394; x=1786754194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yebjqZBPrW/dDD47/Rf4D0u98+RmazqLXCvYFxedQBQ=;
        b=LqrU4NEou5u5eKIl851Jw6O0bplgV7lstTiPtYuqQxeuj15nEJQ/KP8v0XVchdVrAL
         0wbe2rkqXTXfR964CulU7VUmpOhhogXJRt1AZkOvl/4VY1NOjIquvMM2Os0721F6aCLd
         letUuDHtknxfNPbw5v3U/5JY8ofRP5HPjIXZ6absfzS4Fdv2mdxqxzqxm3bwpbklg8Q0
         g/JFINj36bAVYjmrsEnSTl/9LCoFFy1EOzlr6VIDLT+anHaZAfdDhfe5hhKmalm/AY5u
         3Gaymh527cDy65GPTeY1F4Ew9f9OznBSoGvlTLIrbVvC26wN0JtsOAoGaHYBgpCfpccb
         iw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786149394; x=1786754194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yebjqZBPrW/dDD47/Rf4D0u98+RmazqLXCvYFxedQBQ=;
        b=aKrfywMF7NPWe8+XgqURlrcPDf1nNcvW/B45w++7bN8q728ir57MX8PFLjJEK31q/8
         vqlqdEj6WqW//lX7UWxb2vRMMQkucLpRlRpBfiT1UUNC/vpHWKFGcxXIBQZYQlVMGQiX
         jyCdAAQZWRqOV/Bnk+JSlyxXkUh6dfd/7N8wYnS8KblWmkvh4jG5QT8SSwXDwgD/VZme
         8qHm/cn3pyvC1SFiAP1bCbd36S4qZwZhDcQml1CHU31WFxAkCo0bfw9tbFPzM3aK0BmH
         2tD4YL4r9ILNbx7s+A4RkAHYND/+IUFxFdQ5BmjX1SpXh7Ll4g7QCPodHNIWPSOoSlU1
         T3tQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+uIaN7XERitWjrMqeVgQvH4pSjJwSFwb1Cik3Gnrphgr1SxtwgiDN8L/Dm1gtbcRYYOYcATxCsacw0XTiz8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3rKGnIXI2AuJZtVQBlj8geCgYnk9/802Eks3tgCyMJDXcr8PJ
	1gtnoOFp1T5p4IM9Ma3wR0yii1IlivtABWmIrrhNyfMuZE/NjMafbcDw4Q71Cnh97TxVVoFJleU
	nc6Z8In7mA2RwIoOfjvO4DFcm7puLZnU=
X-Gm-Gg: AR+sD10VCw7xY1F6YI3LuQNn8yhCoCNHW8y8rexQCNBd5NaALFlfH+X8cbtQiQ+cxtO
	s6cz3e2niHdsBD2GwxvjSJroYL5Sdmg6QuMYPn0kwcBxKPumTb5+S6O6he2Svh3ShYhgfEwAlNG
	GwevI5e8e7wV9UdviMCMIC4ZZ8hQPHVbcg5oLxpDOiTfVmJ5KaHgwSKrEzcvyyBxwWf1ylPH3cj
	JLsUzy8Ohl/fAVc36NEygjaISDEs5udGD5rxn/9dHHNW1/4PsYy4x0nl2MEciLyOU90vsdkuuHm
	Jnkj69t6WVRleEVQZH4BepqZTq0rpRasrmWB7anFNAXP9UKcR2srnbINFVMTbHK8cHqmCUnkb7j
	3/O1J4eKN4Pe7dq2sNfhL3uUuFafs9SgEqINYVsEIyfw4kw==
X-Received: by 2002:a05:6512:a444:b0:5b2:9599:b5f1 with SMTP id
 2adb3069b0e04-5b2f4cd03c0mr2647132e87.42.1786149393742; Fri, 07 Aug 2026
 17:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804014714.4362-1-sigefriedhyy@gmail.com> <CA+7S2vKRASitG1pK_RPG1L-hDsJyev1q-+ViRhCppBg9aFuZvQ@mail.gmail.com>
 <CA+7S2v+upifiRtBmGjHqBbOLFWn_m1dj+mezi7rFZGYLb-DChQ@mail.gmail.com> <20260807155241.GA2186508@shredder>
In-Reply-To: <20260807155241.GA2186508@shredder>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 8 Aug 2026 09:36:22 +0900
X-Gm-Features: AUfX_mx-98KOh01MxXCDuJTO0muUiF3gWbuaEF-FahzwnAMnC3D1ZCi4xwC66HA
Message-ID: <CA+7S2vJL_5GL0bBJRu6pu3fdiw1mq-106K9fXA-ZAtgsvrr86Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Nimrod Oren <noren@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:52=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wr=
ote:

> But why put it under '#if IS_ENABLED(CONFIG_IPV6)' in the first place?
> Just move it above, next to ip6_ins_rt()...

Thanks for the comment, will fix it in patchset v6.
