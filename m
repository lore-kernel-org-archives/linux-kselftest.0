Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421BD346E44
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647537; cv=none; b=jpkHFZO5wz3fS5TUkU4w7Krk495WP2Q+9xFfWfvzL6qpt0RqPpOAUE9BuzTe1rAeTPjc+SiXIGBoIwFA2wGgH6Km0X9/0+j1K5XPP4DR9ioURVh/qxlLzjzlPieDcVDZk7u5KP7tOfpOAQS7sBTCKwvEXI/B7Ls+b0QX7sys8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647537; c=relaxed/simple;
	bh=kl/rce+pH747JeTrazkehC0Fzht2tJvXss1m0jNXJIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B20wAtgjLQcr4JJiTePju1efYFYLdBD7C4zubm8KEERkEbCQF0RWih9SDXDyTkUrQCwCWk/wes1z+PLe43wFB2qqO8dBY5iV/N/EdDXGyN17qPwaS4YvQfYNhgMJ6Ecr8QO64Yi+urhaCStoJqbcDTdOnxZUV9wIPMDHF3kU6Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j77kxNzu; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j77kxNzu"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kl/rce+pH747JeTrazkehC0Fzht2tJvXss1m0jNXJIA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787647533; v=1; x=1788252333;
 b=j77kxNzuj59+e9lOd9gsEsrXub0ESwxwQP97rE0nCecOb6sNyGalxOgnvEOOMWVcOY8xK2nT
 kOQB56it4IM8CI96NRjmbaEWt0GVEVlmdui0RHcylwmyUTT7i/RUT0x7jXnezFo/gDk5TLQdqG/
 shR2ccsYZtD0+xLPYlrU9vcw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from fedora (216.236.36.151)
	by smtp.migadu.com with ESMTPS id 38c5f1f716711105;
	Tue, 25 Aug 2026 08:45:33 +0000
X-Mizu-Trace-ID: 38c5f1f716711105
X-Migadu-Flow: FLOW_OUT
Date: Tue, 25 Aug 2026 16:45:20 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if
 iproute2 too old
Message-ID: <ao1WILbXdZkC8RYY@fedora>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
 <ao1Uzk6nLcQfkqff@fedora>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ao1Uzk6nLcQfkqff@fedora>

On Tue, Aug 25, 2026 at 04:39:55PM +0800, Hangbin Liu wrote:
> On Mon, Aug 24, 2026 at 11:15:37AM +0200, Alessio Faina wrote:
> > In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> > the End.DT4/DT6/DX4/DX6 support are not available and the tests
> > contained in the following 4 test files
> >  - srv6_end_dt4_l3vpn_test.sh
> >  - srv6_end_dt6_l3vpn_test.sh
> >  - srv6_end_dx4_netfilter_test.sh
> >  - srv6_end_dx6_netfilter_test.sh
> > are failing in some kernel backports.
> > This is the result of one those tests in an unsupported environment:
> > 
> > \################################################################################
> > \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> > \################################################################################
> > \
> > \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> > \
> > 
> > To amend this, check the current running iproute2 supports the required
> > feature and, if not, just skip the entire test to avoid a failure.
> > 
> > This is similar to what have been done for srv6_end_dt46_l3vpn_test.sh in
> > https://patchwork.kernel.org/project/netdevbpf/patch/20260715122859.36177-1-alessio.faina@canonical.com/
> > 
> > Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> > 
> 
> LGTM
> 
> Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

Oh, I just noticed this patch is better for net‑next.

Please wait for Jakub's reply. If not, You need to re-post it once net-next
opens again (Aug 31th).

Thanks
Hangbin
