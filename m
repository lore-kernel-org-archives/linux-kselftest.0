Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D474DEC0D
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 17:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617662; cv=none; b=I6y13CaUloUU+gshy7+Z7uUe4xZTRJFmuC6Col1R5Ciui6UMY/w2683FK+7f1qrj8ObhiNAcP3f2n7r5SLh3b+SjBoHPv7D7q5A1bt1G3K+mAMeg1XSErMjSR75GZ+ZT63y4bI1Q2sS/usH5voVyM0AN8lpGyrTF2mZcDl/jq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617662; c=relaxed/simple;
	bh=BaRm/UTrB9F+8UcWf9LkbRVjqhIAg0WgbRRUXJSL7DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVvomlY/PDaX+kzI11XtD9XIoR5KARz/EoF2+P8V9qzxpQHeOISp9K9emNs6OgEZtXmkjS+qk/lGXJEHaYetdBvpwdSagZ0zpgdPTYU8HGJKxix+YJhfzpcEg0m1xCq5I3Y6/K9Cm5NEceKQmXzfvZZ+jwcatEs77aqU8Y0C8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=DWPAGkQd; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="DWPAGkQd"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6d8d3336db0so382058eaf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1790617659; x=1791222459; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEPu4UIvM8bDDQC/zKVhjC/qeUu0ZR+H5PU+1No1Ybc=;
        b=DWPAGkQd2dWx1WBkuEFeZJRllvSJVVccg2pugRuZ+IHEecKHyb09Xf7lck2i6IPpn/
         A0o5jsPO3a4SPTedMjmpxJWJZkaMAPk0ykEG/7RRqDqviZx8jleGroUt2W/5HRzkrqCj
         SPxOIUN5ZTIk8blmNsOLqCf/rEfPBRPEVghUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617659; x=1791222459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KEPu4UIvM8bDDQC/zKVhjC/qeUu0ZR+H5PU+1No1Ybc=;
        b=L1DL9DCrhsYyCHmpeIoF1EAKcZhMc+lqyZ2pD9/0ecrs5iU50DlIslPn8+H/GswFgD
         jjmr+zBFFSBWobgUXgIKo8jb/052rHiqqkugNAYNLRf1OZqK/4xnjKq51DQBgez5/gNC
         BIF6prg9TMLl+uE0Fq7gFSwGjhXBVPT0wYhaIy6s1qc7YcqiNnyDKJZ2MVs/b18cYcLE
         JxcKV1O5Mh+nnDzGoQcLYLxZSM5ZZEt8NU8+WuWK3AhUhVXu8arWrZcwrT6NR05GSAEk
         6y3bxXkr0rJf6QIAwt/cUktdrXHJ1Fs8CdkdsY8GEddYuJzAZAMH5RpgoAHP9m3KJ8jX
         HJ4w==
X-Forwarded-Encrypted: i=1; AKwUvByzxF1zL4YCg96hPs96ctArc8GGEdxQtH3cBkKbhCI1S+xKEcqAZXa4yXOTkdNjKgn3IhdoCO/QbdmyoNsmAqY=@vger.kernel.org
X-Gm-Message-State: AFuF++kme3mLJZeV8jKlUKXshcCQxmuNR8N4r7QyynGpidwvJS1S6bF+
	WgUPoilK8/rtDdCBCVQ4/H4LY+OrQjMDxSvXEvWLrfRv2oEqGb+epruLs4i6lAh61a0=
X-Gm-Gg: AYBFou0JXx57pPvnsrZ9atM766+Bg/zoA7gFpU3Cp9CJc0KTqT/6C/OJDKw7uiZqAY5
	AQPWIzCC08og5X1Im8hvGHuAoPQKpzJiy45psBG0MhiIpKvJru6XuTbLAq39ClOfVIvfua/g56R
	ffzICX6n6YL0CLj+l3n3H3bmd13/i8DlpNBez/K+YZZP8JclnuOhrLqMytpxfkKZZEfgQ1n6Dzc
	GpzXKIxFHZuZ9X7hvY/JcAAiWABGeVyXS391Xb8TjuwVr9AdpYQob/7l3CEcKcX0N5y14AxMBEh
	WG8zfZG7OgU7tKY3t/Ytd1MMW992WH9rmzm0asDYUgCnOikQXl65qO1Xc3qXW6LEfxWLQSJRcX0
	wmcChr36XyYCfo/mNnUTHkZI4dRuJGmxunZt8RDlRCjMAbWvLTmyE2M6Or/HC96pDp975TNd6XE
	dv9tOctuyy2YwH++32E51MHFm2OzDcqQXa2i6HD9KMk7wBf+maRN9zBdxfcnaxIUy8K9U7n9iDo
	wIqNpy84u4Iuyu60nUFljfpGFKNYi0Bzip/Da9Thp7bjfJP6Cq6Jts=
X-Received: by 2002:a05:6820:82a:b0:6d8:1b5b:3a70 with SMTP id 006d021491bc7-6d81b5b3d27mr4127419eaf.39.1790617658754;
        Mon, 28 Sep 2026 10:47:38 -0700 (PDT)
Received: from com-94485 ([199.47.143.14])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d88358bb8dsm5313812eaf.14.2026.09.28.10.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:47:38 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:47:35 -0700
From: Jeff Jo <jeffjo@openai.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: net: check timestamp echo after an
 old ACK
Message-ID: <arqoNxaxj50Ji5QS@com-94485>
References: <20260924224456.55690-6-jeffjo@openai.com>
 <179037643415.2160803.14897657788666510697@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179037643415.2160803.14897657788666510697@kernel.org>

On Fri, Sep 25, 2026 at 10:47:14PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 0 � Medium: 1 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new selftest
>   tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt checks for...
> 
> --
> 
> selftests: net: check timestamp echo after an old ACK
> 
> This adds a packetdrill regression test for a gap-filling segment that
> carries an old ACK. Two peer data segments arrive out of order. The test
> then requires the ACK that closes the gap to echo the delayed segment's
> timestamp (301000) and not the stale saved value (1000).
> 
> Link: https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7cfab5b6d872
> 
> > diff --git a/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> > new file mode 100644
> > index 0000000000000..f072e5e4c4494
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/packetdrill/tcp_old_ack_ts.pkt
> > @@ -0,0 +1,22 @@
> 
> [ ... ]
> 
> > +0.300 write(4, ..., 17) = 17
> > ++0 > P. 1:18(17) ack 1 <nop,nop,TS val 300 ecr 1000>
> > +0.310 < P. 18:35(17) ack 18 win 20000 <nop,nop,TS val 301001 ecr 300>
> > ++0 > . 18:18(0) ack 1 <nop,nop,TS val 310 ecr 1000,nop,nop,sack 18:35>
> > +0.320 < P. 1:18(17) ack 1 win 20000 <nop,nop,TS val 301000 ecr 100>
> > ++0 > . 18:18(0) ack 35 <nop,nop,TS val 320 ecr 301000>
>                                                   ^^^^^^^^^^^
> 
> [Severity: Medium]
> Can this test report PASS on a kernel that doesn't have the fix?
> 
> The commit message says packetdrill versions older than 83f72d3f9085 do
> not check the outgoing TSecr:
> 
>   older tools incorrectly pass on an unfixed kernel
> 
> This ecr 301000 check is the only line in the script that depends on the
> fix. The seq, ack and SACK checks give the same result with or without
> it, and so does the read() of 34 bytes below.
> 
> The runner only checks that some packetdrill is in PATH. It then reports
> PASS whenever packetdrill exits 0:
> 
> tools/testing/selftests/net/packetdrill/ksft_runner.sh:
>     if [ -z "$(which packetdrill)" ]; then
>     	ktap_skip_all "packetdrill not found in PATH"
>     	exit "$KSFT_SKIP"
>     fi
>     ...
>     	unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \
>     		&& ktap_test_pass $ip_version || $failfunc $ip_version
> 
> On a kernel without the fix, tcp_ack() sends the gap filler down the
> old_ack path, since ack 1 is before snd_una 18. That kernel does not have
> this update:
> 
> net/ipv4/tcp_input.c:tcp_ack() {
>     ...
> old_ack:
> 	...
> 	if (flag & FLAG_UPDATE_TS_RECENT)
> 		tcp_replace_ts_recent(tp, TCP_SKB_CB(skb)->seq);
>     ...
> }
> 
> As a result, ts_recent stays at 1000. With an older packetdrill, such as
> a distro package, wouldn't ipv4, ipv6 and ipv4-mapped-ipv6 all still pass?
> 
> Could the script add a check that doesn't rely on packetdrill's TSecr
> handling? For example, after the gap-closing ACK, inject:
> 
>   < P. 35:36(1) ack 18 win 20000 <nop,nop,TS val 2000 ecr 320>
> 
> With the fix, ts_recent is 301000, so the PAWS check in
> tcp_validate_incoming() drops the segment. The segment carries data, so
> tcp_oow_rate_limited() does not suppress the dup-ACK, and the reply is
> ack 35.
> 
> Without the fix, ts_recent is 1000. The segment is accepted and the reply
> is ack 36. That difference would show up whichever packetdrill version is
> used.
> 
> > ++0 read(4, ..., 34) = 34
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924224456.55690-4-jeffjo%40openai.com


Yes, affected older packetdrill versions can
falsely pass this test, as noted in the commit message.

We previously tested a PAWS-based assertion, but Eric requested a
direct timestamp-echo check once packetdrill was fixed and the
runners updated [1]. Neal has since merged the packetdrill fix [2]
and requested the revised test.

With updated packetdrill, we verified that this test fails on the
unfixed kernel and passes with the kernel fix. V2 follows that
approach and documents the required packetdrill commit.

[1] https://lore.kernel.org/netdev/CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com/
[2] https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7cfab5b6d872
