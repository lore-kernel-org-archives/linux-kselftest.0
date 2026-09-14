Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF633F7ABC;
	Mon, 14 Sep 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377294; cv=none; b=dIBVzRALgr7/O8CBT1bArxlfSCMWGzeV9GokpgZHwTyfTr2yBxyfvjLqXYw+ayx0iPYSq5PmAGiKZAcCRX5jBegRsTKDKwzIoWuacq1cCwr2B8tqZZOEGzU5EytqZK+o+t8P8Vk4n57LWk3+uf2LhzvUEWHDvj6+vC2JX6+P6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377294; c=relaxed/simple;
	bh=NyNkhKSWWyQK1aJbTK1W8C3zHQRHZ2UtAvj2nwEN9Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNiP4JFpWnHJokWrZvEBv+8zfF/F0qZYLklLccP+c9PzblWfW+dmHW3iKW/vt/ho6sXbvDX7Y+pysYLp2LQhYC/1axLYtFr02brZP/WCvyd+UnT6y+a/RkhmP+uVlkatXgT4OrH8tUDngTsLeKNtnJkhv9dysptY8XRre3chqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QB5vB63x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QB5vB63x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F161F000FF;
	Mon, 14 Sep 2026 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377293;
	bh=xtmKyn3NtpgCppoFcCU4yQt0ArbHBrXV8z0icOwmUJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QB5vB63xxqbjDVXTJbNtzJTCKNVA1utACRdnMVxDXdL6WtpouXc0u1NLU3x5b30kr
	 DA18sVYujCGaLjurdwwhfGutonXFH4r5OrWXG4FUyR16dJWZF1Xc8kSbaxGeE4NGDm
	 MEx9mFEMwcOxxmt6m5w+zFNMQuelBCpAaBEQOGXBNUiOt0wofYUwRiVO+lGw0RE5LD
	 E833aE36hwkrySCJVweFJwqjGIJwkCNoNUuotU89ykL68bEf2ZE5yZ0F6ioODnULRu
	 0qwmu4681dmlpgmp6Q/ZEaIuDcki1VeES5qwjqMR+7gbSUR1AysPu/fGOqwjDPA9pY
	 3ANj61ZA1TlZA==
Date: Mon, 14 Sep 2026 10:14:48 +0100
From: Simon Horman <horms@kernel.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	Victor Nogueira <victor@mojatatu.com>, hybris <hybris@mojatatu.ai>
Subject: Re: [PATCH net 2/2] selftests/tc-testing: add hhf hh_limit cap tests
Message-ID: <20260914091448.GO48209@horms.kernel.org>
References: <QDISC-B855.v1.20260911153152@mojatatu.com>
 <QDISC-B855.v1.20260911153152@mojatatu.com.2>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <QDISC-B855.v1.20260911153152@mojatatu.com.2>

On Sat, Sep 12, 2026 at 02:09:20PM -0400, Jamal Hadi Salim wrote:
> Cover the new TCA_HHF_HH_FLOWS_LIMIT bound: values above 2*HH_FLOWS_CNT
> (4294967295, 65536, 2049) are rejected with the configured limit left
> untouched on both the change and the add path, the boundary value 2048 is
> accepted (installed at 100 first so the boundary change is load-bearing),
> and an add-time hh_limit 500 is preserved instead of being clobbered by
> the default.
> 
> Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> Tested-by: hybris <hybris@mojatatu.ai>
> Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

Reviewed-by: Simon Horman <horms@kernel.org>

