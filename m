Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B73A9629
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562915; cv=none; b=qa4baTBiE2ixOtU1Ad0EdBrSjDb08y5AhkruJJn6hlps8fu4m6sNLysCQ9UhcDWC6jg+DXD2UdDRdQbAH8cqWtsSxMUMKYLxA5h/UP/D4wKF8ScAOwSaFuNRsne04pTDxa0JhWSjnmjQfDIMGf8KTti4etMpj2WmQ4/S1X4bxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562915; c=relaxed/simple;
	bh=2bt2Y+pPUyLZGB/JYZQHnTwvkzT2uXOXMCVVdOekqR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4DdWncEiUrOHGRFvH+KewrjiEBxH+vsh99abplA1Jssdgh3PiBld3oN/s3HIzQ3VrqUp2ws10sVZf77vq9gsMOC630cWW+BqXHYCfL+MVHkdnn7q5Orgh3ncuzonhb0yS/kqmGkEFHMdPjdv4oCJUwtU0jG4OJP8oypa0dBj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=0Z27UUxi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="0Z27UUxi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so20098665e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775562911; x=1776167711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bt2Y+pPUyLZGB/JYZQHnTwvkzT2uXOXMCVVdOekqR8=;
        b=0Z27UUxieZMaGB7NAYJtTldWlYFBjfLLOZlpQMitmm3BV2JggAKSDzeEelpPAWwaxc
         zmI+Z4UZ24O3xj2CbZ+Lua4fD2tUStRlLEiPqlm43R0tNGyoHdX68SAUnDNdgvecffYd
         gg6pbq3BrfRMhvkUBejyH0NDhBPn2LxrZFvYGOl5/6GiXsMTtabJzOEwSqKpRwcZ97+q
         3kTr+aCUIguZmb+kij+cgZsrHg0HCkqh9r3ywuHNNJjMTc5HKVUcomYtpV2ACyxeaXi6
         2rT0S5h389See0YZaMZ5KlfknLCFaYIPjDoTofcPSlLVxf7El2q1J8ys/hSezDijZ+wf
         ecPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562911; x=1776167711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bt2Y+pPUyLZGB/JYZQHnTwvkzT2uXOXMCVVdOekqR8=;
        b=Wuph8sPPdootTukPUaK+EAEsq7Nz7j01MlySU7aZ8pYvsKEiyd7HjQSSmPQBIGOR15
         +ud13KqbhtUXFqVh5s7k+hoxEUUJAom2PHVweU0fhYOxEgZSrbVfYvgBt7YG+51Fg7Fc
         BM1QhvWYWz0f4ItJlqZWLMFpMTEjscoERH7XCJNf8Cjtq9FWMXDT8NkG+Y0uE0EgZO+d
         U36Epo3FEV/4k46tMhZ4eYcy/IvGLf3XVsnxsdo+FE7XODfL9lrpxvR7H4IdgPMs+36/
         ubueX0PofuWV+8CVLHqmKNBIFTMUnSHTbDvzzLz2zhhZwnI1FllPaT0gPIGDx1UNb644
         Qx2g==
X-Forwarded-Encrypted: i=1; AJvYcCUNTGmuO+0y8aoZxZ350Tmn+9V9amCBTEapDaXQ3ghWDLCTm4xO9FVFS5zfeKH+2uLGq91RlQIbhbYbyCwlGsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywC0nlFYEsJ85L/Eyuc2skSHzzxGxruemk3lR2pqrbDa79j+lZ
	fRobugZ1IDH9G/rWkSU43GLkQ/kftvakPsGdvIausNeibFEHSgNoZpvydnYF/IyAXtg=
X-Gm-Gg: AeBDieulDMX8XzLKQ79vLdZkVqX0sUm4NvtUROjb5IcX5FIm374TWXsNBO1j7elpYwD
	3+VWrtxpvv7wiMYrIa+yAnw/EJIzMwJ3wkzpunjSKukhiRUFPrtfuDlgVNjc7xiXH1VHXNAffco
	opcgBq2S9yiNB+o5mkFWvRSQdXP14GutCsZJSRN1YmrF9i4sfFwBRrH4VvMH/aTwRBD+AP7KWYK
	IEzGA3VHeg9KRvSp/8IvroexcwQussUznJrs+C4XWn8K5ZbHXRhNbLXXZ4Tc7jPrQWMqIoFve5v
	P6xZKna0mJvvYTHtGBw9+qVmNJuN/6FuGa4RI5BVLfk0sV71YWwEBIoZQGT65aguYCbb3WSkPpn
	qB5FqUr/4wxxdjANr6CjTzhWswYl+zCCuhWLkQjrjorG+dSaiwyXj4npPgMXqAzUyF9VRFvzcUJ
	vkHAeZE0lOr++O9saazdvZeMLz25jjCTc=
X-Received: by 2002:a05:600c:c493:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488996da0e3mr222190755e9.4.1775562910849;
        Tue, 07 Apr 2026 04:55:10 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488bfc31418sm73008705e9.3.2026.04.07.04.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:55:10 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:55:07 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
Message-ID: <utlz3oebjyd4lqp5pd4qdbth2kywxo4hrlrnwcxsx3br76fwfg@vy3tx5f3lv32>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:36AM +0200, marcharvey@google.com wrote:
>Allow independent control over receive and transmit enablement states
>for aggregated ports in the team driver.
>
>The motivation is that IEE 802.3ad LACP "independent control" can't
>be implemented for the team driver currently. This was added to the
>bonding driver in commit 240fd405528b ("bonding: Add independent
>control state machine").
>
>This series also has a few patches that add tests to show that the old
>coupled enablement still works and that the new decoupled enablement
>works as intended (4, 5, and 10).
>
>There are three patches with small fixes as well, with the goal of
>making the final decoupling patch clearer (1, 2, and 3).

Looks fine to me now. Do you have libteam/teamd counterpart?
