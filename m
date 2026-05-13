Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100663A3E63
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 23:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714982; cv=none; b=VukvoYpOg89bDs7cMwZYHU0Bpc6CFKESTeK7yR9R1v7w+q2fzMgzSN9U4mhbe3d82K19GPI2oFA3eZ2di7OvN+qSXNGMAtrMXlwW4tPku9qlGBSVQCQqOlSOlscWWfgznQwdY+Ng1xI2678OwZ8fdEZwV53c1xF7SNYJ6WI3oco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714982; c=relaxed/simple;
	bh=WRkaNLoade/kHcGlxINFLxT3tSKwlYeRzg2sFsogsFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMZh6B/hryuN/EJoqRqWtVubTpxaxIFtR5ZypUl+Ri82KN38V1Xk9i5tSbXOAqCRri/pzu5oPPGAp1PKjvurWErruEZ9wHZvLaQ7JsV8Ff8zzj/vOoc6B0LAoCjN9QRRpd4thN8ZtHSStRGdCliB4/kc5H6wWFKfoEzqSpEZAww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HNlI1l5l; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HNlI1l5l"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so5203910a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 16:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778714980; x=1779319780; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XlQrtvdISVLJgYy9KH898nigaJE+pBRQ/dIJFF8SQn4=;
        b=HNlI1l5lcs2s2RpOe/4oAGO85wmwtSazIQtkD+PQVWs3OgW6XPwXg67aYy/FhfDJbV
         nHfUw2DhSLngmKXeBEUe0cK12gfnmymxt04LMTn4bm5mQaLTpUQvvKHk/7qvDCezfWQo
         GoLoSuKr1U1OyuR+0pCFR2UDKT39ibNpFDGJbc55TdGEoSbojsV2RzKzyAG9S/qirfEs
         ySCZU5Ftibae9dv9RAEbn9CwyTqz7QYHzsq3VUdGkFVNjw7iPM98T05FJw4oyXujFEhS
         XDfKXzZFCJ0dY3VBk/4pdJMNMVh4/SxZxKDBMVX6rrUr5WphUzVmIzLACHO7HAQuS8BE
         habQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778714980; x=1779319780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlQrtvdISVLJgYy9KH898nigaJE+pBRQ/dIJFF8SQn4=;
        b=c9d+t7i7VpIVcwHVe311aYiCTxZBY2ShQxz8W3mfP9V6ICSuTw/myq7fBc9w6uDqij
         s7exL6F6rjzmMH55Wr/v0wGH0Ptc1NxStISxxJhI7uyB508ecLQxZKwjvcTifkO50cDe
         wbxHlmNxVhut5E1A3FCYyqixhrmDnyrfamK9H6ozeiRUgLa0rfyTdkXFter9X0XlDxAP
         TLjjolx1pmjvSUC8M05EBtEkzE0SPV2nyeQXlKzzb7zwWJhMnvgRJrw/bOXqtv4ZZpJT
         RFqQv76P+zwxHMUfgVJnMTfZs6fzXnKwkZyP7UAO2ZaJpYpFe6z+Dj6RKEMxhoAeAucN
         ysaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K0yOzEe8Rm+a8iStN3eYtSycAElXBphE2+daJQh++BbURzFrqYpaqOvYLWDXWbpI9Ja6u8Ub6kixih+iNlxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Kdl0gflkab0lcxPKhUM23s5hod2Go0ibf/KefNN/K1/AF0jY
	z05CFlNOHN7Vh6zCEGmBcbkvYrUbiOIt8u8eL7hEod8HwpSpy2LfURdnJlvkrc5dww==
X-Gm-Gg: Acq92OE/wVYfCD36rXm4cPlmnQZRJNb/r9BqjVnstlws6JpryBJ5uXyDUlS9U91e99A
	6e3YlAF0kirV0wdI2Mbl/cO6Oq7NvtNpcYPqkFRV9oG8K0RNlW6H89UVhboq6pOtOO+UrGpxbwz
	MLxaS3TLivGEisme5pD+GnZOGlD4+5nxUCidHB1isDf5EQmvW8pTr3Ly4+BuB15dQv3kLW/KlsN
	cCYknYDNSC0HnIS+unyq6bQRVgY1PB1Vmlu8BqxazpPJe+5v3MlLwp2spGppXDZGCkvIsEN1X8e
	OTbyq/6Wc/e3B+rcVC/uHbyyf8PNOeZyjjsny2jjSBeZop/UcdPBQDd4R1YvP96Eujdf4lEOFvR
	K9Y7La7L2CTirMEAVJeZpedVTbsP9gG1HsT/DRHGUFyfA/QFkuaGpwbS6xbr0zotr9NvH2MPUwk
	6myAL1+hPaE24KRT7AaFlUlQlD0ZU6U0DyVORipSnMBBjz1uOgGxtvactyu7zDlUPGlqo96WdU
X-Received: by 2002:a17:90a:da84:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-368f77f0966mr4991641a91.5.1778714979846;
        Wed, 13 May 2026 16:29:39 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692303cacesm388463a91.1.2026.05.13.16.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:29:39 -0700 (PDT)
Date: Wed, 13 May 2026 23:29:35 +0000
From: David Matlack <dmatlack@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Vipin Sharma <vipinsh@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] vfio: selftests: Add driver for IGB QEMU device
Message-ID: <agUJX_SVgng3wG-P@google.com>
References: <20260511211839.2781731-1-jrhilke@google.com>
 <agJqAO-RRdjMrUZJ@google.com>
 <CAAdrzjtiiOtw7-YL2COgZC-QSFp6LLwq+jP9V3jPKLUe0w7Y0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdrzjtiiOtw7-YL2COgZC-QSFp6LLwq+jP9V3jPKLUe0w7Y0g@mail.gmail.com>

On 2026-05-12 07:12 PM, Josh Hilke wrote:
> On Mon, May 11, 2026 at 4:45 PM David Matlack <dmatlack@google.com> wrote:
> > On 2026-05-11 09:18 PM, Josh Hilke wrote:

> > > +#define IGB_MAX_CHUNK_SIZE 1024
> > > +#define MSIX_VECTOR 0
> > > +#define RING_SIZE 4096 /* Number of descriptors in ring */
> >
> > What's the maximum ring size that IGB can support? The max chunk size is
> > quite small so using a larger ring will be helpful toward getting the
> > device to do a lot of memcpys for Live Update testing.
> 
> I can dig into QEMU code and investigate the max ring size the QEMU
> IGB implementation can handle. 4096 is just the max ring size for real
> the IGB in drivers/net/ethernet/intel/igb/igb.h. What's our target for
> the maximum memcpy size?

I assume you mean memcpy count, not size. Ideally we want to be able to
get the device to do memcpys for multiple minutes to stress test Live
Update. So "as much as possible". There are 2 limits in practice:

 1. Device-specific limits.
 2. VFIO selftests memory overhead (e.g. for the tx/rx rings).

It looks like the driver programs the ring size into the device:

  igb_write32(igb, IGB_TDLEN0, RING_SIZE * sizeof(struct igb_tx_desc));

So I assume we can pick a larger RING_SIZE if we want? What's the device
limit (if any)? It might be just the width of the IGB_TDLEN0 register.

> > > +                     rx->read.pkt_addr = curr_dst;
> > > +                     rx->read.hdr_addr = 0;
> > > +                     rx->wb.status_error = 0;
> >
> > Don't rx->read.hdr_addr and rx->wb.status_error overlap the same u64?
> > It's not a bug since both write 0 but it is weird.
> 
> That's correct, they overlap. I agree it's a bit weird -- it's a
> hardware optimization to save memory. This layout is also how the real
> descriptor (`e1000_adv_rx_desc`) is structured in
> drivers/net/ethernet/intel/igb/e1000_82575.h.  The QEMU IGB
> implementation also assumes this layout for the bits.

Oh they layout is totally fine, and comes from the device specification
so not something we can change.

I was more commenting on the code here that does overlapping writes as
being weird.

> > > +
> > > +     igb_irq_clear(igb);
> > > +
> > > +     igb_irq_enable(igb);
> > > +
> > > +     if (rx->wb.status_error & 1)
> > > +             return 0;
> > > +
> > > +     return -ETIMEDOUT;
> >
> > Is there any other way to the device signals errors other than failing
> > to set bit 0 of status_error? I'm especially curious how it handles
> > memcpy_from_unmapped_iova in vfio_pci_driver_test.c.
> 
> Yea, there are some relevant error bits in status_err, but
> unfortunately QEMU IGB doesn't emulate them:
> - E1000_RXDEXT_STATERR_LB: confirms that the packet actually traversed
> the loopback path
> - E1000_RXDEXT_STATERR_CE: detects bit flips during transmission
> - E1000_RXDEXT_STATERR_RXE: catch-all error bit for the receive engine
> (buffer overflows, etc.)
> 
> The other error bits (E1000_RXDEXT_STATERR_IPE,
> E1000_RXDEXT_STATERR_TCPE) validate network packet integrity, which
> isn't relevant because the driver doesn't package the memcpy data
> within IP or TCP/UDP packets.
> 
> Regarding the memcpy_from_unmapped_iova test, the test only cares that
> the device doesn't trigger an MSI. Normally, the QEMU IGB sends an MSI
> once it sets the descriptor done bit on completion of a memcpy
> operation. To prevent this, the driver disables interrupts before
> starting memcpy, and then re-enables them after the memcpy finishes.

memcpy_from_unmapped_iova triggers the device to do a DMA read from an
unmapped address during rx. I was asking how the device handles that and
communicates the error to the driver.

> > > +#define IGB_TXD_CMD_EOP 0x01 /* End of Packet */
> > > +#define IGB_TXD_CMD_IFCS 0x02 /* Insert FCS */
> > > +#define IGB_TXD_CMD_RS 0x08 /* Report Status */
> > > +#define IGB_TXD_CMD_SHIFT 24 /* Shift for command bits in cmd_type_len */
> > > +#define IGB_TXD_CMD_LEGACY_FORMAT (1 << 20) /* Forces legacy descriptor format in QEMU */
> >
> > IGB_TXD_CMD_LEGACY_FORMAT appears to be unused. I didn't check the rest.
> > Can you prune out the unused macros?
> 
> Yep, will do!
> 
> >
> > Related: Are these macros and/or the descriptor struct available in any
> > kernel headers that we could symlink into the VFIO selftests like we do
> > for DSA?
> 
> They're in private headers under drivers/net/ethernet/intel/igb. Are
> you ok with linking in private headers? The DSA headers are public.

Yeah we already symlink private headers into the VFIO selftests drivers.
But the constraint is those headers have to be bare-bones enough to
compile in selftests environment, which is different from kernel
environment.
