Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651082;
	b=Mdn/DcBcfJPQDqDXeNoxDw6LSVEiIr336vXxPscps+8r1yOslPEdIkhILIFB7jxMd1Tt
	 tQbdy2dRFDcbLvRWtKjuyYTzu2gMamSgy3Oi+XWBqMBF3uR2PpQ/FbsOh0gb3PxIhFCXn
	 bxHK2kCpHF1mPyImAj5DuLBvgYdMM1QjvGpy5792swEOCRpVtYUE2SQCl7KD9Zpf3o9KH
	 MJUqa7tUqCfLe3Ch93fuC2LFGf92ylKPWh+hpdoGO9GNFlXY4fiyrbP/suGOH5Uq+ELuj
	 v72gcmdCkZYyA6Uqa02djk780HqXaGRTBV6Ztvii6HEDoRlH+5uuUvKD9KYA004B5OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
	b=eG8aQTsLLpn9SEWSvc32P7aRHVRxnqatkfiU1G5yR00pe4hyukycQu0W3I58qIgejIeO
	 TvVT7lC34DxXPODrqeXLB9n8dlOM+gDmHKTScIFZkAv5VfUyab/OPorykntNJcUT1q3BY
	 cfV6e5QUOTecnDjuYoEDbl+axP1SQQpAcPzhW2h0woYl6yzOwXJDkqavQM1bdHPXC4Ibw
	 5Aa/kY8HV7juMCxs835lbXDRd4TV2PekkI918KQA4gc9GRVY6A1ScCafjHWs2OgIpO7wJ
	 cH1zIhjGicxlLvBcWntNUogc17/Kqv8dzt11szhYrFbdq4z1hjc63gbkq1YvzeDuAHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39236606A332
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39236606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvOmcQSh
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1874a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651081; cv=none;
        d=google.com; s=arc-20260327;
        b=GpEb9dx8DrYrlIFLZNOwjJliKHgU8YGC+38TaZnmjXDGZjaiS/rUwABR6T5FYlWRL5
         nRBlV+BePspwS1tOWxMQmJ/Sui91ns88Y76brs6Rta/NBvI+znUe/nK5932wbolpvnZ7
         ZaIJ2sVUeFOkre87A3oCRjVNvTX0yLcq8KSg1dpYl2nxOHjl/3M0E29E25UHzEgwFpBp
         0prqWK2ZYWQ5yb3DhY5DXbOYT5VM2WddpgN/GeTtKUfRXZzVIWEKwZ94gseZ3lFbliAE
         mkEtUFOlUPo21Sj8kEPJoSaQ/zizxnkjbvydtl8r1VJQa+vZSJzUBM2Jsxgm9QlUlzat
         YM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        fh=FPF2NFCJt+uvNgofWPKV42WnDtJjQpePf6HnYaIMkow=;
        b=IolExBIMnCBKse9cgEOE8U0bm6avHucDMnQrNansWMZ6b4f8HiHytMbdYRVvkgmz27
         WbYL4mJ1ZBpQSzkcJa0zw6QUU74wvqUpHm7K8Qi6m8Q1qw/4Hxs5MFINqbWnFyXumQLD
         za9irvVz3hBSBfR8RTmyS3iXM7eW0fGL7LIShxIeiGmi3Wbo8XqsbXA5aSsIJMTDDccH
         4gKZe9nfinAbmOV5OW1lTfjX2iFMnP3mwgqYA/aGVXrZT6hZzeXw73BYP78nTDIoB5Sv
         EH38JHAxyijC+6sGV6QQA2y9hXITeA2UM9croWSWuLZQP1o8UgXwjIofa9XS5UiqYT6Z
         454g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651081; x=1794255881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=SvOmcQShy/Lt3LE+GpGQ7EhkwoAJ2Oh4dl3DKSKKoUDkMaOirBiVW7+e7Hcr3SqfjR
         SCzAzbBMhDNqzD5P+3DXQjwFtm84mTA9TiGZW9kYlDPzlPeRS5X6qXrkHLehuL+oXz/v
         a0tJQ7+URmRTDMS+dmS4t0JA8BOePVO4yJtsuCe/+i68+3svgEdr6NJ+9BSxzhGWJtzX
         D2+3vrhzSS4IGrh4b2ds0fRUX7ytMKUYob9XWOVLjynhVmM+QgInZDmbS+O7gsLrBccc
         92P5mgdx9E1rTjlCF23JPDzYMGMAom8d73U2aOxjDZhf2pa+SJ4+HkV7kOYcZ1IkzSGp
         QoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651081; x=1794255881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRkX0U8+HuQCFFzjR90UGSol1Deg6kqBr45BiznV7xw=;
        b=Z+bC+f3GcXJr874LOnxmpFOfgfbcbJTRnirtjIydWfEgkXFsnI779hBOxyMHcVVKNn
         u/GS+LBq70N9Um3XthjCdbbKHYEtZQyzln1fm8liE6myR3hfawewpTMHRfRLSAru8xRL
         XMXY+2K7rRo9nQLsVZ4x8DZr11hWw056oR01ilOJIMNeFQ3XcdAaxxM+reS82YbSCeQj
         xU+oo/XiZ0ZEYu1Bk5qkA58pyd2MsUx+QlouMAV/zHm6LSllRTnlB9cmzHEu4Oa8sL3c
         GC+cRA3nA4rp40CdWKf8arEViEowahW6BBkdx0YiMYETVqjdyYkyxvu3b6CEjbDjs73+
         C+sA==
X-Forwarded-Encrypted: i=1; AKwUvBz3rEZKVTo/qHCHkKbn90kGzuH1jhVh9xXA+yXTb2PAySeJbEEl9zE/SedU/zEZpEUEgVtBGRh2aORqOFxRGZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U1pRDG8BYBJaQQmUssYrivxg7B0oj8Z3Hg1A8TI6z/+54/i2V
	5Mqzdf/UVBQLI8t6RoUrBrNA5rVutnuagNYJwI8MMgTd5ZbFwu2iMtXVH2v9gYOJDYBhu7LL7yF
	t12e/ENWmNRgEBb1+Vv0IBBn8stkhr63QCDIap06p
X-Gm-Gg: AYBFou1H0t/V6ElXGn7bCJJtUt54sOV9Ms35/AnruYslnmiH9rNVx2mSuNI072qrjWW
	SQaJNEjMFLuFKNiisCZrL/PMw+HyhEmlVJprOt9ZrrSHHviqFo/ZQkKbBdrfk398258bvgRRPVQ
	hypkYvoAwt1ovHUy8qECbeki/v2N8gevHiEfMEqT5gALcp5EGlfROFQoyId+kkVOy7fMF1Z3TYz
	xRYS21HtLTMWnOiXk7iVD8XuzKeAzu2LeXBAk5XmOFet143/t3M2QFHB2phGPFw/Xp0cupJkWHT
	8LMwTMnr8t2ZlUgjWlG4c+IVl2++AafEQMMIcAZo9HUsJKQMgKvgO77GWj/x+tAxqj8k6uL83qc
	5+a6E5QFGOY3vaxkiXFkCvXw3ytrUT3kPFqzYnYCAl5QHuqwsWMFfpBsVseK7dLNHl4M4/u38Ql
	l6Qb9Xh6RhCct8
X-Received: by 2002:a05:6402:a20c:10b0:6b4:6725:f2c6 with SMTP id
 4fb4d7f45d1cf-6b539d6a214mr5220a12.13.1793651080182; Mon, 02 Nov 2026
 12:24:40 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-4-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-4-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:24:28 -0800
X-Gm-Features: AclHuK9HmthtDhK5Se7ln97xEjRHJQkrIbx6CEUxI-rYHFFjq-AxT46s87UOWio
Message-ID: <CAHS8izNMpH-RJm7mk=-MpMMT6nc1_AukmLVHmh2r=AoyBmZPmQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
> Derive the index and offset from binding->niov_shift instead, so TX
> bindings can use larger net_iovs. No functional change, TX bindings are
> still created with PAGE_SHIFT.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 32fafbfa1359..6339f221bc82 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -455,13 +455,15 @@ struct net_iov *
>  net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
>                        size_t virt_addr, size_t *off, size_t *size)
>  {
> +       size_t niov_size =3D 1UL << binding->niov_shift;

I always dreamed of net-iovs can be non-power of 2 and also can vary
in size inside the same binding (no reason why not), but this is
providing excellent value anyway.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
