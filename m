Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029FD2045AD;
	Fri, 17 Jul 2026 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784310597; cv=none; b=nmzGL5ulBJFcJ+FsM/GZj04jGNodbJXdbjHlQPcMZYgB2OYaVVtUl/9qB/k5StlckrPBLrc2IkQfMBednlvFiWYBEOCWU3gQplKW1j4+se/ez2YJan5O2jUqS8v3ekijRb+xEs78DhVVePTHQdxM3jvDYyCYnXKaOpl5oTnio/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784310597; c=relaxed/simple;
	bh=Giiw/ZOOfAJ2hq7FVfZlCKPpzMgwkdliF5X8y5bQqMU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=htAjhGhAE+WfzUhpXoLW23df7g68cmTrbJVAkm3nYqerN5e/aO1i/5gGq6+eXHwx0H9HIfMgpcR2xkRGtvQFLT9M/zb8ZuxPsXorToa2bKi0jg1gJUTAkx+CLLHR5ApGeIYwr7+eWcYkdkd6Sg0fMWIpm+Tqxt6NiquVqjhwr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=62WlHh8O; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=bCyRq4KB; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="62WlHh8O";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="bCyRq4KB"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 66HHnCcl025579;
	Fri, 17 Jul 2026 19:49:17 +0200
Received: from lubuntu-18.04 (host-82-61-152-174.retail.telecomitalia.it [82.61.152.174])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 055731228BD;
	Fri, 17 Jul 2026 19:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1784310548; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDOhEW2nZYnN36kdcdUnCFtouMLk3tpNvVjJA0N63gE=;
	b=62WlHh8OZVO63AYBNjigcjVeLfgXZrZMWeo/11sejZj0Apr0N6+QwcVsaeP/Bd1bNnj3Cu
	hP5YpNF4hx8dgxBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1784310548; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDOhEW2nZYnN36kdcdUnCFtouMLk3tpNvVjJA0N63gE=;
	b=bCyRq4KBPbpwxFhAq6spuUJn63ElBkHkq4zBUUgyV+vjNtek27oA7hNDTdhS9NpE1XIxC5
	BicN3KWRWcXc+xFlIIGID/rvO+FzRGgu2IncwJdSqA7xI81HGZ3N9E4l5gEg21givd2Rdk
	/uHIWGfkWx8AmcTWra5HnG+Q64NVfxp3pElAFx+k7HXTzXqwfDq1fV9oPNzensp3hbvlyA
	M4vAkOYr+/PFzVFx3arl6RJJatVOIft6kphoacyossZEO+CHBjkZLdV7D1btR6E7Eocreu
	3KkU1N+DV4wp64zGUtUmQdoKkSwh+FoCr/r9U6uFsH2CmGtnVFt/axpMhpTHdA==
Date: Fri, 17 Jul 2026 19:49:07 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Po-Hsu Lin
 <po-hsu.lin@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
        Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v3] selftests/net: Skip
 srv6_end_dt46_l3vpn_test if iproute2 too old
Message-Id: <20260717194907.928697ef66c28eb4d3a1d7c6@uniroma2.it>
In-Reply-To: <20260715122859.36177-1-alessio.faina@canonical.com>
References: <20260715122859.36177-1-alessio.faina@canonical.com>
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

On Wed, 15 Jul 2026 14:28:59 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

> In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> the End.DT46 support is not available and the host_vpn_tests test contained
> in the srv6_end_dt46_l3vpn_test.sh file is failing in some kernel backports.
> This is the result of those tests:
>
> ################################################################################
> TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> ################################################################################
>
>     TEST: IPv6 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]
>
>     TEST: IPv4 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]
>
>     TEST: IPv6 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]
>
>     TEST: IPv4 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]
>
>     TEST: IPv6 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]
>
>     TEST: IPv4 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]
>
>     TEST: IPv6 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]
>
>     TEST: IPv4 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]
>
> To amend this, check the current running iproute2 supports the required
> feature and, if not, just skip the entire test to avoid a failure.
>
> Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> ---
> v3:
>  -  fix indentation in test_iproute2_supp_or_ksft_skip()
>  -  fix subject to reflect full test suite skip
>  -  https://lore.kernel.org/netdev/20260713095750.2671173-1-alessio.faina@canonical.com/
> v2:
>     - skip entire test suite if iproute2 is too old
> v1: https://lore.kernel.org/netdev/20260708152745.2430714-1-alessio.faina@canonical.com/
>
>  .../testing/selftests/net/srv6_end_dt46_l3vpn_test.sh  | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Hi Alessio,

Thanks for the v3, both points are addressed.

About the check flagged by Sashiko: "ip route add help" is fine.
iproute2 catches the "help" word and prints the usage before it parses it as a
prefix, so the grep works.
As a small nit, the other srv6 selftests use "ip route help" without "add".
This is not blocking, and I don't think it is worth spinning a v4 just to
remove the "add".

Reviewed-by: Andrea Mayer <andrea.mayer@uniroma2.it>

Ciao
Andrea
