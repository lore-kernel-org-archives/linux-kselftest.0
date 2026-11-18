Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963092;
	b=jBI7qA76k6w9tXrl4yYPa/llPVMPkhPLtvpcK/qUVPTESKy7EC4Sxw2NCKdcsCTsQHep
	 7JA6Kd3mPvWjqwtz4792i5STGKxNetY5OFn9n5BUQe5DvNzt884IbzNFolADdJIoBRJXR
	 qbSbwO76ZCn2hfY1lQ0CUCd2QDl5b7xlVw25H2k/UdLZVjBxuqSsBf9uqS6AbikLo6Vnr
	 7cTaukyjTNZgpPnhjp2pBUU99V4ulmLvYiZNqpEbiyEwUWtc81iSgjWKsarhWH2XTsUPL
	 hrLPZfA2rjXnqDOOEVpDrYAp3XURsTJuLxm0enCB/kqSK0KCR7ifkXTIFDmcE6ooAAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963092;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+h9Sc4b2ra6u3kHXZEe7fr/dhg1Q14nueP4OB65HOrs=;
	b=gEG7G5EMqrPgDrniDEQ7qqG4yOUrZMW23qjHRPPalhtQpYF5paTQNoTxikYmf1Lv+k80
	 SBWRgxtHUdqum04jtunOUSMB5nr4R7yOLtyOZqw22MEU18xIRm/rHKDSnbj8usOeW88NV
	 tdNBnrHCcaqs8EjExWZfGVJYld09VIM8bnhvD8FAomVUtrbtpXBRHqu5J2ueUmvLsAkzi
	 DeJ1K9q2OnXyOb4d+3U0nOk+yAf1SH3Zd9JNmZRala7phX7ADnwtswMpBwJJvjFmWlXkC
	 M32guWAmExNv12C0QVlG20FW+3nTvB15xuURT+atThCubjbm7afZT8nKLn9qVY3qaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DRaub8EV;
	arc=none smtp.remote-ip=91.218.175.217
Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D78606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 00:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DRaub8EV
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=35j3KAfDSmKSKABohtx1cPJcLRuq+RzcWD81Hn4b4RQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794963089; v=1; x=1795567889;
 b=DRaub8EVxyz+fRnfzet//xzx3JvxSjKRGDwmj8Pub2pD0PIIyBaaS9lLF2KDctG53VsfsH5s
 p/7KieQMj1TNXTyCEIF/t+ShEmzSPXqmWNZjh+rH/8VUirds/MTpnGWdllg9gKQm1UdjjHdEMbv
 1ChiNauMGzApRwJuLtcMSVyk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1f790bf25116b760;
	Wed, 18 Nov 2026 00:51:29 +0000
X-Mizu-Trace-ID: 1f790bf25116b760
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 08:51:16 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <avz2hH9T_5OOuHbi@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avwUzLyWxZl9cBIX@fedora>

On Tue, Nov 17, 2026 at 04:48:12PM +0800, Hangbin Liu wrote:
> > > I didn't add `host_srv6_end_flv_consumed_srh_tests()` for End.X because
> > > the extra policy insertion does not work with the End.X policy. The packet
> > > resolves the destination via the next hop directly, rather than doing a
> > > re-lookup in table 90.
> > 
> > The ingress router can insert the extra SRH instead, on the first SID
> > of the Policy. As in the End tests, an End SID of the base setup can
> > then consume it. This way, we can add these tests for End.X too. What
> > do you think?
> 
> For the End.X Policy (i.a) testing, we have SID List=fcff:3::a,fcff:4::af1,fcff:2::af1,cafe::2.
> And we configured the next hop policy for the SID on each rt. e.g
> 
> On rt3: fcff:3::000a table 90 encap seg6local action End.X nh6 fcf0:0:3:4::4
> On rt4: fcff:4::0af1 table 90 encap seg6local action End.X nh6 fcf0:0:2:4::2 flavors psp
> on rt2: fcff:2::0af1 table 90 encap seg6local action End.X nh6 cafe::2 flavors psp
> 
> When the packet arrive on rt4, it's dst is set to fcff:2::af1. And the new
> insert policy (fcff:2::0af1 table 90 encap seg6 mode inline segs fcff:3::000e dev dum0)
> doesn't works as the End.X policy will goto next hop fcf0:0:2:4::2 directly
> instead of looking at fcff:2::af1 on table 90.
> 

hmm, Not sure if you mean to add a ip rule for the ingress route? e.g.
  # ip rule add from cafe::1 to fcff:4::af1 lookup 100
  # ip route add fcff:4::af1 table 100 encap seg6 mode inline segs fcff:3::000e, dev dum0

Then on rt3, we got
   IPv6 DA=fcff:3::e | extra SRH, SL=1 | Policy's SRH, SL=2 | Payload
after action End, rt3 send
   IPv6 DA=fcff:4::af1 | extra SRH, SL=0 | Policy's SRH, SL=2 | Payload

But here the fcff:4::af1 will hit the ip rule and do encap again, which will
be a loop.

Do I missed something?

Hangbin
