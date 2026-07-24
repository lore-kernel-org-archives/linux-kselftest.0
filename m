Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481663FD156
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929316; cv=none; b=Ux9IeI2JOgwotFx2y3nYGVW3ksTpLvsL53RqRujFKHIqSLRUHW/wGBLLwekj7+0ccsNOXhzeP/2qiJODpqRnGnRt9ay4P0hS6pX+HXQ75vWQa2Zr4g4eyQ3d58+JFWyrnV/03L1PDJ3B7hjq3BCzkjrfMf7DiYt3I3rPEUWu3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929316; c=relaxed/simple;
	bh=77AdLZwSlzRXNVmZcPS3aPRWxbdbniwiZ14tXP/9uvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYiuSti2j++N/AnSGOBGI3hSaFmI0ma0fi5AR2knteFbOE3s250/pgs+6+wzMk/r7o3DIZoYvFFbfzrigVWdpDDWylP4WUdbXGOViXzDDlaRA0TINB5NFZEgWbnpsx7OdLYtXOPip2mg8uafYNF9iKNuZkzw2ZU41bp6BkQ5MmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F98VlwXt; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F98VlwXt"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2cabf1f1051so3077465ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784929314; x=1785534114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4ixN669MPx0d/t5228Qef0MeDlKadYsw/AtAwtoW40=;
        b=F98VlwXtHLSvNA3/J8PgB0MtXpYptRA4vJH+f1BbNkuyk7hnC/OYI+WiQKXZnBk94b
         48IzlLfGoW+ntnapKOSLlRmJxhyxm4p0/OQiE2/HoqsJueRc2EZUtgNIKH5WNZKwZ9NJ
         V9SjcIkLRgTxAzJSK/G8hKcAH17/kftrEXMXyDlaaZxMHvxsfw46byRuXY0L3WQNI5yX
         FCIFIDRlnv4YD1mPpQu7DaM/h9Om8xe9KeOsycJSqb+4YjdUo+8AnOvxDUUepR4d5EG5
         58ykwH+HNkITEHRkxOU0oxFwq/39bwF+kWIFU8iw17iaHmRLgtpky/fURR72dge5RQ/A
         Eidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929314; x=1785534114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4ixN669MPx0d/t5228Qef0MeDlKadYsw/AtAwtoW40=;
        b=LRifRcrM/ygSLcubz0UuiaJ1GCi+h55qt6PiDCjEJdZJ/CvUFWAgP7MgqdVsuxtg8t
         4Z563OQQSXpXq/GjYE2Fw6C6lfy58i5R0aEuaRRU/mjHrjzs+49tZkVr0ycsKMFUx/KC
         uqXjU3+TA4FzSqZYrUTWljcSlr6gcOatHObaVjFeB9KHahi/xGkKutnsCOodjkPiC30J
         zCwcPAuESwPDMfYWUPZA9lnacAXpaYK+jNdPEuhC8t/Xrxpvcerw2RjtoSY+xhQAqrBX
         yt1Xp3H9UMOGBUGPLh1i6/875jEXdvcB+QqAaHdeCzou4HBjlUHeVGawQqJ3WZZh4GbK
         4InA==
X-Forwarded-Encrypted: i=1; AHgh+RpJ8dRYwtrUmUrM4YxN7h2DZ+zf9RvZ+F+LYhwXXS2yZ6fBbkN5ffgYVL0URCBWddNcRlbnQdBV9+IhFPH8IWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBk3AVMD6jJV4MutPUFwB5FhsjZY2oQ+7wR9drfwYKMLm9Gm0L
	qTa0K2ZpFUBOapyrOWhzo0yrUTHj00oHX98YcXm+sUhreWBx6eeHugGF
X-Gm-Gg: AR+sD10fP2YpTMq0zNwWLABxxh3fEZKVfnoICBtaIwwSNHay4MiWMRrbikO4/oRiDrx
	Vrdw8JOkU+mDKOqWGQkZOrcl0h6wD0HcB+88K9dtJLepNDXWBqyQ4VVq+DcsyzvIVe/2gpCEdt2
	xrYz4GcU6SgOKXLGTeYt1jSR78ukCt+SA2zCiGdOfSoKKWkFyHzMUKn/H5v7V6GA5hJkR2QuaJN
	hSjNZexMGefCXQcX/eb9LTotWv8aVwOfHSLzkcyVH7YFkfdmbYOaE89ipL67UQTM1Trgz8iILwn
	JLRCqnr6ZZUB2TE0xhvbkkTpbjRCn0zy3TuOE+yG2EqsOSeGMIAOdniV6KtJBKztJmwkpbbkJ7s
	vVQgaXg9hooyI+oGRF/nYHSZkujobJjnxxDPpVg1Dm61YVJP9lTUbpOHonPSlHj2G85ap6/9WvF
	0+iMYs8A==
X-Received: by 2002:a17:902:c943:b0:2ca:281:27f9 with SMTP id d9443c01a7336-2cfde8459edmr1610395ad.27.1784929313662;
        Fri, 24 Jul 2026 14:41:53 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d81csm504415ad.80.2026.07.24.14.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:41:53 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:41:47 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amPbqtxPdhs9QrVP@devvm7509.cco0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
 <amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
 <20260724143001.5afa8631@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724143001.5afa8631@kernel.org>

On 07/24, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 14:04:24 -0700 Bobby Eshleman wrote:
> > On Tue, Jul 21, 2026 at 11:09:03AM -0700, Jakub Kicinski wrote:
> > > On Wed, 08 Jul 2026 15:55:06 -0700 Bobby Eshleman wrote:  
> > > > +@ksft_disruptive
> > > > +def check_rx_large_niov(cfg) -> None:
> > > > +    """Run the devmem RX test with rx-buf-size = 16 KiB."""
> > > > +    run_rx_large_niov(cfg)  
> > > 
> > > Any idea why the devmem tests sprinkle disruptive everywhere?
> > > Disruptive means we take the link down, I don't think this test 
> > > does that.  
> > 
> > Talked to Stan and he mentioned the original idea was not necessarily
> > just for link down, but any test that could be considered disruptive to
> > other tests, with the idea to eventually introduce some scheduling
> > (postpone disruptive until the end).
> 
> Perhaps have such conversations on the list? IDK what Stan has in mind.

I don't have much to add so I didn't post on the list. In my mind, disruptive
started as "anything that can lead to a soft reset". But since the
sockets tend to survive these well, I do agree that your definition
of "link goes down" is a better fit.
