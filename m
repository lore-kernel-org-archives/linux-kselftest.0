Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794441795;
	b=BHNwml7MlWAsm4L8McQpDhBRFqGCAHxMbFlT9niqCtHu/cNnl673zrewIkwW8F9/RwVy
	 A5tglv/7d096b7ob8a/ze2+Mc+Yj6k1DmLd2DQ691j6baRZshV3+VS4mQHeD5/C5HyVve
	 el9FO5EB/XSl/nA5kTBuSDRU7kpV5W0D7+2Zu/KlrzejIsLYF/o8nztUiG8ZeAkv+FleF
	 h2JhCSTFTU3mSSNSKhi5mH+4Lh3JCpC0eLwSu50nVZ0ZNBZBlSwr6s+09oLUHqVlnoscC
	 IztddN+4DsX7LshhHLWhqgASILEiZKQ8T+21VCRoSWNURL5oxqtBnI1e+tVEyw3PNBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
	b=Y9w6s9yqt21MdxgYzrAzbfd+e0Uu1tDd8mmXhgEbL+iCX+d9nPU3aWWT07VCosmb5h3o
	 f5KUgE2j8vj/mdF7prYnx42s0kKETOfeG0hj8Gz+7p3YOU8+/OWAX/+6XlBi2AHO9QxtS
	 pKhEPkaRVTCsH9vjBRPi7uHphXPZqOI1fhR9xk37EGI6zyUqoCYlNjlEIBAm3yEdl5fgV
	 F7LNC90rM2U4CM86Shsof4w0aqNg2P2bOwoXwzwqS0ApMnn+7Ac4qU/fSYLQq6TdaEOlu
	 /shf1+VCrJbpSSC1DHxME5sIqUYjhSt1p3S60Di5xY/uGC8DcjXJC4PRf6YODdeFqvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=cILHLZST;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B4606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C3B4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=cILHLZST
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de1fd5f572so1552689eaf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:03:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794441794; cv=none;
        d=google.com; s=arc-20260327;
        b=gBga8XEQU8lExPJQ6N24jqNiJh2uvVxVi2KV+N/NoDSxHkf/85lxDJFOo1mA82x9pW
         uEzg8ASEXG3Ix2d87W5OknFHg9oZD7JdYxbTaDmeJjx9hiBQwzB1Fo2afncCMOYnB7dR
         CWcw3BRybt/KS40e4Wiv9HpAAgL6qonObH3zIwXf8X/mUXW48oDZ98L829rJROBddVjO
         tSlnP1kot5swgInEcjJs+0wDu7O943p4fGQve60VOvwxcO4F26Ivb4tyezox+pipgLJd
         ByCYzpwsZKnqgKamglQyxWjnyw3D2O9tVJM55hLSjtc1CUJ8fE+Fe/qXsP/U88O7TCzM
         vpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        fh=EFAIW7GKjNEZ1GBZ8ixTlyy8Km2wHMhJB9CtgF0eJtc=;
        b=tBAPQv30lBF4S0MYTPt/GGo++98rVRkBXOW2A7Wi53kcdtyCqlFlb6s7gwieiJ3SCS
         XpXAKPRwoxts2mi8fLINQGlDOYa9XoBKpMx1qv7874vXdL9sMXGnH+3YJ4CPr4EKiBIR
         3/4O59Q7ZCbLARqx5iZwC5NAs5PrmvPtcl5OoOp3sHv0Pd9M+Wohwn8MSkbrE37xfcOM
         oHtVOxi6PodQomNhYXjFsOAmcaKBlOtRwUipwaTQ63ydGPp3+NHLLDI8Jx9A/+WqSlif
         OKvazWAg58ooHtFb5HBrJGPIiXADAxyHlLHXp7AJ7a3/bz6YAGfSPPNiU7QTAkYreyla
         dJeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794441794; x=1795046594; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        b=cILHLZSTnKQEkbe7N+Oc0kZd1YMJ90v+inoo8hnd/du4Q8+TI7ThmqwGF7mc5pC4Zc
         p3RST8uK9+o/pASznYLtV0Z7weQjU6OIrJgytinvIk4otwF+rNEOKoimbWWnNMqH5buJ
         xCLw9HMNTcZlZTRHoJrN6pcicTv9FCZZeYbCVTLEV3d1vbtkvmzglrLY0Rw0y2iTXn+U
         z7pDnxzc2gWXMtz92BavIWrAnQ1cEvS0+M9IK0CPUjNYAYrv8VaJisHOkU80CgP/RKfw
         MyqjjMvpkeYtcCpkYSm24Gf8unvyyVbX7NIxTeOG3ssNop+SIoW1Unp6JfOBJr+qi4OR
         Btjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441794; x=1795046594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tSGqJI9Sfy6jLqsvt9BVccCgWOo1O99X2AFDHy843oU=;
        b=SklZu/fIPz+0/rbR4/sDqBY/xjmpRp7cKcfVbJoTBwvwXCOyEEud/URwEXzcIkqT9v
         dPkc339I5cBnSAypXUxfPXYcBlyfsqmTCQuc4OWYfxbz0D5cpaw1s1t1CGsFfQqI88EK
         OWZh+0J1L/B9doFeaCqWjssWcCS33vuxM/XQPqypnAehCkaAhZXYGbxecjtFzRHSj3jH
         dgifVQRDiFk+8ir4fizIyglQP6Ui+IMf+ZH3jNtdjTA3iVeTN79AjgeHvWJNaSnpQcTn
         69m3bEUMImhFoD5wuqwwh+edKicwN8CUWqqlV0/WHub/yxP+zgfQsVMvNy9HqlhWZ7IZ
         4ELA==
X-Forwarded-Encrypted: i=1; AL+hErEGpxsTRI9GQ/FQylOSsxv6EESFXqA02dg7Zl6MA/q5Pgaug/LANAOkIBgoFqx+jSBpoVSfCQzH4YTdNoGkzZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z85YcFeSd55JHdFklwjc0Uds584Jary+XOSvTc3/rSJy1o3WCHJ
	eKIQJqUp4CvPkUnsOLFFUDuVvPNRo3PCDqjzLiQAlCxPsmhMDVDZLrQLq3ukFV0Qm+r37sNpxNZ
	f6eFdpOfwY/dTzHWwuYxMvT8NdK/QSazJ8t7VNe2wwQ==
X-Gm-Gg: AYBFou1DuZ1G6/RZCTy3OjNjtMr+0mEjxKyJinX3ceNRWkKRYUdxOTfpInBpUKjAMni
	MrtesExB7ip4hJ0q1rSuErgf5BBnjwGhvlfjf5LAE6xacuVDAXXZvgFXaZLI6TJ/iN3HjPm8ltl
	rXl5QdRWVce1rh2OTBVjiK13vLvdWgJpH9BWUv3FcZdBYTgdUFA8talPTIP+40R5ZLHKEiQ41Ta
	gUTiOhQiaOYsHZ/jjC2mVASuAZbEequ/J3UCFbuSIr0iafdlHt0HKWpR9HpXY0+n6eWTj+mnpXf
	szu410C9YkAt1ArBuYP1yF2OBO2BW4RCAKcsqKoAyYy/EfvHY6EdwkvTSRUYdLA1tQWRs6PdHn2
	RrPelLwhgsl9sa1nin/xW1eptrDC8uaRQvIHpQu/J5dcOd4qFeY+OvedufvQpvFv23MUCBQC1Do
	kIwr/YAKEEPw==
X-Received: by 2002:a05:6820:1341:b0:70d:8086:e48e with SMTP id
 006d021491bc7-7191784f4c9mr2405201eaf.20.1794441794070; Wed, 11 Nov 2026
 16:03:14 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com>
 <willemdebruijn.kernel.2c6a653eb65fa@gmail.com> <20261108190831.3f991a13@phoenix.local>
 <20261109154909.32748-1-tianyi@cloudflare.com> <avTOvr+yy+2j8xrQ@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
 <avTSBFpR2t7PO9tx@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
 <CAG4wq-d+LtEi-omGwzgqx14rCp_4J9HztGMpa8ioMsviaPw+ZQ@mail.gmail.com> <avT4CezZCiRhvCXw@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
In-Reply-To: <avT4CezZCiRhvCXw@dev-dsk-dkeogh-ai2-36d3b9a7.us-west-2.amazon.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 12 Nov 2026 00:03:02 +0000
X-Gm-Features: AclHuK_s8wIPjsY9dzqaekzO2VZaPxMJTb6Tg8Z4dNlh8vuXp1Ar6fObcRSwolA
Message-ID: <CAG4wq-cyLyxnnmhPvL+ZNmnXGjBp=OsbBNE=16j6WRSVJ8uv3w@mail.gmail.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
To: David Keogh <dkeogh@amazon.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>, 
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
	Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 11:19:37PM +0000, David Keogh wrote:
> On Wed, Nov 11, 2026 at 09:41:32PM +0000, Tianyi Gao wrote:
>> By the way, I plan to support tcx only in this series. A tcx program
>> is attached to one device, so the kernel knows which device to update
>> on attach. A cls_bpf filter can sit in a tc block that is shared by
>> several devices, which is harder to handle.
>
> tcx only is fine with us. Our chain is attached with cls_bpf today.
> Rather than move it, the simplest option for us is a separate tcx
> program on each device that carries only the tag and returns
> TCX_NEXT, so the existing tc chain still runs after it. A few
> questions so we can check that this works with v2:

Yes, this works.

> 1. Is the tag read for programs attached with BPF_PROG_ATTACH as well
>    as with BPF_LINK_CREATE? "bpftool net attach tcx_egress" uses
>    BPF_PROG_ATTACH, so a startup script could do the whole setup
>    without keeping a link pinned.

Yes.

> 2. When several programs are attached at the same tcx hook, is the
>    value the largest tag among them, and is it recomputed when one of
>    them is detached or replaced?

It is the sum of the tags, because each tcx program can push headers.

Yes, it is recomputed.

> 3. What is the exact form of the tag: which BTF element it must be
>    attached to, and the string format? It would help to have that
>    documented, since programs will depend on it.

This is the form I plan to use, and I will document it in v2:

SEC("tcx/egress")
__attribute__((btf_decl_tag("tx_extra_headroom:64")))
int headroom(struct __sk_buff *skb)
{
return TCX_NEXT;
}

The tag is a BTF decl tag on the main function of the program, and the
value is a decimal number of bytes. The kernel ignores tags on tail
call targets.

> 4. Is there an upper bound on the value, and is a larger value
>    rejected at attach time with an error, or clamped?

The upper bound is still NETDEV_TX_EXTRA_HEADROOM_MAX (512 bytes).

- A tag above 512 is rejected with -EINVAL in tcx_prog_attach(),
  tcx_link_attach() and tcx_link_update() in kernel/bpf/tcx.c.
- Several tags, XDP on the veth peer and VETH_INFO_TX_EXTRA_HEADROOM
  can add up to more than 512. The total is then clamped to 512 in
  netdev_update_tx_extra_headroom() in net/core/dev.c.

Thanks,
Tianyi
