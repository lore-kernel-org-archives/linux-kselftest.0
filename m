Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC3E434E39;
	Sun, 18 Oct 2026 19:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351378; cv=none; b=EbFjCQMrI3bViJ6R7Avl4Ad53RhpeQVB1CM6mIwed1KVK3etnmYoqWboZl5DUbFb2tZvlpkCbJ3blHx3I0+0ySbs8u8rdimyhBAaNSxdnkHyWepwUFX4550/P4Hu30Rh1gBcspT842k/BigKLgJWOKm/EnNs2fvxHZHz2zj3DYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351378; c=relaxed/simple;
	bh=k+1nb0XCKohijbFwXEbXZnxrLULLAybnJjmfFQUZg2g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xmh+cTBtyJGeS1CfxqfV0iTYX46IAezgmqRqSuZUIWTcA2wWbh/rtYla8PKaPYsuSYpTsJnd1OmSq+5VtMvhhlpxYQvdxMAesl91DSG9ZgsoecFi5mxXk1p3OOQfUI0+NRCcd1jGjUExFKcipAvmjRzbunSd2BB59+JtspZvmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTrIOAbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTrIOAbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C89D1F000C4;
	Sun, 18 Oct 2026 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792351377;
	bh=NB3wHF4pl9WA8mNrjpoD9KqtT16UlSNBmKTzTUozhL8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LTrIOAbSBOdT4AjLkFemJQk2oBfnNnynI8jx92ncc3BL4x3qyP+900iMI4K8M1Af1
	 llsRb3XkHnGq6INoq6osWwebwJhDuIrlkd2yoVaFB+OsNdmeF+wuVvYLQB3eyNDoC4
	 E/VPV/djPL8nu6xsC5ZoxaS89LL4+srWdihw2E6vlAY3AXYfSTlSyumtDBvQPNAZqB
	 lv/C+l+5USD0NV2JEAIu9r9sv3fLysu+OvgAIIRivqJnbdcA1U99WLaPy/8qm8w8n0
	 9P/EJJS9lES8cZifE/GQKebD9Nh1wsxT1kr/EY3xssaRfYwIJWCsh64eBsKCsqX4i+
	 8OHJGLCVeY00A==
Subject:
 Re: [PATCH net-next v5 03/10] tls: Honor O_NONBLOCK in tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 18 Oct 2026 19:22:56 +0000
Message-ID: <179235137663.3135.14281539217109085008@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-3-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-3-e76c301d4f05@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern: the commit message for "tls: Honor O_NONBLOCK in
  tls_sw_splice_read()" justifies the patch partly with an event-loop…

--

tls: Honor O_NONBLOCK in tls_sw_splice_read()

This commit makes tls_sw_splice_read() treat the socket's O_NONBLOCK flag
as nonblocking, in addition to SPLICE_F_NONBLOCK. Splice and sendfile from
a nonblocking TLS socket then return -EAGAIN instead of sleeping in
tls_rx_rec_wait(), as they already do on a plain TCP socket.

> Polling first does not avoid the sleep once tls_sw_splice_read()
> consumes zero-length records. tls_sw_sock_is_readable() reports
> the socket readable while any record sits on rx_list, including a
> zero-length record that delivers no bytes to the pipe. The
> strparser announces a record before decryption, when the record's
> plaintext length is unknown, so the readiness test cannot screen
> such a record out. A splice that consumes the record and waits for
> the next stalls every connection an event loop multiplexes.

[Severity: Low]
This isn't a bug, but could the commit message say that this paragraph
describes behavior added later in the series?

At this commit, tls_sw_splice_read() has no retry loop. An empty record is
spliced as 0 bytes and consumed, and the function returns 0 without waiting
again:

net/tls/tls_sw.c:tls_sw_splice_read() {
    ...
	chunk = min_t(unsigned int, rxm->full_len, len);
	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
    ...
}

The "consumes the record and waits for the next" path is added by the next
patch, "tls: Consume empty data records in tls_sw_splice_read()".

> An LLM audit of the TLS read paths found this defect. With empty
> records consumed, the zero_len_splice selftest, run on a
> nonblocking socket, reproduces the sleep.

The zero_len_splice selftest also doesn't exist in
tools/testing/selftests/net/tls.c at this commit. The only zero_len test
here uses recv. zero_len_splice is added later by "selftests: tls: Extend
coverage for zero-length records".

Both claims are worded conditionally ("once ... consumes zero-length
records", "With empty records consumed"). Putting this patch first in the
series also looks deliberate. The O_NONBLOCK problem in the first paragraph
exists on its own since c46234ebb4d1, so the Fixes: tag looks right.

Since this patch carries a Fixes: tag and may be backported alone, would it
help to say that the stall scenario and the zero_len_splice reference
depend on later patches in the series?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-tls-follow-on-v5-0-e76c301d4f05%40kernel.org
