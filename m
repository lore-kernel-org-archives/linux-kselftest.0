Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856AA511E90;
	Fri,  4 Sep 2026 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546401; cv=none; b=k4yoPSoKJkCzgPLdvdqby+Lm2OOVQrDGQeuqQxUVXtwkAcbfLc8fE33wJwHIdl6f/ZSCepfJE4OLyE+mep+sulixkTUjkAxcXC9pXG8yQwy8F+XJ1iAMGJrH2ufYWErRwhkitlfXUJzPIG228qWSjMNMa/nIG/itV/yQocaWsfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546401; c=relaxed/simple;
	bh=Cw0JTTvJA/IOEVEiVV2noA9SO0g4qmEFc6wW9Y5DErc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fXdCsj8NpqiBM4UuDuooghe2jOFwgwEUKaW2t47S2XGRpSx9xS+llWVYkh+b8DFcNOlZvNYhTmO9Ze/2L0fLtHL0UtaY596ndSElFKY6PS1f5JSuVo8Hx10bX/l0uQgj/aDcLWYLYi6dZRS9P7nOeAdUQKiGIlQE0vujPtluUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=tMDQky2X; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=Ea9yUE2x; arc=none smtp.client-ip=160.80.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="tMDQky2X";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="Ea9yUE2x"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 684IPsuH000765;
	Fri, 4 Sep 2026 20:25:59 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.pool80183.interbusiness.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id CB5D91228D4;
	Fri,  4 Sep 2026 20:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1788546349; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDB6SSxkSqoQx0LWzLW19DMiUYEhA8tnXdO4S0QlZWw=;
	b=tMDQky2XyRAPz4fypxsK4w0I9s5ZuoScFzqPDoqzFDSyHhFxx4k3BvoktUh5oShNhcZRtp
	bPcYWxEgglaVI/DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1788546349; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDB6SSxkSqoQx0LWzLW19DMiUYEhA8tnXdO4S0QlZWw=;
	b=Ea9yUE2x8UuvnpU2kzLwSxk2ycqHvjTCc5lX4vVrC2yPYalupSK3Oc5BVlLTcH4eRp2qmZ
	tsPW7Z1huq0PEHBOM5Pq6IX5fwGYSQ69PGo40Qtrowp5z8VDH7fqcHM7gTfFEpt+Z+/SoW
	Rcj2fKPbNNS9Ut1/OKGRUmrq+D0fCYl4dDq1GCQMopXnu5QCPJA1nkFSm/n6DHfxe3HZQy
	MpPaViMvVh4na8bf8F/GRtBxPoUQDulwYQEVDzzwE9nvr3xknwt3IJ1eA2LER2FBSM3piJ
	WDIQNE+BwWSGOTaobjySWU6lEMFu8qDC087ra784KntyIUofTNKS07mFcUAixQ==
Date: Fri, 4 Sep 2026 20:25:46 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, horms@kernel.org,
        Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        stefano.salsano@uniroma2.it, hangbin.liu@linux.dev,
        Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH] [net-next, v2] selftest/net: skip
 srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Message-Id: <20260904202546.a888aad9efbbf113aa1db900@uniroma2.it>
In-Reply-To: <20260903103545.1325276-1-alessio.faina@canonical.com>
References: <20260903103545.1325276-1-alessio.faina@canonical.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Thu,  3 Sep 2026 12:35:45 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

Hi Alessio,

Thanks for the v2. The check looks good to me. The comments below are
all on the commit message and on the subject.

> In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
> the vrftable support is not available and the tests
> contained in the following 4 test files
>  - srv6_end_dt4_l3vpn_test.sh
>  - srv6_end_dt6_l3vpn_test.sh
> are failing in some kernel backports.

Two files now, not four.

> This is the result of one those tests in an unsupported environment:
> 
> \################################################################################
> \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> \################################################################################
> \
> \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> \
> 
> To amend this, check the current running iproute2 supports the vrftable
> feature and, if not, just skip the entire test to avoid a failure.

IMO the sentence could say what the check does: it installs a route
with the vrftable feature, and skips the test rather than failing when
the feature is not supported.

> v2: - remove dx[4/6] tests
>     - test if vrftable is available in the installed iproute2 application
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
>     - initial approach by testing DT[4/6] and DX[4/6]
>     - test if DT4/DT6 are available in iproute2
> 
> Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> ---
> 
> [snip]

The changelog goes under the ---. checkpatch reports it too.

Since the commit message needs to be revised anyway, a few nits:

i)   The subject came as [PATCH] [net-next, v2] instead of
     [PATCH net-next v2]. And maybe you meant selftests/net: ?
ii)  "one those tests" -> "one of those tests" ?
iii) The backslashes in the pasted log could go, git does not remove
     them and they stay in the commit message.

Ciao,
Andrea
