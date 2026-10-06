Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127D49C4A0;
	Tue,  6 Oct 2026 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301633; cv=none; b=tdPTGpOUcXOHUnNm4SwwB5i8ZLZKl+DSPdmn2kDLLXzkefvFcofOTAT43M2+G1mhkuisXk57v4HluElCeGkJ9+gO2LafiiXWFliqtDTHPbqgl3l4Lxzc31KKAp5h65h9G1qbASTpxOFw+dx5NOk/xP+cvmWE3qjqazCvqDDd8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301633; c=relaxed/simple;
	bh=l6WWqPYZcRy0YCCjJU+/3OHilP0v2ihBWThW5qADCwY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bAKYQ0WorK3mcemrq4Liyz265LwwDwNI1p/HH7K5DqUIgDkzghMGFOvlw3rmKzEbXOvacOvp2ObGmHE4LJdJ9xuLHATHbS6Szr9h9SeWXvLmtkUXv7k4T33tLU3G9s2sq2iAmeb20NZ3HjxzfCmPrSrv9IkmXQ8qlMF9P4asE74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1gW4Lh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1gW4Lh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585091F0089D;
	Tue,  6 Oct 2026 15:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301620;
	bh=6t1aqA5iCpmcVkAYBwV+TVtz/OH8X51/GFaWzaVdhwM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=h1gW4Lh2Y1uDlIRTF8EdO+5gxifSQcD+P6oKs3O42sZWoRAiM1GeZuggc3oh8W3PH
	 epgEe1khrXDxDtcpNvi3sxXvZUdQcxqSclxwCHw7lOsonXGJKIOZxDeznScT9mNGp8
	 mwCixQPfT/KbH5BWwuVHVxgc9UDj9dzSDPtIQzKh4zxu80JxQkc3VX0+dml4YNjzpO
	 fUjKAARm51TKj3WxqjWRaoRmaNZnky4c1reqkd/UCfzYQlxhnrtGqVDFE8VqN2sGXJ
	 UGMN7NdVrLRc0yGMRQGVPbPNCJB76K1jcwp0V/9uclqaOuiSsR8D5bx896oBBPM0pX
	 xwGDfuGDHZAqg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 982BDF40068;
	Tue,  6 Oct 2026 11:46:59 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-02.internal (MEProxy); Tue, 06 Oct 2026 11:46:59 -0400
X-ME-Sender: <xms:8xfFamCweX3N7HbcQial92XqDS4sKOflh7ouuL2cA6pLqd9fibwbbg>
    <xme:8xfFap-OB0dxgoxYbbjDvlQgCAzsiyjxQRJpVZFlUroIEmCAC82V3PkZ9jAH9pT3x
    I7A1d_DC7f84blZ-s05oq1WadLPgq3d4gRqpHlwjCzWboMvbr5jpbCN>
X-ME-Proxy-Cause: dmFkZTEETS+GD4maES+3ru+sYQ3899595/uPTf6cj/2mYXB8gx4Uukgx9LnTRm2rITM88V
    c2MTpgOX4mM/V1HPUSuZx8Vu61Zqx1WzwhiO1WzcD5deNHLzLmuvuVoPFSIX+6zAasJAGj
    psvgsn8iKNmHJsVsQMqKkWILmVpDsgYaHjqoUTHk95O8lLFkSrIAs2u/+8U5UWw5ISlJEU
    fzKpFaI5GdQsvdI95JjUVozRtE+QgEDT+Ep7hpfqq7/yHT9tFCM0f/C93sr83pcYCcZCR+
    vDJjdoMTWBaI8pELhMlfD7V2fHiYiL540DOKLnrRucGlUiwWFEYySUPBKqk4RbTSNTFOdt
    o4HR5xyygyHJaW5HfFg0PZuzMYHFd5R0kodIfjLR0AcOPtuqbaTdE0huDqQ1IWc7of5twI
    KHYyKvVjzqE4TXaY9UgG4oD4LUlzq0AK+XcMKGNw3CqrFFEm0xJ0BemWl8bExAa1LazdJF
    op1qtR8WGHb2Q/kJ2noJXy5ksVPR9fFjEsd2HgM6foRPpWBXmP95a47HZnzrYqaCRoAu54
    b6e9AU+k4/bQkAhn3ftQ4a1e/IvHBs2EVOYllAFeqFQ2kcUmwOlE5sU5kLpdkkZ9/cgJoA
    MO75VPJMpaMYvCqMeJaYwt0CuYAGqW1jvdmDpqjr4T9qbhv3O+I4CvPfd8OQ
X-ME-Proxy: <xmx:8xfFajfvjSakG68lA9ZbdYHMHu9jLfRPdbPB9C8Kt2uCdgqj3v3yLQ>
    <xmx:8xfFaqvg7-r_EG5PaWKfKWa9eRSCwQ4W_8MXHndg6Jtvh-UcLkc0Dw>
    <xmx:8xfFaqIjRhaQyIzYa0xenni2Fnnv224IwV2kKioWPvoBXWK8_FdWuA>
    <xmx:8xfFasZq-OGzUcG05bwDOA9TGTyFbXL7gxNyVJxBFgjPWTsbPuLZGw>
    <xmx:8xfFagL2YyZyleH1BE2n1GdDI0ixw7hIXEsz4Aeoi-erSbLXIl0Tx06Y>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8DDCA780075; Tue,  6 Oct 2026 11:46:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AW1NZu9QNFeV
Date: Tue, 06 Oct 2026 11:46:38 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <5f9ebdf2-b099-4d31-8890-40b7b47ca925@slotpi15m67>
In-Reply-To: <179124254543.434549.15179245104274598626@kernel.org>
References: <20261001-tls-follow-on-v2-4-2dd1947bb642@kernel.org>
 <179124254543.434549.15179245104274598626@kernel.org>
Subject: Re: [PATCH net-next v2 4/8] tls: honor O_NONBLOCK in tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 05, 2026, netdev-bot+sashiko@kernel.org wrote:
> > Fixes: c46234ebb4d1 ("tls: RX path for ktls")
>
> [Severity: Medium]
> Is c46234ebb4d1 the right commit to blame for this stall? It looks like
> the previous patch in this series added the poll-then-splice sleep:
> "tls: consume empty data records in tls_sw_splice_read()".

The tag is right for what the patch changes. tls_sw_splice_read()
has ignored the socket's O_NONBLOCK since c46234ebb4d1, and a
splice on a nonblocking socket with no record queued sleeps without
any help from 3/8.

The second paragraph of the patch description is wrong for a tree
without 3/8, though. There, a caller that polls and then splices an
empty record gets the false EOF, not a sleep. The stall that
paragraph describes needs the retry 3/8 adds.


> Could this patch go before "tls: consume empty data records in
> tls_sw_splice_read()" in the series?

Yes. v3 will move this patch first and reword that paragraph.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
