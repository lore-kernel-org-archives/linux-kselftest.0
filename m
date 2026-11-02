Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662688;
	b=ibbWw+cQWAR5JdrH3mpCyGU0zXiYrG9ViXj8BjaKU9BAJxDQGrVtGrf8GELX8KgGlL2J
	 zjBSytgJtc81xTl+YtYKShv3Tjo1uqArTYhF/I3Jj4xEPUljM6f7rnMC3GxDyM2lIAJOT
	 DVq3+wFxl+dWOzWMCfA/Gn96f582kYgTbaj5XGSpzxDFtjMXfmK+LBOIRNDTdX+iXBSJ0
	 PvJpTMt7DvHcoVdqso8EpHhhM4ZefGG2bYzoxz8ku80l8+MW957aWz0PKUZMFaEuFU8n7
	 Uh9Zra/fX7otHYlrS3mKsRzy6ieo/maC7OrzJqBmSUSLTefjAAKoxgkoLpx+ZNX5VJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
	b=sILETnekEAV04tltkofR73oRg7iRL5no7Nqq3pWoRvz4hWlbB5vNzzSK8GqG7jNoMYN+
	 zVZPsKR8+/keS7UePVRcFSKiXgaT+daLMMhKooqlMwozSfysNKqTJGn3Jj1WGuguiIvhn
	 UMIukCQHR5CG3eiP5DZgQlV3Vl/UlDA0Wv2LjEj5I7amnXmKnF2P3X6vW/TTA/B75GPDo
	 M670j9JDg0wW747oPAqE4o5hv7yQOLskf/3PpHyl0zP6JYRbMhUtFziUpq7WPsF+mK/99
	 WVy25iVh9seYsuCuWiqb7/NoNkWMuDKZYKwH9PhU2YMOyJrEW0Zi4KKmEBBSFFF5z1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C9606A33A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701C9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwrWH4g5
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so1676270eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662687; x=1794267487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=DwrWH4g5a2ySoC+GOC6eDg0PYRp7kGP9JqdiDDKQU+vGcurm0exab5wPwxJ0QyOwWT
         2Fy1qABOHcYH4XtCS9N93PB3f5mLk9h1CqWwZKRqQOE0783eu+1pjl+5aBSA8aIDUT5y
         kRsrGrXLGooT2yuPKu1NHWCBJ8t8DbWXvJHSr8qpg7OenSVvzNivb3UVHBsv8XUuzv3d
         EFEs/jZg5QvPXc78m9V/s4lPqx8NYIz1h4wQ2paI/UL85bH2HHR5x0gwnKVWe5NepVeM
         npoBHLbHCq2DQ4oqarJVcLy1iMxKK3M4BZkpFG4cdgyiRfVDfKbEiy4SLaa+Z8J1JNQU
         F6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662687; x=1794267487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VgQ+KN2VyFhEnUQIyYXKW6M1JeW0WUnB3l+NuZRm2I0=;
        b=HJ6sn6lktx+1QHKfDAQYGqEuruNt1Vki0dzOSxa+cFeY7zx6wxpToDDvVxtLESoiJ6
         ye0RcoH9YmFZubVINF/lDvUDn0oX4T81Sl10NZq/wB16Plw2YQkFihAhXqzeqdUAHV1d
         7RnQW/Yf3XlhLJJFWCOGZUBlZlcT5b5DG8htp+u4oJb8YzpAGtba0IB+/FtUrdWtQkxq
         d43n8gwkveim/jrYCLB5MzmJya00PkYBtnbqJJlPFuAHHmte9PzLzXW/KmGyzW0eD4pD
         0O+tr0UXUDzGWipIzV5GbiklpbX8UmCYA3Zdeu42bIqUmG3XADXWtrw7Z7lTDZ61RoyT
         gVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+e4l1O4JPbqlTUZjblZZ9s9trJ0fIBBOo0Q+fC1uL0HDBFLxoxCR22I4bpkyA/ZeBbKZtURgKklrXzoXUiDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qP4lUQGvbJH0GlfkQhiYlDIOu+PbaGdxoSuqqmyv8mA1aAj9C
	eIKIF7QsSNrZV3ueL6CxfPoV80eh5HTxap3xYnMDdGSacMIMSm7NwQyQ
X-Gm-Gg: AYBFou31U3LL9jYTZKzE8s01biXE3YlCfwGSaYqRcWRAKr0SRbPwqecZxvGHuoOds9n
	kquvv97AMS7qTk1XoP/0me2p+A0g0EOSTzH4GMpNhz9/O7Xu7ICEoVKCNZXlf5edIUIuL7m69bW
	dwxpkilWobYSTacbTeD5SHP7khK5T0MgRHA/khr0+nvn35nM67INlb/icuEmL72k3wN6qrGIixL
	svVLTbdBNLYWzPmijlIbqp063GzIGtIKNGv7M3UvoHibdoxT9thZh1ksNiGqaNlX1z2sqctVGqM
	rnYZ/2mHyv81EadkqH3NmUkWZCNZBg2H5RW0i79KyYP50B+XwIj89zPbSuSPhTJPVSuQyqFweUI
	lse657DPGOSbFhu7/lbpFy8eD3PanZHnEXoh5WYKZ3Eg2kFQi4GeA05/hguSqDCJQDwRsO2RdKH
	gCCtDbgcGOfxd01WivQwyRA3PFnj4vJvA0+M8DYXsZ7ztWZWp5PLQxpZMXDCnqdayo6q3d+jg6u
	EJJxIJcnmVEMZUxaY3a5op+XWN7+YEMML9cjO+6Ix4wSV0artiTXyskFc2Fi6A0DVbV7Uuq9ZB2
	ft5Lw5AI9maZrUmqTajShg==
X-Received: by 2002:a05:7300:c7cb:b0:36a:214f:169e with SMTP id 5a478bee46e88-36a4238426cmr18543511eec.21.1793662686396;
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca83sm1701518eec.0.2026.11.02.15.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:06 -0800 (PST)
Date: Mon, 2 Nov 2026 15:27:23 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <aukb2qxV5Y0b3H0N@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-5-sdf@fomichev.me>
 <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> >
> > Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> > frags to the limit of the device the binding is attached to.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
> add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
> Either you know what you're doing (maybe document in the commit
> message) or we need some more alignment on RX and TX.
> 
> TBH I was dissapointed when LLMs started reporting that
> binding->vdev/dev are treated very differently for RX and TX and I
> have to write a cleanup that consolidates this:
> 
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> 
> I think maybe my reviews and yours maybe should be more mindful about
> keeping these memory things consolidated and as much as possible not
> RX/TX specific.

This patch is mostly a bandaid for bnxt which can't express sizes
longer than 2^16-1 in its tx descriptors. And rx is even more restricted
I think? Up to 32K HW GRO aggregated?
