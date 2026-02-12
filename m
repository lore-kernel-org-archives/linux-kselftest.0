Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B675173
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 03:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867956; cv=none; b=s8pnpjg+pKvPui/stNdmE/nPhZCJL+09je4ejN8s7uZEFkMuNM24sTJogHW6vP5UStplGAIOcLpPLq0vziZNHvb1pM5roXsa4hQwKfilhd7fFsjDoO/Nut0G/MGtkf3Im+yXxMu7nLtcf3bKctg4UlJZ3eeNQDvVrGjpHYejGSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867956; c=relaxed/simple;
	bh=3/pFoT7VwY4XYxl8Pm0Zwg7Bm4NUYgI78VGG2y+61YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCua4Obfb5KsDtldRXy482C2sPqN/w90mHt3O9EHN01QERoAOfqaGW/8L5mQtC/GGYktCx4R0eZtQACTGcFT/F/s9lCX1gqJo0lfXaSi1lxJL7K2r6c8bXt8Z43LBHDPGEiAaYXY4m8UKP1soj2SgRDh6b20qPg3NfUmlUfwNMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKuRJGeP; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKuRJGeP"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-460f3f9fdb1so1095393b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 19:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770867954; x=1771472754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tK21a4JoivTAPugf5a0tgKET71snd9+E0xX3YsV0FIM=;
        b=RKuRJGePexikpaOmpE4BIgrlbmS9PF2RqX1+CqwXZ5aXLcf7hAMaCw87N96VOD9TTv
         FBSwaqwbpJidMAZihaJYM4b0wbSjxQmZQuL7kEpW9TWFW0EzavPUVBkDIx0ylQ2hTFTG
         GBs4Q946vQsbai6orKdAKlLX6ebYIxAV0I5LdcofjGF4MG2vpWPxVp399CiBSRhfxD0E
         59eZZIVOojqqYP5USYW4nQ6PkbrqSqrZfNH8HTkdgvsRw2GNBdsHS7e3nvM7c/eVOWTk
         ox0TElPNqWAMOHl7hCDMCDYTtuauCe8pprdwvd/zLkIpHqXtWWPdgWf/bCZi8KJuUB9Y
         e/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770867954; x=1771472754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK21a4JoivTAPugf5a0tgKET71snd9+E0xX3YsV0FIM=;
        b=atFJacKAYFK3l6BzRZ01iwIWNk13gepSj56aeLqjQyFT7s7990D/yhLDzq8HcXNVtB
         VzCKOBqbbvDKFNpdb4yo/14x9LOy93Zx+3AyMckCGLvvTsb/pF0TGoeOde9thurRc+0s
         06c6csFQdo4WpxdQKvlQl2QeyfWcWF2o4J+WEAgULCFGWklK8Piu5GP3pHAV55qY6rd+
         eAyivpiYDnDyt4dfZufvNYSQ8K4sH/QR1czKeg4fjd6zXrdUsd1kSwA6vwQdnCB4hmdo
         3vhTcpiL3NQE03HY9mAwERgyuqJ272g8rWHbcq1DEUsU/kCKDhJIHfBfmDx0uCDIg12A
         KZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXXV8oRtPkOGFW8IKrTOATWyby/2fR6icv7VOxBHCueEdgfipqNcecnMXVpn9IyX/R/O7CbiBI7W5tAa8yuJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TNEaAdlgjE9l09k/cvC4C6STcz9SfvZgbAZWKwNO+zCY5aBL
	5nXsmublVpCngyMgadqcbmT4mHkfO6M+z2ZaNCjDnnrrf5idNhqvBwbg2TY4
X-Gm-Gg: AZuq6aKiRMNRQQKJKV+RcfFHKDi4T0CMpuYdiW7K78m92OqDHedqbFNAWjglQuytWhv
	Dn1W8EmklUNJi/hXQmq7E9MiwAusPmHgrPkmvhyjLWro+yo3FF8v2kNYFMjfcawWSHX1dGTXKjq
	d0J2Fbno1X30AAVFTqWyPcpWEy9Zxl5CgoPElCjO/aiYtEpTQRoH6+SM709KwKAdSrtUYcNnm2U
	/XuNBNi27dmPQJm7tSht7UhmJa98/T1GonY9+DMv0hChQClexpJhhJ7+2QmLDxPUWLOg6V4/1dl
	qDG7jQA/YPHV3mr7/LslI+DHQuVQTIpRn3Wu+V9DYViNLEuodhrI6YKtmm6N6Q0eqwzz6rGmUwl
	7fjKuca/t5Zgm4GLoB5ehiAIufsjqMLEIz/ezjsBtP++JsfT7CUHz7H6az8cY1IXxs6tACDkJxS
	2RMbTn6BkNJJMsIztdYjCkrRXCV9Fjxixs51k8uZsiU4pySnJlWR0uWPjEQPqLmzwp6E9PI0+V+
	hC6kououZBhdvr+zw==
X-Received: by 2002:a05:7022:249f:b0:121:d898:edae with SMTP id a92af1059eb24-1272fd99529mr389245c88.24.1770861432625;
        Wed, 11 Feb 2026 17:57:12 -0800 (PST)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a6e943fsm2870384c88.11.2026.02.11.17.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 17:57:12 -0800 (PST)
Date: Wed, 11 Feb 2026 17:57:11 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC bpf-next v2 1/5] netlink: specs: Add XDP RX checksum
 capability to XDP metadata specs
Message-ID: <aY0zd4Esewxa-8hw@mini-arch>
References: <20250925-bpf-xdp-meta-rxcksum-v2-0-6b3fe987ce91@kernel.org>
 <20250925-bpf-xdp-meta-rxcksum-v2-1-6b3fe987ce91@kernel.org>
 <aNYUqdaIJV1cvFCb@mini-arch>
 <e03d6d69-73ea-46dc-b632-149ef5831f85@kernel.org>
 <aNcZdfCivLR2slFw@mini-arch>
 <aYtqKfv0F0l2-hgy@lore-desk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYtqKfv0F0l2-hgy@lore-desk>

On 02/10, Lorenzo Bianconi wrote:
> > On 09/26, Jesper Dangaard Brouer wrote:
> > > 
> > > 
> > > On 26/09/2025 06.20, Stanislav Fomichev wrote:
> > > > On 09/25, Lorenzo Bianconi wrote:
> > > > > Introduce XDP RX checksum capability to XDP metadata specs. XDP RX
> > > > > checksum will be use by devices capable of exposing receive checksum
> > > > > result via bpf_xdp_metadata_rx_checksum().
> > > > > Moreover, introduce xmo_rx_checksum netdev callback in order allow the
> > > > > eBPF program bounded to the device to retrieve the RX checksum result
> > > > > computed by the hw NIC.
> > > > > 
> > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > ---
> > > > >   Documentation/netlink/specs/netdev.yaml |  5 +++++
> > > > >   include/net/xdp.h                       | 14 ++++++++++++++
> > > > >   net/core/xdp.c                          | 29 +++++++++++++++++++++++++++++
> > > > >   3 files changed, 48 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > > > > index e00d3fa1c152d7165e9485d6d383a2cc9cef7cfd..00699bf4a7fdb67c6b9ee3548098b0c933fd39a4 100644
> > > > > --- a/Documentation/netlink/specs/netdev.yaml
> > > > > +++ b/Documentation/netlink/specs/netdev.yaml
> > > > > @@ -61,6 +61,11 @@ definitions:
> > > > >           doc: |
> > > > >             Device is capable of exposing receive packet VLAN tag via
> > > > >             bpf_xdp_metadata_rx_vlan_tag().
> > > > > +      -
> > > > > +        name: checksum
> > > > > +        doc: |
> > > > > +          Device is capable of exposing receive checksum result via
> > > > > +          bpf_xdp_metadata_rx_checksum().
> > > > >     -
> > > > >       type: flags
> > > > >       name: xsk-flags
> > > > > diff --git a/include/net/xdp.h b/include/net/xdp.h
> > > > > index aa742f413c358575396530879af4570dc3fc18de..9ab9ac10ae2074b70618a9d4f32544d8b9a30b63 100644
> > > > > --- a/include/net/xdp.h
> > > > > +++ b/include/net/xdp.h
> > > > > @@ -586,6 +586,10 @@ void xdp_attachment_setup(struct xdp_attachment_info *info,
> > > > >   			   NETDEV_XDP_RX_METADATA_VLAN_TAG, \
> > > > >   			   bpf_xdp_metadata_rx_vlan_tag, \
> > > > >   			   xmo_rx_vlan_tag) \
> > > > > +	XDP_METADATA_KFUNC(XDP_METADATA_KFUNC_RX_CHECKSUM, \
> > > > > +			   NETDEV_XDP_RX_METADATA_CHECKSUM, \
> > > > > +			   bpf_xdp_metadata_rx_checksum, \
> > > > > +			   xmo_rx_checksum)
> > > > >   enum xdp_rx_metadata {
> > > > >   #define XDP_METADATA_KFUNC(name, _, __, ___) name,
> > > > > @@ -643,12 +647,22 @@ enum xdp_rss_hash_type {
> > > > >   	XDP_RSS_TYPE_L4_IPV6_SCTP_EX = XDP_RSS_TYPE_L4_IPV6_SCTP | XDP_RSS_L3_DYNHDR,
> > > > >   };
> > > > > +enum xdp_checksum {
> > > > > +	XDP_CHECKSUM_NONE		= CHECKSUM_NONE,
> > > > > +	XDP_CHECKSUM_UNNECESSARY	= CHECKSUM_UNNECESSARY,
> > > > > +	XDP_CHECKSUM_COMPLETE		= CHECKSUM_COMPLETE,
> > > > > +	XDP_CHECKSUM_PARTIAL		= CHECKSUM_PARTIAL,
> > > > > +};
> > > > 
> > > > Btw, might be worth mentioning, awhile ago we had settled on a smaller set of
> > > > exposed types:
> > > > 
> > > > https://lore.kernel.org/netdev/20230811161509.19722-13-larysa.zaremba@intel.com/
> > > > 
> > > > Maybe go through the previous postings and check if the arguments are
> > > > still relevant? (or explain why we want more checksum now)
> > > 
> > > IHMO the linked proposal reduced the types too much.
> > 
> > IIRC, PARTIAL was removed because it's mostly (or only) a TX feature?
> > So no real need to expose it as an rx hint. And I think empty xdp_csum_status
> > in that proposal might have indicated NONE?
> 
> Sorry for the (very) late reply. According to [0] CHECKSUM_PARTIAL can be used
> even on Rx side, right?

So is this for virtio (which I don't think you need)? Or something else?
Can we start with the "easy" cases of UNNECESSARY/COMPLETE/NONE? I'm not even
sure we need to expose the csum_level (start with level=0 and handle
encap if/when there is a real usecase). With kfuncs we should be able to
change/extend the API when needed.

(for PARTIAL, not even sure what the BPF prog is supposed to do with it)
