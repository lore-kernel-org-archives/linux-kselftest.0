Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEF49B5A7
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818960; cv=none; b=IPnjUuNEt3pG3DgrEMhGfST6dLDCXIdTmKNd1TD+Fn3iCtiG6GjAxPUw9lVkYxFZE/0+JLUe3lXKwXTb4g5ZEgkvtlkEkuCDjii0EtaV8j7J+uf9QL9xDQwp0PftJmWFFyyUzgVllVOOGZcHOG3WhpQqQq6ztzKFebnvD8XU4i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818960; c=relaxed/simple;
	bh=1dxUVimf65593XQJOKrReoK8m3R89+eNLG6DyO7D0oQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kxfSLaB4hQQxU7amZ8+MLF4kwHOtTUMBA0R/T72D6JUp7HBon96DU5tGT8Fq2R4IOLj2Kvg0saNNQBXgwZxlzgDEx1vpzkClf9+E1DIIboyIchOkvPAY36FUIMQtUEfKlB8jHcIC/oMeG6oTocIHSUt1jmjMRIo9JZfwe6Yrv7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoew0oUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoew0oUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694E01F0089E;
	Mon, 12 Oct 2026 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791818958;
	bh=NcMrAbLpq2OBX3AHj0w0qgkJkplQHESFIN02LZBUuHY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=eoew0oUGjNGqvXHEHEbT7VnoUgpdmjhFdFqnfYDQwF5eUn599pU3k40wqnN//fQ/r
	 Cuq8B9UqYVZWrGw/rAwVvYQiuFBHbdDZCHRccls1b7dGNwPFxOrv4aRECeMwslMzfb
	 mGc3d0NHnGxyX04/ol1wJOyYBzhAY1Kg13RRowMieuBX1lSJ+LFlhyErjKZgZFSSpv
	 jq7AD29rY1kBUY55wi9cpHuorVdlhYlpRALLfflqAq0eEu251NHuoUgGzVERJmPcRe
	 oeX0v/i7iHMKxRjHRx+ljUTeGOVr3i/TCi5pH4WJvexxtuoEyStS4gTg605bnGwwbl
	 4gZ6jY1X9Rthw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id BE651F40066;
	Mon, 12 Oct 2026 11:29:17 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 12 Oct 2026 11:29:17 -0400
X-ME-Sender: <xms:zfzMaggn_rcdiY2VCcTRCfcgQJkZDsslLS56hgOsYbMbt-XduA80bA>
    <xme:zfzMaj2iNnXX_vKB8FUzSAP1gIEeT6utRNM8Yt0swh71uzdNPuzWJaWc2fGpFNDP1
    uQgDUahPlo4Tt032P7zUifXw5990wtX_H0Xut1IwXWNWVJPZ2Cm9-93>
X-ME-Proxy-Cause: dmFkZTEDgETCu/BVbrQzj2011kRTp3JPXrIHxPu2obSyqttl1TOjB0bFjPrIsJXXMGVmZI
    Le89uu9zKw8O1VM8ESu0oRGaoxIRd+A4bEalv1Eggapuadd4KlXWMKDreDMmDRLWXR7gPl
    16WNLIbEM8h4jY0Hy9+y8At7cT6j2llKm20mbs1tbwxEEVWXnjhVd4LiTVHrwpXrz49EBe
    /ok6w6J97VpVhrtJnqhJ/vkiwv7wq0o14qaIT/+zxgPhRdgsAzaaw97B0XiqCZyGHrlksw
    4ffK4hkeyWalembme7/V7qm11tofYzSTv+yuF6InEyfCDKMLuoCTSdCVSwazWfQP6NSEPM
    sKI/md0n128muOx4yAYUfd4RDMEwTaDvCY/Y0ItmgkeiET7GyadhR+JfC0c7HT7m2mytRt
    ZCZwLIrnygUAxLatlVo8nOzOJAxYWWm49EnIrpSDnbSJTLKFRryZnLW4i6vE52Wg1D433X
    SwfiJWXaGsINDF/ynm95fS0wTczjpgDPS7SDdr+r7zu2nplSdRiC83beoRNUMYde80w2SS
    Fs2UXO4r8L55XOzLbDf2/I6VowpuFdEXMaX/JvLPQRkKH8zkMz2oXxzdwUK/NgOssFhyMG
    HhKrzz06GIG+ng4PaBBO/sdMqVhwT4BDraf6y+RIuhMIIiZkEHPuTRvFmIEQ
X-ME-Proxy: <xmx:zfzMapVDXTJqU7Wv71dHrN8J-3ZVBxAgdFLCJPhBl7cthexQ3nC-VA>
    <xmx:zfzMamTwc82xNqNENVf3mfDPg56YQcIzxuWB2A_cRtRUZPpIC3ym4A>
    <xmx:zfzMapQVdXJVYW1LOMH3J4qxgOfB0t6vphYRo0JLI6cHPrsi3rwVfg>
    <xmx:zfzMamcbc8fXOoMWegd043b1L4AjjgFPSddJ2YHosaMlPAHSVrqTJQ>
    <xmx:zfzManeCDLP7zGtYvcyywE0-vNZBgpQl6FP2HPDfIJWU9KcUBQ5coiL8>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9CAB7782738; Mon, 12 Oct 2026 11:29:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AnmxxTRjevic
Date: Mon, 12 Oct 2026 11:28:57 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <48bcc55a-f77c-4be7-beda-1bbb455891b2@slotpi15m67>
In-Reply-To: <179175092109.434549.9909737533057193878@kernel.org>
References: <20261007-tls-follow-on-v3-4-6d52d98389b3@kernel.org>
 <179175092109.434549.9909737533057193878@kernel.org>
Subject: Re: [PATCH net-next v3 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> [Severity: Medium]
> Can a peer keep this goto retry loop running for as long as it likes?

Yes, as it can in tls_sw_recvmsg(). This series leaves both unbounded:
the reader runs in its own syscall context, and a budget exit returns
zero, which is the false EOF this patch fixes. See my reply on patch 2.

In the v4 repost, nonblocking splice with a signal pending will get
-EAGAIN rather than -EINTR.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
