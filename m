Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD742E8DE
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752887; cv=none; b=W0JQ4Pb0R+IJYagNdpKA1CCp6kdvBrBhrkOFyAGwQcWB4OncYfn8I1pvTy1N5RbdUmkcGoF5rYtMvAC0oUC+KDeI2UIlaql2m3ndB7C4ZtjNjBtpZjQIUQx5FmLB+O7bQENtBX9KU5U4dyOmWgf/1mqP7/nFrjp9flm/2pQy9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752887; c=relaxed/simple;
	bh=Yf15RLlhXlooxQ5ojngrKI3NfRjWBJYoBlpiscAPU24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9ZYP5zzyE4nLpu3tiCRvN/Jf3AYBIEROSP+IzhbtZHvBnArdMFoNP7xOUMDRfmRk3dkpg0xNTXvqSxSx+tI/TmBTBE+tpyw7YyGkccEOlvIHYzFjQJE8oHv++Z49DZ8rL8HBixe3N6YhR0lZiYqyg+ZsE4ZzRmcYRvgBGlvugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvkoZmOM; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvkoZmOM"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so3912520a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752886; x=1785357686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwCODOyVSYFhI5c3HdXAxVNdit7/+b6pODVCWxPDLeg=;
        b=OvkoZmOMoZHgmw+uthSEVZwNaDuIVjFK8r4wZ5vcwzk1Qmle2wf/d9bnQi7DIwBuGy
         h7y13hdrNMox/fnxHCtGBAHc7KTIjEXL94fET8o/Mrx55Aog950ugI93RdQcrchmOP9I
         TVDYhfYydNaVHIspnhmuEy55MXIzI3gaJ+FCdzbibdeazu4m5uGj3FRb9vxqq3CnikDX
         lLXogicjPaQDGxkDxwzRh4hs6v86kKKXZf5NwvReJJ3C4hrI/8HVHgeDIISm3BiwA5OX
         nrmhFK+GobX+1TWgBrj+Zgx23kb8PGPUX3GLX5JdoD48npqknWp3WhPfLS3IuC2DkuUk
         fNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752886; x=1785357686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwCODOyVSYFhI5c3HdXAxVNdit7/+b6pODVCWxPDLeg=;
        b=p2aM+8mq3Y4kesA29k5cAd/Hz5AC10FE2Vr5egImse+gq6Zh17xawB/vXIlP4ABPFQ
         urWxP9O/mw3j17cl2sghgF2T6mOY7j6y5jxzNZ55MUkkPj5W4CZsnb2nheonkzV/qVXB
         m8rLKMInAAXNh+1mCyYHn6C2KQx5dmOlFHgOY0Zh6Ci8mWb97wDG1W4k7k08tPJYjDPb
         fTZvpzVFpmRpO3a/23YMyqhMLyLidKKbDlcL9Z6v8eaThl6e/DhwrA+Q9eDTAOoUDtWa
         XaS1yW+fw92YlPaQBBIlH/DGY8S5vKleoKj0mt54SuihaoA0mGCDRcsp9dl6VpewD4He
         mb7A==
X-Forwarded-Encrypted: i=1; AHgh+Rqg+yfncD2/y/rNcBtbr57vo+CvHotvfMPyVyVrFN1A4Ooe8RXsQBAXdBwkDDfHxePSYMPoUEECZAdJciLdZF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXv0+Biglr7h8IelJdSzbM6MM1aDuSTP7E7vfl54pGxgsAAWZS
	dJ8h9KyrwEoJfi1OeTIYIA3rK5wmK2fp/QOjomM5YLy0h88psnc/Ws48
X-Gm-Gg: AR+sD10a4uZbuJzyO/ElxBJoc9KDa/usjbUhLMtVKIMLeMTP7RVmpAH9kX4RtHM+z2S
	V74xs32lyoLkQ+WgXjAOvq1RC4TvBwQKpzDTAYHmB5EMGw7w7IrWec/2YUAj/uTGldFaJ1ZIB34
	z4KfrIrIGZ5Ifd1qTasLjowvnyliiwHDY0ShtMWuGnnCdd1axE4AZg9MutgeaW7w/73CbpmsSCp
	aYxKTdCAhYtKB010S5d+XFBTzdnoAdZ+AOO9CCKz7nFK0hukbJOPG6GTNMC4gRgE2ZQPFiRomd6
	ZPFO+TnSMUyJU/wCsD4TPmSnr2gVcUDN3hIZfWY/SWQP7FH9ivRZxOc5AMUXOKZvZlhLH0KGAPS
	MQmfUkd6Os1eStLVOJcLj2jY+4VSWgW+0B7FdWJT8/Au8xAxbcUhdP5bhtf1tdwIHxtrqCF/bB/
	4Hy3ek9w==
X-Received: by 2002:a17:90a:e703:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-38ec6406625mr281164a91.1.1784752885668;
        Wed, 22 Jul 2026 13:41:25 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea466e62fsm1240712a91.1.2026.07.22.13.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:41:24 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:40:58 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Vladimir Vdovin <deliran@verdict.gg>, 
	Jakub Sitnicki <jakub@cloudflare.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 8/8] selftests: net: add test for XDP_PASS
 skb checksum invalidation
Message-ID: <amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com>
References: <20260715-bpf-xdp-meta-rxcksum-v5-0-623d5c0d0ab7@kernel.org>
 <20260715-bpf-xdp-meta-rxcksum-v5-8-623d5c0d0ab7@kernel.org>
 <aljNR2sf8qJVKFgb@devvm7509.cco0.facebook.com>
 <alkBnI3XcH0XGjEo@lore-desk>
 <al53WS9FMTnu7tBI@devvm7509.cco0.facebook.com>
 <20260721082728.74142e6c@kernel.org>
 <al_4VWS_EyyZLe8z@devvm7509.cco0.facebook.com>
 <20260721183256.6f49d6e1@kernel.org>
 <amEEEohxmC8hkBvY@devvm7509.cco0.facebook.com>
 <20260722113525.34092660@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722113525.34092660@kernel.org>

On 07/22, Jakub Kicinski wrote:
> On Wed, 22 Jul 2026 11:00:07 -0700 Stanislav Fomichev wrote:
> > > > This is about current drivers that only report UNNECESSARY with xdp: the xdp
> > > > prog has to maintain in-packet checksum if it changes the payload. I think
> > > > it's a fair assumption?  
> > > 
> > > What about decap? If we decap the header that device validated 
> > > as UNNECESSARY there's no possibility of maintaining the checksum
> > > (by which IIUC you mean correcting it in along the payload changes).
> > > 
> > > I think we'd need some API to "decrement the csum level" ?
> > > Or some heuristic in the drivers to decrement if the head moved
> > > by at least len(IP+UDP) into the packet ?  
> > 
> > True :-/ I guess one more case to document?
> 
> What would we be documenting? That it's a known bug and we have no idea
> how to address it? Or am I missing something?

Yeah, that UNECESSARY + decap in xdp has this corner case of inner
csum being not validated (and currently no way to flip it to NONE from
bpf).

(idk whether we really have nics that do csum_level>=2, so I'd just add
bpf_invalidate_csum or something, but it's a separate conversation)

> Again: 
>  .. the ask was to sketch out the plan of explicitly
>  updating/invalidating the checksum even if we don't 
>  implement it today

SGTM, I'll leave it up to Lorenzo. I had this TODAY vs TOMORROW summary,
we can expand on that with UNNECESSARY+csum_level plus maybe more
details on the shape of kfuncs for TOMORROW section..
