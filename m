Received: from mail-pj2-f17.google.com (mail-pj2-f17.google.com [74.125.227.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB561799F
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643984; cv=none; b=pzdyiqWs0gv7IiGUJWX4pqLPD4JJM+n4yb4g2L8uvWZxsVOK4BbC4Wo00kzmPuqlnCOQPYuZVInXVvRzgUrtKEChB7dQJuEheO6w1mBgSxWAa4I1yy6VNzNXa9nz5z/J4pc66+nEJxvX2nCcMnTPScKFGTh5SzjmskeZl0WVnyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643984; c=relaxed/simple;
	bh=a3xvF0OREU6IVNTjUEt+ocQYRcp42nk5p+4XJkg0dIk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwFUNlY9fhuzifNPzqqfXjeSJvslBMRaOu/GwBN8hi6UqPRFYah4yYwbZUTOoyNbPohniBUdkL2kjm71q4JVbqu63379oerMbHWd7g5ajYvFdP7UalCui8ChdFbXBiSgp9msLvwCK2OaHcGZIWjH7i1epv0rjEnsZBJj6Y1dpYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anW3khdQ; arc=none smtp.client-ip=74.125.227.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anW3khdQ"
Received: by mail-pj2-f17.google.com with SMTP id d9443c01a7336-2db1ca06a25so16555445ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643982; x=1791248782; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WUJtE1tO6F+vL+F/po6RA6UlyIObXL7Q50q+l+HvqRI=;
        b=anW3khdQg3gW5iMolG2lX3g8QZXGIWmoBidAEi4O4lHgsF+uCc4TtJlnLIb99/Sqam
         jGbi31HtNGnB+YGwhNoaoqYm472LP/RlHriPa0IQROtKztZWwCvUYvQlpF7N8mAUx7VJ
         9VM262nKO/1rlgyi1WnFYbl0N4yRHjnuArrHkM5gveU+HUy4Xyid/0WZdCArJeBdNB42
         5EvUlCPe0ic5ltJ8Bm+TNKcBsVnUg8RU/efgnCNRnATRrYzDuDwGzT9YJGezbKWkq8ai
         8c9zzL31eWa2bSn5jRoWAIhQ1xWz+Z5ofWFKsGdkAZCQVtiGAJUwsgIBKnGoW8Csjsyb
         2PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643982; x=1791248782;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUJtE1tO6F+vL+F/po6RA6UlyIObXL7Q50q+l+HvqRI=;
        b=1X5R3a/Te9EIG0U7tbdoXTj84Zr77IX1wcMhj6jW8UvBi9WbDURtaVNuuioHEizE63
         kaLeMA3sBFZE0rdoJSWuPEIIn1hNOTSaR/MB6FtQ3vLVYwh9oy+tjp2Us096YmUbGuSc
         cboY4ni9T/blEd6jUUre7GxH0Rs/otNPTkR5fdkvTMeU6xuyNkwxgF75eRz0kMvHZL3P
         5bSB2n7HHCjcZfcmSuuNRByQk5P6JL5Hscu6FnKxpb/eWrsjd8yKft+Y9keLEoJBe4aA
         LHFpkXpPmU1Xhlz8tR65lUay7v3og2GXMSCncpuu+xFjSMw8jYtshLcQzdEmK+GZfTJC
         VSlQ==
X-Forwarded-Encrypted: i=1; AKwUvByM0vK7wBJlo8MYFq9sFJK4rV5a6JTGKdvYjEKQZB8j981R32wT51uNP5LCuyJ5FoLF+5eBj4fZeRtsfeyzr8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2F+8U927ZvHGhLpWnZWmzB28EhY2Ye4ipx0uh/ZIOE954VGks
	xsKQWs5wqK89XAaOz4mVsO3zlup8bDmmGY+rHixWhAzKI9KhSbyR7UKL
X-Gm-Gg: AYBFou3SmjuY9AYMoHW0KH5/fgP5Zye6bMWus6L1MWmsCmPtLyukamwL1X1GMAR09On
	6dRKc2fxxgUlTkQxSiD+0p5u6U4U563cQ+WhPtp3zwHD9R9IRrgyrD70uaYTsDKmOEEST4LX2XU
	eMw8A8J9TPyHZxcpuK+4wBNecSxqDTZWFxXPIIc+141rQSdZjYEBcYG5vOZqzmILt3j+MkVK1iL
	fQJvEOtNpyXx+mggWVecDmOaY/RL5EHWyzTYYR7v1Yk4Qmo7T5g/7OcDLD7d80Y/nbUuls52j8Z
	1Er8ksOtbggBk8e1DP575lFA+M+nDFdvcGWNwY5Zt0wki27RQWxaf5W3qOnRIv4s9pIyOHznDv0
	y9fdrLmEaQ7vjkcRh6Q+nxzZcUlfpvx8bIxk/4eR1UDDB+lA3eKQaVFlY2W3/JQr0Ge1+do4ttI
	YjhxsmQkBaQv+fdDzq35ejiqV3flsOyStM8T9Qeqcxo1DTVJRUeeV8ZOcfmy9p6FC6ovqJ12A29
	FcpuDi1IBE8Wv13enCROjPWcdv/dx9rdARm1WZ5HjR7MVK5AIEhlwX4uxhftkytTaZM0pXUhXXe
	iYO8706rDaVFh378Sxp8TkU7dkB9qORNR2cwSSO9zBeRMmcjvfzezFOrk5/DGfon1xxtvuycavp
	n
X-Received: by 2002:a17:902:ef44:b0:2df:9f1d:4552 with SMTP id d9443c01a7336-2df9f1d624emr74517675ad.52.1790643982418;
        Mon, 28 Sep 2026 18:06:22 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbbd2asm48234105ad.12.2026.09.28.18.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:06:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:06:17 +0900
Message-ID: <m2wls43lyu.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: broonie@kernel.org
Cc: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v3 3/3] selftests/nommu: add nommu mmap and mremap behavior tests
In-Reply-To: <1b2fb12b-a342-4ec5-ad24-14fc761e1e61@sirena.org.uk>
References: <20260926010819.604346-1-thehajime@gmail.com>
	<20260926010819.604346-4-thehajime@gmail.com>
	<1b2fb12b-a342-4ec5-ad24-14fc761e1e61@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Sep 2026 21:34:15 +0900,
Mark Brown wrote:

> > +	ksft_print_msg("[RUN] Testing: %s\n", tcase->name);
> 
> > +		if (fd < 0) {
> > +			ksft_test_result_skip("Failed to setup temp node: %s\n",
> > +					      tcase->pathname);
> 
> Your test reports should use a consistant string when reporting the
> result for a given test, that way tooling can tie results together
> between different runs.  Report the diagnostic information with a
> separate print.
> 
> > +	if (result == KSFT_PASS)
> > +		ksft_finished();
> > +
> > +	ksft_exit_fail();
> > +}
> 
> Just unconditionally call ksft_finshed(), it will check the counts of
> reported tests and exit with an appropriate error code - you don't need
> to manually collate the results in your test code.

thanks for the comments, and I understand all of them.   I will revise
those in next spin.

-- Hajime

