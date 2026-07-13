Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62224413258
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947934; cv=none; b=IOP4dq5Oth+vaRwGJjqMsplD11ywICfqIh71tlN5htTrLYo7j74GIOTGo88zHU74ETRRbb1UiSohWSXtRcL4pm2c8EMEb3tdRzVPN5Fz6i2yd4D9X4jMrENdMgO6Vi+YfNaiUxheAtfU7dEBOsFtXRXPohQ/wjD8TeqgMWqYSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947934; c=relaxed/simple;
	bh=0JP8J7BKJotN/4vWt/ni5Dg/VvICWn/EZBXYPOSRj4k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3RDRDpIGo2MfFy4afl85XRKpbGtUrZGsgczx3fvKIEW2dIa3E/NMjqpPNVyYKTU+KAcEPzcwRfAsvYg9YYF0k1DA5bJTPqDugJS57rWly9m/pKrrQT3h7K+350NaLLhMqmaaAZU2lzcFJBTjErUzyizUilgwe/mCieghWLcE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXkRtn54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXkRtn54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11601F00A3D
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783947932;
	bh=UAaKnczb/OrYznqL3SeD1j/r/gLK1tWSThn23E9KHJo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IXkRtn54FRx2ASi4TMTUn2ApJST7eSIJUO4rM/8EXXJ+hKFbaJlfxnWKmSvjHhfo1
	 gZkKIQlTxSN8gEQ7ZzbecTxiHpnvYaFv2eqWeHwtqTTrpvFE3Qe5Q0zmGVM4eKTJVG
	 8Prp14MpshX8J591wdkmyFJpgb6xGXuHzaok6msFwdF4AeByFSOIHWX2/NVK3cj2W/
	 TVBwq70b8tBViYGbcX9B3Ua7XqLJqxujieMMVuIRotj/MeH02HqKW5UyOLOeB1Y6Od
	 dvEUjKrMvPHMDHF1YkqzB0TeQHeSdPb8r6y+2xdIo40a1sZwD+rUjsl7GQkgUhLIDz
	 PpYOP1zRsotEA==
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca88130e09aso2101954a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 06:05:32 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywb5eeWawhg2Q72v+/gO9v4SFgkpJgZ4EZS/AUZlnojb0lb5Di+
	8Sggdc0d0xTBwttmkQnyonteiJIHZ4F9C3gJf4g13q6h+GrBusFgvtnBrf7gLU9vGOXRyuNYs/I
	NiDc+tmfDN3w9wqGnKlWFZCjTsl3be6wb56v9BfPL+A==
X-Received: by 2002:a05:6a21:a341:b0:3c0:9c18:d5a8 with SMTP id
 adf61e73a8af0-3c111079720mr8968957637.69.1783947932534; Mon, 13 Jul 2026
 06:05:32 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 13:05:27 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 13:05:27 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629124245.27674-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629124245.27674-1-bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:05:27 +0000
X-Gmail-Original-Message-ID: <CAMRc=McRtnn-tB+baFuP5R_k9GMnKx1jQy3WE1Uhddgj2x4U7Q@mail.gmail.com>
X-Gm-Features: AVVi8CcJTIWk1Zn_Raq1mJPiQ4NCjteR5GkgjE-tu4Me_Syy0rwIM5vJX-GOknw
Message-ID: <CAMRc=McRtnn-tB+baFuP5R_k9GMnKx1jQy3WE1Uhddgj2x4U7Q@mail.gmail.com>
Subject: Re: [PATCH] kunit: configs: enable GPIO kunit test cases in all_tests.config
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, Rae Moar <raemoar63@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 14:42:45 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Enable CONFIG_GPIOLIB in all_tests.config to ensure the kunit test cases
> for GPIO core can be built with this config.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  tools/testing/kunit/configs/all_tests.config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> index bccc2c77196d5..6825c2e855a55 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -21,6 +21,7 @@ CONFIG_VFAT_FS=y
>  CONFIG_PCI=y
>  CONFIG_USB4=y
>  CONFIG_I2C=y
> +CONFIG_GPIOLIB=y
>
>  CONFIG_NET=y
>  CONFIG_MCTP=y
> --
> 2.47.3
>
>

Gentle ping.

Bart
