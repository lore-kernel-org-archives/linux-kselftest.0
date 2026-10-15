Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F6235E950;
	Thu, 15 Oct 2026 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.80.4.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028796; cv=none; b=QDIqxgMWqb+vcMNDpHOCUuQs2NFzN5bewYxAwBipT76YBJVz/aPq6k9JBfU9DLnaxrjlvc25nANjWNhVyS2pXlHXNEB3qFs7TJGFw7TIxHJrxoeWy00CUaLis/T9Gdy00WQouFx0Z5St03uS9QvNUj3c5et2Rw76mUof8RjgRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028796; c=relaxed/simple;
	bh=JS1UHXPvvp09gY0rzjuh5BWZwvh7T+K/RQvpRF/NL2Q=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EaSpVI5grgKJHeq2xzv+Gk4beLIK3VRVYIkUrlRs+osFS6BiLPn0qmsomUou82aD++Xjs76ykgJjItBcwk2QeYsQpTl2HpnBdf4z67LSH+HuBDz7vIyLeoz69f0aeKld1sVG/0EY1NqmodwOkFvF/t/jckaJQ46TxKm1MItGcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it; spf=pass smtp.mailfrom=uniroma2.it; dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=/tGq1udY; dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b=UcJeR3s/; arc=none smtp.client-ip=160.80.4.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="/tGq1udY";
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.b="UcJeR3s/"
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 69F1jleX026015;
	Thu, 15 Oct 2026 03:45:52 +0200
Received: from lubuntu-18.04 (host-79-32-222-240.retail.telecomitalia.it [79.32.222.240])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id EAC6E1212CA;
	Thu, 15 Oct 2026 03:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1792028742; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3jLV7xkKyPXyvZnAkQlyv/K5QoOzL9c26mU54ZKf5Y=;
	b=/tGq1udYD2iG5msheWccAyxKu5AteoXND1qfVa5kvVZ0uc+nkImaiU+uaKTa0tgYU+vZN0
	zfPYGlf0IQWuyhDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1792028742; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3jLV7xkKyPXyvZnAkQlyv/K5QoOzL9c26mU54ZKf5Y=;
	b=UcJeR3s/d4sIHHpBG9NAmJ6Z5YKwR7ZMZWIT7qSdAG+IvVoBsIoF5ZEC/hArvQbXx41wTL
	0SXQM+G26W02XwZfAgrnJmUknVedK1x5YtIuPPBtRUEJY/yTd9lyH36b5EzbgFD9Q1mdSD
	7LQsU+ISNxoN72/JOGsMn5A51J/vsWV6xIq3dYIYvNpVyNNQtkbnPo4bV/wDUAb0ZVvFKf
	zevjOwGpxHpr7bai4OD/AtELaUEAOHSv6HDaDNnYlXHDC1w6/sIftLOcFlgArE6nva6fCz
	feCUYFFxFuNMT7QxUir/FBBbRhp3lSRFk59obLd4PaIf2yLDhtyQRUkGtC9djA==
Date: Thu, 15 Oct 2026 03:45:41 +0200
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, dsahern@kernel.org, horms@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, shuah@kernel.org,
        hangbin.liu@linux.dev, justin.iurman@gmail.com,
        nicolas.dichtel@6wind.com, ahabdels@cisco.com,
        stefano.salsano@uniroma2.it, andrea@common-net.org,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next 5/5] selftests: seg6: add tests for PSP with a
 consumed SRH
Message-Id: <20261015034541.cc16ac6eb2dfdb2f9273a021@uniroma2.it>
In-Reply-To: <179183319121.434549.16235006579764445540@kernel.org>
References: <20261011192310.55-6-andrea.mayer@uniroma2.it>
	<179183319121.434549.16235006579764445540@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Mon, 12 Oct 2026 19:26:31 +0000
netdev-bot+sashiko@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The consumed-SRH tests in
>   host_srv6_end_flv_consumed_srh_tests()…
> - [Low] setup_rt_consumed_srh() runs `ip -netns ... -6 route add "${sid}"
>   table 90 encap seg6 mode inline segs ... dev dum0` and does not check…
>
> --
>
> [snip]
>
> [Severity: Medium]
> If rt-2 removes the wrong SRH, or no SRH at all, would these tests notice?
>
> [snip]
>
> So two possible kernel regressions on the multi-SRH path would still pass:
>
>   - end_flv8986_core() takes srhoff from the first routing header instead of
>     the one found with IP6_FH_F_SKIP_RH. seg6_pop_srh() then removes the
>     consumed SRH at offset 40 and leaves
>     "IPv6 | Policy's SRH, SL=0 | ICMPv6".
>
>   - PSP falls back to plain End without calling seg6_pop_srh(), which leaves
>     "IPv6 | extra SRH, SL=0 | Policy's SRH, SL=0 | ICMPv6".
>
> In both cases ipv6_srh_rcv() skips each SL=0 SRH, the echo request is
> delivered, and the ping succeeds.
>
> The comment and the commit message say "PSP itself is checked by the PSP
> flavor and NEXT-C-SID,PSP tests". Those tests only carry a single SRH, so
> srhoff is always sizeof(struct ipv6hdr). They never pick an SRH at
> srhoff > 40, and they never run the positional nexthdr fix-up in the else
> branch of seg6_pop_srh():
>
> 	if (srhoff == sizeof(*iph)) {
> 		iph->nexthdr = srh_nexthdr;
> 	} else {
> 		...
>
> Could a host-side check of what is left in the packet close this gap? One
> option is an ip6tables "-m srh" match on the host's veth0. It would accept
> only a first SRH with --srh-last-entry-eq 1 and --srh-next-hdr 58.
>
> [snip]

The consumed-SRH tests in this patch would not notice these cases.

However, the suggested match is not enough for the first case. In (i.b)
and (i.d), the Policy's SRH also has Last Entry 1 and is followed by
ICMPv6, and the packet is still accepted. I checked this on a kernel
where I added this regression on purpose.

A check on Segment List[0] of the first SRH would detect this case. In
the extra SRH it is the SID that triggered the insertion, while in the
Policy's SRH it is an address of the host.

I will address this finding in v2.

> [snip]
>
> > +setup_rt_consumed_srh()
> > +{
> > +	local rt="$1"
> > +	local sid="$2"
> > +	local end_rt="$3"
> > +	local nsname
> > +
> > +	nsname="$(get_rtname "${rt}")"
> > +
> > +	ip -netns "${nsname}" -6 route \
> > +		add "${sid}" table "${LOCALSID_TABLE_ID}" \
> > +		encap seg6 mode inline \
> > +		segs "${LOCATOR_SERVICE}:${end_rt}::${END_FUNC}" \
> > +		dev "${DUMMY_DEVNAME}"
> > +}
>
> [Severity: Low]
> Should setup_rt_consumed_srh() check the exit status of this ip route add?
>
> The test body runs with set +e, so a failure here is ignored. Without the
> route, the extra SRH is never inserted.
>
> The packet would then follow the plain Policy path that the earlier PSP and
> NEXT-C-SID tests already cover. The ping would succeed, since the hosts have
> seg6_enabled=1. log_test would then record a pass for the consumed SRH case
> without running that path.
>
> I could not find a way for this route add to fail in the current topology.
> setup() already uses the same features under set -e, so this is a
> robustness question more than a confirmed failure.
>
> [snip]

I will also have a look at this for v2.

Ciao,
Andrea

pw-bot: cr
