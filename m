Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DE456E05;
	Thu, 10 Sep 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037145; cv=none; b=HMVW5QPRFwU4kAGhZwXMjdRdXydBDJ2MsHoc3j9asJpz3sepo3K0ApkajL4IPEF48GLFM1dXKuVXb8dmPZF7mIpxC+aUYIQJ8rVxx7WhikWZgIMBWSJGLEIAb1CcSNnQn5WC1S0D96PJZjFHm95Fow4/6zw5NGRL4mprbijiQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037145; c=relaxed/simple;
	bh=Dds88dzQqQNYY+IpjafcbCNkuvA4NzQ05JCf4JIrVNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldWjfLsD4taOgro83tWl0T66QaFPj/TTaSt8Dqgn7K/+KfWz6Te3y2tAsnjjKbfbDx6xVQ9RJ1Hn3tvcPLfE+G/doUszROdfvjf7bZKWvDbVcJG6tPu5leLfFD/3dQz7bHexFUpErAmZlmQjQLuJjVRQftaXBXYUmHQfGjAzkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=FdAfoBX4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RmGKVhSf; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="FdAfoBX4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RmGKVhSf"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id BEBD0138037C;
	Thu, 10 Sep 2026 06:45:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 10 Sep 2026 06:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789037136; x=
	1789044336; bh=ZYgQzfa2ctP1UICDBHl7m4arCSxFxSkit8FF1mVtkqU=; b=F
	dAfoBX4AFXFQNQNyJ4iIIMmtIQpz5kX3rzgchRvXVNWGV6sQGY8YJT8N93ucoBpc
	tBNXjeY7vNbS2Dj7qwj9wJGxgkvwe9bb0FXmhrlset3Ng3gncoTmLDR7w2zwlgSr
	+Sb+I7shLqMMgFW70uudbRpDQ8SSHMWQX9h2pW3huX+vJmzk1hoOeCZpH9o1A9+I
	g/idStTOaG1+GQz4y853QQp3M+2LCuC0nB68Uft8MaSfM6h/BqQGxLA38z0PeQJ1
	F2JfLwdIl0doRpmX4fyrcd0oPvu9X+xIXeBWgPjtv9+27TF3SKybmVXanKJgAsXZ
	m9DyJNK11W/ghf9vJzziw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789037136; x=1789044336; bh=ZYgQzfa2ctP1UICDBHl7m4arCSxFxSkit8F
	F1mVtkqU=; b=RmGKVhSf855Dtaopl545RstTURk1eyeXbJk0rz1lc8kD2L3Rcpz
	BtczOMR+IFNuoqyM+YTdp2hdfFO4UWU5cnwGmwutbYKycEs+dJKjQQDEFO5YxuBb
	SqijZELFYmwd8Nl4bN2tpbrT7nCLXy/TuPvHfVeKpfWC7YBJxJZzK73uPiXmnR0L
	9iDDJcEhijs53rmTUwOTLXVcUaGgj7VjCHgfW0sLxin6OSTru2+Jc2Vg+YixIz4c
	0gNVQKcoajcF80ORo7sDCEUVmCod7ekqxYc5UmAYEg3K70TiNns+iCGGq06qTsSp
	yyuwrkQ1gmzbzOawyxy3wYR2rTBFC8FkOLg==
X-ME-Sender: <xms:UIqiaprW4RWq-sJxdABzaweJCI0aZGJ6mAOM2uA0PZZvv4Y0bH60xg>
    <xme:UIqiasXHNn9xPQaWW5x2ckXZFRrm6bRtFLuN8593ZiSwf97CycBgYMVui4f7lempg
    Y8HUKeR5fBqzgHlVSOwok-luoGyv6-0Fl7hrJbQyW8SdLCoEVQrdQQo>
X-ME-Received: <xmr:UIqiahR0YZAyg9ogTPmjBcYs8-AI2C2g8q1WL99GNb5xl-oGQjTSz-F57-Q>
X-ME-Proxy-Cause: dmFkZTE87Z+QS4xVAJvYfxA5lQAfXmH0aCot7TBmx0IaDvGmQHEsolxxhNS5RvvVKSmZ36
    P5I61EVYH0sxtNzv6UfnGLrkEFvP4iPAR0jI1D+kk+/PF/Y1RJ5kj2xDd0ncg2Sz8CraWk
    u+L2Iwu2cZRENajCgjruyidgflkJUEH77Rb6BIFzoc78t6Sw4WNd8m2f0OyKzLQQt7eSn1
    g9f9ONyeUvOBi9rFwsP4OA3kPHdUz07PfjoaqmSVhELKJ2wz+dS9LGUpQZBrRzWyqWANAd
    5+/w6NQUhzp3wSMoGE7FubkoTz7CIqwm8JKTAIuYvVwxZ+0HZo2V1psyjnWjFV6VYa46Yn
    rIqtEnsSrEvQmvGZ9UmpuPRJiZt56xT07GoBSKpbzwiX6Ex9nCbDsJhXu98FV8NtuFL9Pq
    Tg7Yji7Ydde8GQW9Z0v2E53sk/3QWEyCBI29M6r7KbzNMeiOsgNmwBtyMZLA4mD9uxxleD
    pMkJFr1kNbQXMrZT4vlPMVPdBtbtrSwX5fwqJ4FQ07fPiW8EHURvX2UUemct1+YYitB2Su
    IyBuDHMrXG6Azi6KnPGHcu2voQV45mnpPmULjn6PkQzx/BvOEcuPgc4830i3yMsnrgIF0q
    Sq2Ay8BNNa6JPBhkZL8Qw4CDgRuB8klFITV+mOil2L8sOmho43qUcytcmsEA
X-ME-Proxy: <xmx:UIqiak42CcUGK_F1X5V-_t3ofOwXq-9uDYKPX6iYFcyEXlbZb-xpgg>
    <xmx:UIqiar288PFupx6D6bghvoXnWAcNDMcJixd1GNI_eE2xZEb_a0yjXw>
    <xmx:UIqiatI1kzi2JvBbobn9t6KjZkMd1iWLjZj5dkWIBK0EtKZgG_i_AQ>
    <xmx:UIqiap-6vAXf4kE-F50L3GYPNzty8L5f-Y0YmaY4633H3aGblG4Lpw>
    <xmx:UIqiauV-lOCqk1XflcOqoA2znnd7vJOkZY5ZbmFSz-vkxPXHL_G1ywK_>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 06:45:35 -0400 (EDT)
Date: Thu, 10 Sep 2026 11:45:34 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 08/19] selftests/mm: add folio-order check for address
 ranges
Message-ID: <aqKFXlpSELmCtt-z@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-9-kirill@shutemov.name>
 <feb76c81-db9d-4a36-9a31-0b2b31e3c3fb@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feb76c81-db9d-4a36-9a31-0b2b31e3c3fb@linux.alibaba.com>

On Wed, Sep 09, 2026 at 06:01:13PM +0800, Baolin Wang wrote:
> 
> 
> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > An mTHP collapse test needs to know that a range is backed by folios of the
> > target order, and that they sit where a collapse would put them.  Nothing
> > answers that today: is_backed_by_folio() classifies the folio behind a
> > single page, and check_huge_anon() reads smaps AnonHugePages, which only
> > accounts PMD mappings.
> 
> Have you checked check_large_folios() in vm_util.c? It seems to meet your
> requirements, or am I missing something?

The changelog is out of date, sorry: since 6dedaf0d46a9 check_huge_anon()
counts mTHP folios through check_large_folios() rather than reading
smaps, and it is what check_huge() already uses for mthp_khugepaged.

It could do this job too, called once per window.

What is_range_backed_by_order() adds is alignment check: the folio has
to sit at the window start. And check_large_folios() reopens two fds per
per call which kinda wasteful.

The collapse_order_* cases check three windows per case, so I wanted a
helper whose contract is "this window is one folio of this order".

I will fix the changelog if the series gets respun.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
