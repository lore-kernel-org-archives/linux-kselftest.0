Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860007;
	b=NhmbkPvfPa+TqfE44D0gJiMz24Ndd7OhFDMUscDy6g/yfzMh3zieQeyrgvcWc3tbpmUR
	 nPpV7G54lZAEs2W5VTWLw8JGA3M6l/cOjcxUAYaWkXLb3A9zJArH/N6hkbqgobSUR9J4x
	 nZkEXgMCKMML9G/5YoAcPHlzjEZg3LnDjXGHKtn5E/LMLKFjKwnAN2QVZFDv73M82/8GE
	 x0aJjV5w3Jxb6sqD2n+Bsa5EZgyn110G1itHprML4kML73ZDtiPMbZNyDXAUmHDnDvYzE
	 ZR5QMLzMBdy/D/4U8lnM/Kn6PrQKKIVkzZMYkubCueb1Tibj+GwkWzMKjR5Fo3EeYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
	b=ICRdfRQakdC0SD54FnZ/4vcIwlSgF7UJGME1vWDu33YPcCkM4fwcnk5TcW5jlHnbeDAu
	 zlfgypFrSXQdUhOW3S3WxYvykAuDwDeZ7H/YZq1vVC0z6W4DeCU+pOHnKRGhd/xD7SE8c
	 80GnKoy9SxYrU/vwTdrR/weF0F+/Sk7HZmcQ1i0UjnJuKsikLE8jhJNG+stbFRRinlbNt
	 F+AbAkZHhYa3/Zv41bnAk+DpG8249YBKm2d5xHkFJthU393rdYukmRlEBYi4Pk1oFdT18
	 lfxfuFoqu89sm3Mi4qRMvphKfRkzQShVk2MaYFqieIBNvJXeEUVendmVGhyPRpzgN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1EF606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so1071989e0c.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794860005; x=1795464805; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=XHjrS7sSi2aqtED+FVb0XnW5wGyB8px/TKyLxVErtD3ox/FRWwyDCJ7jml5uSMAvu4
         uU/iCNmdaNfMlSE0iz4MepKlSU1k4cdIi3KFDdQeK1xdRJ1i+2Di3a88QzJVc8TpT2eU
         p/0jI2fPQPmmmIkwmqi64abnaQSYKKoMVxWMyiP3dppxD6JK8DSfpQGHQwFKPB/5nFs5
         vasUkWbpzxx0i/SQDIQSGqXcpdrdkYswa4fLsdD2xSOxtGPrjqjbyY/Y8zdJFuE5sW3t
         olWQIO/RWE/whXGhRcsoxuA73nVd+Bmr5Ikn15yXVV1wRYAIqptPFchxhczFTLu04ihn
         RDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860005; x=1795464805;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=gkxpS3mOtxYprs1/Ntksot7Hx7qw4PLj7g2XBBxM1YHanxSu21TeuU+ZWy+d3SnBIx
         FyP9Bn6hCZqkfUkWGcIppl1iYIyGteR8kHFPhISiXqa/9K3m4px9UUt8WubhBLxlcY93
         V5laLG12BiyewYT+5OpNAUO1Bb9CUzS0BJDudqYv23KKp09l5nDQbfhXcNyWh8KjNgvF
         +vGtSGIcxcUai/RrmN98ZzSEOfq5Ic9TuBTSgxpHfyc9k4wzYKwXQ2+naUiY8X8MhaSs
         uCP48OKumZcf+HOXB1ux80drVkmvO1fZkzP/qEc2soN6LyunRB7YxaamFrJb/irSg7KU
         ZFgg==
X-Forwarded-Encrypted: i=1; AL+hErGU/+jtVoVa12pC4aEnVy9ukZtilvrTIGWcK+0tRTHTltyYXTlETyXv2jfHti87iqBD9avbBMyZAM5XAi50Ckk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k43xr/avycfG5dAsQMzrMMW/DPFZJ6fFmOb2W9C6JjpLXq+C/
	zAuKYbID8iATXCi6OPZjNYOYd7XSGbzC71+c83Wd8gGOYMQyw3V6aXP1zIikSsiLPNw=
X-Gm-Gg: AYBFou12gSNiuJQjjUqRDrkbJp/nHQBTuOto+go3ZyJ7bMELkU4w6piv304LVwGzdKe
	v3tMYzDcqH+CVq4Rvo0DmmPvrelM+E4zCeaHHdQXdfAFIi6J2MNdXhSJzUTLrocI03AlMnIQhlH
	jiB96pRKPaLSUrO/YOb5HyRtPd+8SCe0Mh1MSZ2/ufQOpXIi5JQ3nceVvXRH2G7d3+UmHWCajWR
	F9WQLldShxUAVPFrRV6GzalZ1IqfFgN/qVLhPht2JGTlOt4dlgHptBeCc9aea+eRC0oWKNXQMVP
	v92k72djQJrxrLr43WzJbibxMutX9Lf+ezWLmIWyI8WtnadtimwegllAwhef80lJUSdGRQrfQgJ
	v9JsXRWiTkC1qyXUv2aKsIGjPoTxkirzlY6hZlFEjKUKTbdiAx4cuLboeMqZdmQKeDPQSTTZVVX
	gEUcrbvxQC1fww65RMdBvZ/xtCa0IPJbMgkrjwSgg3aOb82hWYok6bbQisIGRLUk3UCMLYaukWH
	7Ce5RqdgyWCgaiitwhWbwe5JFics3yZvMvatx3O4+4bvL1Fmof1fJ4uxuA3zamzsXhAuuV/ai5b
	bnmRkQrNbwnqWztyeHfDpk9YEiPqoQ8aKzzqJ+jYGAKPZOg8q/hRu/9ryQr+U3sMpL5NpEzsDi/
	qQwJXnl3XyCnvKOGLOCdBTxn4K5J7FywIS0P36aQKkXIoP07iNJjK
X-Received: by 2002:a05:6122:3c4b:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ee34aa9574mr3361794e0c.17.1794860005139;
        Mon, 16 Nov 2026 12:13:25 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e031bf0sm5639266e0c.5.2026.11.16.12.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:13:24 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:13:23 -0500
Message-Id: <DMWWRQTLNYH6.1LJ2K5HT60LK8@soleen.com>
Cc: <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 2/5] kho: build KHO objects into a single kho.o
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Alexander
 Graf" <graf@amazon.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Tarun Sahu"
 <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <20261116134013.1636689-3-pratyush@kernel.org>
In-Reply-To: <20261116134013.1636689-3-pratyush@kernel.org>

On Mon Nov 16, 2026 at 8:40 AM EST, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
> kho_block.o is part of the KHO infrastructure, but is currently built as
> part of luo.o, which ties it to CONFIG_LIVEUPDATE.
>
> Group all KHO objects into a composite kho.o, built for
> CONFIG_KEXEC_HANDOVER, the same way the LUO objects are grouped into
> luo.o. This also gives a single place to add new KHO objects.
>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  kernel/liveupdate/Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> index d9f4694625567..bc679905ce3f2 100644
> --- a/kernel/liveupdate/Makefile
> +++ b/kernel/liveupdate/Makefile
> @@ -1,13 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +kho-y :=3D								\
> +		kexec_handover.o				\
> +		kho_block.o
> +
> +kho-$(CONFIG_KEXEC_HANDOVER_DEBUGFS) +=3D kexec_handover_debugfs.o
> +
> +obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kho.o
> +
>  luo-y :=3D								\
> -		kho_block.o						\
>  		luo_core.o						\
>  		luo_file.o						\
>  		luo_flb.o						\
>  		luo_session.o
> =20
> -obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kexec_handover.o
> -obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+=3D kexec_handover_debugfs.o
> -
>  obj-$(CONFIG_LIVEUPDATE)		+=3D luo.o

Please send it as a separate patch. I have the same change included as=20
part of the kho-ro series, but let's fix it outside of both series=20
instead as a standalone fix. Also, maybe rename kexec_handover_debugfs.c=20
to kho_debugfs.c and kexec_handover.c to kho_core.c for consistency, now=20
that they are not shared with the rest of the kexec_* files in kernel/*?

--=20
Pasha

