Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA123FD15C
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509561; cv=none; b=ZI/iTnSyRRp4j/zZze84QI6Fxs3nQaZiqU9CHU+9jm3+7I4S/nXEKkHUN4xBjw2y8CFsplBYcsSPTN6wG2M1FVPR/8doXj0UvZQl5898T4PnZGuQ6Hum/buE8W9I6tA1UNNN4k6SIH4wC/v7z6nhiOwh22dnqdEKdYDAN7VHeqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509561; c=relaxed/simple;
	bh=y6mI/aBQdIS45CPgRMSXGRkAKq89vLEbgo3SgmuJbgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhdGfswdZOqLnHspIARfBeebG6kXPozUbQ7C/R6DmV1jX0xXCCIjQboCAHLOn7RoXAA8Yp6bFCTU6naio3tHk3SxRrqIuh1R+TMck6AbVovG4yqGUfxt+n3UEYvbyusprvI0801Xeu7q4nPlm/Yv/TKgmWAk17ChxalLtmo6NNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RInAvzG/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RInAvzG/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso46615215e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778509558; x=1779114358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1FsOK16n6jAh/hhIjwyhyeD9jcnIwHzJmEfMcLD+mE=;
        b=RInAvzG/m8eTo2zDpf+r+T50TEG2S44D6jkRSr2l1M001E8b+W7fkkZp1pIA7LHD9e
         RSblEGU/sWf9fXz6BZZFmuH6InHh0kOA1215Su/giYecKL5rAm+2ikVbL2LQhbE8M3/Y
         jmMLx/DK0Bus5UqbrLA/kkfvh18fZF0Z/i84QK39bKTi/ex4CS6O/4RX+Y7KFA6BMGrH
         w6y3Ag+aDSVZwzFWbRCW2wGW25fFZuR6Vj389p+o9dIzCv0LD/L7oQ+lu4A5t+eNVjI+
         mmofHq6pMkfzftHaPacG0zRbfFJFJrfQeXVbIv+CdC7v/h7ua1ZN1D9WpSOr43bj7Tex
         Jzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509558; x=1779114358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1FsOK16n6jAh/hhIjwyhyeD9jcnIwHzJmEfMcLD+mE=;
        b=ITK4OYLKaaG6OVsG1soF5h/JADBYIQ7d1tuBjUDa5nsnD4Jw8kgyncbMpn/CKNKJtm
         Z4a75xgGEVwTsTUV35w0b8/O3HNHDjQmJX5sGTXvA1uc11jwHcs6yoJA4pz+M+zVoOGv
         s92KM1lEVoku6FHpH3FN7mBAMsXK5T5YOH0CyYuFcyRZDfGap23SI7H1E/oPoiUCJyx7
         AghQSmEZBEFk/qxiOVYS/VHyZylf6IgJcizhMbVytsVONkXO89g0hn0c4+D6m6Kb4lTp
         d2OGQsqvhnJ8Eu8Z4Buw3XcMBHocqKh8lNPyifGc42zP5j28vdFSfb6J3D/S75zCJie0
         cAzg==
X-Forwarded-Encrypted: i=1; AFNElJ/MtZ8OHYTDS2GF7tHQvHZuN0N1SMd/oJQ5RjTWe4r6zHQwmJ3khtFLqWCPPX3JKZjuC09rDvuOvEQodQ2svbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGSx+KJ9uQ2niIMQkJKQBLCkX9HT9TuQhwB287bbvdkSGMoVT
	rQ01Kd0kjC35RQMdOWZKFEBZOWgeN6bLNyOxleS/y8VtPhS5VwdaEo+AEI4Qd/KHTd4=
X-Gm-Gg: Acq92OERCHOLgJr+g1wdSk43u9cpKb46X7bmaA63QBgpmcA75zBizCZgqrJ1YR8Sbl8
	C3mnR3a1lBruThexneCmhF7P6YAja+3ZlLVsEonVg0TLHfkoOYshpGgaWIl1JYG+6clLdGfwgpj
	0F/zdQSe7kdxXxxMAZNvLrHMuaUpkcBp/TvLuQggYK6nPeSryjd+/7fPfaQLACUdTlYWAbZFfJs
	p444ZlV5nnRYOP9g5cGBGDy8A2Oc50xi8Bxx08g6c/pnuU5QJg8Q0BTwxKgD0dzkK7mH5yVDox7
	cGkyh1MCwlTqAHtdiooXBF3kdwYmiupQntjIIG3AwQru4Cd8zZWyS0ZmGFlGav6YSt9nLDY/DiD
	MwUnuUDVX95a9VEu6JxzFguUbVn7OUUqzjFLH1dBohUsCSrlgxclSEtPP4UOVi0aN4JVygqS0i6
	pHba3LiYkbwzY8C6B7Sk4qqcvgSC6yahEm8fTC
X-Received: by 2002:a05:600c:3b0f:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48e51f4e9admr397103525e9.29.1778509558540;
        Mon, 11 May 2026 07:25:58 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm25413486f8f.34.2026.05.11.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:25:58 -0700 (PDT)
Date: Mon, 11 May 2026 16:25:57 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHm9Vj7bPPCRS1g@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHgDgwu8H9Opzpl@laps>

On Mon 11-05-26 09:56:30, Sasha Levin wrote:
> On Mon, May 11, 2026 at 03:49:24PM +0200, Michal Hocko wrote:
> > On Mon 11-05-26 09:39:32, Sasha Levin wrote:
> > > On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
> > > > On Mon 11-05-26 04:41:38, Breno Leitao wrote:
> > > > > On Fri, May 08, 2026 at 05:47:04PM -0400, Sasha Levin wrote:
> > > > > > On Fri, May 08, 2026 at 01:56:30PM -0700, Andrew Morton wrote:
> > > > > > > On Thu,  7 May 2026 03:05:45 -0400 Sasha Levin <sashal@kernel.org> wrote:
> > > > > > >
> > > > > > > > When a (security) issue goes public, fleets stay exposed until a patched kernel
> > > > > > > > is built, distributed, and rebooted into.
> > > > > > > >
> > > > > > > > For many such issues the simplest mitigation is to stop calling the buggy
> > > > > > > > function. Killswitch provides that. An admin writes:
> > > > > > > >
> > > > > > > >     echo "engage af_alg_sendmsg -1" \
> > > > > > > >         > /sys/kernel/security/killswitch/control
> > > > > > >
> > > > > > > It certainly sounds useful, but what would I know.  How do we hunt down
> > > > > > > suitable operations people (aka "target audience") to find out how
> > > > > > > useful this is to them?
> > > > > >
> > > > > > I'm not entierly sure here... If folks have suggestions on folks to loop in,
> > > > > > that'll be great!
> > > > >
> > > > > I work with these issues at Meta, and this approach would address a real
> > > > > need we have.
> > > 
> > > Thanks for the feedback!
> > > 
> > > > > While livepatch could theoretically solve this problem, it's less suited
> > > > > for rapid mitigation for a couple of reasons:
> > > > >
> > > > > 1) Livepatch rollout is inherently slower due to the blast radius if a
> > > > >    bug exists in the livepatch mechanism itself.
> > > > >
> > > > > 2) It's common to run hundreds of different kernel versions across a
> > > > >    fleet. Since livepatch is kernel-specific, a single CVE suddenly
> > > > >    requires building and deploying hundreds of individual livepatches—
> > > > >    far less practical than a simple sysfs write.
> > > >
> > > > LP is certainly a more laborous solution. I guess this is quite clear.
> > > > It is also much safer option as it deals with all implementation details
> > > > like consistency. All that is not done for fun. I am really wondering
> > > > how admins are expected to a) know which kernel functions are ok/safe to
> > > > disable and b) when it is safe to do so without introducing unsafe
> > > > kernel state or introduce an outright bug that way.
> > > 
> > > In a similar way to how they would know if a given livepatch is safe to apply -
> > > ideally it would be communicated by the vendor/distro/kernel team.
> > 
> > You have missed my point. KLP takes an extra steps to make sure patching
> > a particular function is safe to modify or to put the change into the
> > effect.
> 
> Safety checks like making sure the patched function is on the stack, or did you
> mean something else?

Yes, exactly what LP infrastructure already provides.

> > > "On Debian XX.YY, use the following command to mitigate CVE-AAAA-BBBB:
> > > 
> > >  echo "engage woops -1" > /sys/kernel/security/killswitch/control"
> > > 
> > > > Thiking about this I can see how waiting for an official LP can be time
> > > > consuming and sometimes creating those is far from trivial. But would it
> > > > make sense to have automated LP creation tooling available that would
> > > > allow to return early from a function and relly on the existing
> > > > infrastructure to do the right thing?
> > > 
> > > This would definitely help (and in light of how the last couple of weeks played
> > > out, the case for livepatches definitely increased), but not all
> > > vendors/distros provide livepatches.
> > 
> > The point I've tried to make is that you (as an admin) shouldn't depend
> > on your vendor to provide you with an official LP just to disable a
> > certain function(ality). That is/should be a trivial case where the LP
> > should be ideally generated automagically if you have a tooling
> > available. I might be wrong and overlook some complexity here.
> 
> Module signing is what stops that approach for me.

OK, so the actual constrain here is that you cannot load your own
modules. That was not really clear from your description. I assume you
cannot enroll your own key and sign?
-- 
Michal Hocko
SUSE Labs
