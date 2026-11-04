Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805891;
	b=POeAeRtb4SDFDwn/jX9+a3nuOAQ5g3OJnMhlWixGoVf6dqlhBzUymqErzaam653PMAyH
	 Xa/PJlWfQNvxMkaDrNwzMY8akEdkYg0EDgwB1gu7EEaXH3pqepdhnRX83ATaQA+MR81tR
	 4l5bJwvLpaGTolvojOUmGttAUHAuBB0Org600Ax2XMhvaWD3PfZpiyRLSz8Y5BVYxMbVk
	 txcqQD7RiBrCzZt+6ymm6MqnYvN15u08FES22jqoNHHOV4O55i/EFf+wP5F9fgpU2vrVx
	 w4hO8r8ZlPSrPkii0Df3lPMxTom/OZK7/zVsrIT5y4n8vTh8VkKwmkrmbtR8U4SZXSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
	b=LGNPwe4bPtwgO/Y0txbaDQb5mnDJLlAemW6AxixyanFUIXyKbBpsWnNeB7d8uovIkmXT
	 PhiCSsEDH9yPzeqLYjrOpvPbOyjDJFcbATlmbHZ1c+KTxlvrR/RY8eoceKLgeaJCI6LU3
	 Z9KFMdsAvUaNd7yoGbzpjn1lpxyEDMnEosn3u1sTD7pwmmCtLhXWwuZN7RKoZHo18rQw1
	 5e2PWEgiTKJ3mxjMAVcc85BMgnsfOsICaKO0iLfa9oOSnLFgJrNpFYK1vCgbZfaCWZQtG
	 6/zLE5CnvyNMYKKvY+89ZZnepKZwSqIjmOyxmQT2wGr/TaiXn4UFVwUWZapoL6A6IDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=F2FlsQEw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EE9606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 15:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=F2FlsQEw
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a6d1c66dfcso40231fac.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 07:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805884; cv=none;
        d=google.com; s=arc-20260327;
        b=RuRicrY44AcpiM42BwiRoFKTZ1aZQ1wlwDX2Lnohcs/oFyiY71PgGX5Tmr+kcnF5Ah
         5TjuRkd8WFWUaNcdjWGGbBuB6oMgbifQe2zbi7+MnOO5ICOKXgLuDTF2pidXKmI2/y8n
         3jTKR8jkklwZcWx+omtySSMtzijpYRU2iAfzitcqYqrY037NDumiInqpeUDzCMyXQYe6
         X5D7j1sYviTFVEARXMDnTdlkPJSiZXpfbYBITWpqAVofktJR2klZgIhVzLZpnxw257Mn
         AGfSD8JQZs8zcA9cDwFNOi6qDKNsbMn3a/4Y8XAm1zAeGugTo3vU4k2cDV4UOcZVIa5c
         9Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        fh=J0cJzA9aDsZ2t6a7kPWI/wENSCfzzY0MWG/bsnNOuxY=;
        b=akInVuIFtaMnJKMr1hYI1i4bjakzg0uiL6jxZpAmkPfK7YrMxyxyRbnNySuGddNZ2f
         +3jiGkrJqiDcW9CYBTyvU/KyKLryt4fOQ3+HotiUFX1yXNKJ5H7yKojO26ZiElBLJfc2
         RrBE5VktwrlMKNIPZBfKAF8b8cXzRmUBfxW3aKQz0uUbDbZ0HHxJwyHx8cN5GTgFJOUa
         ZW3vrtYSnPV2CjEWsAXtTqaxJOHQLv+LstIoEp4APedEq/S4nVt5PFqbNZxqUz3a9IMU
         ET/DGanRxtBQ8Gx/485W1iTl1VUjfVb3l5Kt8hD560vGOR6/sqvfoh2w0JeKbSbbyZZI
         a60w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793805884; x=1794410684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        b=F2FlsQEwuvngD0Cs3xUh/uc9NpdhUow1/QhCVrIX6rEcw4PgpCGa6Qy7QfVlZOf8eJ
         2ELX/a1fHRXZyGSXTaDoC0QtbeCd5xbShvqfew/jAuwifMw+Zf742BHoCyqeTTiaMCOJ
         UbT5ILvHZpsOCOcp0aKMIGxYBpY9OMXYlo6qL4WaZsaFHuPPKKICpVYqN5b8GDz5XBj+
         /XjT8VpWUEw7P35P2OF4ep/XAtv9MPJxxz/NL3AJhJBrLY7YyqAi5eUP9zfG1dWy33SI
         /3FKa7cAs/q+meWYCL9PdjVcA/+uZHYBHh0C5woYIDdVkZfKjTcCR1jchUfA+LouX4gg
         5pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805884; x=1794410684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flDP2peFOVzNvXwcnvbCxj5AquiDajQXF7kcyM2P/Mo=;
        b=Drc2VCTPIo/Br1EkVKrQrEwNK45vNAxirnCLf39uY/o3WgQCkT0yY8SpMcly6LYIHa
         cEIOWH9QWWg/ZgWrFWDEOaYMj8K6LosaQu2kPSVyK87l9k26WYt69bdvkiq9ePsh9UMq
         3Kay5mcB3d/1fmSSHduX6RgpWARZ0ns6pWsQzmyQXlGM6z5Ee2BPncAS6iA7tno4WBYr
         vrrNGqKG2T2UckHIv+csFQERW2scOY7wdKmY1rRY5R8VFexAqNW1cT3B0nyK38MzTime
         qoTS0glE+Yk9xhy+Z5AEvqD6DZnRsvdGRq4PussNAyK99ajqqHalmZROy3HotMNGVRDW
         Zswg==
X-Forwarded-Encrypted: i=1; AKwUvBy2gvw5h9Kq70H2R2hhwQBgDQPvAUHA5ZdUw6MuhYtDtXezUp8QDtdVddGfENZlqlKOhBMfSKYTNnCN2vaeiQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jn1OijluiTMMqKLUxkX2sK6cuV71gDchEtOHOQoD8fdXELGpC
	FXprvSmEA79WqVlHyOTjGZxcE+gTHVHdlu3Xf8uF8MMy1Yk5kn1gViXu6Wjn+kcOeymMXlU7NhP
	YdCQjc4l7HJn798+J5FLWeLaAhrd2XPAKq27kN+yIYA==
X-Gm-Gg: AYBFou2cbk9TusTvl1MM+hmHV7nJE7rlJ0VHXySjkPApXmaA23tQUaRC8T1YNxbCV+f
	wDLjQc5LCD2g5SZumlp1pkOJb9IyRRjuD3GqUDxCGFZNYY6aDEzpORT2mUWB2Ppo6PW6fkaRkg1
	KDnuoxdDnaaq/h0nCr0+RG5kbnq99ZlpqCskOC7H5xrSqVzkWyRjyhiRIu2UFhavDQotmb1GJLF
	fJr4mIC73lKIIUBJPS24Wu0+sfSx17ODn2lE17ATZWT5E+SJEndYnv/RWPMsVIS3pXdF/7WdkWP
	gVsngbnUbQdxQE4gg1jCxpIOE/Dj5Ob5ZPy1Dg2xq7EfCkDwJwV+vnjM0yx0Dwfert4RSAijAJj
	vFCEj+xsVyDNCx3OVsaeHt8yQx0fC8jC5bqKw
X-Received: by 2002:a05:687c:40c9:10b0:4a7:fe04:7dfa with SMTP id
 586e51a60fabf-4a906c5ce81mr12210477fac.0.1793805883319; Wed, 04 Nov 2026
 07:24:43 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104104909.129656-1-thuth@redhat.com>
In-Reply-To: <20261104104909.129656-1-thuth@redhat.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 4 Nov 2026 07:24:31 -0800
X-Gm-Features: AclHuK9voeX4CroBKewKkDb-TCTAm3mHMofh5zqgIby-6JO5pA3M1-VHQAtqXLY
Message-ID: <CADUfDZrwgy38Nt4bFeZd=nfHAOTScy=1PKjanTAoUFzUkydkbQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: Fix include path for out-of-tree builds
To: Thomas Huth <thuth@redhat.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:49=E2=80=AFAM Thomas Huth <thuth@redhat.com> wrote=
:
>
> When building the seltests out of tree with "make kselftest-all",
> the compilation of the ublk tests can currently fail since they
> are using the headers from the distro instead the headers from the
> kernel source. For example, I'm getting:
>
>  kublk.c: In function =E2=80=98ublk_ctrl_dump=E2=80=99:
>  kublk.c:190:27: error: =E2=80=98UBLK_F_IO_DESC_SIZE=E2=80=99 undeclared =
(first use in
>   this function); did you mean =E2=80=98UBLK_F_UPDATE_SIZE=E2=80=99?
>    190 |         if (info->flags & UBLK_F_IO_DESC_SIZE)
>        |                           ^~~~~~~~~~~~~~~~~~~
>        |                           UBLK_F_UPDATE_SIZE
>  kublk.c:190:27: note: each undeclared identifier is reported only once
>   for each function it appears in
>  kublk.c:191:53: error: =E2=80=98struct ublksrv_ctrl_dev_info=E2=80=99 ha=
s no member
>   named =E2=80=98io_desc_size=E2=80=99
>    191 |             ublk_log("\tio_desc_size %u\n", info->io_desc_size);
>        |                                                 ^~
>  ... etc ...
>
> Fix it by using the KHDR_INCLUDES from the main selftest Makefile that
> should contain the right include path in either case.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/testing/selftests/ublk/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selfte=
sts/ublk/Makefile
> index fc64b8f028332..ba6df7c0b530b 100644
> --- a/tools/testing/selftests/ublk/Makefile
> +++ b/tools/testing/selftests/ublk/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -CFLAGS +=3D -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)/usr/include
> +CFLAGS +=3D -O3 -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)

Sasha Levin already sent a patch for this:
https://lore.kernel.org/linux-block/20261103130131.4069212-7-sashal@kernel.=
org/

Best,
Caleb
