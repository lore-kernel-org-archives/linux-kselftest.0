Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576045;
	b=vU2R8e6SfnfnS6lTjzL5afHV9tggXOvFCLFGpWFAaQD9qgJYmAWa44kmpPglH4KlfeFQ
	 ZyqxCRa5M/tcQtN9Jbe2aSHB7VajVmmMXlXnM3AIgPxeTmL7XE+hYCj+0WA0lG1VCaVdu
	 /5LPzQfjpRG9EO4SSyyefsOh+HCUv5mZ8GnKWCqnoT0Tx8UKmD55FvSseMXlCz3Ypb1lZ
	 HbveVq28ZfI4zcHFBun8Wg0yfNjbgiiq04UTw/y9Htt60hLPx77gp82wV4i0vO9S2kzVR
	 rQ4PJwrECwz5t18nSzURbmauTLVmgM2Ysz5hQMoYbOkTnJVomWTeJTdn2k1piFbkMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576045;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6jxbovViT1dwleMaJSyVR1xtPDE5gaIC6VKfIzW7oqs=;
	b=osurjl69hAu9QsFJmALPrAVQ9JPTk2WA8SkpiAe8+w57sLf+g6T0L1C+X74jz8rf9OOr
	 HUvtzqDEGR+SwGAg73KueJIFJ4IjDMlBOXPWsMlYko85M0TkDIBzyTQwrYSPjdSWzsT2T
	 3cRRi/CWCNnbyo+bzrwjO/Zql/aM2fNMI9mpXYznSZjYveXFXBEjs+Xc5+NE/+5jDtiSi
	 LLnjJCxtTmEuQZeyfnZRtiJIOZUNuX06tR9vmQDwSAQ0MdYvk6OD2RQO+e/iaKSkB8LnW
	 LnKQaklCaWEIGjrTOOCOEmZa6krmaU7A+Gs9DGjqeVwiALvqKoG9nnbIPjUipz9uqOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWgSk3P2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D655606A319;
	Wed, 21 Oct 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWgSk3P2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6497A1F000C9;
	Wed, 21 Oct 2026 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576044;
	bh=6jxbovViT1dwleMaJSyVR1xtPDE5gaIC6VKfIzW7oqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lWgSk3P21BYenopQ2upzfYo3d/TE4oDtM4SR3JFBUhdZMD5viF2Re7D/QpEpSa/Zf
	 7sP4LYeo+yENInG+nqx12ZhtdozTQ7uVR5+vPueCegxy/4dKbzGtBagLjmXU4m4ejw
	 S6fbTZhBvonPWyvEU+c92IRdzvs/8V71KuIQH+fruYepE4uUuHiEvjXUgxbaLPzgoC
	 RQJcYewDbmMS51g9DMnjQTHLr4pxQibEDPd298cncqLzxtyL/GoSNc9+xc1NfB6pBj
	 YBtO3ds+fKMrJkfQMRLlUHYvmBrPqxjHp/fz+HeDYXMQL5IuYlHcuknSZSsopx2xSp
	 US+0SlOFkY2mg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Shuah
 Khan <skhan@linuxfoundation.org>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs
 isn't supported
In-Reply-To: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
Date: Wed, 21 Oct 2026 11:47:21 +0200
Message-ID: <87qzhj75cm.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> writes:

> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
> which is only available when hugetlbfs is supported. This isn't the
> case on all CPU architectures, for example it isn't supported on ARM
> 32-bits on cores that don't support LPAE.
>
> On these devices, the devmem kselftest doesn't skip gracefully, it hits
> an exception while trying to open the nr_hugepages file :
>
>   # Exception|     _reserve_hugepages()
>   # Exception|     ~~~~~~~~~~~~~~~~~~^^
>   # Exception|   File "/usr/lib/kselftests/drivers/net/hw/devmem_lib.py",=
 line 36, in _reserve_hugepages
>   # Exception|     with open(NR_HUGEPAGES_FILE, 'r+', encoding=3D'utf-8')=
 as f:
>   # Exception|          ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   # Exception| FileNotFoundError: [Errno 2] No such file or directory: '/=
proc/sys/vm/nr_hugepages'
>
> Let's check if the file exists before trying to open it, and return
> immediately if we can't.
>
> The _reserve_hugepages() runs as part of the "require_devmem()", that
> skips if devmem itself isn't supported. Before the blamed commit, this
> check was done prior to accessing nr_hugepages, so the problem wasn't
> showing.
>
> This has been found by trying to run the selftest on stmmac, on an
> Altera CycloneV SoC (Cortex A9, doesn't support hugepages).
>
> Fixes: 8ac4255c1e0c ("selftests/net: devmem.py: add check_rx_large_niov")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  tools/testing/selftests/drivers/net/hw/devmem_lib.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools=
/testing/selftests/drivers/net/hw/devmem_lib.py
> index 3554954a6691..24637fb180ca 100644
> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> @@ -33,6 +33,8 @@ def _restore_nr_hugepages(nr_hugepages):
>=20=20
>  def _reserve_hugepages(want=3D64):
>      """Raise nr_hugepages to @want and arrange for it to be restored."""
> +    if not os.path.exists(NR_HUGEPAGES_FILE):
> +        return

Maybe raise a KsftSkipEx() would be more robust? No biggie...

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
