Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908D38AC66
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775125206; cv=none; b=r6/mEqH5/jSaJbLZUvHniiLrjVyQcrVMyENAlli0U2pnccOaUkxUXob3L53wI1XUuDqp2gha8G4ikN8WIz2J32EY3BmIBNFBqrXlNvYRZOQAIRRPWJy4EqM6PksIiK5gtksZqnyYCVOZ3msTA5pR0+LphJKDJWYcN0U68HMqDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775125206; c=relaxed/simple;
	bh=C97VEa+NVtr1a+zTAOjF7qbw7z5ErHahekcY3LMMzjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEADotXGOE+b7Ejxl8LIY5cA3HD8lNnISbeNIplisIKNrCR9WvpXHtYvvRzEoTZAexlwH2hbSlPklMX65w6U4YN5O/bZWjMkyw46Z6CrAZQVrih4CeaYCOIpUiMMSbMZgnC+FXjGOCfuSCoxKF9uYCB+dRthj3yObP3NXYr09mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UrT0u4aJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kNRjvj9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UrT0u4aJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kNRjvj9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775125203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9FNAq6JXxyYmLFJe3V/l1GPxm6IdqNxZH3xpVlwE3k=;
	b=UrT0u4aJcIEPHUOf9domdQgQG91IqHo2qLmEA3CoKX8d12wCdO0bxHz8OnvSxU/HF60B6H
	evRU6gJsHS7haYKMymEiXceMM4bsJcQQIerYf6gAMXL/rTS3oEe+uReMvCqfBTEZDlDNex
	dsl8e8CZqqcBXhoCOPuqoaT1L0XYSVA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-fQcQdsH9Mi-d2glIwBvqgw-1; Thu, 02 Apr 2026 06:20:02 -0400
X-MC-Unique: fQcQdsH9Mi-d2glIwBvqgw-1
X-Mimecast-MFC-AGG-ID: fQcQdsH9Mi-d2glIwBvqgw_1775125201
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso19515175ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775125201; x=1775730001; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9FNAq6JXxyYmLFJe3V/l1GPxm6IdqNxZH3xpVlwE3k=;
        b=kNRjvj9yiFQWTmwG/KTDnmcx/HtqjW+9dc4qKa4IlbqCLf+aiE9HAjybGN73a2yHhK
         XZGJK8vjmWwqrTR7i5eWXlTYyY2U9b1IcS6f0poGK7V6y4acTVgXuYLY/PWn21DfjgQe
         rWJQ6Cfk5cEzrQ9KlPtwVqAsmuCJG1RFZPe9807+6fWPcwC/e5J+vWX7XfimdhAIQSIS
         SVzKgcaMXPJKNMU1X8WQIOIAlpu5eSzju1J/7d0ze55pN+4c2QDsN9I8Dy4rUtBuYicz
         8hUkKEcapI6muqdHNI6E6zxRDZUJ6y0oVxmRjzbtifttYaCV8vhHXTSdQEeeKeciFFO2
         weGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125201; x=1775730001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9FNAq6JXxyYmLFJe3V/l1GPxm6IdqNxZH3xpVlwE3k=;
        b=Cw0jwPfF9I999KHfeI0CUbx17BhPWeHwZ5dPaUHFRZu38ITIHgdzCaBtyqbl9OZB/R
         kl+o7NSqvpU16aiIG8zQ6sQUNR7hOA6Yy7ktvn9Q0cImgffZ4WVoWdA58G+c/xOlwInr
         SuXnsMpCLr1mDZx1Ij7Hjh42axbUHcz9V8AdkSBE8C9QaK4RlvE1A+pzkeypIzBeCU9A
         kb4oaxLmuj0EJg4ut6KKbdMTOjNq7M8PxB4H3h/xoQOFSm8DFroI1REJCcb+RwRsh5Qq
         NIe3B2d/7UPNgFbVn3CtqyW2RNoyGzXX7HbXzEl2cosAM1sz7w5BQwoQBrJ9DcwsqQD0
         XdKw==
X-Forwarded-Encrypted: i=1; AJvYcCXE7+fhVKObDPX5BHMZr72HZwenQu1g1dAtudHsfUNvnkT0g8npdbpuFuT/DDFEI/GJQ6Oex7ZuHOdxFYdVyTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCf2GESyhqVyyLiIhi8KfPUtn3iS3c0cf2M8oWZVeoqs5skwx4
	HbvQzFEYJgScARro5w/GvQtWA8yBTiv1Kx1poL9FqrlxwgUWvIODftLmE1mXVPFyfPwwbR2vm3J
	1/jJ+Z1X011TuMWUjZrbYc31MuofpoIhEO+m2TS5Cg078G2AtL0UlbDAX/6MAWnfaoGMknA==
X-Gm-Gg: AeBDietxlml1cYeiX4sM5Diy8t5wQZ9q6xpjGnllIHvCFRZHtyx7KqvWkiPfNLmfIVR
	KSYUmIHj9Q1/URfhAm0XWRLc3NHhMtOH+xenfF19lwidecP82kV/V3AZMmagn9qEqtSyCbGtzTQ
	6nDWZOvJwx7M6lCOpsbkfbzIq58Z5I3p6M/CtMix+3Iz6Mb4PU4W3uM5/2XPzPviXzZyWDoRukq
	MxBqqXlCY/1/HcPex/pygJRFs8u0iAOm07rSyEog1CrzpK4M/Oqmy1BjoOCn7yuOfyB9FdRIfaR
	vS18Me2JYeJvoUS/xu8edJ4USg7Qb2G91XaTMU4MmRnfpseVRK1zzZ13+6436hYUruEnfJl30Zf
	Rp6yr22GVFPNKFfZgXQ==
X-Received: by 2002:a17:903:248:b0:2b0:af2f:b26a with SMTP id d9443c01a7336-2b269ce75dfmr68411265ad.48.1775125201021;
        Thu, 02 Apr 2026 03:20:01 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2b0:af2f:b26a with SMTP id d9443c01a7336-2b269ce75dfmr68410865ad.48.1775125200433;
        Thu, 02 Apr 2026 03:20:00 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cada2sm22687075ad.71.2026.04.02.03.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:19:59 -0700 (PDT)
Date: Thu, 2 Apr 2026 18:19:56 +0800
From: Li Wang <liwang@redhat.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Waiman Long <longman@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 1/7] memcg: Scale up vmstats flush threshold with
 int_sqrt(nr_cpus+2)
Message-ID: <ac5CzJ5S0kp71rrs@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-2-longman@redhat.com>
 <n6mhkjsxsami3qmczkdh57eep4lmcgbtyl7ox3ajzveke44yf6@m4bjevvsr47k>
 <ac42aIDVaGim5moO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac42aIDVaGim5moO@redhat.com>

> > with kernel functions:
> > 	var1 = 65536*nr_cpus / (45426 * ilog2(nr_cpus) + 65536)
> > 	var2 = DIV_ROUND_UP(65536*nr_cpus, 45426 * ilog2(nr_cpus) + 65536)
> > 	var3 = roundup_pow_of_two(var2)


Consider a 1024-CPU machine with a cpuset-constrained cgroup using only 2 CPUs.

Its unavoidable batching error is just 2MB, yet the global threshold imposes
256MB (harmonic-mean) or 32MB (sqrt) of additional error — 128x and 16x
overprovisioning respectively. Both overshoot, but sqrt stays bit closer to
the ideal.

-- 
Regards,
Li Wang

