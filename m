Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F23C661D
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043001; cv=none; b=rekAW0MIgIDAPLaXKNT12DwIy31/iemgwsMr3Wd/+Mv0aB8KRCT1aKXSCn5RiA3yjRkn1uiJfg9n8b3zQ4aZ9VC04cfgNYlyjcxdsVc3bXxObkN6QNZfrRo4IbspOJZz/eBi32RGDzW6vIXT9qzo3wQaDz6oIo7JvL2K811GelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043001; c=relaxed/simple;
	bh=WLP2XISDODwrJ9jTE9ldleGxDFC3U/plew2A2E6a8Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uW6o0rr9LpctiE794GyX8uIpMoXdofCl1mn828rM17I5sRmvYfbSMDKhR2KJPSOKJd7CdzWIQqf42Jehe3cM49EvBM6JFDiURYJfV9xV3ylAATLWUlRkim4Iklso+8GOtJJeyfFKjVMGPGH13oxFG3qc2/HFEbQjsZ9lhv6o1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=E8pRMi48; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="E8pRMi48"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-911501a99feso217991385a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779042998; x=1779647798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lirFWsJ5C0bTd/R7aKsYhvTxoj04iUNEXEllFWQcIOE=;
        b=E8pRMi48rMimZqHyZsyiQqtynHdmNsssKQoSp9vRy4l8iBxj9DUzhRjj2QazNuD47G
         gM+O8wp7lRq0CeQeJUA5t+U/jo/j949vaOma/fCd6tPWoMrpo1DE5sTcvd2VObXHUhpB
         s/fQv5e66Gj8uA68T8YpFT9BGokWZ9yzv/0p15T1W3y6MwnLDMaj90SBsr5kv8IpO9vy
         kfPQE2EO2QPxOlGg8D4Mp0aCK4RoX8eNoCrpwGT6HxJIoTJmvTkgp5QXbUGiQsbe79Lf
         tnjeMh/EIMrhYblBWKv7OyqLxrInxyJLVttkYBatYvoM4qmMnFj7v6zilzYbfhvs0oNU
         tqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042998; x=1779647798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lirFWsJ5C0bTd/R7aKsYhvTxoj04iUNEXEllFWQcIOE=;
        b=l29rZaLtSFIZrXzW6HGlmqAAwTczcI61VfRy7Ji39qIToWtI5OVN9YhW2NBF0IqUk8
         LjrgXJWWEVJ0Zi2LO+viy0V2ReyZpNKZbdidrHDY2zj8z9gJXo7ayUXTvW3zoLkfBg0S
         Kd7wo/sxNBiexYg06al2ZtOABAXrJkdj59gWjE+rFeHWzPsCPgt64iB0ueLNhY+HrbM1
         Wo1PcAFA2Gev8okiE/C/ZSuwzMAv2VPZr1ZTFwjpe4piAflxJBQ6v/VuH9SEz9LJNrC2
         Ry+6MEZbzR/GFKtEw6rsKfjFtGASkoLYDQU4x1DLe1SY5R7I74s/Nfc4QtZOkJ/2ImDH
         rSSw==
X-Forwarded-Encrypted: i=1; AFNElJ9fcTH1Ws+Wxbk3YlJkrFxcJaGHiqkTn/OJfwPnwWKUibIjIj1BEotJ3colhS8lC95Ov0VMRoALgvEaB303O1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrAV4NZGaq+KniOFyetU3aBL6klROxLy4Lta3AUu25cAldnUOq
	F9sPktffx+JKddB59N3XZr9s+alJZq+iEh73XaJeJxDrRvY2/0C/kArQwUYpQ3Bn5r4=
X-Gm-Gg: Acq92OHK/5YlC5P32Gm0C9KajFS2kiqpPygkjaIJ2K3G9Wq1g+eeK6Mzi8otM5YMqWc
	RsD0P0Na7Bov3/c2XGbu519c0paSTk59GmMK0lWubOJY6h2yG3MNHzzj4H4tPk5uCnFUJjF0mA7
	bDcoQVzYmZQFquGZjQMfoYxjhzTmjwPz9ZGeQWvPdSNrarfh7u4OYE/QdAJXtaN3jrdoxHfn64v
	RXTRPaC6k+WijIB4YEvPz0p2yNIWqKu6K6qf5nMPEdVA/RJqk+aLqcqbUw4IUJCnybLTQeVeRmP
	o8/LnP7F/dthCVbTD91TXyGPH5R6yFbtaGWhw1YunmUimNzdz4HuI0q4av3E6fkPXq/Goi+kjF3
	H2HgsAwXg/OF1umVGVz18Kg+IvbhcRVn7+E2FjZk+u0rUAlNPRNfKC2yKx16pisTJUO+B8XbpvA
	R0pDdm/c+cnWhwRiMummhOAsdbaps92QZe7X1TgLszUuFI0uVaaCA=
X-Received: by 2002:a05:620a:6cc6:b0:911:a9e4:8b04 with SMTP id af79cd13be357-911d1042fc0mr1877269085a.62.1779042998343;
        Sun, 17 May 2026 11:36:38 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3584esm1221812385a.34.2026.05.17.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:36:37 -0700 (PDT)
Date: Sun, 17 May 2026 18:36:36 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 01/10] liveupdate: centralize state management into
 struct luo_ser
Message-ID: <agoKAw9CQIVIhp2b@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-2-pasha.tatashin@soleen.com>
 <agn4z5ZrFBi9AIGw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agn4z5ZrFBi9AIGw@kernel.org>

On 05-17 20:20, Mike Rapoport wrote:
> On Thu, May 14, 2026 at 10:26:19PM +0000, Pasha Tatashin wrote:
> > Transition the LUO to ABI v2, which centralizes state management into a
> > single struct luo_ser header.
> > 
> > Previously, LUO state was spread across multiple FDT properties and
> > subnodes. ABI v2 simplifies this by placing all core state, including
> > the liveupdate number and physical addresses for sessions and FLB
> > headers into a centralized struct luo_ser.
> > 
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/kho/abi/luo.h      | 91 +++++++++++---------------------
> >  kernel/liveupdate/luo_core.c     | 59 ++++++++++++++-------
> >  kernel/liveupdate/luo_flb.c      | 65 ++++-------------------
> >  kernel/liveupdate/luo_internal.h |  8 +--
> >  kernel/liveupdate/luo_session.c  | 57 +++-----------------
> >  5 files changed, 93 insertions(+), 187 deletions(-)
> 
> This looks lovely :)
> 
> > @@ -115,27 +117,29 @@ static int __init luo_early_startup(void)
> >  		return -EINVAL;
> >  	}
> >  
> > -	ln_size = 0;
> > -	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_LIVEUPDATE_NUM,
> > -			  &ln_size);
> > -	if (!ptr || ln_size != sizeof(luo_global.liveupdate_num)) {
> > -		pr_err("Unable to get live update number '%s' [%d]\n",
> > -		       LUO_FDT_LIVEUPDATE_NUM, ln_size);
> > +	header_size = 0;
> > +	ptr = fdt_getprop(luo_global.fdt_in, 0, LUO_FDT_ABI_HEADER, &header_size);
> > +	if (!ptr || header_size != sizeof(u64)) {
> > +		pr_err("Unable to get ABI header '%s' [%d]\n",
> > +		       LUO_FDT_ABI_HEADER, header_size);
> >  
> >  		return -EINVAL;
> >  	}
> >  
> > -	luo_global.liveupdate_num = get_unaligned((u64 *)ptr);
> > +	luo_ser_pa = get_unaligned((u64 *)ptr);
> > +	luo_ser = phys_to_virt(luo_ser_pa);
> > +
> > +	luo_global.liveupdate_num = luo_ser->liveupdate_num;
> >  	pr_info("Retrieved live update data, liveupdate number: %lld\n",
> >  		luo_global.liveupdate_num);
> >  
> > -	err = luo_session_setup_incoming(luo_global.fdt_in);
> > +	err = luo_session_setup_incoming(luo_ser->sessions_pa);
> >  	if (err)
> >  		return err;
> >  
> > -	err = luo_flb_setup_incoming(luo_global.fdt_in);
> > +	luo_flb_setup_incoming(luo_ser->flbs_pa);
> 
> Sashiko asks: 
> 
>   Is there a leak of the preserved luo_ser memory here?
> 
>   The outgoing kernel allocates the header using kho_alloc_preserve(), but
>   luo_early_startup() returns without calling kho_restore_free() on the
>   luo_ser pointer once the fields have been processed. This results in an
>   unreleased memory reservation on every successful live update.
> 
> This seems preexisting, and we probably don't care enough, but still...

The freeing happen during finish, that was by design.

> 
> There were more comments by sashiko, didn't check them yet.

The other comment is stupid: yes, changing ABI prevents updating from 
older kernel.

>   
> > -	return err;
> > +	return 0;
> >  }
> >  
> >  static int __init liveupdate_early_init(void)
> > @@ -156,7 +160,8 @@ early_initcall(liveupdate_early_init);
> >  /* Called during boot to create outgoing LUO fdt tree */
> >  static int __init luo_fdt_setup(void)
> >  {
> > -	const u64 ln = luo_global.liveupdate_num + 1;
> > +	struct luo_ser *luo_ser;
> > +	u64 luo_ser_pa;
> >  	void *fdt_out;
> >  	int err;
> >  
> > @@ -166,27 +171,45 @@ static int __init luo_fdt_setup(void)
> >  		return PTR_ERR(fdt_out);
> >  	}
> >  
> > +	luo_ser = kho_alloc_preserve(sizeof(*luo_ser));
> > +	if (IS_ERR(luo_ser)) {
> > +		err = PTR_ERR(luo_ser);
> > +		goto exit_free_fdt;
> > +	}
> > +	luo_ser_pa = virt_to_phys(luo_ser);
> > +
> >  	err = fdt_create(fdt_out, LUO_FDT_SIZE);
> >  	err |= fdt_finish_reservemap(fdt_out);
> >  	err |= fdt_begin_node(fdt_out, "");
> >  	err |= fdt_property_string(fdt_out, "compatible", LUO_FDT_COMPATIBLE);
> > -	err |= fdt_property(fdt_out, LUO_FDT_LIVEUPDATE_NUM, &ln, sizeof(ln));
> > -	err |= luo_session_setup_outgoing(fdt_out);
> > -	err |= luo_flb_setup_outgoing(fdt_out);
> > +	err |= fdt_property(fdt_out, LUO_FDT_ABI_HEADER, &luo_ser_pa,
> > +			    sizeof(luo_ser_pa));
> >  	err |= fdt_end_node(fdt_out);
> >  	err |= fdt_finish(fdt_out);
> >  	if (err)
> > -		goto exit_free;
> > +		goto exit_free_luo_ser;
> > +
> > +	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
> > +	if (err)
> > +		goto exit_free_luo_ser;
> > +
> > +	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
> > +	if (err)
> > +		goto exit_free_luo_ser;
> > +
> > +	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
> >  
> >  	err = kho_add_subtree(LUO_FDT_KHO_ENTRY_NAME, fdt_out,
> >  			      fdt_totalsize(fdt_out));
> >  	if (err)
> > -		goto exit_free;
> > +		goto exit_free_luo_ser;
> 
> And here we also seem to leak memory allocated by sesttion/flb setup.
> 
> >  	luo_global.fdt_out = fdt_out;
> >  
> >  	return 0;
> >  
> > -exit_free:
> > +exit_free_luo_ser:
> > +	kho_unpreserve_free(luo_ser);
> > +exit_free_fdt:
> >  	kho_unpreserve_free(fdt_out);
> >  	pr_err("failed to prepare LUO FDT: %d\n", err);
> 
> -- 
> Sincerely yours,
> Mike.
