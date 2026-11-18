Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970675;
	b=tkA6JSPLAOlLNpP+xohkadZkTIJZ/9Lu1HSf/+ljfsUVbwAnk5iap1NUubioXdMo1nve
	 XN5w1oZ7lUhMkgMcBce9xMzn75xqQuK2q3q3r/Re2iEfFh1iR0PXYWK3i1CubfJiR5k9N
	 bevbTCWZHD7Yo2VB3RtS1laqDLteLXXdE0PgRAqHBIQ4xMJYxoay3hRjNjkbTlkPgdXvm
	 hGdP++uAN13JGx63b4HPyMVrdW4uhAR/AnBnTmGsNj0r0rxPaE+1F4BNpBHZUvm/aoDix
	 9o7hzNXL1jMQKw+S/svjhucT82lo3g39FGcaS7gvGNQ0qtU6ctvPwdSm4OeQN+uvDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970675;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=Zz6iuXsbflDbublwbwpSIrgu8Ro3WRY197OMR4QSr5E=;
	b=o7m0uNt+j6ahaKJglRnGTd+gz3WvTBQ64MLN+FdFj3uNdKsDL1bZvTs/HHtw6PQMFNjK
	 LaU5ei3yi+jXKPCadybpZKOFdmc2VgQd51Gewq4fz9ja8XNGmh4PazqJfYPWHvB3i35un
	 JgToCFdnMcEpTDzM7SnV3mIeCi48MIhJS4RhK4ykZBmsmRkdOUOuiDaa6zfjJ7Or/soMa
	 KGh/KJpdiu412Xh8r6SrVwlGLiLt3KqDhqkJ02u+/Av/499t1B01zp7UXaXD8dEajilOm
	 FcYpw9cjYAPDiJ6lPIGkWUNojg3fcMQo6Q6ns9kWLKfb8lfAtXnPT2gliY8W5nR5Z3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b="DU/j1e/T";
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=Rs5PeYNQ;
	arc=none smtp.remote-ip=160.80.4.37
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DBA606A893;
	Wed, 18 Nov 2026 02:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82DBA606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=DU/j1e/T;
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=Rs5PeYNQ
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AI2vSBd025499;
	Wed, 18 Nov 2026 03:57:33 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 4DFD1120065;
	Wed, 18 Nov 2026 03:57:24 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794970644; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zz6iuXsbflDbublwbwpSIrgu8Ro3WRY197OMR4QSr5E=;
	b=DU/j1e/TbMc4MfWw+Xr0nGR/LermEnITlT8WH5wmBd1gPpZVE/Riv1uaQY9yxSTzdSIn39
	YGqMZdojRkElK3AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794970644; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zz6iuXsbflDbublwbwpSIrgu8Ro3WRY197OMR4QSr5E=;
	b=Rs5PeYNQIwESWRRoXOvzYF41yyfNtqNTPH8cTSkBdSfIUzi/smdoe3cgCo127EUYJKDa5x
	4U5MZPq8KhIr8dMV+pyvUFszV+fiMYBGt5Jrgumx7ViFhxu32xaEkEeZ4dhcgfoGiFpgGX
	xu2ZaAvlkw0AR8CfOGNtrzFglgDwDMLIQCPgN80XFIwFoZ0yGarPw539E1WsDKPlt1TDIJ
	qEJHYNGFhkUtrZKoShd60dy+BzCNoMbyg7wUfvJXUmd9yLg8t9nItVjl51marEDVvFeLCE
	eGegZMAK/AQjbuA0gXXeImwcCRQRZWPmwZXtsYcreqBfC6HkLHg6NUykL3r/Jg==
Date: Wed, 18 Nov 2026 03:57:23 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Justin Iurman
 <justin.iurman@gmail.com>,
        Andrea Mayer <andrea@common-net.org>,
        Andrea
 Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-Id: <20261118035723.e842bf3a2f0921779ab1c087@uniroma2.it>
In-Reply-To: <avz2hH9T_5OOuHbi@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
 <avz2hH9T_5OOuHbi@fedora>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Wed, 18 Nov 2026 08:51:16 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> [snip]
> hmm, Not sure if you mean to add a ip rule for the ingress route? e.g.
>   # ip rule add from cafe::1 to fcff:4::af1 lookup 100
>   # ip route add fcff:4::af1 table 100 encap seg6 mode inline segs fcff:3::000e, dev dum0
>
> Then on rt3, we got
>    IPv6 DA=fcff:3::e | extra SRH, SL=1 | Policy's SRH, SL=2 | Payload
> after action End, rt3 send
>    IPv6 DA=fcff:4::af1 | extra SRH, SL=0 | Policy's SRH, SL=2 | Payload
>
> But here the fcff:4::af1 will hit the ip rule and do encap again, which will
> be a loop.
>
> Do I missed something?

Hi Hangbin,

No new ip rule is needed. The rules that send the SIDs to table 90 are
already there, and the route goes in table 90 of the ingress router only,
for the first SID of the Policy (rt-1 and fcff:3::400a for (i.a), as in my
reply to your previous mail). After the End SID of another router (rt-4 in
(i.a)) consumes the extra SRH, the packet goes on to the router of the
first SID and does not come back to the ingress router, so there should not
be a loop in this way.

Ciao,
Andrea
