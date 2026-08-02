Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145B0326D44
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696604; cv=none; b=mrJxKSZkDaKlzD5X7SSqvP9vVeMrQI8YuxYUFzdIiRokxH5f4cNobDfK3LIXRj991C55dADnmVQ11qPFHq8pmYjTKuW91ePrq2SStbRoXAp3yfRrjsSlt7rc2NsKKJhsp4SI/iPdyGKy6SjELT6kmAZKgt1k9OgG5mE/OIzYbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696604; c=relaxed/simple;
	bh=L0svd3D0foAbS1pofZ2kwhRgyX0xQSmgHu3dPZH+i4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwGacVSOJcj6Bpfhe2R9SSpIpbdUwYQ2phQTttPi9Q3/rNqjZvvil1ilUcU5KlInjQycLIsZsRUsOLHzmPXqWqywkQRXq7ntmRK4vkh6g4jobEg4pYGT2dB5Vl41W8YT12Y5qLoHfc3dyNyrfYs530uvwLjqfdBnhfmboDzR2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoQwcz27; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoQwcz27"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66892c81725so3451694d50.2
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785696601; x=1786301401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCOGXAiY1okgWD9P7MgJLnCxWDi+bKHeP2QdjRB5Ehg=;
        b=ZoQwcz27h5BjI7NgFB8M4mPyMqp7hxnpgbn6h/Ian3SYRBW9T92qmsln5UaLXUgWR4
         Davj5R+ogiBvNa7w61t/Bh5agyeX4h4E9TMBA5XwpWrGEnsNekU+VhEiIqDX4osxx3th
         XNFp5gqWWADvP0JaWNizOtjFc5A9twdGboRfHxWQMHQ3aJLpV0VIs2RG7gKE2qNwdBNF
         jQnriCmJAXJQ1nFSNlmMWnfvPAh75sN6F5s0c0mM229nIy1pzOloGk40yQs5wQtx/L05
         oSRD+bnZgE41KHgs7UF/tZDN5N9vxaEez1Yai2X0Q+y2JJ3uzzemYaafWVtCThIgoL37
         RBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785696601; x=1786301401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCOGXAiY1okgWD9P7MgJLnCxWDi+bKHeP2QdjRB5Ehg=;
        b=RGIM8dQoZ2SLVHuNg95szB0nhuW4EiBAl0EfHhYUHX6/5xQX2IZ8LaIvKsDPZb3o4U
         tgoV6zx6IKxw/lqVeHiI5o+ufdmINp1WCjoOM+lpMFGKx7vGUx8sjGwFO5tBhEkDoFl/
         tnSovxSJzBCI2CVFJqXVkTNcvZFA88JTT2glaZcEgD0hNbg1Je7qnfDKoRmxXip/tFjz
         nO+rn6kuns+Gz5FxkoaQSipZturc3z0aGBVWqhSq7JqhlNWx0+RD+D45SQZN2JwGDv3r
         dhRTKWP5GBudR3s52rIdJTF5hM8MzujKPln8sYcePnr9qjlPKUpeJobuKM2BaTCDpvhN
         wJoA==
X-Forwarded-Encrypted: i=1; AHgh+Rrfc+tNPP9XKHgPiDPtDOE2Oq0OizjIqPXW6iVDWD836bQJzxvQlluwCPcBVMzd7Rt4J496fTFyvXijJKbbKMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHfx+XhBO6hagCb24SETm2OyWMtFVvkYN1KDGPPzQqvO6y8JN
	e3qf4W9GswhBvEjviFXQ6LXjaWeRnEr1RXdQLD0dwR3JDaFO5TFL8vRC
X-Gm-Gg: AR+sD12BUbp1gydjdOI9Np+h1vMx/ibs1atUR8QXeFubCcuaXpRrP1F6lT9MLY8xlvM
	GFJNBQzagtRxR1ZcPJ8SoopMLkrWgx9t6HL8CPv+0D5WFta82UAsdtGpZ3HRweAPa+X5zKHyzfn
	f11D+Sfwn7IadcW1h8l7ybZCSilxspEinof9JR6spBEJ2ZIFMSaB4EWszQxpoJivzfYSJo7yOy3
	5n3bnHncyDAGr8dz2ZBqSTmOpdVQy64tE2iJlFbPxxTWcbUIq0k38da3GZWm5F9ID4YDr+/elmq
	1KQA0u/RL+7YKUmZavlDylKZqYgOAVA8+SgK1VeUiTmF0jqPUeq5zrMoNWHb9cL6PzQ+3fdXPxf
	Al1fuFgOrWhGiTbSGtwNf5mkpnt9p9/H1P8iQ3JdJSlP6XvaIZuyzDBQFb5Q+Dr8hAWJwYtIU0x
	BDbRJaM1tDCwc18zAzHy5JnDPSt+AhcThPsOabe+6dLkYfqhKPBDhG9/zmSmR5tszfYB3G9+NJt
	R2UXi0=
X-Received: by 2002:a53:b711:0:b0:662:89c8:4a62 with SMTP id 956f58d0204a3-6694f095b5fmr6981875d50.18.1785696600981;
        Sun, 02 Aug 2026 11:50:00 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6e:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fcb3acsm4247511d50.10.2026.08.02.11.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 11:50:00 -0700 (PDT)
Date: Sun, 2 Aug 2026 11:49:57 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 2/2] selftests: ptp: add a regression test
 for the frequency adjustment overflow
Message-ID: <am-RVacT-dbrIiJ1@hoboy.vegasvil.org>
References: <20260801222923.39017-1-deepshah146@gmail.com>
 <20260801222923.39017-3-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801222923.39017-3-deepshah146@gmail.com>

On Sat, Aug 01, 2026 at 10:29:23PM +0000, Deep Shah wrote:
> testptp's -f option stores the requested adjustment as an int ppb and
> converts it to scaled ppm, so it cannot express the 64-bit scaled-ppm
> values needed to overflow scaled_ppm_to_ppb() and bypass the max_adj
> check enforced by ptp_clock_adjtime().
> 
> Add a small test that crafts struct timex.freq directly and verifies that
> an overflowing frequency adjustment is rejected with -ERANGE.  The test
> skips when no frequency-adjustable PTP device is available.
> 
> Signed-off-by: Deep Shah <deepshah146@gmail.com>

Acked-by: Richard Cochran <richardcochran@gmail.com>
