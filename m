Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7334229A2;
	Sat, 29 Aug 2026 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788037965; cv=none; b=tyd0gSiFKXe+iGLeYqfYbgUA6M9salWKvsd7j4P82v+j8PnhDwdqicRIx7Awxr/75Pmklvtt7slPH/e+XaONn1eHh5uv85Du/ra6RqTBdOzQ1G2kvIKAbAGA2IF3R6XPD7Tjb9PKr6Cwnpxlp8mSXMOPmYN0YQR1l0BgN5x8g+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788037965; c=relaxed/simple;
	bh=DQ0TH8DC1nNl3Es47wQXDJ7rMjgGeNs/T/P/qTulhz8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pLpoW5NURXC0INnnPYDTRfwCqIEULFDHiiMJD2fSm6/bztqtj7OzWiZLST4oOdql8C/ZPg7Ujr/0WqwoufIh5oqjB2Wgzsh7Hd0CH7ygFFCERJUQBtbtezjSdE8CN5jcKj4ARRGHy8lOzwyDMJl2zlGRnt49w54gX6lvVdH03Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=f8yygAUd; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=Ub2yeB85; arc=none smtp.client-ip=160.80.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="f8yygAUd";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="Ub2yeB85"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 67TLBwHW014696;
	Sat, 29 Aug 2026 23:12:03 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.pool80183.interbusiness.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 060961208F0;
	Sat, 29 Aug 2026 23:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1788037913; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnOseVsq8nTTJxBJK83Un/BrgyQIX5fU3veDIxrKJq0=;
	b=f8yygAUdargi009ok6v2hcsFLnyiOedU3QGBdTOvW0G/lO/8GeYFP5ZORQNkzdLaz6fTnN
	M9kO0VYVqa/67kBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1788037913; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xnOseVsq8nTTJxBJK83Un/BrgyQIX5fU3veDIxrKJq0=;
	b=Ub2yeB85hbxqFwlXnhCBj2VUukbSEEx4ze2DVeTNRn+PQAdk1ZDUA5Z37a+n3mDfpHnDhW
	Fa8UqEuVWC+np4FRSx7csFyWuuJc6qV6159+oolxlOSq1oErPjplh3+zGjLl8Axn8QYiO8
	c+KcrleiXp0/OG5MLZ671zx30mw50XVbPp4ySQK29vDUpNtAd4JO8gcrVzuSsPPoQ/eZph
	YcNWMG4/uDS+yAZuBwGjhpM1kkAeTuSF6XSnf5OkVJ261IUXRupGDjMQqtXDEaGXOgVWYG
	QG+LLttAiRZqnRfiP4l6GXTnMKL4HFY70GODaRdtKqfr0szwMVMc5g/RZbjHtQ==
Date: Sat, 29 Aug 2026 23:11:50 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh
 if iproute2 too old
Message-Id: <20260829231150.8180c09f6874606eb49d0243@uniroma2.it>
In-Reply-To: <apGxmfjQs247lHX-@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
	<20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
	<ao7S04LkWVXAQpgq@cicciput>
	<20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>
	<apAJuZzDOvjkVx60@cicciput>
	<20260828042357.1d6e802448752a8fdff5a485@uniroma2.it>
	<apGxmfjQs247lHX-@cicciput>
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

On Fri, 28 Aug 2026 18:04:41 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

> [snip]
> 

Hi Alessio,

> I tried multiple methods:
> the first approach is yours, but I can see the following error with any iproute2 
> version I'm using (I tried 5.5 to 5.18): when running 
> "ip -netns ${rtdst_name}" command, it always returns 
> 
> RTNETLINK answers: File exists
> 2

EEXIST means that the object is already there, and says nothing about
vrftable. When ip does not know vrftable it refuses the command itself,
with the error you showed earlier: either "to" is duplicate,
or "vrftable" is a garbage.

In a netns created by the check there is nothing to collide with, so EEXIST
does not come from the way I suggested. The full command and output would
settle it.

> I tried the following approach as well,
> 
>  	# set the decap route for decapsulating packets which arrive from
>  	# the rtdst router and destined to the hsdst host.
> -	ip -netns ${rtdst_name} -6 route add ${vpn_sid}/128 table ${LOCALSID_TABLE_ID} \
> -		encap seg6local action End.DT4 vrftable ${tid} dev vrf-${tid}
> +	if ! ip -netns ${rtdst_name} -6 route add ${vpn_sid}/128 table ${LOCALSID_TABLE_ID} \
> +			encap seg6local action End.DT4 vrftable ${tid} dev vrf-${tid} 2>/dev/null; then
> +		echo "SKIP: SRv6 End.DT4 vrftable not supported in iproute2"
> +		cleanup
> +		exit "${ksft_skip}"
> +	fi
> 
> where the test is checked at vrftable creation time, and it would
> cleanup and exit as expected from standard tests.
> 
> But obviously this gets the same RTNETLINK answer as an error.
> 

This is a setup step, not a check. The skip decision is taken while the
topology is being built, because setup_vpn_config() is called several times
inside setup(). The check should run before setup(), once.

The way I suggested runs the route add with vrftable in a throwaway netns,
created and removed by the check itself.
test_encap_lookup_supp_or_ksft_skip() in srv6_encap_lookup_l3vpn_test.sh
has that shape: it creates the netns, adds the device it needs, tries its
route, and on failure cleans up and exits ksft_skip. For the dt4 and dt6
tests that device is a vrf bound to the table passed to vrftable, and the
netns also needs the strict mode.

> Then another approach came to my mind, and it seems to be quite reliable.
> Practically checking if the ip command contains the string "vrftable"
> using the "strings" command, and if not, skip the test.
> 
> Something like this:
> 
> +test_iproute2_vrftable_supp_or_ksft_skip()
> +{
> +	if ! strings $(command -v ip) | grep -q "vrftable"; then
> +		echo "SKIP: SRv6 End.DT4 vrftable not supported in iproute2"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
> 
> What do you think about it?

I would rather not add a new tool dependency to these two tests. The
route add uses ip, which the test needs anyway.

Ciao,
Andrea
