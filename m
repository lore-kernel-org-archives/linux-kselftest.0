Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.33])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F9F5519B4;
	Wed,  9 Sep 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960636; cv=none; b=XVg5rZaNMW2XdTTNJtbgxuTb7uYq5InbsCPTbYL/VGvdx0swAfy96NufHdzkYMuV5LzvUSNOL6y7igNMm5jrfA1Ib9oAcO62KP9zYbg3IUGNuOeY3FW4idO8thHul1ylThvgFANQ9f2Hy6WpDd0bYbbPFvkM2hb/Zvbb1dfsR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960636; c=relaxed/simple;
	bh=wH/5rLMbn/tkRQGP+nFCObBZ0jZTBhBNuQmCJLzIOgY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FK1W/RZbSpMTSA78PsivnP1IobRCotoCQ94ne79IdSslmFPdqmb28r6FyQvyY3rdZVdQBKsXBaXt/zUsug0KGWCB6a4BMTxY85sETMNyhDDEDG18hWWuzps9F2J8jLA858LbQXAuF5u7a5f7918Qm5HCXvbRERNFmQvxMuR19Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=lHy5YNbz; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=gXVUNniL; arc=none smtp.client-ip=160.80.4.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="lHy5YNbz";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="gXVUNniL"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 689DODVO014165;
	Wed, 9 Sep 2026 15:24:20 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.pool80183.interbusiness.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 40C6A12296B;
	Wed,  9 Sep 2026 15:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1788960261; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmwQH6xbCrxJ9uhmc8NIhOyl6JDr6UEwf3ZJ6I28osk=;
	b=lHy5YNbzDq6NNAfggp9x9jA7OPfAYppL5aKvywjuF5SSLYITz3mr2mUOntHuMlpO0kNcht
	08V2H++wY8QQqOBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1788960261; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmwQH6xbCrxJ9uhmc8NIhOyl6JDr6UEwf3ZJ6I28osk=;
	b=gXVUNniL8cWk4Uc0boQJKMYRBPkagDULYHexISeUhy9T/fgGFhZdMU3bUkACrE22Ar/PPm
	SNCaRt9bmcAYZgybSmUfKr7SCNKFhxT1tpSj1oYLKppXYrOUUsTn++7PZsqUNjRvn+ocDZ
	oz86h/H8VuOTpDbMp/Esf2LczRaYe040l41pM58yhzUH5JEOYHtLeSMhBIV9gvZtvqoqmN
	xqz3Ks4FMYv6R9ZyfIHQQGAWb+l/Z2ndMWJ7M7X4oH6hAbs7+5dTKfGaQcWXNmxBFEcTS6
	b1qLgj5yQ6gp+KwRIiaZk7dirRcfsq60ZSvoQ6HD+tQ+WQ07VS1pQjTY7tgpWw==
Date: Wed, 9 Sep 2026 15:24:18 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman
 <horms@kernel.org>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        hangbin.liu@linux.dev, stefano.salsano@uniroma2.it,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v3] selftests/net: skip
 srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Message-Id: <20260909152418.b94e314757b1a88dd5400b17@uniroma2.it>
In-Reply-To: <20260907100631.1923148-1-alessio.faina@canonical.com>
References: <20260907100631.1923148-1-alessio.faina@canonical.com>
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

On Mon,  7 Sep 2026 12:06:31 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

> In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
> the vrftable support is not available and the tests
> contained in the following 2 test files
>  - srv6_end_dt4_l3vpn_test.sh
>  - srv6_end_dt6_l3vpn_test.sh
> are failing in some kernel backports.
> This is the result of one of those tests in an unsupported environment:
> 
>  ##########################################################################
>  TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
>  ##########################################################################
> 
>     TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)    [FAIL]
> 
>     TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)    [FAIL]
> 
>     TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)    [FAIL]
> 
>     TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)    [FAIL]
> 
> The test installs a route with the vrftable feature; if this feature is
> not available, the approach taken is to skip the test rather than
> failing it.
> 
> Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> ---
> v3: - Fix Commit message and mail subject
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260903103545.1325276-1-alessio.faina@canonical.com/
>     - remove dx[4/6] tests
>     - test if vrftable is available in the installed iproute2
>       application
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
>     - initial approach by testing DT[4/6] and DX[4/6]
>     - test if DT4/DT6 are available in iproute2
> 
>  ./tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh  | 21 +++++++++++++++++++
>  ./tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh  | 21 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>

Hi Alessio,

Thanks for the v3, it looks good to me.

Reviewed-by: Andrea Mayer <andrea.mayer@uniroma2.it>

Ciao,
Andrea
