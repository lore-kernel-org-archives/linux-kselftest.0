Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0530F938
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959698; cv=none; b=GGhEoqZCmaXT+3UD59+d1CetM84EneT7YAj0ofeP363ujAAcUOl11nnqaWXfqCtEoOi8kWXaZmNay4x/M2H0Wg+N8yu+evYBcW1iRp94KXhYjFLqOeKDj+s2+3z51r1wTIfjrJ6X7IgftOeFfb4oX2uksNASGwgckBFoOy2Fq0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959698; c=relaxed/simple;
	bh=qzNaz3Q5oVarjJ/0tCQUpR47z40hmKMjNfdlTnOMDds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+j7iJXayGrRdA5g38hjxP/OxDdwbOzEpvj8L5NoN/Uqq5BDkifvC9kcBc0FBxilTrVEh2P1R+2tXX6vTRtf4ZDrHADhP9ZeM6JorWkSPZXDuxD1E7QjRHY8mAk7kuQx0lRKXwdyA3rBwrH85ojC0/pE0rrJnC8IGCUAivPe//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkmHKLyC; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkmHKLyC"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649278a69c5so3102005d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 17:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768959690; x=1769564490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0gPyzl3flI+QLK9YSJSXFLXlGP49FWWM2rxD4Oz2s0=;
        b=ZkmHKLyC/WLqo6o/mGPeAQqCceLIevx6JbsDPL5iR9Ed10MLwr3pvwPGVAui0R0wqd
         O3foAJzBFxpO0MN74JR41sccEVcjFTahUh+Yi8VSpCtobcpgAta+pBdObhmo88mg6ZAW
         MAwODSU6ljoF8wMNK0mr9BS8rf0fZlMxHrC1JREKWbNBWQ43PhcMGlYgX4F63KWqIAi7
         aBbNHtWGtbeHVfPh8culwtbFiCM8DDxjRaunDgC5hzSS1EqB2DjSDDRwlI/+kix8+9z5
         3ppUVOd8KMzNrrFx5P4Iy5Ad0eq8gu/jUXFz6gYM4h8EThbAlut6s1reNMe3t+d9CiVt
         WQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959690; x=1769564490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0gPyzl3flI+QLK9YSJSXFLXlGP49FWWM2rxD4Oz2s0=;
        b=nvuqJf7jZTP7DDjgsUDETpoEmajoXCG7lkArM1g+nAIn+AMhCfyrS7HqtidZ/cI0JF
         Xnw4FAjikXc37LvwjUtv+BsrspiSTya4NINZnH8W7F9yJwIYMEIDrE5Gl22O/GLJje4X
         NQviDMN3pzHaPUA1tLYm/eUBWhjsOw7ac6uxR26uZw4dEecYgMJpdcZWxKr8aD5o4lQQ
         AdDP4KOM1PYXRuYuyR1gAs2MZldyhvS5OBILKuh7+wYC/6MGAQ9y6hiZFXJ1vnZouG31
         N44IhKYYd9bN9Wa8R3t6j+tu85lJT9Sn8EevrXrmBMmzIg3y665dRlCtVxyGAm4FBd0U
         Vn2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV9fQ/VU7DLUdFDEcwzd4/qj9yksACXJerjWHqGJkSileX9YqlTqsgMy7aMFeh5gn3Ia0MwMJEvhPR+49V8Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8UhbzKGPJFLAAIXrh2HoUUw6D1xHCd1swwVvVm0s191UoMupn
	7+t+1zpxFrr41qhgNpNiq1HAbuJreL/pVKEYU5mofulIfOZV9h8K4FhM
X-Gm-Gg: AZuq6aJhbKQRLpCqIt6pZmY6nZ/8N0OJ8keZfZqjn4EoigUU2y22CN3oJzpca8DafqI
	zt2SX0vyoh9sU+JBCNy3UN+b/PQSHH3D1AVGocga9LkvbTQkwFuCYYVWptdX8+Yy1zIomqEMH1I
	CJ1Zon9eDJL3sU0Dy1KmRPJmr6kp2n/K48/HiufX8saeKKDNAoYXdzdANNqL3LQ8wEtH68Awxkq
	1iKgA2By5W+GFJHRWiuqQ/OfDac0GHN5EHXYgQdU5BKqdBOSwNTmKoXc/0AvsNbTxGhdSH1Sqwa
	1/7HBaboX2IhKh2gCEJ5AG+MqWb4+W89eWoE99QWU427QeOjf4w9SXOFZ5Rr/LGPsI4dtTmF1K2
	UteB+nimHCnaL3cOQ+IB1Ih35yr74rhtNi5uVaa1wHzH6V3T+5MWutcPoyj5xbfN3SiHbQ3YAAr
	s8DxBAxHP+ypIme920pCtqhuHtGjH+OX/autqTfQuyuDoVxg==
X-Received: by 2002:a05:690e:d8d:b0:63e:b41:cebc with SMTP id 956f58d0204a3-6491648c379mr12616986d50.17.1768959690075;
        Tue, 20 Jan 2026 17:41:30 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:48::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6494080138fsm1106822d50.20.2026.01.20.17.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:41:29 -0800 (PST)
Date: Tue, 20 Jan 2026 17:41:28 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Petr Machata <petrm@nvidia.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: forwarding: cleanup veth peers created
 via NUM_NETIFS
Message-ID: <aXAuyPwez4ZfuFT7@devvm11784.nha0.facebook.com>
References: <20260120230905.328528-1-aleksey.oladko@virtuozzo.com>
 <aXAsb+sCbyeD/xkL@devvm11784.nha0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXAsb+sCbyeD/xkL@devvm11784.nha0.facebook.com>

On Tue, Jan 20, 2026 at 05:31:27PM -0800, Bobby Eshleman wrote:
> On Tue, Jan 20, 2026 at 11:09:05PM +0000, Aleksei Oladko wrote:
> > Some net/forwarding kselftests set NUM_NETIFS, causing lib.sh to create
> > the requested number of veth peer interfaces.
> > 
> > These interfaces are not removed when the tests finish, leaving stale
> > veth devices in the system. This can cause subsequent tests to fail,
> > for example min_max_mtu.sh.
> > 
> > Ensure that veth peers created via NUM_NETIFS are properly removed at
> > the end of the tests to avoid interference between test runs.
> > 
> > Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> > ---
> >  tools/testing/selftests/net/forwarding/lib.sh | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
> > index a9034f0bb58b..ae7699c0c7e5 100644
> > --- a/tools/testing/selftests/net/forwarding/lib.sh
> > +++ b/tools/testing/selftests/net/forwarding/lib.sh
> > @@ -597,6 +597,10 @@ vrf_cleanup()
> >  	ip -6 rule del pref 32765
> >  	ip -4 rule add pref 0 table local
> >  	ip -4 rule del pref 32765
> > +
> > +	for ((i = 1; i <= NUM_NETIFS; i=$i+2)); do
> 
> I'd suggest 'i = i + 2' here instead of "i=$i+2", as it seems closer to the rest of lib.sh
> style.
> 
> > +		ip link delete dev ${NETIFS[p$i]} 2>/dev/null || true
> > +	done
> >  }
> >  
> >  adf_vrf_prepare()
> > -- 
> > 2.43.0
> > 
> 
> I see that some tests that set NUM_NETIFS do not seem to call
> vrf_cleanup() (e.g. bridge_activity_notify.sh), so I think those tests
> will still leak?

My mistake here, I now see there is a more indirect call to vrf_cleanup
via defer there.

Best,
Bobby

> 
> Maybe lib.sh needs a remove_netif() to go along with create_netif(), and
> then tests can call it from their 'cleanup()' EXIT handlers? This avoids
> the mismatch between vrf_prepare() not creating devices but
> vrf_cleanup() removing them.
> 
