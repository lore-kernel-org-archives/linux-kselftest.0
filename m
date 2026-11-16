Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794797093;
	b=UpfysxgSs5rmhtVAWy+vKO3jVXtap61WVH1fyOrO6x2a0gcF6ue1kHR8fojQAp7biXl+
	 17YN7pOFtys9B+gQzOkaAGNYQmnPIQbdO1uHrxQhZg+Cz8ve26RPFRtG42ABFX9fEfyAg
	 Evv74VUVLn8cYOPChPAZ4l2wRP5yhqgKNZE3QtKgzrXuaUTwpmCbd975DxpNyldCXAyfC
	 4pjlQKu1ewOueSZk9+us6vqqMbovM0TH3Xfg3n6rbcuNFiCYHlfz1i8nIQg3aHVRodJgQ
	 mu9NwL+jh/1sShl7WJXOZwS454BIbv1GFpQaeCEZiF+18KYEfjsOD1Xyqdl3inqLuKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
	b=MdTmhnIwkcBk9bjxmCvgTARIUeYay+WX9NuJbmUCMvcNkGWxKO6wrXvj2F5fPiD+ZQ0I
	 a2K0DlZZguIBLbG/ktKRBKhBOlesFTtd5843OtL5qHmLR185iyv2Lxb1L8C5Hu5418VjB
	 GFm+uSJOY69I6add2TBFLVPoLUExRwTnzKsAKsNP8432nqPyLcX39drH227hsFTZ0DC0c
	 rKVCPVJc9wUZGO6drjggpRirquRVVwCsuKackMhf5h2zYU86pn71DRIHg/qNysCfF5DEt
	 kG1UZrMbeqoXZc6JzvWabKNSA506P8sYvipFOhPL5SvqeGpeOO7OwvK04SYNMXTODkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E5606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 02:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE9E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nFGwJvQR
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54492d8a988so226121cf.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 18:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794797092; cv=none;
        d=google.com; s=arc-20260327;
        b=sjqEkc1CjRxtnjkPJli4noInRpQyndNkxdMatpaku6kY5HRwMEeGIrz/NVsL1be8ak
         SmPMl1tlrOQ7h3xo8CjD30q5dunHohZB58o72e3NvKqME8WO6s/M7IOqQHhI3Q6olVkY
         d5Un2MQn9Oj/F15SWZb129rVzPALhZRqK3WS2rESw56t2raXXUaDDMlKr4vwu4NqAG8T
         IKAfD1XIfX6aVHbPjtbkGSFDENQcFJ9v+jGAluW9fNbypsKK3GR5F/sYvEuG8Yxoh/JT
         z2mA87GN2b4Rff7O1+ertaMJ293xJkM6/HNve1+cWh0Dx0p91kW6LuBgiLvEBmSRvf9J
         77Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        fh=CkY8Av9a5lmON06ucyA+W3CNclWK/UECBTpLwPaKRq0=;
        b=hMTb6v1GQqTDImODFJXhbOc4DdGCvmCvkofGacPCmUcYYZlKNL6M4PXvEYprR4qSL6
         +JRbzuDx8M66vJdUemlKR2VWTygKj00zhBdeuQj7GIQOvoyGGZ/wV8WiEssWL/Umqp4h
         Db+UJ+lHa7X8JTQm1ABlyKRteFA28XkPrO46lrhIyILRPnRxRtv1YPGlEm7bd1HZ2V2F
         YCLVtUGWQQBTwkqUt0gGd68a5GyY7rzPVx/hk9lBR15PUAKdDovXdCgxjdkTOaMpiTKU
         WAH+ufp/OZOsuBzTCHQF6qFomYJ8zHrU8kSsLZyzJpFH4EejdpPcw5Mm9wK7OwL72bKe
         vZgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794797092; x=1795401892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=nFGwJvQRRsHhvwfmdSvYfqBZw+cwMsVDENRdiit92dHTa+7O+OiIcMa1sFUe5aj+gV
         0arE70K4hM2KQEnQeyVZ3KwVQ7LSUSlFUphhAo8u/ggapG0bMwsQPeKcDnoGP0F55hDp
         4YgoLKjJcLaqOl3iwtNpCKzM3pTB9gqovF2Tfe85YMJiKuPCSgUFSqB1VvncglChRX4Z
         DnxE1h7MeVn/c1AgAC3Bt5zC7nov/mhM9bTKbn7r9TPAfAZ+qRZRQdTetJ3Xtj55ocS4
         3SmNPRvTlmMZS1B1sWIAVj5WbHuhzjvrKl+4LOf1YMHMVRouDTiyQfv14TVJzdW2x7Dy
         GRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797092; x=1795401892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Kly0eM9XbBDovJgfRouCKU4R9pr6Wk5hOGGnjCgSkY=;
        b=FUo3Q/lPkE+Qz6OcK70uC50Og3sAr0Rz2IZcGk/yabxIQUMyt3RmDWwnpatx/JAB1e
         oauUgOArXOQt8+TuIrOymUuBkhgF3Xm3iiVHregaS9dFeVAry0ZwI277HEI9rxrSg9xD
         gA7UOKkQ7y/UBBDuDRM63GHjO9hZaxW9PDvgv5v/yAJfIHN7+d7mFOjkOcKHcOyY/tuc
         LDbh2nqQouSqH5fMVgbUk4nMJ7n07OiKEpEXzkz7EGaGms/qgiWfkPh4qWwbcli67xq8
         e1wpalrAgbaQbtnztcqVjTA2onY6wi+ndshEm+NAk0KuqKfpqljkn1mIQvhbRQh8vwhx
         shJA==
X-Forwarded-Encrypted: i=1; AL+hErHV8I1zb8cVXJea+uc+tlc1N19EjiLKxdJL+0bstye9Lai/pjjHy+ydyojTIFapIwR8NetlYGTj8LK9r8BmujQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VBDofnnN6OwFWoplUHTUQjh7ZaN0ss1MhJX9DbMzg8GrNZRse
	i2ma7+R+b/Ttoeslelk/YJ1Y8KW5V+4SRj7H/IyLIYbYVpPk+9y1RuoHbrnpJc6ArfphTfYc3eX
	G2aom7Zy3i3HanBEuuROzYT4B/vtG39tbS09pqKLJ
X-Gm-Gg: AYBFou3Ps++Zbl/4AyEMpkQIZvaOSbP25W048xuVIkmjy18N4rd5EDi1xoQNx7imh77
	HKfAq5iO0PWqDIZZQxk4cls8VOKc1zjFrEUbKTf1ztk159nP5YlmymR2MSTN8dSLaS7aklXwlpW
	FlF+17dgXHIgtaUiHZIBmM6jih/w8tiKk7HWDLxuTfCdj3iK87i2xZxr7mugIpcwBYHQXBLZFY9
	MjnQw/uutW96Q/UXdCIJLqhC7sgIqaZouxPMu9vuJvWkOyRW/IEL7Hi90U1zzsNBjhVuq9V9cvN
	csM8hyg4nfr2l0LOFRnonV3XTFOTYNXy5hT/KrXQtgSo74uS15zUr/auNCeS2RKXtPhSJQQgjEr
	CcFHXUuzNxWU0la0BfHcw26EoBwW/gPe5njc=
X-Received: by 2002:a05:622a:a06:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-55c682a8a6emr25827851cf.14.1794797091092; Sun, 15 Nov 2026
 18:44:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
In-Reply-To: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
From: Wei Wang <weiwan@google.com>
Date: Sun, 15 Nov 2026 18:44:40 -0800
X-Gm-Features: Aa3M54o-0Vkofupcnn38JmSI-OGkOkHMmrH1O9tJZwmSDKKBsdojHT-nKCZT5IQ
Message-ID: <CAEA6p_CXNCgmq0bz_mfuehPGaEx-GwcHxdNVBSBAAtqB0nfMrw@mail.gmail.com>
Subject: Re: [PATCH net] selftests: drv-net: psp: skip unsupported versions in
 netkit data test
To: alexeys@xsightlabs.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, guyt@xsightlabs.com, 
	Lior Yizchak <liory@xsightlabs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:03=E2=80=AFAM Alexey Skidanov via B4 Relay
<devnull+alexeys.xsightlabs.com@kernel.org> wrote:
>
> From: Alexey Skidanov <alexeys@xsightlabs.com>
>
> data_basic_send_netkit_psp_assoc() runs for PSP versions 0-3. The
> non-netkit data path already skips versions the device does not
> advertise in psp-versions-cap. The netkit path does not, so those
> cases fail instead of skipping.
>
> Version 0 stays mandatory. Skip an unadvertised version before opening
> the PSP connection.
>
> Fixes: 43cf629700fa ("selftests/net: psp: add dev-assoc data path test")
> Signed-off-by: Alexey Skidanov <alexeys@xsightlabs.com>
> Signed-off-by: Lior Yizchak <liory@xsightlabs.com>
> ---

Reviewed-by: Wei Wang <weiwan@google.com>

>  tools/testing/selftests/drivers/net/psp.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index c114d2245135..7c8fb2200b39 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -728,6 +728,12 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, =
ipver):
>      """
>      _assoc_nk_guest(cfg)
>
> +    # Version 0 is required by spec, don't let it skip
> +    if version:
> +        name =3D cfg.pspnl.consts["version"].entries_by_val[version].nam=
e
> +        if name not in cfg.psp_info['psp-versions-cap']:
> +            raise KsftSkipEx("PSP version not supported", name)
> +
>      # Enter guest namespace (netns) to run PSP test
>      with NetNSEnter(cfg.netns.name):
>          cfg.pspnl =3D PSPFamily()
>
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261115-main-0b37fbe5e1d2
>
> Best regards,
> --
> Alexey Skidanov <alexeys@xsightlabs.com>
>
>
