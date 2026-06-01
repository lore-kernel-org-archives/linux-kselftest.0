Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B53DBD73
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327759; cv=pass; b=iWSGT4GtfCeybKsUeYzF9Mdc96SgoUn3L51fvtB2BATOwOL+XkLKJVLHFpBFE9qdehB/MtY18ctKu6EZtUolMI3Llz14QdtBgC1jrtOeVX282SDzS+qAH1vGLbzkcDWkBEhYTVUi3vMs0G50RNYqoAgm6z7c2UFwGH2DV7bRbQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327759; c=relaxed/simple;
	bh=Wj2HjaCmvrNykd7/b89FdO2/xBGB5dAuIyTwzhwlNos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUdHQENH9BNCu8u7C8jia+gr1gS2WOfuKtVbmArjTRaMGQkIhpvHjLJkOyZ6yFRBArOI+K//7MeZAYEVYDKa/0oOpEGL+VIUZNjPfoiE1knyrLIvXBn5PVsCuhgGJHXVV6QENUvXQJejWiBo8smokghBy3lPs5yzB/KG5YRtVhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZAAJYdYZ; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZAAJYdYZ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-516de78c4dcso95000981cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 08:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780327750; cv=none;
        d=google.com; s=arc-20240605;
        b=LfiWjl+MNatoeXmKJ1dYdpksqCou/8a/7aHncmO968HukgokNCc3L0Nl3iaLfuZ52M
         xdhWO3kSzJjs91qVaUGJha6Rpg81Tk0w9YvBSeAP2BlqjGiCmMia/FnBvHZ/tX0aC3tR
         tclx9xBCyq81oXphMM6Ggnco+tITQugAhgwPoEfNsugZQNJ5xXKZ86hE2tUj3DcBo13z
         RhcbhokUBjT7gAPxnAEGzkl6cjnUO9UZCfCU1J4KYqEvtSFcUkmF8wK2E0awJ6va+gsf
         Zmjkf4RKqK/OpTvJIOp/rFfKAwXuXNKTSKegyfO0ONapaErZSnf6x64SXvdIMNLl+QkO
         VVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EP5yWJP/oLaBrC33EafyKNZLj+nlCv8r++/P2IFxvE=;
        fh=KrEY6vrGUURN+PgVXltMQeWAvI+uDXpmkn6esuYW4oE=;
        b=EXOLgkFwplKj9RnN2qOy0rqM+4yMBMgz2M6zSeuE0FjqbozLOUXvPtd95tpC1Wn91Y
         YT+lswesV5/yTc/FdxMoAzNtByhJKmfn2StdjNo6dA85q6XXXyUBdyUPz7xbc7qh+Pz1
         4K6bKzqUdWnM9zFExTY+YbjlZhtqu/PzeIZcSL9T9EvhQOGx1Dt7lvoObFBACARj/PU8
         G1ynYwJwmSQicAzAMkDTZQuMAe27bI9sXnPoDywer5NQcZ4nUQGEZEXV+1WfAz1+9a0S
         5+YD/YHIOFWLE8uXLBJgkoRGHKcn5vaNn2j7odZFszaLlmGBii/OnrkprZPrkhBcZZqZ
         Ae5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780327750; x=1780932550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EP5yWJP/oLaBrC33EafyKNZLj+nlCv8r++/P2IFxvE=;
        b=ZAAJYdYZV/KGWuFFI74dgcE5AjOOyyiRXII2VV93UrZNpHjLmPIDR3f//rcPmuDdAm
         bZYMZK84P2WA51F/FCWoVDSe80hxKU+FT2kAsJvFTNE1IT3ljY0jkQ5U0vnb3hE249xl
         oxnXysfShracuKeYpx/z49Xqw55KaDOQnm15831kQ33BbUmEYn+QhuIl95pQ06AaHBUc
         PVPvmZcXv8T5//LvHnIXUHvVsBDCutUVpeYRhPY3vDaTIaFKZmTuKy9YZfVIeXWAGxYf
         Ul2B2e9KhGG0XHp5MFmcDz0gPcTr5Oc9CSQObBvmofdPrkKPeCB0A9pw/Cbd08kI/mso
         MJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327750; x=1780932550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EP5yWJP/oLaBrC33EafyKNZLj+nlCv8r++/P2IFxvE=;
        b=HU/IBdcHqD7fSjdQMH/in07fUTaBZlOesHOrEDQmdjj/CSyhxz0lrivDh0L6Wpyby+
         t8zO32ZcAU5lMaFWShLM3HMfq+fgElwsHoB0fcJkM4FLCZUKgi2o0+3+d0D50hJaqIYA
         XL0laVGsf2xx3Bj0ALyJAhTCWsW+Xck1VpmNtblqM3MpN8pezN5eytbvNPNtrq9K2QGi
         SeeqEntYkHJ1NLR5NWDfG7wFqokl/X5X2CgtbY28aFqLKZKw0lcwAg75XTDcTj0xqg6R
         vY8Lp3VaBiuc6F5b3Vn8W69wE+ottg8/ktCoZSNPOy1z82pYqANFSeZFF9hS/EKsODxg
         uuLA==
X-Forwarded-Encrypted: i=1; AFNElJ9+1RTSuSdd75sWeXWkr6RGJ1kc3CSzVzHGazAVCxrhi+UG+KaSWKFROJz2gP9E1RMfUp8mdl0nkeKziOUezvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkLkudDbTx4aKtCsc86k4+n0oGvzPVX2kOHbyoZFM5D6ruxNG
	goGJt87VNW4dFSIZ1IS89gBfAPL7moD7HrSbkQmP4rbXkKnAQIRAfqcHlZxfr9FNUFjIcIxDnz5
	P4IbEdiH+Q8a8/p4OKPP0DwwxbkuepL9qKi6V3Ijx
X-Gm-Gg: Acq92OGnAI2lNcD65lx1q916yeYVFJoLB9YPkUwOv328dFIRnrAcuNw3V8tBjzNMUP0
	FX73SbNuVus/sLMz1TexI++PgjQjjOdZQOn8awwSj4BpINOQGlO5kvDcyiaHBWKmJG8aZK0JJvM
	zFtoAGUoZ6rASL1qe4yXFfzNpgFmRrXzUmPb4KIYK4T7ZVlfPfEzNbCMfzasTUefhNMqsOjkBDY
	YrdEYbncdBCL8+3V2CmqYqS1I3rasaFpXCq+RaQNP53J25ZokwTwLWfHEOhVfix0EYgxNIPYVur
	+xYcdol0ukhnXGIozGGw1EG7DH+KnucqGr1NZr8tFxtxZw1nPAknPNdkwxKcbveJXvRXpmE55gT
	E47D84j/TSAZ9TzpuIMrFVhVx2CJO
X-Received: by 2002:ac8:5fd4:0:b0:516:daff:7f7e with SMTP id
 d75a77b69052e-5173a80ffb6mr163432151cf.48.1780327749316; Mon, 01 Jun 2026
 08:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601150203.20352-1-leon.hwang@linux.dev> <20260601150203.20352-2-leon.hwang@linux.dev>
In-Reply-To: <20260601150203.20352-2-leon.hwang@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Jun 2026 08:28:58 -0700
X-Gm-Features: AVHnY4KtmX48lQbX-Wzhm_U2p70Q1h5Y6tSbTyXB_2Lu_Z88IMHeMo5GbIX4esw
Message-ID: <CANn89iLJgBxx=NaZDHy4s1_U9LKp9dqUDd1v9LR3CQPNo7DxEQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf: Update transport_header when
 encapsulating UDP tunnel in lwt
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Guillaume Nault <gnault@redhat.com>, Ido Schimmel <idosch@nvidia.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Peter Oskolkov <posk@google.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com, Leon Hwang <leon.huangfu@shopee.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 8:03=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> Currently, bpf_lwt_push_ip_encap() does not update skb->transport_header.
> When a driver, e.g. ice, reuses the stale skb->transport_header to
> offload checksum computation to NIC hardware, VxLAN packets encapsulated
> by bpf_lwt_push_encap() helper may be dropped due to incorrect checksum.
>
> Update skb->transport_header in bpf_lwt_push_ip_encap() whenever the
> encapsulated packet uses UDP, so checksum offload works correctly.
>
> Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_pus=
h_encap")
> Cc: Leon Hwang <leon.huangfu@shopee.com>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  net/core/lwt_bpf.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> index f71ef82a5f3d..65d1dfbf3312 100644
> --- a/net/core/lwt_bpf.c
> +++ b/net/core/lwt_bpf.c
> @@ -599,6 +599,7 @@ static int handle_gso_encap(struct sk_buff *skb, bool=
 ipv4, int encap_len)
>
>  int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool =
ingress)
>  {
> +       bool is_udp_tunnel;
>         struct iphdr *iph;
>         bool ipv4;
>         int err;
> @@ -612,10 +613,16 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void=
 *hdr, u32 len, bool ingress)
>                 ipv4 =3D true;
>                 if (unlikely(len < iph->ihl * 4))
>                         return -EINVAL;
> +               is_udp_tunnel =3D iph->protocol =3D=3D IPPROTO_UDP;
> +               if (unlikely(is_udp_tunnel && len < iph->ihl * 4 + sizeof=
(struct udphdr)))
> +                       return -EINVAL;
>         } else if (iph->version =3D=3D 6) {
>                 ipv4 =3D false;
>                 if (unlikely(len < sizeof(struct ipv6hdr)))
>                         return -EINVAL;
> +               is_udp_tunnel =3D ((struct ipv6hdr *)iph)->nexthdr =3D=3D=
 NEXTHDR_UDP;
> +               if (unlikely(is_udp_tunnel && len < sizeof(struct ipv6hdr=
) + sizeof(struct udphdr)))
> +                       return -EINVAL;
>         } else {
>                 return -EINVAL;
>         }
> @@ -637,6 +644,10 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void =
*hdr, u32 len, bool ingress)
>         if (ingress)
>                 skb_postpush_rcsum(skb, iph, len);
>         skb_reset_network_header(skb);

iph might point to freed memory after skb_cow_head(), leading to UAF in iph=
->ihl

This issue is already there in the skb_postpush_rcsum(skb, iph, len) call a=
bove.

> +       if (ipv4 && is_udp_tunnel)
> +               skb_set_transport_header(skb, skb_network_offset(skb) + i=
ph->ihl * 4);
> +       else if (!ipv4 && is_udp_tunnel)
> +               skb_set_transport_header(skb, skb_network_offset(skb) + s=
izeof(struct ipv6hdr));
>         memcpy(skb_network_header(skb), hdr, len);
>         bpf_compute_data_pointers(skb);
>         skb_clear_hash(skb);
> --
> 2.54.0
>
