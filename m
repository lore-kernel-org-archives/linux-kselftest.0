Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE43F437847;
	Mon, 10 Aug 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385605; cv=none; b=szM80+46llpN9nhCkRNHIgEsatBdCyNGS5X5miwroQrTBwkMwS26H6sC0uYSMxj0EMlZi85esvjpgaIIEqoeIKq214mZHYWDBTnt6FBtfjNJVhZeIk3f5s35utdvOHe7N8MKAFZdnsg874nuvWDzMpPX51LiSgWq7l2xyJstZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385605; c=relaxed/simple;
	bh=5ya32EeiX/6ALIqvU9TY2YYC5n096KOB3wJrQ287IQo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MepHQwHooeDymeLWtGDlV2MU1CQNi4Z0OrTAqpcLRTmLta3ixCmxTUXko/HMTRHVhnzkK7BFNM+RzqQY2ELgWQ7XFXacFj5qKiGOCsObnsPpH/WaxIs8TeCWP92ifjq9Y+ygfZT/9F0Y74abstEjdyC9ukvajjLidyBOJQVTNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SESZTbiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SESZTbiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD841F00A3A;
	Mon, 10 Aug 2026 18:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385603;
	bh=LIl/DIAXKD2O5Z+P4VyBIwLQq43iQSjULudMrBjU0ak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SESZTbiLYuOb3qt5M/ePfIeGEYF9QnlqcyuS+Kosl8lXPs4CLM0evu5y7tzedAAoc
	 Huq6rSEGXiI7E+Em1QHEngCozJp2PsPi5GYaqNeS/PkFuDmXtNmS9pXO7VTHHxKML8
	 X8y3TRc1iaUssYwG5iTmjlIyOjdGdehEEvsSqvlxdk4iTWzJFPA8t7FR763fEKv3DU
	 Y8E8T3STiVy445rWE2R+ukDb5codpt0yjxyQNsuuCkut0D/ndkt4xB+mSNy6g61TDN
	 cD5ZhNVxOEEB7c8rmtGjG1Kx+dR8rW+FTgZRskyF4Z0vMEssNeSMXb/VGLsG87fxao
	 tMSNNM9vmSr7w==
Date: Mon, 10 Aug 2026 11:13:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Petr Machata <petrm@nvidia.com>
Cc: <davem@davemloft.net>, <netdev@vger.kernel.org>, <edumazet@google.com>,
 <pabeni@redhat.com>, <andrew+netdev@lunn.ch>, <horms@kernel.org>,
 <danieller@nvidia.com>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: hide the devlink
 port_split test
Message-ID: <20260810111322.20341a39@kernel.org>
In-Reply-To: <87jypy9qy7.fsf@pmachata.org>
References: <20260808164843.2475226-1-kuba@kernel.org>
	<87jypy9qy7.fsf@pmachata.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 13:04:48 +0200 Petr Machata wrote:
> > The devlink port_split test has limited applicability.
> > NICs (as opposed to switches) require at least a re-probe
> > to apply the split configuration.  
> 
> Interesting, apparently some NICs require reboot after devlink port
> split. Hmm, should I just move the test to drivers/mlxsw?

It's not really mlxsw specific in any way :S
The cmode + NETIF compatibility would be my long term preference.

> > On top of that the test is not compatible with our driver env,
> > it just splits all ports on the system, not only what NETIF
> > points at.
> >
> > Long term we may want to add some indication in devlink whether
> > the port splitting is runtime (cmode of sorts), and fix the
> > test to follow driver env. But since no (known) NIC driver can
> > support runtime anyway let's just hide the test from the selftest
> > framework by moving it to extra files.  
> 
> Sure, go for it.
> 
> > Having this test randomly break unrelated NICs within the DUT
> > makes people implement allow-lists for ksft, which then means
> > their setups don't run new tests.  
> 
> So I'm fine with the patch, but I don't buy this argument. People
> presumably understand that allow-listing implies that only the, well,
> allowed tests will be run.

One note here - that's a fine position to take for downstream CIs.
But upstream / in NIPA we want to test the drivers as much as we want
to test the tests. It's _very_ useful during review to see how well 
the test works across the runners before merging. So allowlists are
explicitly a no-no for NIPA reporting.

> Presumably there was a history of new stuff
> blowing up, or gradual enablement or whatever, otherwise why not just
> blacklist the one problematic one? I.e. don't blame the existence of
> allow-lists on devlink_port_split.

IIRC Intel devs mentioned port split as problematic explicitly.
I also had issues with it in NIPA.

But fair point, maybe once the auto-neg / link config tests appear
upstream this will be more prevalent problem. For now devlink port
split is the only one.. let's just squirrel it away.

> Reviewed-by: Petr Machata <petrm@nvidia.com>

Thanks! I may need to respin and use PROGS_EXTENDED as AI suggests.
