Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D9D31D730;
	Fri, 28 Aug 2026 02:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883891; cv=none; b=ktRPL1CI9qFLWnzvQsfFkKZMI3dHCnrUKxUXlhuJO1j+fagx6WBMcFItwmrlx+nJ7/kduUfUFJN5HEloX98jHbrvzLRP5G89l4ItTZt0UMlk09uub5pU/AheVMHJ1FR62/5ATqr5CSdMJv55CqoYtjSkZVl4vtyNdGkR4XtEeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883891; c=relaxed/simple;
	bh=cSwXwbZiNm+wpI0qTq+BPatYQNSeinvWGhnimGLbtXs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BRUNUCYA3qJpz8XMoTRd8qFXG8ZQ+ZsPTsuCR0Jnsomstx5KBKEh8EuO94KLyvMcbBJcEejItJVIy7/7xe1cbJKgr+0fz83UNV41y/B4WAkRzrNWwY2G6lcKH42TTLVruJzrg7TXMcOBuZH6zNn/OalXWTvgEITvV8nbBsRw8EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=CQ4q+NBB; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=jtaPNNXq; arc=none smtp.client-ip=160.80.4.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="CQ4q+NBB";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="jtaPNNXq"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 67S2O4DN009976;
	Fri, 28 Aug 2026 04:24:10 +0200
Received: from lubuntu-18.04 (unknown [46.102.188.23])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id F3BDD1203BC;
	Fri, 28 Aug 2026 04:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1787883840; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHsVrpcKhIi554UgPAGddcB5XgcFsZd5TabwRLAme3M=;
	b=CQ4q+NBBumm9gjNk43IqUpd++cYCW8DOmcbRdLWxAD9tTe0bNXDAYbza4J/uIyxvWQg8Sf
	1j8mSMkFH03smEBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1787883840; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHsVrpcKhIi554UgPAGddcB5XgcFsZd5TabwRLAme3M=;
	b=jtaPNNXqTzDViLoUbfekNOtkNPLoziQLzn0Ezm1fwlRPNetmQEcEZFLBaG0GpBvNIis5Pf
	7nHgo2CIkO1g0Uzw4hIB9LyrWlL9zmUZDFUsNfeoJ05brOvSoD3eDGn/E35uJpcFe6Y/JA
	DbLyEIzTD9SOwIvrAl9cZyhmfnfx29O8mPnugJKncv5LP1ZwpedJqeQisn6s8+ul8ee046
	oyIJ66TN4D+JNesfey8+jFsTkcqxPC/Bpl1eun6h2DpslrlIrsvxx98/YgaG7HG/vNAVhL
	f1G0KbJkwp+OdRTPcYRk3DKAnIGx9FfrLCd9C2ng86znlI1LEo9v0jq1uUtrBA==
Date: Fri, 28 Aug 2026 04:23:57 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, hangbin.liu@linux.dev,
        stefano.salsano@uniroma2.it, Andrea Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh
 if iproute2 too old
Message-Id: <20260828042357.1d6e802448752a8fdff5a485@uniroma2.it>
In-Reply-To: <apAJuZzDOvjkVx60@cicciput>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
	<20260826000156.bdaa71db68dbdc9c13907205@uniroma2.it>
	<ao7S04LkWVXAQpgq@cicciput>
	<20260827030701.bfaf6eea6dea1aef24c353cf@uniroma2.it>
	<apAJuZzDOvjkVx60@cicciput>
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

On Thu, 27 Aug 2026 11:56:09 +0200
Alessio Faina <alessio.faina@canonical.com> wrote:

> [snip]
> 
> For the DX tests I was doing a local test but it's not in the original
> kernel, sorry, I must have confused 2 tasks with one, so disregard the
> DX4 and DX6 tests, they are not relevant to this issue; if we manage to
> agree on a solution for the DT4 and DT6 tests, I will discard those
> modification in a subsequent patch.

Ok, so this is about the dt4 and dt6 tests only.

> About the DT4 and DT6 tests, I thought to use the same method as the failure
> was practically the same as End.DT46.
> This is the version I'm currently using 
> ip utility, iproute2-ss200127 (should be 5.5.0 if I'm not mistaken)
> and I can confirm 
> [SEG6_LOCAL_ACTION_END_DT4]		= "End.DT4"
> [SEG6_LOCAL_ACTION_END_DT6]		= "End.DT6",
> is available.
> 
> What do you suggest would be the right way forward to check what is
> going on?

These tests need the vrftable attribute. The help does not list it
before v5.14.0, while ip parses it from v5.11.0, so a help check skips
tests that would run on v5.11.0, v5.12.0 and v5.13.0.
One possible way could be to try the route add in a throwaway netns and
skip the selftest if that fails. test_encap_lookup_supp_or_ksft_skip() in
srv6_encap_lookup_l3vpn_test.sh could provide the general idea, but here
the netns also needs the vrf device and the strict mode the test sets up.

That's more code than a help check, but it skips when the route really
cannot be installed. There is a trade-off to consider, and comments or
other ideas are very welcome.

Ciao,
Andrea
