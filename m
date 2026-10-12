Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110049DBBE;
	Mon, 12 Oct 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818713; cv=none; b=O5PM2i+vRBeOUpuTyM6ZF8kE8OpE1PxXCnlWvitKC9muu3p/Pu9iTlCUZV2+VCA3cAj4oWN8ENCHhjAtSMAqVqGgBsIbcX07NLYl9pkln+hmfujFmS+iAP2g0S9Q3I1+mAuOxbk34hT9B7l/urkXSR1cYwkov9ZG72xAmuvTm70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818713; c=relaxed/simple;
	bh=bgCkOaW6e1+isC74eKNQ1VVmKd0oNZQtZ7jjnfh34Lk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n5P0X5G7Xz9L/36apDIvKs3bShrACytd3wsURW4o0uk/Fjb9EbnY2YHKkw/DlvSkeotwxdDcJ9w/7DIRHSTEy1dTsfZBjWs1Hb+8wa+/masGPLHjJut/E6P3X44n6Ol7qUB++X1rN4vIT8cE89l/aG5GacxHq/wRPf4semFzIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INosGET8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INosGET8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBDB1F0089D;
	Mon, 12 Oct 2026 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791818710;
	bh=6hbVwLc+Eobakx5L2leuGY1znHSunoczQPN33A9OPuQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=INosGET8+gkJY3NiKfECcItxHVcDRcrTtJjRWL+EEazcwlebusLiQd2hb2SE+63KL
	 k1W27SZfpzwc2NFtpURMZw3GI3g4AotUC7N2c6in+kf1NksOeTUJ5tIKMD3CCMH9Z5
	 gp75xEq25LL8gQnl8nw68QOJaBD7m3HuZRKJduIMyU9MJjRjtfydJMgBiiLv6/j+e5
	 JqqdAIKcL9bxm5hucOCwOYnQcw8q4aqnbnKvMgCqUn2oB8tFan+vnfvgah/sY+5Hur
	 8VlJd9IRr55yzf/Ipzg1l4ePxQWIzE4p1SecQ6U5U/5hnIB8d/j7qehOb+m+VbYWof
	 nwWuz3Zz/9X5w==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id DA063F40066;
	Mon, 12 Oct 2026 11:25:09 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 12 Oct 2026 11:25:09 -0400
X-ME-Sender: <xms:1fvMavdm_-o250QfC2x2xyX1RtqXTJT0g9KjwN7mNElNeSyBBfzXhA>
    <xme:1fvMagCVg34-PS09WFYsu0tZOgFDhPBJ7UDuBD7PFte5BcU_SH9o-P5Zy0J3pQfy7
    O43vyRPR7uJvlrn4buz5etWs0WnJquTbsL5D4G8gU_j-mRGWMyoiuE>
X-ME-Proxy-Cause: dmFkZTEOnW4i8X4wWC901D8Y1o9KOcazIEmT/stD4L/DlfyOxF0GACBQdDeRx6eDgNyQI3
    yshvgdYsfIacm1KxlDOAS8BqDJUmN2mF6k6sdeR3gAyweWrXhQIBXl3adS3ouMv5M8U6az
    E9Q5k6ge7GIIAFY0x7OLY1UQDSw9WyN1mq/gaKSrF6P1o57m9iFMPL/zAzz32BHXGoscXB
    naeawCkdb4jtBH9vmRiUyj98QkmvUwJenJERcUsQsKKm4pi2+e87Qac4CKPVHDUdCY/76y
    yKksX9K8fThe5AUJukG8iFUW5raJvMVcy78fQw9/usYzM8HKAwvGcLUB8JLMW4hfksHGcB
    +3frmvmwaLl3y218Wpfnky149QjTX2qBEHaBcaV+oA1fNAOVPzLXYBlDSFuECebz24OZQ9
    R4RU1yvk9FjEfCR5CiJ5waBE+tbtfYaX72QBKS9/J+8c7szqOzVFulRB5D4TP7SQ10Ez7y
    pPRHwcMRE3pNNludtWkhoYAuhl920+92UrPMGYSNgvxk9CUp3KHCCeORI9FO3/K2ddrCOp
    Av3X88wjeBupknfFqAI6JIDMrg0TxqxRpvC28LmUckm20RRLjdIPXHIXij+enkpWX2ukGI
    FlHZ5PUB2Gv1iRRtJTKCb61MXfCr45gKy6RDmWlzXxPkmA7xSDGo8co2gk9A
X-ME-Proxy: <xmx:1fvMajQgGIiG1W-3sM68lWQj0qShzvc1Om_9L-RUI8jXma4iEgnccw>
    <xmx:1fvMahe6znQfPR3PTJxSbokXHXaGh84JgezRVROG5DEkBtdA_1X7VA>
    <xmx:1fvMasvIV3DrXIHmS62ddPaFhO60WQDoH5X68IxytmGSoBpbR16wRg>
    <xmx:1fvMatLTsHaa5FC22LgShujHd0isPJl3t99Kj2cdDSgo41vXjhPvfA>
    <xmx:1fvMagYqqJD_fcjqxuTAT562-Ec6KUoMCCKDzHUhjLxlIP2zUdrwC9eG>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0BE1782738; Mon, 12 Oct 2026 11:25:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcXweelUJT4B
Date: Mon, 12 Oct 2026 11:24:49 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <daf8b73a-f3df-424a-86ca-6ef67430671b@slotpi15m67>
In-Reply-To: <179175091859.434549.6003999701782227362@kernel.org>
References: <20261007-tls-follow-on-v3-1-6d52d98389b3@kernel.org>
 <179175091859.434549.6003999701782227362@kernel.org>
Subject: Re: [PATCH net-next v3 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> [Severity: High]
> Is this comment accurate? tls_rx_reader_release() begins by calling
> tls_rx_msg_maybe_announce(). That function calls the consumer's callback
> synchronously, and reader_present is still set when it does:

The comment is wrong, and so is the claim in the patch description
that records left queued raise no sk_data_ready(). Since commit
22f8bf8808dc ("tls: Suppress spurious saved_data_ready on all receive
paths"), tls_rx_reader_release() announces a record that was parsed
but not delivered, and that is the state the new break leaves behind.
The work item adds no value: when no record is parsed at the break,
the next TCP segment or the strparser's own work item raises the
notification. v4 will drop the work item and correct the comment.

> Can this self-deadlock on sk_lock.slock, which this CPU already holds
> through bh_lock_sock()?

Only with KCM attached under TLS, and that pairing does not work
today: tls_sw_read_sock() reaches sk_flush_backlog(), which takes
sk_lock.slock. The release-time announce already fires on the other
read_sock exits, so the break does not add a new path.

> [Severity: Low]
> schedule_work() queues this on system_wq, which lacks WQ_MEM_RECLAIM.

Moot once the work item is gone.

pw-bot: cr

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
