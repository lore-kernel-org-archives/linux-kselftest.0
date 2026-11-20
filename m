Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174047;
	b=oQ4lmiCnUU+POzaYzZYSdlEN6/EhemLlNFyz2QfxRFPkKQkQQI3/rNhkmv9nGJah1xLS
	 pcKIFKBVjz1qaqTIzaPxI4I8wnrtwnFuj1IXHsm7Kp2ldqn5W3HJ15+9d2VKDIUBr/DW+
	 QYItH7oomKpY7b80nSLa1jnTvS0xpND9eWZDseqEERe/rUBiS7BWCXlLFpp1ERY7QAzdc
	 0sJa7TVyT5qf6D2+nj4Hs8jbgGLkiYrQKbdwOuR8pSIJpvwbEOew+r84s61mAoComC1Rg
	 q5EiL54bnZDm4CRmrwY9Nog+KVatEaILumqTycADiYY/HEzCOsbOjFj1QFhkDJt/GnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174047;
	h=DMARC-Filter:X-KPN-MessageId:Received:Received:DKIM-Signature:
	 X-KPN-MID:X-CMASSUN:X-KPN-VerifiedSender:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Originating-IP;
	bh=SXK/SZxRntgRyvv+mxr4LUsXIJfJSPnef+5p0Sj7gNc=;
	b=xDHBdtg+Z5O3+eBG+k+H0X+vrPPKRM1tknZbQ6Fzo+w/FDLGwcEmRCM3DZD2ThI8V6iW
	 Z2ggYjuD3UwTZWe69hAz18eOs8wuYA1A2izHsWm2TUWHkvp8Wa+Y/bxT9OL8e41/m4P6y
	 5s8lL11onGCATx+VrJVd8TE4Rw0E6yNJN6px1ktF5TJ7vgSZKFrSVICNcbe5zwc4DyYK9
	 twe5r/W2nNPv0BnNwfHQu0Hi5zaS2nOhrLQZxmu4baewEzcPhoR7Cm6mrbqkekLoI4hWI
	 ub5eGHb6c8JRiZCP6qISqrCDg4l26u0ifEQGyU5GYDVDCJhmcRdxILqyz2z4blkHVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=OVC82ucR;
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A40606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A40606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=OVC82ucR
X-KPN-MessageId: 5ba30fd0-e4d5-11f1-964c-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.190])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5ba30fd0-e4d5-11f1-964c-005056999439;
	Fri, 20 Nov 2026 12:27:24 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.190])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 5ba19b57-e4d5-11f1-92a0-0050569977a2;
	Fri, 20 Nov 2026 12:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=SXK/SZxRntgRyvv+mxr4LUsXIJfJSPnef+5p0Sj7gNc=;
	b=OVC82ucR55v0Bw1JGf2Wp4pndBzc2/97tO2xIuG8FfT5uTgs3lHuolNb8wMo0hXGow1T0eMG96gHm
	 Ayi/TqXqe4yeEbUBpse1sJYkU6C58CCGrCZDYMNW0v+sFOE6AxOWWiDaA4GSYIjdKB81uI5GeA+ddX
	 +9seIo3tgKo3b18ilraNO0Tcb0gTmF4KZB5JNoMRV+SQO0kDGkqbXb0zHyTPx3Fp1fY9IXZDli+j2L
	 JRPWH9NSHevT4AKeznbqR+F3DcPv1fe4HFjO3LgqTCHyszPnsUYvQqavhj4zmk1sQ5HXq1jtRx/KOR
	 PJrJHz21e5GyHD9Tqr/nuWy9kC7T2hQ==
X-KPN-MID: 33|gxolvIubzIz4owOj8/OH1wLITMnTIAk72PI12p/KYa3hhZVuBVzG2/moSUpJtbw
 LDnX2zkpdtVLX9YgxDUhE4a7WcpBhNXmvWnt1AygC8i4=
X-CMASSUN: 33|yILptPHw52JfC+h5HlK3xLYKy/4pdGkvIqaO9i5zBuVYRoDSlP0K5f1+sU76d46
 mfxY/KLTukGyADy9mHYPOVA==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh07 (cpxoxapps-mh07.personalcloud.so.kpn.org [10.128.135.213])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 5b9669c7-e4d5-11f1-94ba-005056995d6c;
	Fri, 20 Nov 2026 12:27:24 +0100 (CET)
Date: Fri, 20 Nov 2026 12:27:24 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	=?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <936710069.2100225.1795174044091@kpc.webmail.kpnmail.nl>
In-Reply-To: <13c6ec9c-c4ea-4471-b5e8-77d1a786796b@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <13c6ec9c-c4ea-4471-b5e8-77d1a786796b@linuxfoundation.org>
Subject: Re: [PATCH 0/3] selftests: add option to print the time spent per
 test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 18-11-2026 11:15 EST schreef Shuah Khan <skhan@linuxfoundation.org>:
> 
>  
> On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> > For CI/CD purposes it is useful to know how much time each selftest
> > took to complete, for instance, to know which suites to run for a
> > quick-fail diagnostic, or what percentage of tests you can expect to
> > complete on a paricular --override-timeout value.
> > 
> > Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
> > prints a KTAP diagnostic line with the elapsed wall-clock time just
> > before the result line of each test that is actually run, e.g.:
> > 
> >        # selftests: timers: nanosleep
> >        # time: 12.34s
> >        ok 3 selftests: timers: nanosleep
> > 
> > The other two patches clean up the use of 'local' in runner.sh and fix a
> > bug when using --netns in run_kselftest.sh. Strictly these could be sent
> > as separate patches, but "selftests: add option to print the time spent
> > per test" builds on these, and it would otherwise require needless
> > rebasing for two small fixes.
> > 
> > Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> > ---
> > Jori Koolstra (CIQ) (3):
> >        selftests: use local variables consistently in runner.sh
> 
> Please spilt the convention related changes and real changes.
> 

Do you want me to send it separately or drop it altogether? It isn't really
important really, just a clean up. I have some more changes submitted a
couple days ago that I'd like review more than this.

> >        selftests: pass the timeout override to tests run in a netns
> >        selftests: add option to print the time spent per test
> 
> These two look good to me. I will pull them all as a series once you
> fix the problem with patch 1/3
> 

Just sent the v2. Thanks for the review.

> > 
> >   tools/testing/selftests/kselftest/runner.sh | 50 ++++++++++++++++++++++-------
> >   tools/testing/selftests/run_kselftest.sh    |  8 +++++
> >   2 files changed, 47 insertions(+), 11 deletions(-)
> > ---
> > base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> > change-id: 20261117-kselftest-run-timer-df3ac531652e
> > 
> > Best regards,
> 
> thanks,
> -- Shuah

Best,
Jori.
