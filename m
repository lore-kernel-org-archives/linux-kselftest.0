Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8D53E557C
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456595; cv=pass; b=Z6RMv/RgxFs8M4ZB8daI8SW3j3sVWR6pLaBWB+j8Mqx/GvtqXQoYigm9ssASTlhhXQxDBb++cAqUiIVi2opvbgwe8OjI9oOQtEh9vgqLE4I9ZQwDSQZezKZTz+7gCdMjBF8+y2vbHot/IrTz+ZyeSxeDQbZUDk5r8J9EsRGBbCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456595; c=relaxed/simple;
	bh=HJ8OXuS5hgTr2XHk/8DDuJJA0eA/2PHZVltL570lzqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gu7FMGiz849PHAz9/fJF7opysaXTgsstm2F3Jn8sGOK1U8YrZ2Y/CgIsQ+mdUOE+vHL646i0SYS3Z3Of+uilkJncpkOVh+RJHWLdNXXuOAlU/z+qMyFf3TDhBJJmHhPQehx6qploCxcSjW+L9KJGdkcMyKXgOl/4fku46VNHTgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dNohO7ct; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dNohO7ct"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab97c86bdso4005ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 13:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783456592; cv=none;
        d=google.com; s=arc-20260327;
        b=fK0R/fTBOZfoypcMa9phVFESZEAGovtwyILl9SGXj4GJ8aYbt5LO4ZDKNiDaAXud6P
         GGWjH3aA4EZYYC9gHeyv6XbfpgIDAh0+u9f32xZwkAbbZpcYNLuesH1fVJtMuljZT5uH
         1OSidpxraMlHnRQvYf/s/Fbv6bihXxeCDbaq/nC8gbhoEIPdUJkaIm9b/zcKFOSKuISt
         jggsFcQFeAbftW4j67gjsyptARnd1uhvoWli8ug+CIEo1ddePYrdG4oLewagX5QAlCdF
         qe03hm6oz9Hm5KpjVJmhnT7d6Q6mlObfEWKhT2TsXGuMb/EF1soztgZeAwpVHU4hPWo0
         +Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        fh=aX/kYJqrxE+2AsrHgZN0y9BtwVsGVD6p4QHRG/sFy0k=;
        b=kpuTT0wA8enU6TMBxYSgidbz9f9j+UIWNLoFFzXHquUnE3Oj8iAFt1CwNe0G0tbOPZ
         KUAWA+FBMVWyNKrawg0TpyP4dYsUYLIHHavH6d22dg8gx4GxkYIBVpi7B2n6ZTviyKNd
         se8+nlYI656G+C2GtjA9/RqdXvY7EPp2vVInAkVgLrNAs/9i10MXP7LgEge3gqR9e+wp
         /nnVK55MEeGIG/bmfoz2o78/A4GVdf5V4fd8ao0wZjKiKE0EJbGjg4CjxFmoMJamtGaS
         vuXkegpb1V1OJ+A/hBr7vz/CysJXkLpSDFm1ZDRxtXkfeO5ZBUAvCTlOKM1Kq2RQ/6TE
         RJJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783456592; x=1784061392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        b=dNohO7ctFiQDh8hfgA3fieXFh4ooHz/+zEOTDjPG+mn2hxzilaFHbdQ5O5eZkbRB6o
         jddEOOY6vJ44jotyRwzmDY9mwHrqSUNVbHu4Yfb6Z5HWsZYNl9uVqol+THbVfPi5NAn7
         HM3QvSs3klg9fknuqJRDnXM8sOGnCVY+rDNiO52AM/bv87W7aMBWKZY99Ovw+kpkS+nT
         XIyakJYmO3i28r50cWFGfHDzAyoGbw7uTQh9Oyrbv04LRCu0RiC3qPqhm9m3F98RfK1c
         RoBOSiiQdppsvIetJCIaCaznVFrIzuV6w5DRJ/+EGttI6Lb5t4+aFxOzgRHD3LRND1FO
         XbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456592; x=1784061392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS1etq2XBh0Y21n7kpErG7DuCVj3yAQ6JGZ2x5w3TvE=;
        b=OZSeXs3B0e81o1q4xxfEtWCwr/lWVYaFw4Gywq/oEV1LqRB+vTg2BYpwpWAEPNA1uS
         f/v8RNxmcJq2Na6lCm+8xpzU1/jqhlBnldGmSJ960LdiW5/OmSBM3vS4sntmFGEAC7Gi
         ZW9eumDW0UwBOLLQDPJNTkUiW30sS7KCqZ/rqHMxXAz47B7YpnCNmnX+VyZBaYVcAuxB
         p10Tm7FjdTUWEMnYTi/Ua1U6KPXh32fStZKQFoXLYr+jkLOVpCzCJwAW4e9h4BCYdIbJ
         ELCymHcVnafjWj6/EwwhMSuOnlSNkIQKC0ZiO60cAg4xiEGWpQ6EaZFi7/KrWquTbswY
         X4Hw==
X-Forwarded-Encrypted: i=1; AHgh+RozO6MV8sXwQ4W2UAUh/+rVfP62HdIga9nludjV5NqPmACoyQVMx2hEZCdax7tsnaJ1fAmB4V+A4fo699WWT3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaZIXeFYQbR8zWLKi6c1aHr53m0FHhi5n5+IClJ5OvQTuNhAc9
	7NHeOxiNgUmULyzvZ7ujrrJTkXxjoDyhQao/nGpW5OPB7I0Sts2wILPtWl/zO9mNjN4+dj8ftA2
	qNKS94wLVi40fmdOTJYBkmMH73xEVvJSk3IL8gBHY
X-Gm-Gg: AfdE7cmzej4QLY+6CnK5VAJoAqbUCouYKidmqfPK4cNu9zCr3kSHKMdmTKt/ed4EFCP
	U5vsNilvTYLhTT+9fjszOaxuItalLjKVZNEzNdYmVfm9aeZnlL960STdpCBg3fZ7+oGm/iOx1dH
	9gtPwYztsIlyvcwa/wRiv8KY52KfDv94U8pIFjgYsfNJVhx2NfgC8oiVAwHjz93q8CJ0Najk4WL
	aKNnCn5HDrG7UkKVK4muoXRYP+F0H5fd+apOLb8mvyjy7/9PgytnASAwkQ4EwALYWGV+6KS/cfo
	uKdTaOYKBFnS5b3gn7Ejo51D2KM+gCZ8v8MeVQ==
X-Received: by 2002:a17:903:1746:b0:2ca:e513:17a6 with SMTP id
 d9443c01a7336-2cce6070055mr514845ad.15.1783456591431; Tue, 07 Jul 2026
 13:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com> <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
In-Reply-To: <20260701-tcpdm-large-niovs-v4-1-ca4654f37570@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 7 Jul 2026 13:36:18 -0700
X-Gm-Features: AVVi8Cft8xhwKuUJQBVnGzgYj4CRKQzZAZeZD_sYSlOKVL1n3UGciPvnN9lcbO0
Message-ID: <CAHS8izNdJ1LTOr_pLjXef6Yv-=JOFPe1GcZtcbStD93Tkpy1XQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
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

On Wed, Jul 1, 2026 at 12:22=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail=
.com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> churn for large flows.
>
> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_BUF_SIZE, that
> lets userspace request a larger niov size. The value must be a power of
> two >=3D PAGE_SIZE.
>
> Measurements
> ------------
> Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> dctcp, num-rx-queues=3D4, dmabuf-rx/tx-size-mb=3D2048, 10 runs per niov
> size, mlx5.
>
> CPU Util:
>
>    niov        net sirq %        net idle %         app sys %        app =
idle %
>   -----  ----------------  ----------------  ----------------  ----------=
------
>      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/-=
 10.53
>     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-=
  9.24
>     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-=
  3.65
>     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-=
  3.27
>
> RX app sys % drops ~19% from 4K to 64K.
>
> Throughput:
>
>    niov       RX dev Gbps   RX flow avg Gbps
>   -----  ----------------  -----------------
>      4K  300.63 +/- 53.21    75.16 +/- 13.30
>     16K  321.35 +/- 28.20    80.34 +/-  7.05
>     32K  347.63 +/-  2.20    86.91 +/-  0.55
>     64K  332.11 +/- 14.26    83.03 +/-  3.56
>
> Throughput seems to increase, but the stdev is pretty wide so could just
> be noise.
>
> kperf support (not yet merged):
> https://github.com/facebookexperimental/kperf/commit/8837577f920876bce698=
6ec18869ac04439ebcd2
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

I'm pretty happy to see most of this patch being a spot-for-spot
replacement of PAGE_SIZE with a variable. FWIW:

Reviewed-by: Mina Almasry <almasrymina@google.com>

> ---
>  Documentation/netlink/specs/netdev.yaml |  8 +++++
>  include/uapi/linux/netdev.h             |  1 +
>  net/core/devmem.c                       | 55 +++++++++++++++++++--------=
------
>  net/core/devmem.h                       | 13 +++++---
>  net/core/netdev-genl-gen.c              |  5 +--
>  net/core/netdev-genl.c                  | 19 ++++++++++--
>  tools/include/uapi/linux/netdev.h       |  1 +
>  7 files changed, 71 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netl=
ink/specs/netdev.yaml
> index 5f143da7458c..70b902008bd3 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -598,6 +598,13 @@ attribute-sets:
>          type: u32
>          checks:
>            min: 1
> +      -
> +        name: rx-buf-size
> +        doc: |
> +          Size in bytes of each RX buffer the NIC writes into from the b=
ound
> +          dmabuf. Must be a power of two and >=3D PAGE_SIZE; defaults to
> +          PAGE_SIZE.
> +        type: u32
>
>  operations:
>    list:
> @@ -812,6 +819,7 @@ operations:
>              - ifindex
>              - fd
>              - queues
> +            - rx-buf-size
>          reply:
>            attributes:
>              - id
> diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
> index 2f3ab75e8cc0..85e1d20c6268 100644
> --- a/include/uapi/linux/netdev.h
> +++ b/include/uapi/linux/netdev.h
> @@ -219,6 +219,7 @@ enum {
>         NETDEV_A_DMABUF_QUEUES,
>         NETDEV_A_DMABUF_FD,
>         NETDEV_A_DMABUF_ID,
> +       NETDEV_A_DMABUF_RX_BUF_SIZE,
>
>         __NETDEV_A_DMABUF_MAX,
>         NETDEV_A_DMABUF_MAX =3D (__NETDEV_A_DMABUF_MAX - 1)
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 957d6b96216b..3d6cf35e50f3 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -46,7 +46,7 @@ static dma_addr_t net_devmem_get_dma_addr(const struct =
net_iov *niov)
>
>         owner =3D net_devmem_iov_to_chunk_owner(niov);
>         return owner->base_dma_addr +
> -              ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> +              ((dma_addr_t)net_iov_idx(niov) << owner->binding->niov_shi=
ft);
>  }
>
>  static void net_devmem_dmabuf_binding_release(struct percpu_ref *ref)
> @@ -90,16 +90,17 @@ net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_bind=
ing *binding)
>         struct dmabuf_genpool_chunk_owner *owner;
>         unsigned long dma_addr;
>         struct net_iov *niov;
> -       ssize_t offset;
> -       ssize_t index;
> +       size_t offset;
> +       size_t index;
>

nit: I would keep this signed. Some of the most frustrating issues I
ran into is some of the underflowing and then passing a > check or
something. Although if the LLM is not complaining about this
particular case, there is probably no issue with it. I also notice a
lot of existing code that deals with indexes and offsets goes for
signed.

--=20
Thanks,
Mina
