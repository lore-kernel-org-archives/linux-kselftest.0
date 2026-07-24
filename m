Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815953B47D7
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911199; cv=none; b=emoEQIlQGPCuIagwSJPaRZvM65xcmQZsnmgF0tWRgQHX0iyHS2BzBLkUKlB46ZVXM/pvGCTd6UZCPJuJ/KL/pcdYYSpTYf04faVXImZpxsdpB5w1JVZQjAxLB+8aiOmjk+hHXcCIRXa6Mzu/i7dNGI4objKhCeGe4SshR600xxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911199; c=relaxed/simple;
	bh=rxpQc12lsUWEKrXL6hgR5Ul4ob5uHCzCMUR1TSqQtxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4R57yU+NoGIojtNnHS5Us7lrl8wxDelgWJE17Y038GimW+4M/gPXqwItFFQjVBsU8MpJU4EEFdASHJQnNsHaQiePJh0JnGW+2iIZAVTKHSVUasuXO7QN9ngwoluQjijYk8fckRKnY38sO0p1HF192SpLFwQ/f2jjDK9vgIwz7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erjUYXfu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erjUYXfu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848743155bcso318468b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911198; x=1785515998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhTRsMUDFAKZh60GY3lXmo5DTZVRrbo+NNX8ufmzfOc=;
        b=erjUYXfuLYe4+SuorcxzU+FMwuXss9uxmfHrCUQYWGk3zfybKZBSf/WlWldJk7FNBC
         tAshTeDxYSpMkZQ9oMCYrGYBYugRAZXXPjsq4MznEeiw6KuJl48JCUJza13yBdFV2Gcg
         eK/Fch37D9EfjOo27NBD2rOiMCPvK7PfjDZVOGMTj2Gqr3EN1/bqx4+iO1p3tK63FR9e
         xY2j42LNR8nmq2o/Ep769+R1StMlAES3JE0cEpIkmT4a/jCnRACQZes6nGcItlcZwowA
         lTmeRyt4PKxrIxUlIpBvdf+kXc2uQLlODIuLqhydzlYxWVG8RcDroarCPvAYuoq+sGhX
         hO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911198; x=1785515998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhTRsMUDFAKZh60GY3lXmo5DTZVRrbo+NNX8ufmzfOc=;
        b=k53TGd0nSwEtIfAC+lqr7ycwzMbN2gTKWGt40CUYf+OpdlAbus8AapD+OZVJY8lyrc
         SH06n3QrOsV9sNElF14CBQBvChMRhpT2c2Qdb790nq6J1TfzpKs1P17efd3+PbZlhIW4
         M+KY8cmuDE5G2VwfH/pL8Rs3fQBj6KRR1h8L4kxPx95LRe8UmAtkO5e9is8QvHJrTqrX
         Bs7WmXKWzfKVTIfoRe+6rHQZkOtf+3OmhTdw1mYZblUMVx4ggnrqaodjJWLJLGj0w0aD
         Ma3FGdcJf8ACBNt1pdtvyKwDQwny4PkFw+nVW9+5dHs65UW9KIi1LsulHkW94TDm4Rw5
         TlsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNAmY6wAp58BW6H4f+AbntuQ5GBvMWB44nYZy6lCiwW3rcIxwn4o83iA6jHnJrjuj2s/N6p0srPbQhqRU6Vl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FPO4xvSCFRNHy8z18zf1TVplb/WfB2hnQ4IgFbEXQQCXY9rV
	ma3PJvIUIxD9xieFtQgqLbzf6CWU54O1okQum8Tbf4ANXr+Ni73eNpkI
X-Gm-Gg: AR+sD13tjY/K/tZQBMT8A9PHlaJe3S0i+ZKQ30nhZiBePdAiGEn9ct7glpSJycY3kBm
	+UpY8yZWMELWvcWTS/Fd8f1j6I8JxhuP83elySPlON4cJnFShq6xL2d6wJa5rLuOZrMUj3iHKSi
	tJ672cC+K9elL52M5+tyGi9kTH2HRMlmg7L6sg0VxqLqlSMYu4TJSTglEmuYLc6mTShUOdvjnKR
	Tg0IYLlAN54oJEvVw4bzAL36JTzf0JLI/PXf3FY1L8qiJ3aR+AjvSQIYH3bLWvHWfJ+M7Ss6CgG
	o5izJDgR2L/7IrBCMGsZM+do9OgDmg/5cIRr0eAMJXKWKzFsNVM2t04GFXEWKJvwG74inMrfpDZ
	SBdBy/SvmMau/hudzAjxsB+ouiT3oErzWaWBFVtYVDpYLX5aLgT7BQYfhzvlDJTlhZQsaOGaEmO
	l/F4tWtkWIKGV7Kzxy4xcXXFM=
X-Received: by 2002:a05:6a00:430c:b0:848:47db:a0ac with SMTP id d2e1a72fcca58-84e2b8aa987mr8703690b3a.27.1784911197498;
        Fri, 24 Jul 2026 09:39:57 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:70::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm163841b3a.44.2026.07.24.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:39:56 -0700 (PDT)
Date: Fri, 24 Jul 2026 09:39:54 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <amOVWgJ3BAJ8I/4+@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
 <20260721110713.325d36ba@kernel.org>
 <amKqlqgfZipKjrii@devvm29614.prn0.facebook.com>
 <20260724072419.62778bbe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724072419.62778bbe@kernel.org>

On Fri, Jul 24, 2026 at 07:24:19AM -0700, Jakub Kicinski wrote:
> On Thu, 23 Jul 2026 16:58:14 -0700 Bobby Eshleman wrote:
> > > > +	if (info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]) {
> > > > +		u32 rx_buf_size = nla_get_u32(info->attrs[NETDEV_A_DMABUF_RX_BUF_SIZE]);
> > > > +
> > > > +		if (!rx_buf_size || !is_power_of_2(rx_buf_size) ||
> > > > +		    rx_buf_size < PAGE_SIZE) {  
> > > 
> > > we should add a check: min: page-size in the Netlink policy?  
> > 
> > I played around with this adding:
> > 
> > Documentation/netlink/specs/netdev.yaml:
> >  definitions:
> >  +  -
> >  +    type: const
> >  +    name: page-size
> >  +    value: 4096  # dummy value, to pass ynl_gen_c.py checks
> >  +    header: asm/page.h
> >  +    scope: kernel
> > 
> > Generating:
> > 
> > +static const struct netlink_range_validation
> > netdev_a_dmabuf_rx_page_size_range = {
> > +       .min    = PAGE_SIZE,
> > +       .max    = U32_MAX,
> > +};
> > +
> > 
> > ... but the dummy 4096 is kind of annoying. ynl_gen_c.py can't know the
> > value of PAGE_SIZE but needs some value for its arithmetic checks (e.g.,
> > confirm min < max is true).
> > 
> > Should we stick with using a dummy value, or should we add a patch
> > teaching ynl_gen_c.py to allow value-less consts (skip the arithmetic
> > checks)? 
> 
> Let's stick to a dummy one for now, but maybe something obviously dummy
> like 0 ?

0 sounds good to me.

> 
> BTW did you add both min and max checks? Cause the only risk with using
> a dummy value would be that the policy will be rendered inline, and
> inline policy is u16 so 64k wouldn't fit. But your sample above has a
> max of u32_max which forces the out-of-line policy, which is what we
> want.

Yep, u32_max:

+	 name: rx-page-size
...
+        checks:
+          min: page-size
+          max: u32-max

Sorry, probably should have just sent the whole patch instead of
replying hunk-by-hunk.

BTW, how expressive do we want these policies? For example, would
absorbing the power_of_2 check into a policy be valid in the future? or
is that too bespoke?

Best,
Bobby
