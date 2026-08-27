Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437C125333F;
	Thu, 27 Aug 2026 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793815; cv=none; b=sKzg60SYzhJsOSvevKIb/xYT/AHw4Ahtn2zadxUkqcRqBKCfEeFIyYyWuxG/QvA4N1vQb2W+CdqxiaQDg5PREd9e33lOze2Fm0huplBIQO0N/QkB8nEf0tiuBO+vdT4JH/NmCwXJQkIEdHqaUmCTN/K9TO3hZYXobK5bg+Pu7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793815; c=relaxed/simple;
	bh=AUZjF1tSXfPulx9ds395d+l+4xKK3aq9dnnKAuL4NhM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hwiLkt4f5VYzlfOTuG3w/oWioq/M8Ox2gVx2RCirQfNhVKuRDMsn81eMVNvgRa43JaSApg7+SzcVTkgmocgDNZN7fjX9yM7zTkod/C8fYG0WPyu0/+FGH4nwR/PxUVmtR9neh9vYY125GufjVfU/bJ93ViQ/vQpLyTQ0PbZqcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=CIexIDba; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=TpEI06wG; arc=none smtp.client-ip=160.80.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="CIexIDba";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="TpEI06wG"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 67R177u3018451;
	Thu, 27 Aug 2026 03:07:12 +0200
Received: from lubuntu-18.04 (host-80-183-189-234.pool80183.interbusiness.it [80.183.189.234])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 0845F122917;
	Thu, 27 Aug 2026 03:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1787792823; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyCTcqNbBu4niFmOTFXhcVWrtpRsvOvbQiIDfLmuFdw=;
	b=CIexIDba6p1nMH2qeSyYmAY7wUrjkCZk16qnSncG8AdXH9y6iRVGM8Ao9KZ2KH5yPb3rKn
	qYPBrS2WRRhOohAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1787792823; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NyCTcqNbBu4niFmOTFXhcVWrtpRsvOvbQiIDfLmuFdw=;
	b=TpEI06wGRatFoagz3VZTQdGvdGV/wj1RR+xfU888oLWETq2GEMx/sa1pg3ltm1cN6aQ17A
	jTt6sr59nfmJX/C7IgjQB3SCtqslRH9kz4k2S2VeBCWJnEnWMKfaaBnvnPRRRA9PsE47MM
	QfY07f/d6DuEP0Lhe213se/2Gl9wgT9RPaiev9o/MSijqv+/iJb+hyNY0MMpRdfOOHRuNR
	ZNj9vFC+Cr0IURpnorcFWuibJU9ljRdLb+HtbubH86va3/TprEqEMTyHBndTvsSXvPP7et
	Shb8vvkMfun/dwWvcblBWp/ZeAMA4NKiHaDd1JKZbyxN3tyQCxNKpYaPxnEUww==
Date: Thu, 27 Aug 2026 03:07:01 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh
 if iproute2 too old
Message-Id: <20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>
In-Reply-To: <ao7S04LkWVXAQpgq@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
	<20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
	<ao7S04LkWVXAQpgq@cicciput>
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

On Wed, 26 Aug 2026 13:49:39 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

Hi Alessio,

> I was running kernel 5.15 (5.15.0-139-generic).
>
> Removing the sink to /dev/null in check_hs_connectivity
> I can see the following error:
>
> ------------
> PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
>
> --- 10.0.0.2 ping statistics ---
> 1 packets transmitted, 0 received, 100% packet loss, time 0ms
>
>     TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
>
> .....
> ------------
>
> The error I can see upon installing the route in the setup is the
> following:
>
> ------------
> Error: either "to" is duplicate, or "vrftable" is a garbage.
> ------------

This error comes from the route parser: the seg6local action was
parsed, and "vrftable" was not recognised. The End.DT4/DT6/DX4/DX6
actions have been in iproute2 since v4.14.0, but the vrftable
attribute only since v5.11.0.

> I can see that iproute2 doesn't support any End routes
>
> ------------
> ~$ ip route help 2>&1 | grep -qo "End"
> ~$ echo $?
> 1
> ------------

The help text reports the names of these four actions only since
v5.14.0.

> It's similar to the case we added last month(-ish) for
> srv6_end_dt46_l3vpn_test.sh.

End.DT46 was different: parsing and help line came in one commit,
so no upstream release has one without the other.

The two DX tests do not use vrftable, their seg6local routes only
need nh4 and nh6, which are as old as the actions. Which error do
the DX tests give on your setup?

Thanks,

Ciao
Andrea
