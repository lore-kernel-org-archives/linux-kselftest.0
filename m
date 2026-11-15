Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794722756;
	b=viOa4Tfj8GgTKePJi+Yk6jhXLR/w24rsuEnOy3+AJTx3XAymWBdU6gDRl9HO/7d8GdMm
	 xFbD+gyGYOUnhzHIuZt4hjPFD3BFiRzUqBk0e+xQkPVJrgqZhRnNITj2gVPmkF0Y+OcDr
	 H+XwYKnKuZzg92Bv7TY6QFaNK1n5VN+qNCw2RxpBiRfKIlD5/nmRsf1/UKs1X0BBWAY26
	 JIwTcJg8byJhrEktQDvhGYMtRixVVEyzc+BE1yKxFBEu1mYJuuz38ENJ0KxaSk/7fxcm3
	 L0Bi7YGhgjhwiZpOL++rH7ZC/DGIvIRJ5eFiwTWmErW79bf31tNG1zaN0vNMkWT932A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794722756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
	b=3+WqrY+jl6Jna5xkwDLrF4yKni/p8QJVnajcPbA69GRb+HF58tKr1FoHwdoqrfvPN/N+
	 zUXJ9wSJ+mDaVrpym9lrGGbqq2tA3sXyAc2QYoTNis05So9XVJcH+KTKGu+uiPKvx/IIi
	 pjMJPlfXuB2W0CexkCRp+gOcflwfmFTDcWZiILbR7wwMEjpEyL6vG4QaAGMQiTPa0nKty
	 NoAJasCrY9nFV7iMz2Ebh8rmg4oLgueRjPlErknATmsMw+YbZ7nCNPoCQdGQBRBDMtEdp
	 eI92tHBZ3C3fDRF5b7GcZyAWLv61D6tB8ZE1qyyZ/CBvaoPuxeumayVwMMSfOTc/YHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdM2pJet;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE3606A32C
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 06:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AE3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdM2pJet
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67db35e7953so31404d50.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794722755; cv=none;
        d=google.com; s=arc-20260327;
        b=TxjjSXYgCWdnkv7P7fZmKu8VTq16jv7TeywhBhiDNAgOEbN9giu4w2dXINoGuJXBbG
         7XANuCramVDUA+twbLEXzXeBN6B+WRIuobs7QN1g/I0MWHa/E1iTK4mriEiIyPFJWTGe
         AxJ7uM/WK/GA2m7MYvhhhraUyfAgAVqsYHYliwnYwsD0jOXqErmA5mcG1JwgS/rhknIX
         XipiZdKYb5hOBtLC+mBodscFXA1XrndQhAdDuMva9EjFF+/Hl7cDGyglUPZYk4hEWC+X
         7NR9UZKX4O9mje/oqCdQQPzb3gnGGFsPAjeyDfsLcJtOL9DZgIEUt9Minq7JhA8RwgTR
         oLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        fh=BOUCsESbdE9KsYtDCwYFmlHTp0ukV6vDP25fBtzzaXs=;
        b=X3a3Rak/3bDVI5L7bEXP9Anyjz7Hic538iglYMvMKR+mvx/sxfkIemcKU9EaUVmFjh
         Yn99uK1gmgo/f3rf36fsOaeqD3YxwtzvFV6jKtBujTFxbzBf7ykrPrNaoAwwTIRvzGO6
         4/pGsEhqf1XWyNYjXUGi6bKGdWDwZ0yDxDbhex/nhT9Nsj4M+C3AZCD1FeEh1cXv0pRW
         2m6iztj2FtjlEEpCePStuKdXvG3q3iuv5+gnjTtM5ZcTBwd5cUttD3bFsJBaq5KXMzpR
         9P/o1cZJoU/HpjzQ+OqedtZsX7yKyXFLil4qkEAoRS51KEKmRBQ6qvUrN0ARmbEcjRVj
         FFJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794722755; x=1795327555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        b=hdM2pJetmcG7lbPfxmIHhMMbqalBSLiK1OfCAZJnDMlAl4hBUxie8rKwzuvG5ylXVi
         rBAcTxjUI4n8WNrDLkXJHncNqH1HEBjBGPWpnA7sLaJmEqz/yZ/lVzfUeQKl+DQ4yQ+d
         3+NBBaTn67q/aZcZKpnjRROVcoAxlvwMxcC5+GyVPq+DYS3Jpxqfz3jdrIMB9MG7FXKE
         XEGVOXSnuRR/ItZXUwkcXbbZnQH8SaNU+ns9GsPOVBUtp6nI4wzZJHAWtehYg0ot959n
         69RcXAJ4SkKHcrB2oQwRIuq2mAMMUPzQDsCxHCN0FZDTTAIO5ycMTxgQO/mozqN4ic2+
         c0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794722755; x=1795327555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FITseE7Zv/1l8cq3zgJXnN24e0Fs+RVp4x0dpZnQmOE=;
        b=gDcEFYTP/xYNXiHokTiw1SuKy1aMIpgI2Fdwscz6IXDfNKslSqasTxbM1sYTlab5oL
         eczxYpLC1FsFEWcWK6gahzJ1AAQomKg4k8kD5wM1f+eApw9ywTHBIU4gxuXLH6fmpfoZ
         8HQqgcQ07VE66C+yCgP7W7WY78VZ+PSdo/tDUp6KdFGQpJDbjgwf60ygfXr6QDC9SbBi
         QMgLDPi9QRtWo7Vbbpbfw9xOcya7o7hypxQdMPYMCKIVybE0dWduKIJFKWrRWBlOXXtB
         KRClozbqbqfrN1w+9ks/Wb9hYrCbRK5FVWocSytdMbuhezSrewsSUyV8vGLSz1mxNBdB
         DbHg==
X-Gm-Message-State: APuU4Z+/Yhd/5le6+qa/FZwYT/pWs5GyRDgAFnTtnxJBmr00mau2mdzb
	8Y2iM4iU3pL5bvpcwVpUT2xa7k4WqxAV/7zH58VfS4eurhWF2AXlYJmpgoTbyszD+X9H4cJxCm/
	X/Dfxk+9prGmqncpi6dAYaqSzBRI5sBt/P83Bwx0=
X-Gm-Gg: AYBFou3Bh5f/ttDUSwKCsUsPvOw5Dk8yznR70ZI0sP9Cz/RmCP6rzXpymt6FjP8eZg3
	oKrhCkr/czuB2bUvBsJxRE5uRHuVUOgANeBnEpB9JTpx+wTFvidFNofb6KJYzQ/FrSesYcRZfKM
	djS2IoqJmgulmsX58VZJ7XlqHZC1elO85KQiEtl10DLFiuM3EnN3EdkdG1rzIScDFs35coX8p0m
	4nF1qHQ79RxZiQPnT2yJrw+X/a6qgRrX+IGtTUzaoMXyZuYujQxYS/t2pW5r5DI3mOVTkO4KaOp
	/7lbwzc444/ojdbPgXRAnmJrdSDwCFhXRkq7esHkUTDuMVh5UZ6vKf2OJDSBf4P3PfQNoxXY86R
	wTW9y7gPRgFAMEJa2iCWuNbQhCi/0Sxa4LTEiXqpnNuVq4ilA2zb4hY1N8XIi860lhNN7yfWqpn
	mhSOWrahpGhCUorNNm
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2334548d50.45.1794722755338; Sat, 14 Nov 2026
 22:05:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194814.188536-1-asiyee994@gmail.com>
In-Reply-To: <20261101194814.188536-1-asiyee994@gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Sun, 15 Nov 2026 09:05:44 +0300
X-Gm-Features: AclHuK9cK9SDzr5t64Hozu-2vcN3fjlBKrtXR2hNhcl8zQPeFczxV_7C3mWbcDk
Message-ID: <CAK77STANn3cS4-=mw59_G31_kFLyVp51N==K9RcikqrYzd4ELA@mail.gmail.com>
Subject: Re: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Just a gentle ping on this patch.

Thanks,
Muhammed

Muhammed Sariyildiz <asiyee994@gmail.com>, 1 Kas 2026 Paz, 22:48
tarihinde =C5=9Funu yazd=C4=B1:
>
> dump_queue() finds the message queue's stats by brute-forcing kernel
> indexes 0..255 with MSG_STAT and comparing the returned identifier with
> msgque->msq_id. This misses queues whose index is 256 or larger, and if
> no match is found the loop ends and the code goes on using a stale
> or uninitialized struct msqid_ds.
>
> The identifier is already known, so query it directly with IPC_STAT.
> This removes the loop and reports a failure if the queue cannot be
> queried.
>
> Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
> ---
>  tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftes=
ts/ipc/msgque.c
> index 4b4c1ab..f4168c7 100644
> --- a/tools/testing/selftests/ipc/msgque.c
> +++ b/tools/testing/selftests/ipc/msgque.c
> @@ -130,21 +130,13 @@ err:
>  int dump_queue(struct msgque_data *msgque)
>  {
>         struct msqid_ds ds;
> -       int kern_id;
>         int i, ret;
>
> -       for (kern_id =3D 0; kern_id < 256; kern_id++) {
> -               ret =3D msgctl(kern_id, MSG_STAT, &ds);
> -               if (ret < 0) {
> -                       if (errno =3D=3D EINVAL)
> -                               continue;
> -                       ksft_test_result_fail("Failed to get stats for IP=
C queue with id %d\n",
> -                                       kern_id);
> -                       return -errno;
> -               }
> -
> -               if (ret =3D=3D msgque->msq_id)
> -                       break;
> +       ret =3D msgctl(msgque->msq_id, IPC_STAT, &ds);
> +       if (ret < 0) {
> +               ksft_test_result_fail("Failed to get stats for IPC queue =
with id %d\n",
> +                                     msgque->msq_id);
> +               return -errno;
>         }
>
>         msgque->messages =3D malloc(sizeof(struct msg1) * ds.msg_qnum);
> --
> 2.47.3
>
