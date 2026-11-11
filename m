Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424315;
	b=eqd3emnDGqKAXNrvycHfAlMdI/bXouUCk2F/oPyC7XyumvT80rbs2YCXYiz7LNKnMzVe
	 04F4VE2J6EQSIyh/k046VOv9jLVQYBjAPENY4u5eP6dJ2+MLtb9fTgXPcgsKzMTfhO6uZ
	 nAYDV7in9M71ueVq7jBdyK/Tpk4b8dVGH49eb6QG2bb6Iio5yTonG0EkIlv9nnGotPIdK
	 Fj6CGX09oz4ADT1YD3bHZcbe/pZET5oAfBDEcLLLCxa24OTmAxh3jMxgecqykzKDXGONQ
	 kUgLK82WbmUtHVB0BRols5Z0nQNVsCfSwkNcyoEiio0qUY+X4mhxbaJnyhuxJjvO4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424315;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oML3TPP6HXNN6K3FeFEeidoeaOy0OFvDD/XNkYhR9I0=;
	b=bvpn+ZwCJ8wcWA845acUY6TYvnjWwETlwW4qfXKlZjyAWgiGksG/6huweR72Uls1cux6
	 V43um4fB9+JETftEJc9lKgx2BYPA4hE7JxBwI2+fqo4ApWdXezZUxNOv4+kEFNcSf7CzT
	 WvR07bmf8bFibLqkjCuO70IwIU/p3k8C9PRbE86MKYKCzZeDUeuS2MFdeM6Pg0CeaCHe4
	 ARjzPRpgcjZR3hMksloqYDwN1EcDJDDs+szIAu42XI000OfoIHkoI8MbLENE5jS7gZeyS
	 ZMXadWoujxk2sdyWtmLvSbwwLt5apdkRyXLGqNwdN/E5qgDOnoqSzYebVsmHF3e9q5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGS7z17L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29410606A885;
	Wed, 11 Nov 2026 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGS7z17L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016C41F00A06;
	Wed, 11 Nov 2026 19:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794424315;
	bh=oML3TPP6HXNN6K3FeFEeidoeaOy0OFvDD/XNkYhR9I0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jGS7z17La20chKgm2YvPyicKQ2TUFSU2qdlg998Pbv0HWU9L5lRnoF3yI6PRcNbVF
	 qyvvjPESXxtToY/14cCFZr2iPFIG+hHik3DUMy9Pa1n4HSBp4+JiZxSJz11qDSmrh+
	 owU56NxhbGTRbETWCW4XVhr/Pmwx1oYhuKEtF2rbWZE/JkT/Ck1fuXcqTQT64AE40+
	 qy2ZSndP58VH27qcrZlv3iZ33vha4JcA0phdEmgaUVK7vRFQKPpWD8pfuGSF6S95f7
	 XSUAndDMBkLCScUztdwuRMRkRZ7ZnlhzPdMpAoFgjdUfT7bczuoRKlNdczfB6dGH96
	 nuoaFy290sVOg==
Subject: Re: [PATCH net-next v10 3/4] net/sched: pie: correct tc_pie_xstats
 field documentation
From: netdev-bot+sashiko@kernel.org
To: hemendranaik@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, donald.hunter@gmail.com, ast@fiberby.net,
 toke@redhat.com, liuhangbin@kylinos.cn, j.koeppeler@tu-berlin.de,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
Date: Wed, 11 Nov 2026 19:11:53 +0000
Message-ID: <179442431354.2199510.17171987421866459673@kernel.org>
In-Reply-To: <20261109071017.438478-4-hemendranaik@gmail.com>
References: <20261109071017.438478-4-hemendranaik@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch fixes the unit comments for struct tc_pie_xstats in
  include/uapi/linux/pkt_sched.h: delay is now 'microseconds' and…

--

net/sched: pie: correct tc_pie_xstats field documentation

This patch updates the comments on struct tc_pie_xstats in the uapi header.
The delay field is now documented as microseconds and avg_dq_rate as
bytes/second, which matches what pie_dump_stats() exports. There is no
change to the UAPI layout or to runtime behaviour.

> diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
> index fef848eaaab23..445a041cd103f 100644
> --- a/include/uapi/linux/pkt_sched.h
> +++ b/include/uapi/linux/pkt_sched.h
> @@ -920,9 +920,9 @@ enum {
>  
>  struct tc_pie_xstats {
>  	__u64 prob;			/* current probability */
> -	__u32 delay;			/* current delay in ms */
> +	__u32 delay;			/* current delay in microseconds */
>  	__u32 avg_dq_rate;		/* current average dq_rate in
> -					 * bits/pie_time
> +					 * bytes/second
>  					 */

[Severity: Low]
Should the netlink YAML spec for this struct get the same correction?

The tc-pie-xstats definition in Documentation/netlink/specs/tc.yaml still
uses the old units:

        name: delay
        type: u32
        doc: Current delay in ms
      -
        name: avg-dq-rate
        type: u32
        doc: Current average dq rate in bits/pie-time

pie_dump_stats() in net/sched/sch_pie.c exports microseconds and
bytes/second:

	.delay = ((u32)PSCHED_TICKS2NS(READ_ONCE(q->vars.qdelay))) / NSEC_PER_USEC,
	...
	st.avg_dq_rate = READ_ONCE(q->vars.avg_dq_rate) *
			 (PSCHED_TICKS_PER_SEC) >> PIE_SCALE;

With this patch applied, the header and the YAML spec give different units
for the same uAPI struct.

The later commit "Documentation/netlink/specs: tc: describe fq_pie per-flow
class stats" edits tc.yaml. It documents the matching fq_pie fields as
microseconds and bytes/second, but leaves tc-pie-xstats as it is, so tc.yaml
contradicts itself at the end of the series.

The commit message says:

    Touch include/uapi/linux/pkt_sched.h only

Could tc.yaml be updated here as well, or in a follow-up patch?

>  	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
>  	__u32 packets_in;		/* total number of packets enqueued */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109071017.438478-1-hemendranaik%40gmail.com
