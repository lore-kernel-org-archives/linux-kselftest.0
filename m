Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AF449B21
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774082; cv=none; b=AI9axhZgmwAnAYOL3J/ehSqBZglCOYD8G38wAsD5ulEWu4MJp3KZBuLWDdu9Ul7bgU2OhB/THUBQmFt+IfvmOQoP5ymrGQcC5QPJM7oYlhw3ui26AWqWa2To3s7nIy3V6wOuexlaOGOpcLFRbLfNmet/NKC5MmNrB4Yi+J+5A2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774082; c=relaxed/simple;
	bh=rQqHePLWdGfRjZ1vNvNSUN+STKeoOIcZI5Q6jZ5P4zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTVC+MV0nQFzXvTW86Ym3rmNszHUggELqMKiuj/Tt3RSfAg+s7u2m+zeWpCLk2vxQrbNrG4BCyx/oQHGOG3Hf8Iyrm1Fid3EYaI81hZn0r2fGYSk8EX1s3oEN8Gm4fiGwMIBPEd1VNFySCsDL02xhlswbMFyUJz7cfsamSwgfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=MDgVWSfD; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="MDgVWSfD"
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5141D3F28D
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788774078;
	bh=RYZ4OmdAPOoMtab4t2tgvajC94K/KaFxqp3U+WedQ18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=MDgVWSfDQdLtxJtGQvw/ueg8uUjL5zknX480KXQbpAgI7ijDfjIYnbYav0BsLqz+a
	 KmiorajJokFcweLpeqYg+2WKi/qreQyBBIWQRXPRn9L2naCEpq4eGW5qswXPC1SMh3
	 BIMA1vczpwVM58jHlzmuZXUcqStAjnO84BUvqiRhAol/TISeABh4TrS2wLn3xb5WRT
	 POrXAMSR/NljaN+wGMkiKfqPD44zo1JOHM0qorX9XRqo/b0RAKXR6sQrNk1BlXSzJd
	 6IZIWrqq1PhUKn2lFbjEkeB2K2JdPBcC6KfOg0mNWGk+w5QXqJ0dtXc80tYv6a5U7J
	 Xm3c0UwXQIAWdKIpRo8QyL25nsPQtjm7wmNi6JAmgyADxHEDSh8bs5WjWYWW+e4fts
	 GUEAuDEol7iruTX5cNe7FBjpJI8rjscdiD6UlkoTIg1J27SnuFCTyvjB3WNSQjpYQE
	 Tv0z8tiAwc1TqIAnixy8d+8xpHCTT9WJCdFLy6daDb4jy1l4F5+lUzd8Kb78PlTm2Q
	 7/v9iMmLIPSdgyjFo0wdck1nkf022XUBHq0W+nhTKZrGJPm0sR9R6nu1g9z9+mGEVR
	 dbffP6aVQdrHvJpAD0W34vWLd41+2SNJO8WCqRavSZBxD1gl/OZobiHQFnLBXWnelQ
	 UKsSTFP6GxZPvP4Q6Y5VYaUA=
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-472c330e555so1573659f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 02:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774078; x=1789378878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYZ4OmdAPOoMtab4t2tgvajC94K/KaFxqp3U+WedQ18=;
        b=bACeGO99qiYVbMO3o27GwfUc67PlbXKNJHX6XkClZpeSUagX1+EFt+jVQDUtOQbsON
         AR+7KQ5VKGPEn6q27E/JdLIhNSKU98vku99b/Ie84UBiAoVshmZWFfz1MpNYXtRTHyn2
         EHfvWb+FU+7M9cySPqYLR2DfWK6hmHYNPLAtGlBVpcjxWaIXUzUSehOjAtcR8EtX5oO1
         T0wLwpZFFWaAaa/lTzSS9puQc3eBtbBEB5qOYVDUH+J3zowxg9ufrffwvOcXukz+M9Sr
         nwbzdoAUiw77I0uS2ZXAfZH6JXRRZW6pJkUKGxq85jcAyo+BWA4zEEf0hs6PXwEXqQqX
         o8fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhZ9ediDR6sJSXMEIVxO8VE4BKmXoM/xygPOYOfSgvtmQP3kHP2FW7awbxMsHSt0N/dNFkdrBcHs0H8dMDbTU=@vger.kernel.org
X-Gm-Message-State: AFuF++nyirmlxOiBKirbbdzKPENGo3okahTo9e2nHLUxoaJsXqKJ8A7g
	nbCOoQPNT1a/7tIadnuF9X9tQSlFQX90mj91zdariD963g+ji+CVQhIsbr/JllfZd6+9+jbfUwu
	VBFstGHNchQpzLMz8tgEyN0xyULdKXa4FCUz0ZXBMYoQHNB/0We2oAnKh4ppipbjgcPpJ9L75cP
	RmerjUWq6FtQ==
X-Gm-Gg: AYBFou1Rh5X6MaCS1UlKreeSvRvFEgNKU2fmm+fyM4pFG/9Zktbav/I1EpkKUWL65Xf
	uyIF4Os74uhi3crkZYst/cLIHwaBEGbwzjm4l0OoiRWzi30R0rkXpoXTI6bNViMae7EFS1nEwUi
	nvMAEuaOi8Kp8PvQKnbhUvr5rTLxUUxDms/WB/kIHYoww/1GX1/ivkCfmzLsSjAjL+GEeMkI2Vb
	oDxcTr1UjfQlWq2JuTW8Mf8WoY42He0fy/Qub86HxZ3FkLv07sY/LPQ7JzDYsBGL6EndKDvRNEg
	4PltdXQy2KN3vNonKvpn7UFPPyCxXl0CfgSvYvZxK7Mx1/zadu601lqFs+Rt1OCaNttYP537eu2
	TwbtV6lSp3ugev1lEiFWnrfDHZ8eQ/JN7utTng3P8ZCztBXDx8zJH3+kqHIy23JloOWHaKQ==
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-48587087196mr24451154f8f.4.1788774077832;
        Mon, 07 Sep 2026 02:41:17 -0700 (PDT)
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-48587087196mr24451111f8f.4.1788774077434;
        Mon, 07 Sep 2026 02:41:17 -0700 (PDT)
Received: from localhost (93-40-94-241.ip38.fastwebnet.it. [93.40.94.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm26869519f8f.27.2026.09.07.02.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:41:16 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:41:15 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	horms@kernel.org, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, stefano.salsano@uniroma2.it,
	hangbin.liu@linux.dev
Subject: Re: [PATCH] [net-next, v2] selftest/net: skip
 srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Message-ID: <ap6Gu0oRGKXcs4vg@cicciput>
References: <20260903103545.1325276-1-alessio.faina@canonical.com>
 <20260904202546.a888aad9efbbf113aa1db900@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904202546.a888aad9efbbf113aa1db900@uniroma2.it>

On Fri, Sep 04, 2026 at 08:25:46PM +0200, Andrea Mayer wrote:
> On Thu,  3 Sep 2026 12:35:45 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> Hi Alessio,
> 
> Thanks for the v2. The check looks good to me. The comments below are
> all on the commit message and on the subject.
> 
> > In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
> > the vrftable support is not available and the tests
> > contained in the following 4 test files
> >  - srv6_end_dt4_l3vpn_test.sh
> >  - srv6_end_dt6_l3vpn_test.sh
> > are failing in some kernel backports.
> 
> Two files now, not four.
> 
> > This is the result of one those tests in an unsupported environment:
> > 
> > \################################################################################
> > \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> > \################################################################################
> > \
> > \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> > \
> > \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> > \
> > 
> > To amend this, check the current running iproute2 supports the vrftable
> > feature and, if not, just skip the entire test to avoid a failure.
> 
> IMO the sentence could say what the check does: it installs a route
> with the vrftable feature, and skips the test rather than failing when
> the feature is not supported.
> 
> > v2: - remove dx[4/6] tests
> >     - test if vrftable is available in the installed iproute2 application
> > v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
> >     - initial approach by testing DT[4/6] and DX[4/6]
> >     - test if DT4/DT6 are available in iproute2
> > 
> > Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> > ---
> > 
> > [snip]
> 
> The changelog goes under the ---. checkpatch reports it too.
> 
> Since the commit message needs to be revised anyway, a few nits:
> 
> i)   The subject came as [PATCH] [net-next, v2] instead of
>      [PATCH net-next v2]. And maybe you meant selftests/net: ?
> ii)  "one those tests" -> "one of those tests" ?
> iii) The backslashes in the pasted log could go, git does not remove
>      them and they stay in the commit message.
> 
> Ciao,
> Andrea

Hi Andrea,
Thanks a lot for the review, I will address your comments and update the patch
accordingly. A v3 will be on its way soon.

i) Yeah, definitely my fault when I exported with format-patch I didn't
merge the [PATCH] and [net-next v2] parts. I will fix that.
ii) Yes, thanks.
iii) Is interesting, checkpatch.pl is complaining about having a
list of ##### in the commit message, but adding a space in front makes
it happy. I will use that approach.

I will add the missing cc_maintainer as well as mentioned in the list of
checks.

Kind regards,

    -Alessio Faina
