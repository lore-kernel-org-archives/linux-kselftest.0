Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9892E401
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965658; cv=none; b=eeTHshnWRK5YZiSwI4JvkhUMRO8T0Bm4qXXi8wMS7A7NDoJhVtIm1Pc/q7SSPrMHmnf5Y4V/XD3SkV9xCzU6rQA2HH7TYZi609GUvf2g8hOB5N4Gi0+CI+oslFG5/l/PnUbwVmN9GxTCbZ+ikpvL9zkDlThbHsv9ErLetC3UQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965658; c=relaxed/simple;
	bh=vJz1YZIsrkWRgT3a+32wzuiXm4tMPz5zEmaZG9RxIA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQOjER5ip2+2StTAkjPh3rbdPso+v9zHC/llg5MeBlA6CG1J8uRXxqom2H8iM+7BtXCh4ZQRGOPovHb3q9wP3VXhwrkkbYyHMp3UcUPGu0WosQ4Z8Meg8vGw/Rd26PagxZo4RSSHmpqoqVGH9qgWI87A3lR8g1agGMWTE5vyg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRfnyQwa; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRfnyQwa"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124a1b4dd40so1591122c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 22:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770965656; x=1771570456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFllcNF1m/veazpXfhkGge2XTmCfSEav8feNbAw2Nvs=;
        b=CRfnyQwa2BCUtOdsu+n4LjPVI/SU9r5HRyJMFifbMLzX0WqV0NcJgGkn2R6Ire4Ffp
         fFlmgePf8tquqf9w0/KnQ0nu0ma6V/EOVMuaNU7je7auS7+YLreJvULqnDuU43CzUzS+
         BOGlhVsxz+ppVSnmuXbxg915IRDFqA/6WkljT8snWKbgU60FPdEHKa9JGXtochSTkVUQ
         n3kF+bLlVaHrdbGFKSy6mBmi7JsWoqsUx47FEX+DmFIwjVDpHiz8INjw9vq1ecHr5kYL
         OQYbA4MfgkbpgO3xzfi5wYmHtmxbbUS2ttwh7eiW0zQVu8oV4pRdFuB6FrAY6L3h/0kz
         jMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770965656; x=1771570456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFllcNF1m/veazpXfhkGge2XTmCfSEav8feNbAw2Nvs=;
        b=oD85uGhjMYQQVcnbzTfx3ZOKJNunGsez6vt5eUM/IKV4tEtfWLp3jHCkn7SQx7l8O9
         onHqH7G9O+mWfuBVkGGJFntz7t8IeqXQH7BnFZiFgE4QnIBdzQG8Ed7wHfLwVhQvvMaD
         pdmbUoXgdX8x7mGu85DlVg+gGnqS2A8nAJmGgOsSv09lI6U9m58EXof6yeCj1CD6/wvv
         LhiMX0M/gjhaB4pMRFsFcwyiZQ+W09jKolBanuKs4ojuIhfhTGZGHN1LNOYm1KuUClaa
         AOtLxzEsZf02NpNpPQswFll6c9jFkvLLjztHy7ultRZjT3PPxUV9YDpaYNlJm3//1k9y
         Be+A==
X-Forwarded-Encrypted: i=1; AJvYcCVgEqYijfoG/sueS3YfaH4kwkTjz0DObkBoMMVmSQRy+Ah66wvNXRrNQxfcV4HksukstyoERea5I+SJ0QuH5pY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeoW5gebYCJd1KqS0eWwqvqgbU/MqCyBKchY2Wzif2Uj/Gofsa
	hLJnPej8JED7go9iQ9//iILpaTC+zKTzfmgseS+SkmZ9E2tNsVnwfYXq645BnQY=
X-Gm-Gg: AZuq6aLqT1sOhOoNuyO4fgxpjwaqs1f0lBjy5Dni4Zdfe0Q6cJqnoeF9T9/je8rpNza
	OfDX9Z3Nn6YbM0XURY1sPdDVHB7ebqek8fajnfR0eNBa7sO79BiInKOlhhc01O7LXLcb1jMJiGg
	A6Mghu4QpxKpdpMewDqQQoj8oyl7b/SJ2crH+6ScLTQ1AI82HLiVeOgstPQcNQr7LOjCKIV4ltJ
	f6wQCUwSYk5taK+3VSz/b0lFY8xBClTzArv4go0JMRknwsszl8O+nKINPqkd08yfLjvfOtGBVuL
	SU9sALJVQLGYEYo+XHG+z1OeJO9EDR+eg0nENFRu2L1pEafXfsRqJODea70qEHoFtutdZRPDHlp
	0pLc6DN7BOba+p5cJcGrU0UkJ6lfMBsb/ZYQG0RBiHadz2MQNOG/CC35LjY222eg+eJ1NwMe7wZ
	yl5qje5px64aPsGv4Jrk3K2SATFck2yfKK4aLB/SLPLEpJ8z/YbV+xjlod+gbPZJsoK3LEmatDo
	nkYzLLSFqE4vGyCbA==
X-Received: by 2002:a05:7301:2f99:b0:2ba:7033:533b with SMTP id 5a478bee46e88-2babc47ff16mr240332eec.32.1770959815327;
        Thu, 12 Feb 2026 21:16:55 -0800 (PST)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dbe123asm5764986eec.13.2026.02.12.21.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 21:16:54 -0800 (PST)
Date: Thu, 12 Feb 2026 21:16:54 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
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
Message-ID: <aY6zxmRcBSt4ju86@mini-arch>
References: <20250925-bpf-xdp-meta-rxcksum-v2-0-6b3fe987ce91@kernel.org>
 <20250925-bpf-xdp-meta-rxcksum-v2-1-6b3fe987ce91@kernel.org>
 <aNYUqdaIJV1cvFCb@mini-arch>
 <e03d6d69-73ea-46dc-b632-149ef5831f85@kernel.org>
 <aNcZdfCivLR2slFw@mini-arch>
 <aYtqKfv0F0l2-hgy@lore-desk>
 <aY0zd4Esewxa-8hw@mini-arch>
 <aY4FB_Gf31V-VYiF@lore-desk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aY4FB_Gf31V-VYiF@lore-desk>

On 02/12, Lorenzo Bianconi wrote:
> > On 02/10, Lorenzo Bianconi wrote:
> > > > On 09/26, Jesper Dangaard Brouer wrote:
> > > > > 
> > > > > 
> > > > > On 26/09/2025 06.20, Stanislav Fomichev wrote:
> > > > > > On 09/25, Lorenzo Bianconi wrote:
> > > > > > > Introduce XDP RX checksum capability to XDP metadata specs. XDP RX
> > > > > > > checksum will be use by devices capable of exposing receive checksum
> > > > > > > result via bpf_xdp_metadata_rx_checksum().
> > > > > > > Moreover, introduce xmo_rx_checksum netdev callback in order allow the
> > > > > > > eBPF program bounded to the device to retrieve the RX checksum result
> > > > > > > computed by the hw NIC.
> > > > > > > 
> > > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > > > ---
> > > > > > >   Documentation/netlink/specs/netdev.yaml |  5 +++++
> > > > > > >   include/net/xdp.h                       | 14 ++++++++++++++
> > > > > > >   net/core/xdp.c                          | 29 +++++++++++++++++++++++++++++
> > > > > > >   3 files changed, 48 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> > > > > > > index e00d3fa1c152d7165e9485d6d383a2cc9cef7cfd..00699bf4a7fdb67c6b9ee3548098b0c933fd39a4 100644
> > > > > > > --- a/Documentation/netlink/specs/netdev.yaml
> > > > > > > +++ b/Documentation/netlink/specs/netdev.yaml
> > > > > > > @@ -61,6 +61,11 @@ definitions:
> > > > > > >           doc: |
> > > > > > >             Device is capable of exposing receive packet VLAN tag via
> > > > > > >             bpf_xdp_metadata_rx_vlan_tag().
> > > > > > > +      -
> > > > > > > +        name: checksum
> > > > > > > +        doc: |
> > > > > > > +          Device is capable of exposing receive checksum result via
> > > > > > > +          bpf_xdp_metadata_rx_checksum().
> > > > > > >     -
> > > > > > >       type: flags
> > > > > > >       name: xsk-flags
> > > > > > > diff --git a/include/net/xdp.h b/include/net/xdp.h
> > > > > > > index aa742f413c358575396530879af4570dc3fc18de..9ab9ac10ae2074b70618a9d4f32544d8b9a30b63 100644
> > > > > > > --- a/include/net/xdp.h
> > > > > > > +++ b/include/net/xdp.h
> > > > > > > @@ -586,6 +586,10 @@ void xdp_attachment_setup(struct xdp_attachment_info *info,
> > > > > > >   			   NETDEV_XDP_RX_METADATA_VLAN_TAG, \
> > > > > > >   			   bpf_xdp_metadata_rx_vlan_tag, \
> > > > > > >   			   xmo_rx_vlan_tag) \
> > > > > > > +	XDP_METADATA_KFUNC(XDP_METADATA_KFUNC_RX_CHECKSUM, \
> > > > > > > +			   NETDEV_XDP_RX_METADATA_CHECKSUM, \
> > > > > > > +			   bpf_xdp_metadata_rx_checksum, \
> > > > > > > +			   xmo_rx_checksum)
> > > > > > >   enum xdp_rx_metadata {
> > > > > > >   #define XDP_METADATA_KFUNC(name, _, __, ___) name,
> > > > > > > @@ -643,12 +647,22 @@ enum xdp_rss_hash_type {
> > > > > > >   	XDP_RSS_TYPE_L4_IPV6_SCTP_EX = XDP_RSS_TYPE_L4_IPV6_SCTP | XDP_RSS_L3_DYNHDR,
> > > > > > >   };
> > > > > > > +enum xdp_checksum {
> > > > > > > +	XDP_CHECKSUM_NONE		= CHECKSUM_NONE,
> > > > > > > +	XDP_CHECKSUM_UNNECESSARY	= CHECKSUM_UNNECESSARY,
> > > > > > > +	XDP_CHECKSUM_COMPLETE		= CHECKSUM_COMPLETE,
> > > > > > > +	XDP_CHECKSUM_PARTIAL		= CHECKSUM_PARTIAL,
> > > > > > > +};
> > > > > > 
> > > > > > Btw, might be worth mentioning, awhile ago we had settled on a smaller set of
> > > > > > exposed types:
> > > > > > 
> > > > > > https://lore.kernel.org/netdev/20230811161509.19722-13-larysa.zaremba@intel.com/
> > > > > > 
> > > > > > Maybe go through the previous postings and check if the arguments are
> > > > > > still relevant? (or explain why we want more checksum now)
> > > > > 
> > > > > IHMO the linked proposal reduced the types too much.
> > > > 
> > > > IIRC, PARTIAL was removed because it's mostly (or only) a TX feature?
> > > > So no real need to expose it as an rx hint. And I think empty xdp_csum_status
> > > > in that proposal might have indicated NONE?
> > > 
> > > Sorry for the (very) late reply. According to [0] CHECKSUM_PARTIAL can be used
> > > even on Rx side, right?
> > 
> > So is this for virtio (which I don't think you need)? Or something else?
> 
> I forgot to mention before CHECKSUM_PARTIAL is used for the veth use-case
> when the packet is coming from the networking stack.

But what do you do with that partial state in BPF? I doubt you're
calculating/verifying it? Can we treat/export it as NONE/UNNECESSARY for now?
