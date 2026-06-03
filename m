Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD83DC87A
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455445; cv=none; b=AREpungB14ppZuuo6ExlEHp/Hul7NQ5uLkZD+BRxb+1ltMMAmDLXeX9NtZhQlFUfv+TWrxYndxnTpcaXEHu1abn+Z2Mb1m6eJyMHlaHMTTF61jwQy9LxuRpYYcC5bmH6CwUo8qGP5/Z1fbZaYYOangIoDvI2YHf4HkUkkvJmkW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455445; c=relaxed/simple;
	bh=N4OxoQTixXI0CRT16N1iXZqTHUvsDx1Q9fcNeE9kgUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU7TG5LC/PS4Ha7vrHaP8kMUpUTFCMp3V7KBWJO7/NyOZpw81ekpFczY8H+oAHyg3X2f7rkfhWkWpXUI3oRH4t9ESy4W0fGj3NEz6ZY0zf3fKRZA5hR87r/4GIVugTDI+87cl18IkGYDHgGLjGk8vf4JIsFQApjTBU6L3xhvft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=E/KUNS3x; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="E/KUNS3x"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9157d3f2098so165168585a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780455442; x=1781060242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3awZDWC/0BEHXSInI6v/h4g63e1F9fJCkxQA7vD56Q=;
        b=E/KUNS3xAzyC0G5EB+KrwKNZP2PaaFGBqYrzzi3riFW2g2Hl9xI4giD9ok2HT6DwCL
         u4K2OUJO3dmn0W5ZKtJ5f/r2xR6z8CKXTWncXmk/lpinHNYaAKMZNWQ8/JxX5elMmjKM
         HFy7vIxTAvEQD4jgxZriuLi4E1f4EmlG7EVlnDE8Wz+RvwLVS6nPuCBe4CR1H8BRDgpq
         Hkc94WHD1xU5zAR2I1oX/q/ZixtaEc+HsSDKvY/8wukHbiN6cACtWFcV3HoEDajqVegw
         onscqy7DfCCZERTXfCIG22TP1ZXsp02TW1N35oI7kOz5CjHslA6DZ8rWxHUnZXz0S3rp
         E2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455442; x=1781060242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3awZDWC/0BEHXSInI6v/h4g63e1F9fJCkxQA7vD56Q=;
        b=N7U1uXrGmIMISVCkGJ5iBCtD9iOwat6E772jj/m21qHZ+z6QxRFi1cZYdn+XpNh3vy
         8nfoSP9+vfylvmR+4RSc+1GceAHsF2yMBZzY3TKM/uz0a0nZ9u52kL9p6soJGlI8vBXT
         HPe0lRjvo46kvbRqUoZCTu6NNoadZo+TK0uYvBBf8JiHgDm4MEYqdkkg2iPWPv/lOQ94
         +oAjWCHS7Ns6YM/nI097Cb2xrcVmggwv7+Ty1f14Up5pFGPIkPJOaYmcICrPumcDNqZ8
         oTue9nzR+Ikba9wLZFfzycbsO/joitn+z8LXYMBuwehV90YGFqqHioGLW1H2qE7K/A3z
         SrBw==
X-Forwarded-Encrypted: i=1; AFNElJ8xJCgsyXZGg9hQ6YhqUq9hLNE2rrCuAjFeEB+OHCsl8rsN+RPPKNCWd1GXUN6ta5Lh8fDt8sEit0tr3fT6LEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytiysUSaYFZdpRO8eiZ24j8u8y4PXzjvwFR/tf4F+ZrUXx3GyQ
	VgVC1AaPnEyYe0twELogQxFziEr7lX0Z07gfmACaciKxVD3jUxx/KWWCxxd3HJknH2s=
X-Gm-Gg: Acq92OFupnOKmcRAdeGo8VGzLNPnlaOuUo4xbfbDBAdmnKecn/wge4/KooJcp6HhYIj
	YNqVT3m6p0J1+BSbtAYwOvaKYBL6g37CiICA/chEGC7/+5ZQYqeu3G8vAxl4I5bvlVBjRCbCzVG
	Ph/66o0p3dW61NIEMaMoU/1Yp4I8DwnNQUHf2OlG7u5hza3il0i7raN9BmBMjTkNEWDz/nJJv4t
	nHoSaY2ED8PKEoFYMeEPxmgWXQIeF0CEHYdLN/5ZB3fptHc0ugw46ghU/00SlyiFnQMys5jMjjA
	SA/RZE/V5PIwsUBXtBMJCZymMni3oFHxmETj1ACPMNOo0zch6dIIveslfvusvr+blag8OKVVjUi
	t9HE/Pp3MPnnSSaSQiTA5BFMAWhV36Sxn4jwqhI30cd28+kBFuM6E6kr0kR9T44kO8/dR+eRQLr
	TD67UH8i2BxEjq/dpG9VLx3adlaiq4bTOLt7MiCIxjbphClpKwrlKVdsH+xxnxSw==
X-Received: by 2002:a05:620a:3199:b0:915:86c6:8432 with SMTP id af79cd13be357-9158a6979f0mr317963585a.14.1780455442182;
        Tue, 02 Jun 2026 19:57:22 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37bae6sm118824085a.31.2026.06.02.19.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:57:21 -0700 (PDT)
Date: Wed, 3 Jun 2026 02:57:19 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 03/13] liveupdate: centralize state management into
 struct luo_ser
Message-ID: <ah-Wov2fvjYbpjHX@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-4-pasha.tatashin@soleen.com>
 <178038801487.119771.6308607614059754603.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801487.119771.6308607614059754603.b4-review@b4>

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:28 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
> > index 8f5c5dd01cd0..c8dd30b41238 100644
> > --- a/kernel/liveupdate/luo_flb.c
> > +++ b/kernel/liveupdate/luo_flb.c
> > @@ -579,53 +565,18 @@ int __init luo_flb_setup_outgoing(void *fdt_out)
> > [ ... skip 18 lines ... ]
> > -	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
> > -	if (offset < 0) {
> > -		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
> > -
> > -		return -ENOENT;
> > +	if (flbs_pa) {
> 
> I like 
> 
> 	if (!flbs_pa)
> 		return;
> 
> more

Ok.

> 
> >
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> > index 8d9201c25412..3b760fefa7b9 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -497,75 +494,34 @@ int luo_session_retrieve(const char *name, struct file **filep)
> > [ ... skip 58 lines ... ]
> > +	if (sessions_pa) {
> > +		header_ser = phys_to_virt(sessions_pa);
> > +		luo_session_global.incoming.header_ser = header_ser;
> > +		luo_session_global.incoming.ser = (void *)(header_ser + 1);
> > +		luo_session_global.incoming.active = true;
> >  	}
> 
> Ditto

This functions get's re-written with early return later in the serires.

> 
> -- 
> Sincerely yours,
> Mike.
> 
