Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D375468C23
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960564; cv=pass; b=HFctvO7XNF+1CVYt8sZdrPV9H7jL07Gz2YysuWiLZ+jlM6E/whekfYVLVeYNolO23BvH917ZGnqKWXSRtNh/oO4ikOmpBQyJ6TlsUrZPtt/+Q7rWKLaEAq2fNZ6xuTmJ0FD13+XP+6rUBGvc2/CqZo7uQN5xAxPYW0NYaKfAFIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960564; c=relaxed/simple;
	bh=aQp8oRIAczotXzqSiIFfwp9CnFohJGLCpjPmm7TR0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUxyv+WYDLVu11qD4g6lj9ydyp2Cy4RDec7+OfWO1IiIrFiewq9dy9Ir+qQnFMNGCmCjmzBKZ85VABIbHRPb0ACi27QLnyrzspn0SmBSFjik3KTdYDAyYzAAgzNsTKphBxwsA21T6Tjcj0XluWm8UV/FI/uPNp8ERpLDysFeaTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWjG486G; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWjG486G"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso34500a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 23:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960561; cv=none;
        d=google.com; s=arc-20260327;
        b=jBjY4uN7ntHZLw/Npz2zaJuM1aNq+bwuRjNlFuGmpdGUp4VzWxCZs3i8AHp/Ey8ghO
         9poOe6dTTWff1o1Bw+K0RzJXIEqQU3l4URm3V0VvxVyGLcQoKR/vllmsIrPX+fAl2m6X
         6sUW3vRPCLiMfJYyCJhqAVExzT8H4hE1b31/+BpP/GiccmDwJV2DV62V94+RU10ghjls
         hb9cK4MZ9CKuUSQzS1nr8dkOtT+zuPY7V3qUDf6zovURF61S0kVH+kBAQCsenIxaGpAq
         YbQLLT0bVGBLj2p0Eo4LJ4WnmadTgafB1OWpYP5noy2WldHEiYda7/mlrt5yLIu16jOu
         BfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        fh=cQOwcye5wKmwojYbicjRgs/MGV+dnWNLjXigQz5tXkY=;
        b=rUHmh5ehHnWnErjrjOu/gcXakF3w2H9juMXKYyytPVRF525kj973Tpg/c85oX4qzid
         eK+Wj6E5J1mEVfE3O5ZkOVHuCjO/ax2em6OcotE6s3ZErXTCloW0A5xyhf+mx00SRVaJ
         BqS26T2CN7GSuC3zNoKrR5LPmI4NIFf9MgCoxoHhsgtrhpmKZdwgcV5YI4WFqS0/bRCA
         ViVum6CXjFblhmhiSPCi04qss5y3z95Oox1KaRSrOmQK8RsnCVKo3y6ZYwTL9+sAR9on
         p4sb1IH1QssOdXk9hM8p0Ohc5d7Liuw/D848kV9MCTfrbIHpexcwUPtanSmGdbeQWY0I
         N6bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791960561; x=1792565361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=FWjG486GXpUj3e0LVRi171FwusyIn1i2DWnpGEyaMq+NBB3vJ7TXGW8YOo4NESEwKH
         NnM8/VstPFYQSSmxXk29eryt8gJqYU7TcvpCjQHIp5nDdbtVNS8z4nN2qQuLVMLjBJEe
         RftBCs5N5t9gTiQD/x4Pfz1y2tsTVVhME9abr0Ojz/5zinIIM1chaolYT1Knnq5W8kin
         XoSl/Svo2qYyKhi4qM6NGqhWgXHB15Vf83Y7CYbzwtLQQILvrZ03BoYIQcv8ndJSfTDu
         dN7prpwJxctDbR7LNdkOyzJMxx8k72dE4q8d0BUxi9tSu1CDcWkJ+kQyMwWOqjmqrmgL
         tFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960561; x=1792565361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzNLroY1rGs3lSGbTgXAw9YTjwc3chJEBfBH/eKMZdc=;
        b=HKEVoWPvKI1NC6CeoVWzFbP7UWnDWHNnsLYGEDwtETQxsRzGfWVEbov5SvOJWr7FqH
         F+LuFD5MrnDLjn5Yl9+yrqPvD1cutTxuCeRcFv+Qv5SahDv16R0Jlb8uONiV7pwxVM3N
         +8bGByyLmlFTksx9o8lfQncgUF+SQ++or0wGKPQ966OZr8crJlPAbA4DrmFAKskTkcMG
         9yYHE4jvBzj6SNZFtpXaYTlU1zYE2eYHoRUlHnLc4O30hArsXbt+LnHWtGzNUL+G1mnO
         Gt3M62GrLiATJChKeGoDhV6N/LNgDTmkRhTOcFnu4Xe1AU62kW+URwv0w66DwM6b1G7A
         A56Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBOyJLd3iHr+5/VEGlSlzRsdYkINrfXRWod3tEkbHDF1uBr7L9zcn3oNqZ6eJMgt6ujGuqooHCDsm4AYkb2YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgdJ+uU9DuOBN0Lkeb0fNl/Zo9Lw4qw7/oqFWCwh99vzDtXmG7
	m7MpN0r7xvFKMjsfacj42X4b2h6Jfem9C/wvDQwWp0boCdqS5tqnxzSsw5rbHLd8s+H1qSx3ttP
	4Tla2oYjwv9s+BstC30iPnDLkKWIB8nRXhDB72PIz
X-Gm-Gg: AYBFou1ddWnrp3D2Ekcbc6z6icgogyZ3mPjuQv1Dsxc4CZyasRgHQb8SrjeIEmrdGmX
	kHCyaH94HftMeTolVsWfWYUbOyozvNbXc2BRU3giTVkzNynrd1qAf6Oc2kcNQfX7NV3E4iWmVHI
	o7BXGbd5ZlbleyBNLMT8RK8LQFIEnppfbikDnYKH19XmpyMpHnO04Upm0RzpYigjYJNAKSN2A9W
	zEXBEu4m0BXnMZ6uVt3Mar1Q0m0JOFmJ5uWScbVQg9ko4Qh2tYNuQGCiCMbR1rB803XCEbu+7CB
	5ldoF7QtYOrenjGeppgPuqwn8nBMQk4d8SNkdwZ9T9imUFJWH/8fX4XA6FGV9F51
X-Received: by 2002:a05:6402:683:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b20ab049f4mr17118a12.14.1791960560065; Tue, 13 Oct 2026
 23:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012174300.2338784-2-almasrymina@google.com> <179191526299.434549.7888465945343049764@kernel.org>
In-Reply-To: <179191526299.434549.7888465945343049764@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 13 Oct 2026 23:49:07 -0700
X-Gm-Features: AclHuK_pUGXFUw5Tdds7zQVYPdcRbxQWbgDPdlpfKDTpq7eymZUOA6XtUrz1B90
Message-ID: <CAHS8izOppdgVxeHrUpR6zVxfdTHw1Bv4JEoYGYGodAjyijB+ZA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 11:14=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 0 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The same dma_unmap_sg_attrs() slab-use-after-free the patch
>   claims to fix can still happen for RX bindings made on a virtual=E2=80=
=A6
> - [High] net_devmem_dev_unregister_rx() adds a new writer of binding->dev
>   (and a new unmap).
>

For both of these, they're issues with leased devices AFAIU. My LLM
found just too many issues with the leased devices. I'm hoping to have
this series merged to fix the lifetime/revoke issues with the physical
devices binding->dev =3D=3D binding->vdev, and rework how the leasted
devices work properly in another series. It was just too much to fix
all the bugs in one go.

--=20
Thanks,
Mina
