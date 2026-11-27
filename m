Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804552;
	b=zjJqo4cFchwF3EiYtD+APe4iRWJmBx82GzQeE8nQt5x3Qthd+wCmGEwQ4Zsq0FHG0tTG
	 jxn145WM0WIb9UHQwGN1WVjrDciSG+ralyBv+S4zLdk460Z7MNESESNDl0EYf0rxwBt7K
	 P8Fnba7AFYekEOOC7jtIeA/aA+qJQhpG3cR14tLCGTkWXWsM1BgW0DcxLI/aq2l6/RL90
	 uc6pN464bCUOfOHW20kqKSbFEVj0fbQf85DC1L6UuFH+VJpFKKuQemNz5Zi5k8YdysBHw
	 uVdTI9rskljQ4ZibjRl2ECGxuq20GaWrx99M5S+XtX4+t3cmikIJXffhIz6t5PaX3jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
	b=uFUadGaqUUq9ASioTlJCe6n0tefReOoqexj7HMzcZzTVNZbq3Uf95cG4+mFbAm/8WPt0
	 T1SaEusCM29OnTmvb7gHTxirMuWs+sJdqUto1k4/cl2KWTC6bEJTyl5yxJpiPN/quvoyV
	 ho/gWGLmUkVTmHd7zQHW1MkN1ksPsSsNP8kgH8Ho58W+SRUIaEh0PaIFHAxR6zNKKsFgv
	 oP4Qyvq2dV4OJR1IlFppeMnI15VEr6rgk4uxbK7WHjQFgfhtpZPTvzpzScnLQrEdPHQXE
	 qg1HeFBjZLGOeCqvPsmDKf8JuRebCn6VgDVcVWVuNHaX9lb2xSO6TGfgiU9xlVQb9sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Fj1bJxJ0;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686E606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5686E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Fj1bJxJ0
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d360ca878so75456711cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804551; x=1796409351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=Fj1bJxJ0/q+RCXCL+ngrgkwcF9vPXRG9KyQ+E82YNMaBs0oRjulHVQ/26cv0e4+b5u
         W754HR+EZ/XzS6ncfOunsPe7plYOuq6Cmoi8KQxSetFUApHaQJBxC+t6H0KCBnkZOfsz
         e8MzgoFJrAWOL9ZPB8FvGhj8ABGzeXR2CBOotSDjuJVbw8fsP9btqkcAthJ1icYxSdvi
         2ocIY2FYVJVe18nQMXSHybxY/PTXbTs6O22AyLJayF3ptX1w05wnFQwkfCn0yt744AYQ
         lK0Oteoy7D1yLBAWeZRG6EZ+P87QYxG0zQrm0ak9iXwE0TKzbiMZ6oHR7WgLupm8OkQc
         iEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804551; x=1796409351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=TDU83vUVaSAYUo+QMCSBolkSGAZb58cQBxLzLs3EudbWGly5bTI9X4tyWREB+7Pxao
         JsKy4TCm5KhU+ciRiiZ8cRkJbCQSXGd49k3U5FjCkYf3OLMh7yV/Aj7nHCFm+/X+vvH1
         xU7qZKsMkdiFBtfivCn3sRt4HmRLM1xLZr+CQjXFLDX7rNj3mhX9lKvNMkP/bHfunaZO
         OaySneRb0TNHFmscnowqSpRBghPq2RRZF8lDWZaebwQmt5/+3pOlVfslu7XU/TI+EBP3
         OMP/knLPq7mwgyNl9JJA4G1tWnhMk/nADsFCZSawCbK2mUXX4fFOp2mYxIc+7jYSwb9T
         PpMg==
X-Forwarded-Encrypted: i=1; AL+hErE8c1uCJe6BDlBV3hJuapZOeChzd+XO8hnzM2mm8VGvFbfRWmt6GuiggPleDZdh0YHDTHybmfbBV6HaFsPF5JE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EySoUeRC5eR95duX5xvxUZesyy9sA1W1jXVX2hrx/Ii7A/oij
	ytOZ1/CyBjND8iLbJdh6hALkNQtzjHQQdRS5pYfEiZVZcBEbkB0+mNR2EVeOoLO6BLNGsmFjrVO
	eYu9S
X-Gm-Gg: AZFdTZeg93yNq79/35x90n54hcIw1mvZZEBnwr7S9VsxMRtmhOX4KIa/FgjlZpVKraR
	DS3USBZJnVwu1d4KFGcHZ8BgWSHdb+KFofgULiM4H5BvbBHZgpmc9Jl4L5tguCEKt48ks1ydZ+y
	JhpnPgs28dQDI1nKjHYXFDxhRK7E/YyXKGX0Pv3s2WHKA/u5CQbIhFc8H9ylqKz4o4VE+/GE++m
	jkr9Tx5n9V3A5MaJ0IIi4Stl626FF8vAdCjSo99ROjHyAPFOsJiviHX/VbjY3P7odhSsEngtom5
	otwKV7b5Xk8ScRldhBIC6if4m9qh1TQ/4mNQ8coU1apv8hSAeJHjWCyx1ouEe8OqTQrha/FOXR8
	B1AtfVYbItz2BxDNtvlplHfjlgkzMRUwQ3xh6lzREwJ3zCsvm/o3bCBvEiLVHZtPwMYY8FUnEmO
	k4VWiP1nVerOCuMzurtF4+KeOuNz8VA43qA77n3m/NcrM6KbRfKgg7SopCARBrWxFPw2Jq0hzRc
	qVGxJCVSooVyk2MDjv5UUJzFKwxt1Zo8tgfZcdZ+9TOGIHfru7LdTtkKylqt+iX9TPLUo61tQCP
	0G2JgA==
X-Received: by 2002:a05:622a:5a0c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-55d76aa5123mr463929871cf.28.1795804551241;
        Fri, 27 Nov 2026 10:35:51 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895b8bsm36322411cf.10.2026.11.27.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:35:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0nW-00000007aGg-0jpi;
	Fri, 27 Nov 2026 14:35:50 -0400
Date: Fri, 27 Nov 2026 14:35:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127183550.GV246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnK2c3kMq8p2a_7@e129823.arm.com>

On Fri, Nov 27, 2026 at 06:24:25PM +0000, Yeoreum Yun wrote:
> > > +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> > > +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> > > +};
> > 
> > should be the generic EAT token type
> 
> Is there?

That's the idea. TDX uses EAT as well.

> but the content seems to be different according to vendor, So would
> it be better to keep it as vendor type format?

EAT is intended to be self describing, so if you parse the EAT then
you should understand what the vendor and content is.

Knowing the EAT came from RMM won't even tell you which ARM profile
version it follows, so I'm feeling like maybe we just need to tell
userspace it is an EAT and then userspace can parse it deeply to learn
exactly what it is??

> > What is this and the related work? That isn't making sense to
> > me. If the token size is not absolutely fixed when the driver starts
> > then it should be fully dynamic and this just streams the variable
> > sized token.
> > 
> > Ideally directly into user memory so we don't need to allocate a kvmalloc.
> 
> In case of live-activation. I think in that case CCA-Realm token could be
> different by activating the new RMM.

Then the size isn't static and you need to just stream it to userspace
whatever you have.

I'm expecting these unsized tokens to work by streaming them into a
memfd so that userspace doesn't have to try to guess how much space is
required.

I also think it is pretty broken if LFA is changing the token for
realms that are already running. How is that even going to work with
an RSI API like that gets the length then tries to fetch into the
allocated buffer? Token silently truncates? You need to loop?

> > This isn't OK.. We only get one struct device per RSI and it gets to
> > bind to only one driver. Given there are other drivers that will need
> > to use the RSI, like the TSM and others, this needs some other
> > solution?
> 
> Currently, this attestation driver is enabled when !ARM_CCA_GUEST only
> (IOW, when this driver can be built only when TSM arm-cca-guest
> disabled).

I saw in your FIRME series a solution to this problem, I think that
would be good to get out on its own and apply it first to RSI as
well. We will have the core RSI stuff, the realm attestation and TSM
driver at a minimum..

Jason
