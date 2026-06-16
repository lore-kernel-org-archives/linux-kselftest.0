Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C43F23C5
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 22:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781650362; cv=none; b=ilNMOYIckAdKcNXAZoXbkEMaB+/tLwpECd/INotz6ADi5/5MMbQscdHwdu34X/Lzj7viYwht+iidDh00Rp0MDRS5b0dgNFNredrhCmwbSRn7uFRqQo+XWLgL9NZHCzcAs8Hps3Wg8mt3FCl4Ewj6WYy4Uw+fpLHA2i5eTh3VCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781650362; c=relaxed/simple;
	bh=yOTU6w139ebGNpr1jYhz4dm0//DwIZIeTHbPxC1bh10=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=NMcvBwsrTiw0cJUwpH3H62hea1J3ni99B5bydVIQRN6EuHSvH6PxrRqw6OXGdt5kk0aB5eNSGH6E0ukm8DgUaT8fDcFTd8Hrqdk2YmjtoGUeyHTw5V9WwlqEqyFcrWVVlmGWQqBy7vqV4mz8pafLeS9vfNIRLomP1rmzt8PP20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=EAE+UA/1; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="EAE+UA/1"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so1656542eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 15:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781650359; x=1782255159; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DnWQh/dYS3heDu56hFCU5ip/WEIP0vqTwzgJSaTXBk=;
        b=EAE+UA/1JuZCPfrxtloIW4YzuebB6PEjS1HOjyvwMadxqJyzDu/Kq8RJKgM5ZkYfrK
         7jHMc7QLrLKuk+ex+qQh0DSupIdpqQ9FQT+3GfOikxW/yeJJo1p9Gwj0cT9A5K1n285j
         xKLR4Am3+1ZB9+/mHyqJIyOjFZZvdjcSfLpQ7N0/ba7g24s0B40I7Rf/K9AvTGMfdAOX
         2qsunwapaMeV++1q4LRw1aaLp5Ra6mfZtWzjHTaO8bV3N9H4gJ6s6K5YoyOhIG4pwz+n
         AkWDXO5bhxaIKQjPsfEL/hNbuXM/+oT7XOvxdFAlH93l1OXk1TJ+ZJnAbxiYazCaUvFi
         chig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781650359; x=1782255159;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DnWQh/dYS3heDu56hFCU5ip/WEIP0vqTwzgJSaTXBk=;
        b=crbH5+rOUbaomaj4vuEbmoRfRC1QSXqOzURkMmZe7LBQjlu4HG7MMoyZZv8fvfzm8C
         gSaL1HfUDa3r84yGW3n+0orONXAerUi66qqcb8UD5hc2qmDyKxAhnUvU8fggEFYFVyQn
         nfAMkJUFEp3um+DuBcIdx0E1epC2AUGBHilltky8z2Ds2vnWObI4AcvDf3kaFla7qBf4
         lKOr31C41XFEuOl3d+O6ese3WBjSrCcasgrn+iqXK2uWiGH7lfygF1u2G0WKFtZVwHOf
         zIOSh0USirjjDeeHLO8EITgX1guOZuMXq2QmrDKE6IZjwwOio895pAE3QQBmYwglauLD
         3i7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zv++lrIjNDfd9hbm+TQEHYF9p1tEWtPRazwSVDXlY+OV4mImrPKJwlgZx3oZw5u4dsIDWJmwPzcXMRDr/DtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXo74XPkJo2s6Kj8pQPpIDIawEFoykFZzz99WzbFgiksTNhT7
	TmaoPwUoEyAbFnliA61Q/ecWh/GZt9pVCFdscUR0i0MGCsAAE8WXsAlFXO2ReUbl2MI=
X-Gm-Gg: Acq92OEBZkXy6Xh5N2OapikrEPXAo7WZdCiAmEsC5i38L1ceAhIo+DvZSbeXJgQ8Ce1
	97M/mJSShiVts+CVp7ejKFtVIscUvwAWs5RNQ/y3+MRPr6HMH3iR5sfwB6Cz68xtRCZA2f+j1Vq
	JYyQ4+mRN3YuQTRnSrzNO0OX3rPxkcYzfsDZAj4j3MMKVOf1RxshjVR4sWlBnH0GDgs0+IwoIt0
	1x7laHQu90aZWfo9GkHwE/IuWBqzfKJzs+EtiJoUpumDILAb7F0xkT2EBLG4P9m+Fs+Ca/t1QtM
	27M9TYsrsmhRL/4BRddQuRtIxKuaOTacCwq5h22RUgoIUdl6gxokPMgjNt6Kr6d8YXgqmrHtw+P
	qVVjV9RWX2RGmWSmJr33D1vejjO5Ai8u47US0NvxdKaW1Y8TJMZ/dx7y+eq18CAGQY452xRJIdJ
	s6jupV
X-Received: by 2002:a05:7022:ef16:b0:136:5c88:d928 with SMTP id a92af1059eb24-1398f6c839bmr483612c88.19.1781650358897;
        Tue, 16 Jun 2026 15:52:38 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbcb11310sm2725155eec.14.2026.06.16.15.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 15:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 18:52:36 -0400
Message-Id: <DJAUCAF948QZ.1YW31SG097K6C@etsalapatis.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 <bpf@vger.kernel.org>, <linux-input@vger.kernel.org>
Cc: "Shuah Khan" <shuah@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] HID: bpf: Fix hid_bpf_get_data() range
 check
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1781627122.git.chenyy23@mails.tsinghua.edu.cn>
 <783681f27625a11ed58f00221be046643232a2fc.1781627122.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <783681f27625a11ed58f00221be046643232a2fc.1781627122.git.chenyy23@mails.tsinghua.edu.cn>

On Tue Jun 16, 2026 at 12:35 PM EDT, Yiyang Chen wrote:
> hid_bpf_get_data() returns a pointer into the HID-BPF context data when
> the caller-provided offset and size fit inside ctx->allocated_size.
>
> The current check adds rdwr_buf_size and offset before comparing the
> result against ctx->allocated_size. Since both values are unsigned, a
> very large size can wrap the sum below ctx->allocated_size and make the
> helper return a pointer even though the requested range is not contained
> in the backing buffer.
>
> Use a non-wrapping range check instead: reject offsets beyond the
> allocation, then compare the requested size with the remaining bytes
> after the offset.
>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> Fixes: 4171954f56fb ("HID: bpf/dispatch: regroup kfuncs definitions")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index d0130658091b0..09b45c40d84f0 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -299,7 +299,8 @@ hid_bpf_get_data(struct hid_bpf_ctx *ctx, unsigned in=
t offset, const size_t rdwr
> =20
>  	ctx_kern =3D container_of(ctx, struct hid_bpf_ctx_kern, ctx);
> =20
> -	if (rdwr_buf_size + offset > ctx->allocated_size)
> +	if (offset > ctx->allocated_size ||
> +	    rdwr_buf_size > ctx->allocated_size - offset)
>  		return NULL;
> =20
>  	return ctx_kern->data + offset;

