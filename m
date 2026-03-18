Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4D73D6665
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837010; cv=pass; b=IgQl5QMVReAZBdtgFWM4PMeQo/Nq8HtuyaLSzQrax4+cCwkvKS0/fF+C1WRwFzl+tM5dGGHoFocs/6y4H1ez21fXMYUhrbGJsnyIwsfMtiFGSj6s9Cfx7TC202CTW7U4nHVp13OJpkaFN/7lObo6+aB4vKTS/qxGTVeeJY0ca6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837010; c=relaxed/simple;
	bh=ROhlfTL9Sy3cHk6CLZy5m3sOd3WTbANPLHJNqzwB4D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+PmS5cYsdjjKhj6iYBTF+dvIMUp/fMHLrtMzOPGTP1/9JmptBXG4yFu5RUCybv/3+CCQTuQYW9gETZQZAmIvCl47dnL1skGnrYmIYc46QKiXrCaZlRi5i5kkrQ66bM07LUZf9dfMUptIqbAna9Ou5+nIsN4JTCRKK2XWBg84xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=d5NeCFer; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="d5NeCFer"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b980785a0bfso54266866b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 05:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773837007; cv=none;
        d=google.com; s=arc-20240605;
        b=NQT1DpurGSMORLLaHvFsLcxXSlnFsrMmmCYItXdbfKORi3HN35/A4vmjeyjH61gxpf
         WbhH8YSrYUjLl8snJEeJ+7IaFZiPEdVdrB1jQxu7Sdg+0/FoVUp4FObFwGXjovXDqF/j
         +AXnFafdU0eKqFlFh9T+8hsroOftlFg1RGvWPXDoFrqt1YM4drm/bzCdwbeCf4WQ5nkE
         xaOUX0w7nFti9QjotsNzvuD/+5hihj9IP5RJTaHZg+BPc4lXS62X/feNKFRQf28XrM8w
         iUTqMOyXS5nAP5/YbHSzPBi1dDDCEGS0oZMQTwAtCP95+AC8WlrG7cB9jxCmGEaPCAtu
         umOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iejl5bKnTCPX1VljyvIsJAO5CIjOaHMy3MfRtqFfauA=;
        fh=NvuJeD8DLKoNrHNovWeRhy/hrXVVMpJoFeH/TkYleXM=;
        b=VFAmDiaVDKuboDG8A7u+PvK5DVr1OsgMDiBfj6cCFLMdE128+qBwkDcWk1xwcjd2Dw
         t6ZZC7HtfZl9qI160j12srLgvBmZoo+I9eJ0WvPwfxMkH9P47/IZK6eACkRQ5HPEkvYN
         /I6eRicaeux437Qr4uYWMqV6U5O01UHuyBiRG/OIxISKhRfpuHLFJtZaHLfRRo0hiYfY
         6AucR+ApNMxV14wb/zFknmZHyo58gYmiSwusKofWBvSP62TaApKgE4ltDGrsla2449ll
         TLialGSpNQ0MW9GGK2tqjovCRkPWRniA3eepxANHvYrDvfr2D5xlHUNKSYqERsmDDEUX
         mSTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1773837007; x=1774441807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iejl5bKnTCPX1VljyvIsJAO5CIjOaHMy3MfRtqFfauA=;
        b=d5NeCFerBFz0COs5LpJQExE+1eZABScTmh6tz5Rm+H/w/jhkKCEW0vLT9xEzpeb/Ya
         5RZWDbwgRtvmoQxOf2226jvaCQsxpnFfB/q4POmDnz+Kl5l+MqWYO1/w44v3C2xEsZ1N
         D1myokwr/q0cOZuYf5jQxRuY2fulJJnbr9xPHOb+RlW+S95QixbZVVm0Vi/ZvabFYSCB
         Ckn0cZnq/y7YATrsnl7ddKIoJgFhETMrvja7HhGj9V24qg3jq0EquXQu9307a7RdRIu5
         Bax30aN5+LWNMHuNqMyTl4TtQS7RBLontmF4KEq+7CwJ5gl5uf5e1PoXTufa1+1Bh4Ne
         +4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837007; x=1774441807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iejl5bKnTCPX1VljyvIsJAO5CIjOaHMy3MfRtqFfauA=;
        b=GYyFLhWJni7HTXycepxyZEQIdAJNym44Dyn/jVXsA7nXpsbOPETSP9yVrC0VZPLtCs
         2oDZvWdG6XwhUi6fIS7rF4WsLK2aZjMZLpk2KK7p+6d2zL420Vw9iCEtbcoJSCPDUUUt
         1Gok+JWFeiyGbfTYDJwoHwCj3WvgWJTqhMei8bDYdKvk/uYUftkIGF4CWgb7Av7Jv2eA
         bvMVMB/yUHj4j/US0tOhN0cigqaUDTa0mfdn1kxmvtKvwRMLnGIG+KqDzRgvYZJOF6w7
         12wKgYXpDHNog4+VAj6Zj6qgokVBjNGIcgUVZPfaV1wskJUxk6XcWibXYuywjZuymsrZ
         JGcw==
X-Forwarded-Encrypted: i=1; AJvYcCU9EB03CgC3ebhzOUE6VwPGAkugn8Lhrlo8lNIJl8ucGz4BbarpCxJL5r1pNLiwXX06pxOGoKTNR+h1OXQpyF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9byWrjLHD2JJ21wOhTEMd78R2tD8kBAGJMfICpW2P6MXtkY6v
	rldOA7nDR2K0MHNOzT6EN0kGdftGPsi3oYARl/md/fou/gSKY91iYx30jAj593dxHK2OVTDn6OS
	aSk/oB8jbgbMzIcRGBRZD6fCt3v3RjnwE7DSfWqtTHw==
X-Gm-Gg: ATEYQzwR7VNtZ2L/mDIT7qU8t3KKhS3zWeWZmOtj59gFr3xXLV2DxNNAr+jTrBCrHtF
	1sQaafrl0uBSy7S8OSzowamjRLiGKYwG+weRnRr0lDKu+UyMkmZ8LqW9MhSEtYRwSdX1O8NPJSc
	GjBRGeAgixLqD0Q6D3baiF8nxTN/dO8gAKaVvsyv3nguuZjzFV0vJBg94EYfYJNasFcnc+PhbQl
	xH57DJCjCdlk3x6bHY/nB/21cygiCbMUklmegog4JuRwzu33zOVqpzL14RKTAiECltbxSQz327z
	cScIoA==
X-Received: by 2002:a17:907:96a0:b0:b98:5b2:77f7 with SMTP id
 a640c23a62f3a-b9805b28b65mr102526066b.12.1773837006849; Wed, 18 Mar 2026
 05:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316162955.1253225-1-justin.iurman@6wind.com>
 <20260316162955.1253225-3-justin.iurman@6wind.com> <20260317115430.cfd3846b20c1e2314d468b5d@uniroma2.it>
In-Reply-To: <20260317115430.cfd3846b20c1e2314d468b5d@uniroma2.it>
From: Justin Iurman <justin.iurman@6wind.com>
Date: Wed, 18 Mar 2026 13:29:56 +0100
X-Gm-Features: AaiRm53ZHeg1yAGrjAZWpjoVzZYmQo73kAIA1paBZyGcK5uHYxU7ySYRwEAC8Sw
Message-ID: <CAOY2BqxrY6je_34375P2FEGp=-TatSb3oSktWXcc-xBeMRqYVA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] selftests: add check for seg6 tunsrc
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, justin.iurman@gmail.com, 
	nicolas.dichtel@6wind.com, stefano.salsano@uniroma2.it, 
	paolo.lungaroni@uniroma2.it, ahabdels@cisco.com, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:54=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma=
2.it> wrote:
>
> On Mon, 16 Mar 2026 17:29:55 +0100
> Justin Iurman <justin.iurman@6wind.com> wrote:
>
> > Extend srv6_hencap_red_l3vpn_test.sh to include checks for the new
> > "tunsrc" feature.
> >
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: linux-kselftest@vger.kernel.org
> > Signed-off-by: Justin Iurman <justin.iurman@6wind.com>
> > ---
> >  .../net/srv6_hencap_red_l3vpn_test.sh         | 65 ++++++++++++++-----
> >  1 file changed, 50 insertions(+), 15 deletions(-)

[snip]

> > -     # Direction hs-1 -> hs-2 (H.Encaps.Red)
> > +     # Direction hs-1 -> hs-2 (H.Encaps.Red + tunsrc)
> >       # - rt-2 (SRv6 End.DT46 behavior)
> >       #
> >       # Direction hs-2 -> hs-1 (H.Encaps.Red)
> >       #  - rt-4,rt-3 (SRv6 End behaviors)
> >       #  - rt-1 (SRv6 End.DT46 behavior)
> > -     setup_rt_policy_ipv4 2 1 "" 2 encap.red
> > -     setup_rt_policy_ipv4 1 2 "4 3" 1 encap.red
> > +     setup_rt_policy_ipv4 2 1 "" 2 encap.red true
> > +     setup_rt_policy_ipv4 1 2 "4 3" 1 encap.red false
> >
> >       # create an IPv6 VPN between hosts hs-3 and hs-4
> >       # the network path between hs-3 and hs-4 traverses several router=
s
> >       # depending on the direction of traffic.
> >       #
> > -     # Direction hs-3 -> hs-4 (H.Encaps.Red)
> > +     # Direction hs-3 -> hs-4 (H.Encaps.Red + tunsrc)
> >       # - rt-2 (SRv6 End Behavior)
> >       # - rt-4 (SRv6 End.DT46 behavior)
> >       #
> >       # Direction hs-4 -> hs-3 (H.Encaps.Red)
> >       #  - rt-1 (SRv6 End behavior)
> >       #  - rt-3 (SRv6 End.DT46 behavior)
> > -     setup_rt_policy_ipv6 4 3 "2" 4 encap.red
> > -     setup_rt_policy_ipv6 3 4 "1" 3 encap.red
> > +     setup_rt_policy_ipv6 4 3 "2" 4 encap.red true
> > +     setup_rt_policy_ipv6 3 4 "1" 3 encap.red false
> >
> >       # testing environment was set up successfully
> >       SETUP_ERR=3D0
>
>
> The paths marked "true" here were testing the encap.red baseline before
> this change. They need to stay exactly as they were originally.
> Furthermore, if tunsrc is not supported by the kernel running the test,
> the ip route command with tunsrc will fail during setup() (since
> set -e is used), and the entire script dies before any test runs.

I kinda disagree here: you're not supposed to run the updated
selftests on an old kernel or with an old iproute2 version (versions
are kept aligned). And I also concur with Jakub about degraded
environments on your last comment below.

> The idea here is to avoid duplicating the entire test suite, while still
> providing dedicated test cases for the new per-route tunsrc. A reasonable
> approach could be adding the tunsrc checks as new, separate test cases
> that run after the baseline ones, leaving the existing paths completely
> untouched.
>
> For example, a dedicated test_tunsrc() function could take care of the
> whole thing for a given path: setting up the tunsrc address, installing
> the route with tunsrc, verifying the behavior, cleaning up, and finally
> restoring the original route.

Well, I actually thought that this approach would be easier, and would
specifically avoid adding too much code or having duplication. FWIW, I
don't think providing dedicated test cases for the new per-route
tunsrc really makes sense, as it's the same behavior as without
"tunsrc". It doesn't impact the encap baseline by itself, since
nothing in the selftests depends on the outer source address. I'm open
to implement what you suggest, though, it's just that I'm not sure
it's the best way forward.

What I suggest as next step: I'll ship patch #1 alone, along with the
iproute2-next companion series, so that we don't miss the merge window
and have the feature in 7.1. In parallel, we keep discussing design
choices for the selftest and ship it as soon as we settle. Would you
agree with that plan?

Cheers,
Justin

> > [snip]
> > @@ -819,6 +853,7 @@ test_command_or_ksft_skip ip
> >  test_command_or_ksft_skip ping
> >  test_command_or_ksft_skip sysctl
> >  test_command_or_ksft_skip grep
> > +test_command_or_ksft_skip ip6tables
> >
>
> This will skip the entire script if ip6tables is not present, which
> takes down the baseline tests too.
> I think a probe at startup that checks for both tunsrc support and
> ip6tables would work well here. If either is missing, we can
> just gracefully skip the new tunsrc tests and let the rest of the script
> run as usual.
>
> The bottom line is that the script needs to keep working exactly as
> before when tunsrc is not supported or its dependencies are missing.
>
> Thanks,
> Andrea
