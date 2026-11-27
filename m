Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807105;
	b=OCdOI+00Xl5ArUG5vNb67GMMmA3B5nBtaGJm9QtaGX5Fuu389Vxf+2myXcrTlF/sXmqB
	 If0wwqiVVqRVIYucAvZWhX7PMxR4yfi1iKTdmYK8wNniNWf60PC8SuAgZ0729sLxGO9sj
	 XhlalYeiJG6MUq36XxZhkIX4rLT5tiY+U8Fi7Ivl0E1a941KFWmndYH51V7ut1iUVeJTa
	 pMOTMTyP5tDWrdBYkL+ztAufxrA5/sX5OoryMxDqLS1nAU8IcvwKTCi8+VGVFfEu+4mVm
	 Oybc/nT675/ZDPqRWoUWSve1sNobN4iRaNcTiENuwNf8jzhsi0QMePjahKtckqAu4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
	b=5WfS49j3yGbrXmDUqq68fbV2g0KBe4jGwJbTnnYtnhDmDrjTDetqsV3+lSpmuSUIuN3X
	 Sr89LjmA8ObtJUjYG+rVUMoP85e/b68ZLPvWfqIZ5L17Np1/BapfZZkZVwiIhSftcO5F7
	 36YOrtllWUVtnrE9p/5AIz57nXXNSkeULxwMA21z8QIdzv+K7cccJYr53t0bNssgru/U7
	 d63DfkLwWa94m4TBjoAUpkl+De4huzpUv7l0D3O4pvfeAYGPVyuCwj/uJDXXclcc6MO+0
	 ZmYwQhhGllF5ByowMXh975EAr9rpz3j61O3BsATQc+HDxPHWZ2loPjNWYKIghbQlHcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9237606A31F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 19:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9237606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5430f70c827so98246231cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795807104; x=1796411904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=Au2hPQjfRRLKqpzLdUlS4qTuMZfutWDMs3nxeZ6kBFtz5N2Xk2LtgNA1S5U0oOtM1F
         pUH04r+cU6kZ0kDgUOxrstM7z2Im5gAyxPSe4aD83cFjmAwAj+Fkxac12C/8nN6ofeLR
         MFElkoYfleQYMRT7phF4+sDQ9A/GDPgp08AagWSlO9SiwrCyijC940FqmwCDAQns8SPF
         vr8fSP2KNc3B6d+8S0JwcH7uT18lonZeGkS87z1MJOqJgxKlovDuQgZgrTINI217fher
         UuRXmrGlqd2cTXfhETi+BHgGNRW6PAqgPj4iVvWnFYjeFdjgAOpMLRYBPKKqoDP1GfuD
         ymIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807104; x=1796411904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=E8D+LGahLknwseiibxzlPTGIOnOQEH4ihs+ZtpEtreS8VZnIXrNKgOZ4NPx97IshS3
         05B/5I/0lmBcX8ikOv9ar5+rIN9fGdXtQPgXHgWlF23k4J8u+jp2RyBs4Okvxiiieksp
         19WM0GW0S2/xesmHlOKfwnNX0LF6am0YzKi7Ojl6u0I6ibSGDVVbkep3Jf7Vg4SLE+Kl
         w1Y3nvJ+/CljygDu1YAsnjicXONUgBwHnpQB2BvJlpghUymHBWllSi0Zx6+u4EW+x5tr
         WwGE6uItcwPIe3Xe+aEOaqZTiipEJob9YwknpNtESziDsY+fEhUbcKW+qLQD8XCdhGWl
         rp7Q==
X-Forwarded-Encrypted: i=1; AL+hErHQrZGHV/oIGL8OLvDv8wyFFiu3eI8W8zmdKSQK2RxAQIwDW+JMnzHdHAqH8DwyBsvHvtL2GxkyOJpXNoBxdb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LMlbmxqIGXfx3BRkT9+bVjmNRNoMiy8e4zESTD7FEwkI0PAHo
	StHgxFzIbJXgBHQEnj8RMlfFCFKxOnTwSCHv0k+LM1bioomNEjcwocu5Dlo7IEx2Jq0=
X-Gm-Gg: AZFdTZcFOZ07IwNoGIXLb4rX5pVZA6f6PRlIPWWsG/dQUL1uga2MdYfArfJFJgvVoQc
	7113eSr7DJ0ObLHLMAbgTJT6WzuG2jHiFPHIKFt3rEZCD2UV1O6DK4EM4zY/tk4QZF0KeDDQm+y
	A3DW63f+iNU+HdS/GI6vU6ssMkWDs9Mh6/L9t4b4Ptuat+2Wau7hj/zYeqnPHYv+tUXNyWjVfjg
	R/n1abzCbIkSx+v7aRM9D+WPg52KdBTZ+YQ1sy78dJO15ZYgLIi4/tSIbwoDhYMKAgmdjG6O874
	DHEuQjMYf1FhX31ZN5uy089PzQH30PXqeQFvfTLBOV1/AeHg019k2LkpHl9N7jRlTfpG/YvYL19
	cx3fftPRFdKflQ8PNjpgPkEJoGMW5pi8nwVbCztks5y8lqFVVJg4p1NA4jbmT7WZQDsncA7O8Dy
	88YFEp4JcpfJDvWOzJc1MOJJwEB4RcdijmQzE0XeaaDaVblc7Po2MjuVPHC9PkPJOTTmtZX7hJa
	6+z8mgd3sVuz0Zv4FDa7sU9DwTopdWZZu5Rzunr7t0s6J8kzUh/5/HnsbaPOznkusbIuaOC9nGr
	iqEweA==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4395559985a.49.1795807103939;
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm1867466985a.38.2026.11.27.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX1Sg-00000007nGK-3YSV;
	Fri, 27 Nov 2026 15:18:22 -0400
Date: Fri, 27 Nov 2026 15:18:22 -0400
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
Message-ID: <20261127191822.GA1856591@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
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
In-Reply-To: <awnV5S703Rgf5sh5@e129823.arm.com>

On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> I think the problem is the *max-token-size* could be changed.
> once the LFA updates the Realm definitely the contents of hash of
> firmware binary can be changed. this means the token's content could be
> change including the *max-token-size*.

I think that is broken, there is no good way to make that work in a
sane manner.

LFA must stay under the hard wired max-token-size limit, not try to
change it while a realm is running. Take this to your spec team.

> For this, the RSI host call interface has the way to get LFA eventlog.
> IOW, after LFA, there will be LFA log is genreated and then for the
> time of re-attestation, it should deliver the LFA logs together.

The detached event log is even more reason the token should not ever
be changed by a LFA.

> > I saw in your FIRME series a solution to this problem, I think that
> > would be good to get out on its own and apply it first to RSI as
> > well. We will have the core RSI stuff, the realm attestation and TSM
> > driver at a minimum..
> 
> Hm,, Does this mean do we need to create two device one for TSM and
> one for attestation even the functionality same?

They won't have the same functionality. It will be the same as you had
with FIRME where there is a driver doing CPU attestation and another
one (the TSM driver actually) doing link IDE.

Jason
