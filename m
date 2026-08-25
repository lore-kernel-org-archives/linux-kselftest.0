Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60572C11FA;
	Tue, 25 Aug 2026 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787695402; cv=none; b=GYzn/elaWob1PVRIoq3/jg0Qb5iSOXrlNQSl/l0E5NBkgjMYuMbqose/O4uz2SkgzoMt7WgSQGBm4+QRNJVmojwPnKx+3FSmb5dvBycFJ5sbfJ/dp+/STea7u3jzxkvZByJ0JfING156imgwoJy+HnEcnDwRY6wUClW1NlLR5P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787695402; c=relaxed/simple;
	bh=DkYkLePONybg/EJrYQU5DiPk+Ngmq2wQx2E3o7a1RSg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BDquzD3rGYxWkZkTQ5Hcu2DcU5bVyTf5EESBnEuGyf8e0zv4PQ2fpCVtV1grIBjYMiu8CLzaYbsV86snWZLbxnqgWDTPTub/kZMyqfBYamRJucJMtn/TY1oXzFIqi3jzVKUkPrRLRxTdVZ7D1GjAeRym8Fw3vCSnNdnhlBpmig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=mhnUJ0Lb; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=aSRK/Gyp; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="mhnUJ0Lb";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="aSRK/Gyp"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 67PM22oP020405;
	Wed, 26 Aug 2026 00:02:08 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.pool80183.interbusiness.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 1CDC212045C;
	Wed, 26 Aug 2026 00:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1787695319; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7H0B2MCYltjUAOnmnO0aIX9bDCYE3lzj+iNrf07w/tg=;
	b=mhnUJ0Lbii777Zy9OFz0E5sPPZ00Nyxnwfk2MN/rSRxc71o1PLuoBPtWPqoNrS7pAYxX+n
	xrS/sisEVnnhC3Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1787695319; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7H0B2MCYltjUAOnmnO0aIX9bDCYE3lzj+iNrf07w/tg=;
	b=aSRK/Gyp0Pp+iwoOxBOSKGtRIWvPB47En+bUn3kNOaUnxnmdZL2plCqPLOOY+Kqv7ME7AM
	AxC/mNetWLh78xnMpPSgIphEIzNJNWRfIrVwNKKwYgongc+F72tze67MQxN+2QjJ8AEpxB
	8kSdImftiBstSt0nNpdl+nLO+WN3qMe74h7g0RN/UKZ95YAcsbcO9CUs+m3WSKH6qnIfEp
	dBTd2Txzb3NfxwN+J1KWIrHyyEbDlsafMoyznUpMc4bjUWPv3Ghe5wH4p+7u7JJsGBsyea
	xIzHPmJ33SezBm9I9Oalv6YYD/gSSbGQ6qrU5pgjBkC5GwHVC0dweHNTtzh3jA==
Date: Wed, 26 Aug 2026 00:01:56 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh
 if iproute2 too old
Message-Id: <20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
In-Reply-To: <20260824091537.2305107-1-alessio.faina@canonical.com>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
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

On Mon, 24 Aug 2026 11:15:37 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

Hi Alessio,

Thanks for the patch.

> In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> the End.DT4/DT6/DX4/DX6 support are not available and the tests
> contained in the following 4 test files
>  - srv6_end_dt4_l3vpn_test.sh
>  - srv6_end_dt6_l3vpn_test.sh
>  - srv6_end_dx4_netfilter_test.sh
>  - srv6_end_dx6_netfilter_test.sh
> are failing in some kernel backports.
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
> To amend this, check the current running iproute2 supports the required
> feature and, if not, just skip the entire test to avoid a failure.
> 

Which kernel were you running when you saw these failures?

Did the ip route add commands that install the seg6local routes fail
there, and if so, with which error?

Ciao
Andrea
