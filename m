Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C5430CF5
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212834; cv=none; b=RtkU7XpaVR6MJ76R2BeJrQLdeokuwoQw0A5irYYpPX/vjmEI3JZrOLI6d9bCXEEEuxn5YXB8SHdG8eM7nVRlcF4REcl/ECu26eMBMKseJvjYckmHIT8sPi+L7cohPBSbVjXd+2Pr5iR4I8uN8OBGlE7tR9fVI2DgueDaPHEIcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212834; c=relaxed/simple;
	bh=Hpdg4JBAxOj+PU+ZMsPgiOD+dHGCLzSNL8/fu/+bZ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFBeBysI1ZV0GgZGvmH+pNkMBdcGtNFICY5tnq/f7faLSWHRDC3P8NYC/VGgjqxCN1mIurTbDydCxun055XVleZugyr/Dum9MoyCnv/I/zNU9BlXiGbi80ZVY4w1qZn/eKkaJ3oEhV04UHNRWVTVrex3SAlYtU4ehFPZinzFtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UzDxVw4r; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UzDxVw4r"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e69a2db34so7936597b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784212832; x=1784817632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Hq7mqdQ2orEVSVK+XIkt+n7imo/sMvdXL9WaKcDjY4=;
        b=UzDxVw4r37gRy6e7Ns4i/TyrGCapM60g5HKvfgp7KfcrO/cwkB49OUvI4pdsLoFdEJ
         WwPtvfLfy+Xy/iYv0HZ1192pEFnh9VzXCO7VVxUbb0dJ6xSYzYSZnN9Sml1VLJysy/T0
         r2usg+roiujC/rBpn5y7CGe+8msr+O0lNPcFbrp9I4a27kjPYNYPsoZKLQxCdGGnahLp
         5s4LVOCzr/EYhXP94pPcy7AaUX/UkOmjjF5HAKnUadd8fC+OYOkgad6a6p5BgRUDTQVv
         0H9Qlxa9X7OHs87uwwVuot6dIk/kBh0XsUGEXTaZRA7rS2xqHZr5yIsPUZyngOa20g4R
         TDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212832; x=1784817632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Hq7mqdQ2orEVSVK+XIkt+n7imo/sMvdXL9WaKcDjY4=;
        b=suN7Cu3K3TKyfJuzkPjhkBjBJQT56LLZyyKARnl9atmLobBkv7DVHnd9sKl28P8m5h
         ZPOG6mJmT14DcyCJ63LKuSX0yqJDZ+EpW0PHT4ArcDF50XxsRfVBNU7USzdSP/tub1od
         4Kf1sNvVZFElhogfId9iY90UeqChx1kpwORwoKoQ85I2Zo4Cbl0X0BVr2yKM00tItvSL
         x5xGVcVeYfwY/uEYgPRckirxxqzvxPQJbHoF1UKlImJ+p0eHsHi1HNuMvfE4yKolgnap
         4pG1NNj3PASlt3ShgTzVBXP52KCcJDxjRoBK0fbD+Gppf6b5A4C5Wp3pOBA0dm8bUgEM
         ZjwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpA02k016H5zXEJM1DFpdFu9fnRuKGZrP1DA2EbGqxDeNuRnJ2uMpWgXmNkzir8r/gPfNh1vR1ThFrkiyqRM+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweOx+E2MJLjHIw5dH6pyaHHC5Mk7k71wiw2XkVmxaCFopateVn
	8YPzbCgwP+8YumTjmg3u6ytn3i1TNfrUiCFzR7RzyLOs7awdRqu201X6JfVRhAppJoo=
X-Gm-Gg: AfdE7ckzDiJvDmKutvo+ot7vrXCofVfeY7x87GzwvhRAhTrlP8aKRBKcSQIam9INlPz
	IhVO5pT2Vf07084BoXV9+Be3rXnokvsQJzsCStSPwt8RnZJQC2ruY6WFtYH0q8VqUl7E/i4BDod
	RVJnRyXBMecVZDU7frGTNPD4m+32S8E4zBopiwDRPvpzwG/NhVk8wWIWFEYaRixBt5K5agyNLbV
	uDmj+2GpI7DxZLdMaertE9Rrfs/9OOBzOCKQOioZQUyfoePUJhtMClz18JYTUac0s/szMsVdzj+
	UAfW6e6AL13bcj7Bk7VFVZenLAETivJaF0j3PB7Y0N0HsSm6lgtBq2EYa4cRarxqRdYT0+Zu+PO
	1/B5IU3C071Z68ztgZAHRoJ9D/pLZPmmqLqxTw8i1VSaim/Wjirxr8RJxCVCzEM5/pmsdR9rEpr
	WNvzcrI05/UmKAKLVabjwrPTm+2AmGlGkHoo2cB20Wm4QaQVKw4JIrvEdZHtUeh/LFOW90kM4Da
	x2WbLoGvC+tTBNc/7ulH70=
X-Received: by 2002:a05:690c:4b13:b0:81d:6eec:fe22 with SMTP id 00721157ae682-81ecfa0f945mr56355607b3.44.1784212831974;
        Thu, 16 Jul 2026 07:40:31 -0700 (PDT)
Received: from google.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ec99280e3sm58348947b3.12.2026.07.16.07.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:40:31 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:40:30 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>, luca.boccassi@gmail.com
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for
 /dev/liveupdate
Message-ID: <aljtXsr6xvI6FAmA@google.com>
References: <20260714190356.190328-1-dmatlack@google.com>
 <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715172336.GC3775915@nvidia.com>

On 07-15 14:23, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> > Hi David,
> > 
> > On Tue, Jul 14 2026, David Matlack wrote:
> > 
> > > Remove the single-opener restriction for /dev/liveupdate by removing the
> > > atomic in_use tracking and the exclusive open check in luo_open() that
> > > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> > > that concurrent open attempts by multiple processes safely executes
> > > deserialization only once. Update liveupdate selftest to verify that
> > > multiple concurrent openers succeed.
> > >
> > > LUO does not inherently require a single opener. There is some
> > > documentation about it simplifying state management, but the only thing
> > > it actually protects is the session deserialization during first open,
> > > which can be easily handled with a mutex.
> > >
> > > Relaxing the single-opener requirement avoids the kernel forcing a
> > > design pattern on userspace that it itself does not require, e.g.
> > > allowing multiple userspace processes to create and manage sessions.
> > 
> > Agreed. When the kernel had a global state machine in the early versions
> > of LUO, this might have been more relevant. With sessions, even if we
> > later add a state machine, it likely will be per-session instead of
> > being global. So I think letting userspace open /dev/liveupdate multiple
> > times makes a lot of sense.
> > 
> > Also, today's systemd only supports preserving individual files, and
> > does not hand out sessions. To get sessions, userspace must open

It should in the future, because of permissions issue, see below.

> > /dev/liveupdate and create a session. This opens up room for one bad
> > process to block every other process from creating sessions. It also
> > imposes a need for userspace to add a polling/retry logic for getting
> > sessions and serializes their execution around this point.
> 
> Shouldn't systemd open and own /dev/liveupdate? That was at least what
> I originally expected here, you'd talk to it and get a session FD
> through dbus.
> 
> Moving to multi-opening /dev/liveupdate and removing visibility of
> what sessions are open from systemd is a different model
> 
> Not saying this patch is wrong or anything, but that I don't really
> understand what kind of model you are going for now.

CC Luca for systemd's take.

/dev/liveupdate should only be accessed by a privileged process, and 
sessions should be accessed by whoever originally created them. While 
this patch does not change the permissions, it paves the road for us to 
move in the wrong direction: instead of having a privileged userspace 
manager that distributes the sessions to their rightful owners, it 
encourages userspace to work around the permissions so that VMMs access 
/dev/liveupdate to retrieve or store their sessions directly. This would 
also allow them to access sessions belonging to any other participant of 
the live update.

Instead, sessions should be created and retrieved by a privileged 
process that knows to send them back to their rightful owner after 
retrieval.

Also, as a minor concern, each userspace LUO manager needs its own 
session to maintain state. This means that by allowing multiple 
managers, they may run into naming conflicts for those state sessions.

Pasha

> 
> Jason
