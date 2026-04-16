Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96A3B8BCD
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342819; cv=none; b=CeoOocLwK8HMBw0W6WZuJODBhaZFzzxMA7+PFjkOq7wJ28bb0Vuj1CdHSe6t623D1jKPcO6n8t0Jr6vs1vIT90xGMdzLy+ZpY6nXvFAuRWlWJatg12I25taTM/HFVE8Of0d3WqEj+6+CedY5gehxYGikLopiQXmYmQs60TRa+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342819; c=relaxed/simple;
	bh=CEb3cuo/uAP88ESWyuNyMkZh7DTfU9K7tpZY9polNZ8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=ezEriF4aymYhatiihv2cCy7wZLm+NH/MxmNHyMtR48cToEiF3dLSwukoEu5J8IViC6nt2HOByXTgNLDvXGZzAzATnnKJw1KYqQ/Ur3DYbCTddaIUnAdaUvmWSZMIqTSYpXbJSwfEbdtdTUtR2XZ74GaSqa5qum37RHmMz1JuWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7GJG2gO; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7GJG2gO"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a60975dc5so92319287b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776342816; x=1776947616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LArw8lu+z3P+Njr288piMWTqVUwbnY19SMC1K2R3E/8=;
        b=V7GJG2gOVXPXgEcWQ/6GxvBr9fAZXecoBQKOmbmF6wvO2XZB8MRBS/u6R34kQ6AYbZ
         dYY6FlHa+Edmfc9f1h6SDUcullyvuyeuYEnfZKWF1TFkZpeHOVjsB/pYwL7C+TXbiUV/
         2y1TA1D4YpQ42Yg52hDz3yc+V3EQi+zt+wQGF3zaMsbW6+pdQ+CokgFzDHY20MqdzrMa
         5IUmVSMLejNWAAgnwUV/B6+awLkYCf5GatPGp/gJktsBfqABRplmATqWXgU8BtmHMTT1
         Y2h0ZQ9p5VicyI3QtbEpzwIXWSolxXkBfSEE86HvCxevq/L0s+QPS1f5AgbJS0aEJrS8
         0HNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342816; x=1776947616;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LArw8lu+z3P+Njr288piMWTqVUwbnY19SMC1K2R3E/8=;
        b=hMs0iTlq40YPi8mmzSKKyEuxck3PPTbo7zg9M//jlEDMNmHVjG4MI+uC2/MmTMFM8C
         Rd6tyIjtgC2HAjhm8RbxYLZ3J3l2VI5dId62mteu1uNymSqKWuTCc+SksI1NKCEkJb16
         3CONBWoG7Q8+mFX6D88BmrEkHwR+KqzdN3q8G7T+dfJjXi1jOBwy9VcTNyK0CWUFwOsr
         Ng38SKhxUCXhxTL93jzBOuhRWQucgiXDZMjLTloxkGMcufvRZgliG7Lw0DJVq7m//wF6
         flIIeN6YrhVz09lxyKbV66wP2iDLqZmVrZSnUpfT9BQmsTdVpOFmfYPupYgkhN5t2K5/
         6WQw==
X-Forwarded-Encrypted: i=1; AFNElJ978cD+fApc7Z+b+ecwUsqlxWfbMfG45G8yODuQ33yNqEFjJx9JEJwnoRAD32KRW8WOf+LTTyXFHdIUz7PJCjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+LrhMlN9gLvtJfoZsDI+Gbr3tlD1AcLMsSEYkQZhLFwbNAMg
	R4TSf3hQd3agrkMSa/8L01/dMp+XmGy693fQluqmS7jBD+1uPU0za0/k
X-Gm-Gg: AeBDiesvp5Hhw4AtdAx/PyedStSAMo+ci9K6iuHJ9wn9ALcHful08P8gxkE/LjTQT8t
	yFZJfwotJQ1DBiaLjHFRTM6f4K9XowbB/WONiu3clQaoYGyalKdUwvP6P7ERaOIFwt+zsAGN6i5
	zR84VMeuig6jMesjkJblpcV1u5wR1kWNY09tE5nb7l7ABbKoEUgZU1HhzMseI7g+ghga19dLSKd
	tFpvZ/GX04P1alwEE+IoNsG66OrEibOQ2yZ8U6VVgStrPM8pxcKKS/0dAeo73Lp9Ob/U7rAmp1c
	wrYMo6wsZXllaFkJeUI5DAryOET1DvQcLkdAuT9vg4rMIE8UR7dLABdSa4dMCO45ZeIfiHjSDrG
	N8eNSSQbajm4Fkbs8ePh1ebS9URH380N66ENmsBJcV2BFYNtPU4ZGM+mQ/8P/r97C4js0eJPj4s
	Rtfu2zCgLNZSIUuYimihS8W/iINltvuFqqRE6UTTgwEeND0l27BcqnrUbkhMPjwGY26x0yPu8wB
	3GbznG2ZWxERskX2zSPy29rTQ==
X-Received: by 2002:a05:690c:6e85:b0:7b8:f152:753a with SMTP id 00721157ae682-7b8f15278bfmr15108987b3.19.1776342815689;
        Thu, 16 Apr 2026 05:33:35 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b7693179a5sm21853427b3.36.2026.04.16.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:33:35 -0700 (PDT)
Date: Thu, 16 Apr 2026 08:33:34 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Nick Hudson <nhudson@akamai.com>, 
 bpf@vger.kernel.org, 
 netdev@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>
Cc: Nick Hudson <nhudson@akamai.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2a800b32a572a@gmail.com>
In-Reply-To: <20260416075514.927101-7-nhudson@akamai.com>
References: <20260416075514.927101-1-nhudson@akamai.com>
 <20260416075514.927101-7-nhudson@akamai.com>
Subject: Re: [PATCH bpf-next v4 6/6] selftests/bpf: tc_tunnel validate decap
 GSO state
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Nick Hudson wrote:
> Require BPF_F_ADJ_ROOM_DECAP_L4_UDP and BPF_F_ADJ_ROOM_DECAP_L4_GRE enum
> values at runtime using CO-RE enum existence checks so missing kernel
> support fails fast instead of silently proceeding.
> 
> After bpf_skb_adjust_room() decapsulation, inspect skb_shared_info and
> sk_buff state for GSO packets and assert that the expected tunnel GSO
> bits are cleared and encapsulation matches the remaining tunnel state.
> 
> Signed-off-by: Nick Hudson <nhudson@akamai.com>
> ---
>  .../selftests/bpf/progs/test_tc_tunnel.c      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> index 7376df405a6b..74dfb694a210 100644
> --- a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> +++ b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> @@ -6,6 +6,7 @@
>  
>  #include <bpf/bpf_helpers.h>
>  #include <bpf/bpf_endian.h>
> +#include <bpf/bpf_core_read.h>
>  #include "bpf_tracing_net.h"
>  #include "bpf_compiler.h"
>  
> @@ -37,6 +38,23 @@ struct vxlanhdr___local {
>  
>  #define	EXTPROTO_VXLAN	0x1
>  
> +#define SKB_GSO_UDP_TUNNEL_MASK	(SKB_GSO_UDP_TUNNEL |			\
> +				 SKB_GSO_UDP_TUNNEL_CSUM |		\
> +				 SKB_GSO_TUNNEL_REMCSUM)

Leftover remcsum reference?

> +
> +#define SKB_GSO_TUNNEL_MASK		(SKB_GSO_UDP_TUNNEL_MASK |		\

Odd indentation?

> +				 SKB_GSO_GRE |				\
> +				 SKB_GSO_GRE_CSUM |			\
> +				 SKB_GSO_IPXIP4 |			\
> +				 SKB_GSO_IPXIP6 |			\
> +				 SKB_GSO_ESP)
> +
> +#define BPF_F_ADJ_ROOM_DECAP_L4_MASK	(BPF_F_ADJ_ROOM_DECAP_L4_UDP |	\
> +				 BPF_F_ADJ_ROOM_DECAP_L4_GRE)
> +
> +#define BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK	(BPF_F_ADJ_ROOM_DECAP_IPXIP4 |	\
> +					 BPF_F_ADJ_ROOM_DECAP_IPXIP6)
> +
>  #define	VXLAN_FLAGS     bpf_htonl(1<<27)
>  #define	VNI_ID		1
>  #define	VXLAN_VNI	bpf_htonl(VNI_ID << 8)
> @@ -592,6 +610,8 @@ int __encap_ip6vxlan_eth(struct __sk_buff *skb)
>  static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
>  {
>  	__u64 flags = BPF_F_ADJ_ROOM_FIXED_GSO;
> +	struct sk_buff *kskb;
> +	struct skb_shared_info *shinfo;
>  	struct ipv6_opt_hdr ip6_opt_hdr;
>  	struct gre_hdr greh;
>  	struct udphdr udph;
> @@ -621,6 +641,11 @@ static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
>  		break;
>  	case IPPROTO_GRE:
>  		olen += sizeof(struct gre_hdr);
> +		if (!bpf_core_enum_value_exists(enum bpf_adj_room_flags,
> +						BPF_F_ADJ_ROOM_DECAP_L4_GRE))
> +			return TC_ACT_SHOT;
> +		flags |= BPF_F_ADJ_ROOM_DECAP_L4_GRE;
> +
>  		if (bpf_skb_load_bytes(skb, off + len, &greh, sizeof(greh)) < 0)
>  			return TC_ACT_OK;
>  		switch (bpf_ntohs(greh.protocol)) {
> @@ -634,6 +659,10 @@ static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
>  		break;
>  	case IPPROTO_UDP:
>  		olen += sizeof(struct udphdr);
> +		if (!bpf_core_enum_value_exists(enum bpf_adj_room_flags,
> +						BPF_F_ADJ_ROOM_DECAP_L4_UDP))
> +			return TC_ACT_SHOT;
> +		flags |= BPF_F_ADJ_ROOM_DECAP_L4_UDP;
>  		if (bpf_skb_load_bytes(skb, off + len, &udph, sizeof(udph)) < 0)
>  			return TC_ACT_OK;
>  		switch (bpf_ntohs(udph.dest)) {
> @@ -655,6 +684,35 @@ static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
>  	if (bpf_skb_adjust_room(skb, -olen, BPF_ADJ_ROOM_MAC, flags))
>  		return TC_ACT_SHOT;
>  
> +	kskb = bpf_cast_to_kern_ctx(skb);
> +	shinfo = bpf_core_cast(kskb->head + kskb->end, struct skb_shared_info);
> +	if (!shinfo->gso_size)
> +		return TC_ACT_OK;
> +
> +	if ((flags & BPF_F_ADJ_ROOM_DECAP_L4_UDP) &&
> +	    (shinfo->gso_type & SKB_GSO_UDP_TUNNEL_MASK))
> +		return TC_ACT_SHOT;
> +
> +	if ((flags & BPF_F_ADJ_ROOM_DECAP_L4_GRE) &&
> +	    (shinfo->gso_type & (SKB_GSO_GRE | SKB_GSO_GRE_CSUM)))
> +		return TC_ACT_SHOT;
> +
> +	if ((flags & BPF_F_ADJ_ROOM_DECAP_IPXIP4) &&
> +	    (shinfo->gso_type & SKB_GSO_IPXIP4))
> +		return TC_ACT_SHOT;
> +
> +	if ((flags & BPF_F_ADJ_ROOM_DECAP_IPXIP6) &&
> +	    (shinfo->gso_type & SKB_GSO_IPXIP6))
> +		return TC_ACT_SHOT;
> +
> +	if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
> +		     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK)) {
> +		if ((shinfo->gso_type & SKB_GSO_TUNNEL_MASK) && !kskb->encapsulation)
> +			return TC_ACT_SHOT;
> +		if (!(shinfo->gso_type & SKB_GSO_TUNNEL_MASK) && kskb->encapsulation)
> +			return TC_ACT_SHOT;
> +	}
> +
>  	return TC_ACT_OK;
>  }
>  
> -- 
> 2.34.1
> 


