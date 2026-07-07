Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16E34750A
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452276; cv=pass; b=I5AnmA+QuZMYvYpHIDRQRvaHXtdA13t+r0YuagrgsetU0no6cSoINNWh0gbSJz41DHOz2Bj4pnMDzl5+Mmb+zEB23s7vBbEhTayx4BoJ+erGrUxJX1WFdoiFuxGc/OaOMCruaw3MqvQC9vszInC0qlaO+n+WP0AFVm5y00UBWcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452276; c=relaxed/simple;
	bh=lqIqD3byUVDYSUFyysmtpZVvkzId65XXgC2avO2Zwzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhFzWGCfN0tkCNdimImF3/yhhs4jhIE5rPyQ0VktfOUx+4BKiAax4qB6HhAnWthhIOAZBwqAINxBh8ZkZ3BXqfUp/uYjOLj3vtpfFsrxbdd0YVikBOUlMj6+kKtlSpuZ0dAkaf5/Wb+tgIorj+Fs0qPlmn6RXBiDgYoKORjvKcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQpdttfb; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQpdttfb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab97c86bdso22195ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452274; cv=none;
        d=google.com; s=arc-20260327;
        b=rQow0lwy/Qh2iNbe60nCdHcm94YQAVpvvXWYfse+XaqoFLQkSOox0glE9zNcHW7Apw
         YCVAFJs0ILb8xL9Pw5i0PvldqH/62I9eGH7mEyK2H9rZyLaxOxORPIeQoynXz3HJOwPX
         2RQZLie/OjXi0JYFs143ph4JUwKAZTtKZrrPblRxCAoraz6RpD954UFdeYcUlfrLN98F
         uc6xfdKT8QTtth9IPqBukyZv6Mwm5SzeK7LwAzf9QFKxS+H5N3YHFXpM1GrIhVcS/K2S
         KnkS7xhGkkvK1nZZUwucp42kWc5wIKT/I+F0pl6VRLlcJHkKq9PD9HhhRznYm4TIkp4I
         yAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Fm7QjNSE0IJ2/34q+H/eGUWaQNYPo+v65MhhotHihY=;
        fh=UV2pd5SJKS2LlPwadcKKULUZfe5XqXHuJjzfetCnTeI=;
        b=qCNt0Bp9tXF3xdazKmWFMtgmK9I2shJQ3pgAI3c6j2OjO2T3CGAcBnOFPnKuqbOEex
         rfDlq0Uq9+re143in1wczBnh4ZR8Pk36nkTtH1Qnkl48jjz+kAaMsEs7vd++RXFpQ7HM
         QYWViqdWlBA6XVDEZEvdRfCXv5OfwsWAN7Ha7y+X46DbufCJOzBSRqu+5X3GG5JSo0+5
         SNCByJt29D9wsuxMs5GvswyTdJUP30iWZ5NDe3dKuwSWKR9tAzguPbzzk64XkvZjxOYR
         x/QYGg+rMiFCstho4s9tRC6dO/rWEaPZOIQ4X+sUpRckOImS/PLc4eOU7M4ssSZIpxdt
         LWqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783452274; x=1784057074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Fm7QjNSE0IJ2/34q+H/eGUWaQNYPo+v65MhhotHihY=;
        b=oQpdttfb2FUCW91i+sJsbmx+R2UJzLCXaTuMELV3Qmry2LGXg5KMg9biadhTxnUize
         +dmbSO4yp/DpFMZIFGP/lDL1QbLOnCo69SlucqmyKG24GOjeOOxfUbaqwRk4VMG7Tf52
         llgULpThfoHNPXiGK6oM4oKc2S+haSl0KS1ThuIxH5qbfDEdK1BbyApiX3ggKfi1qLKH
         jgYqXCOQyQIflRXCoXZdlyJ3jkeBBPaADEgvuLOzDiW60E+KUxHdPPyel/jn9OMR6qLa
         QakHO0SF3XoMmf3Bie5rOn3xa7kZ4Auz+Hl6szRPsfoes+n4KG2Wa3tgcMPwXCup9dAm
         DbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452274; x=1784057074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Fm7QjNSE0IJ2/34q+H/eGUWaQNYPo+v65MhhotHihY=;
        b=kL3CzjL3yOtxzpYnz2d/H4ml3IgK3cd7cAzUL3vk3K6/A7opyN+D46o8U2CpOe10vm
         88vxNsr7aFcBbHcdMgYEv44zRW4T406tenC8X4vdGuPik3cnZGAPQ1EmQF4Y4XUkjVNM
         Ej3AQ7A8RUkPZVYPcvT0ZtsKg1Jj1aUpPtK0ILmt6smhJcCxWwKgk6p6kY2utqmCzGMM
         B/7kk4D8fHKzGHNEA1jOK05q8i8aYy7v2L1h6RITLdjeeQVCro1pr2h1VOwBAdrduuV5
         HaZjvR0/vqSjspQE/ou4n6dk2luxQ3vtIMI6juhDLdWVsdYU6dxRBpXKKAYW+aXzMPPx
         Sz7w==
X-Forwarded-Encrypted: i=1; AHgh+RrN7/Z1HXXmjuVmIBTclrR7rurBlXjxjefy6aRKnlYfR/tjnBDCO1UQpdlcSRD6JLnfZqICfiUsCGv7OVDXY+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/CXT7vpVgOTPD2BFaKk4jHUbC0bkFnFmSf+ZpyoRD543ZLzy
	Fx/9zUs817SEZa4aKEJAPIEGZ2w/ZGJUUHnjgvjXJxWwJX+CYGDJSLplTQA3+hlANFnYFZfHisi
	7cWhDD+0IFOkYg7oZrUDffTmzqxCRV6umblCyk8fv
X-Gm-Gg: AfdE7cnZQXz5PArx2NtLVbNnQTeTCwO0sHG535kaRdCsVWwj4OfXthPuOgnYI/dEes3
	+rRUDon/f9lgAnR8r1DICfoW8wTnuochEs3zSuSNqbtTMZWOrNSNQOyUz6l6wvIiZ1MV2CVto4i
	vM9VBC+Pg4LQoogEebUxUSripMNM7YVP+SxiEm1wbP8gGSjtSXq5elDEUu4YFz+J/Fy8vY+XUZc
	5x7cw2OidBuRmEC0H3c4fJjBcAhYKtoODWZEZa1WIAH6S2cuIcaJKf5Qnp8eBcpYSj5tspJO5X9
	elRenjBlaROg9ugXa/VFhzSQvVA=
X-Received: by 2002:a17:903:13c6:b0:2cc:a859:d404 with SMTP id
 d9443c01a7336-2cce6093926mr513125ad.23.1783452273682; Tue, 07 Jul 2026
 12:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
In-Reply-To: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Jul 2026 12:24:21 -0700
X-Gm-Features: AVVi8Cf2zkjvZFmISVUtPxc7XWtQGIP2yN30jA4uYxFxIOpN1CJ2PCF-gRvgh1w
Message-ID: <CAHS8izOmA_U=Q6WOO5mcoi2vBps_JFEtAQa3gXk=JcL3rqE1BA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per binding
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
	sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk, 
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(I'm kinda reviewing this very late here. Some suggestions/comments
but feel free to ignore if not useful).

On Wed, Jul 1, 2026 at 12:22=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail=
.com> wrote:
>
> Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
> On NICs that consume one descriptor per netmem, this caps a single RX
> descriptor at PAGE_SIZE and burns CPU on buffer churn.
>
> In this series, we add a bind-time netlink attribute,
> NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov si=
ze
> (power of two >=3D PAGE_SIZE).

FWIW we may be able to support arbitrary sizes with devmem. Because
the genpool supports byte-aligned allocations AFAIR. Also the
dma-mapping happens with the dma-buf size, so the actual niov size
doesn't matter. The only thing I can think off which may not be
flexible to arbitrary sizes is the driver itself. IDK what happens if
you ask the driver to dma into a buffer that is frag size 5023 or
something like that.

But that is something that can be relaxed in the future.

> Drivers must opt in via
> queue_mgmt_ops.QCFG_RX_PAGE_SIZE.
>

nit that probably doesn't matter: ...QCFG_RX_NETMEM_SIZE, or
(...NIOV_SIZE). This doesn't actually work with pages, right?

If you decide to extend to arbrary sizes, I would add to the
queue_mgmt ops supports_netmem_size(size_t size) function, and let the
driver enforce "it has to be power of 2" if it needs to. AFAICT core
doesn't need to.

> Selftests use udmabuf, but udmabuf sgtables were previously hardcoded to
> PAGE_SIZE. This series modifies udmabuf to respect folio sizes in its exp=
orted
> sgtable. The result is that when backing udmabuf with MFD_HUGETLB 2MB pag=
es,
> the sgtable is populated with 2MB entries, allowing devmem's gen_pool to =
carve
> out large (eg. 64K) niovs.
>
> Measurements
> ------------
>
> Setup: kperf devmem RX/TX cuda, 4 flows, 64 MB messages, 60s, dctcp,
> num-rx-queues=3D4, dmabuf-rx/tx-size-mb=3D2048, 10 runs per niov size,
> mlx5.
>
>    niov       RX dev Gbps   RX flow avg Gbps         app sys %
>   -----  ----------------  -----------------  ----------------
>      4K  300.63 +/- 53.21    75.16 +/- 13.30   54.15 +/- 10.23
>     16K  321.35 +/- 28.20    80.34 +/-  7.05   41.05 +/-  8.87
>     32K  347.63 +/-  2.20    86.91 +/-  0.55   44.54 +/-  3.51
>     64K  332.11 +/- 14.26    83.03 +/-  3.56   35.47 +/-  3.11
>
> RX app sys % drops ~19% from 4K to 64K.
>

Hard to read the columns for me but seems like good perf data. Did
performance become worse from 32K to 64K? I wonder why.

I have some devmem performance fixes that are very critical for our
production that I haven't gotten around to upstreaming yet. I wonder
if I can send them to you for upstream submission. Are you potentially
interested?

--=20
Thanks,
Mina
