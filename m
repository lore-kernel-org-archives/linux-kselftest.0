Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464B2F5313
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784308038; cv=none; b=kJAVrXST15864h/NOjOnUmfl945uL6f5/Iy/iybOcRhrys5TVVZXDNgJe2LDGjHBKD5LHIIah6KXrcrHHf61HBLH4+KfbmnUvV9rn5wxCR29aqSSuc5IjxZZhXX1E4Mr3ZgTb++PrCDQcFZrkVqJXb2X9WjBMZS4L/oTzyl1744=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784308038; c=relaxed/simple;
	bh=hAQuitJW7qQjez5c/NHWPmdXOpei7vCFQ674pCMcye8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5q9bxQqQ214xD72sPVETdhGhnRI61JyxTlVG7FIG6ZzyQ8KoueriHhqUWYZNRtk+6B6+G/LHMv1gmWdGFKEOiz9I2H0JVkKtYfCDqtneRZL+c7v35brPwv580UySfpL2nZfrwGP3E2NdBT4gGVYxCdurKrlnjuutzr8/A+GSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eKvzEB0R; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eKvzEB0R"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e86df8987so25022737b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784308036; x=1784912836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSNYl8Tp/9qUdH5Q7cjRfYFqP/b1gMhyNsAj6RU4JXA=;
        b=eKvzEB0RHDM1oDCAJa7thDXZYBxqaLu14FOod30j6MfCUHJ82kqI8ZlwB8MZ9a0Sv9
         MVxFiJwqgk7rgrBVyjJMQ5ZCw843MfB1GY3Lu+RtyMO3nHiPv6oN5swhN+UNJfhWy7PZ
         5k5X5Fu46kc66vRhGDB5HCI3sO7+JRmaRgjckZUOcC7GqibGRc9iGUnVJ38IvZ6H8N2d
         iUnHYUdDFJASawFMYjEuo8DA0a8rmq4MONAxBWnkq2mILuHGCj6fAiZcTf8Zqx5soNDb
         RlNGDtXK6ci5q3PTERaYCD/Vj66GE04FumGxQDErn9Ey0/uu3fYem/H1Zyk90nVYNhlb
         UtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784308036; x=1784912836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSNYl8Tp/9qUdH5Q7cjRfYFqP/b1gMhyNsAj6RU4JXA=;
        b=htsCDGbJ2OixHAcD8MHKQnyTwCa3n3XApQ37ZijCZZh+CJ4JYr20ePwcWxhefedkyq
         p/hJNZmoLojA9nUr/BZwbpwsvBYc4+owOW3mZrgcMDWcHW6MUHem/EDdyz+lx3Dap5/I
         3RLkHeYZhuj4Gi1urZNwc8K7AA1Ck2JG7MDamZGmuAyHTJTCM8FO2azSAjpHYqe/lt4T
         nQ1g/A+8htxehqsiROvH+oF14ZHKdw80i5BbeC/36W9r50hDu7B/S28DrUM6JoCDr99o
         epPx0k0zlbNyzrJrulfzUykTfxLb8yTHJKA2YHjs4VV9D1VZ+RMwmJXtkCGDkKEVnFgO
         XrVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUqIP794NwoAfgDfQqIz6+wusGckQWpzMmqx28bK5CRWoaTZsBKUKO9DpdumYq++FPQNW9roVGlAJihe4ZaI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7aHD3sbhEGM8WrxLA/ack51uvuFX+fek3Aiq+61EO97uvpzv
	OJ6WNjlbEudj90jG0CnR1ql3M71eBL+p+3jcFhJqvZFj5AX/qZHmPYSyqKB7PIwKZpk=
X-Gm-Gg: AfdE7ckIFPrcPv7NWrvoClgu0ro3oDLYju4fNmLPATt8q3uHGJp70Um+evviDrbs78W
	MDMqA9MuEQ6O3Q10qrF+wNKcA0CkLKmv3elDUJ51wt5+s3kl0XbPmIkE3Z/+jEMarG15xGUQe/W
	b2LvNryvV/9fK1DnH9hv586M5HMw1YTaunzcLg4v9twRwTAhs38lqAZVwI+tGY5aZXQjiUAEOAC
	pcg0J/+TJh2AYHu5lHkTAbzM3IHm0DRvzQqCRmb/vGw9JLaQpgxIzXBvN/U5Z3N82Fp/iYHpI2e
	ODmFGtfWBnw2PxmK5VdusFmgyN4jQHdEHamk17FDWcu2NG8wkMKrJhXR4U/IHKg1FgBc+Lqe8G5
	CR4dVHISkiBoDbbCRZ3bazfO5Fi9H0q/JE5ddlNmEGXbYhvWyteJWT4RwTS3idX67OMbfQu94rO
	M01RfqJc9sUuAweBABxzWv1UI5sZdBD49d3SJmnFc5MZXF6c/6rmkMkE9Z/sVi2XfZo+lP1bDS5
	i+NydCU2XT/
X-Received: by 2002:a05:690c:600a:b0:81e:a471:e8b2 with SMTP id 00721157ae682-81ef2735e55mr13299087b3.2.1784308027486;
        Fri, 17 Jul 2026 10:07:07 -0700 (PDT)
Received: from google.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42eb72asm14759947b3.47.2026.07.17.10.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:07:07 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:07:06 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>, uca.boccassi@gmail.com
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for
 /dev/liveupdate
Message-ID: <alphOhGU2c90l_3m@google.com>
References: <20260714190356.190328-1-dmatlack@google.com>
 <2vxzy0fcicpi.fsf@kernel.org>
 <20260715172336.GC3775915@nvidia.com>
 <aljtXsr6xvI6FAmA@google.com>
 <2vxzh5lzhrgk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzh5lzhrgk.fsf@kernel.org>

On 07-16 17:41, Pratyush Yadav wrote:
> On Thu, Jul 16 2026, Pasha Tatashin wrote:
> 
> > On 07-15 14:23, Jason Gunthorpe wrote:
> >> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> >> > Hi David,
> >> > 
> >> > On Tue, Jul 14 2026, David Matlack wrote:
> >> > 
> >> > > Remove the single-opener restriction for /dev/liveupdate by removing the
> >> > > atomic in_use tracking and the exclusive open check in luo_open() that
> >> > > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> >> > > that concurrent open attempts by multiple processes safely executes
> >> > > deserialization only once. Update liveupdate selftest to verify that
> >> > > multiple concurrent openers succeed.
> >> > >
> >> > > LUO does not inherently require a single opener. There is some
> >> > > documentation about it simplifying state management, but the only thing
> >> > > it actually protects is the session deserialization during first open,
> >> > > which can be easily handled with a mutex.
> >> > >
> >> > > Relaxing the single-opener requirement avoids the kernel forcing a
> >> > > design pattern on userspace that it itself does not require, e.g.
> >> > > allowing multiple userspace processes to create and manage sessions.
> >> > 
> >> > Agreed. When the kernel had a global state machine in the early versions
> >> > of LUO, this might have been more relevant. With sessions, even if we
> >> > later add a state machine, it likely will be per-session instead of
> >> > being global. So I think letting userspace open /dev/liveupdate multiple
> >> > times makes a lot of sense.
> >> > 
> >> > Also, today's systemd only supports preserving individual files, and
> >> > does not hand out sessions. To get sessions, userspace must open
> >
> > It should in the future, because of permissions issue, see below.
> >
> >> > /dev/liveupdate and create a session. This opens up room for one bad
> >> > process to block every other process from creating sessions. It also
> >> > imposes a need for userspace to add a polling/retry logic for getting
> >> > sessions and serializes their execution around this point.
> >> 
> >> Shouldn't systemd open and own /dev/liveupdate? That was at least what
> >> I originally expected here, you'd talk to it and get a session FD
> >> through dbus.
> >> 
> >> Moving to multi-opening /dev/liveupdate and removing visibility of
> >> what sessions are open from systemd is a different model
> >> 
> >> Not saying this patch is wrong or anything, but that I don't really
> >> understand what kind of model you are going for now.
> >
> > CC ca for systemd's take.
> >
> > /dev/liveupdate should only be accessed by a privileged process, and 
> > sessions should be accessed by whoever originally created them. While 
> > this patch does not change the permissions, it paves the road for us to 
> > move in the wrong direction: instead of having a privileged userspace 
> > manager that distributes the sessions to their rightful owners, it 
> > encourages userspace to work around the permissions so that VMMs access 
> > /dev/liveupdate to retrieve or store their sessions directly. This would 
> > also allow them to access sessions belonging to any other participant of 
> > the live update.
> 
> But you can still do all this. In fact, systemd's release notes suggest
> doing so [0]:
> 
>     Units can also create their own LUO Sessions by talking to the
>     kernel directly, and store them in their FD Stores, and those will
>     also be preserved and passed down to the unit after kexec

They should not. Ideally, systemd should be the sole entity 
communicating directly with /dev/liveupdate.

> 
> Having a single opener does not in practice prevent userspace from
> creating sessions directly. All it does is to force them to turn the
> open into a polling loop. So I don't think single open achieves the goal

That is a fragile design, and they should avoid it. To be clear, I do 
not see any functional bugs in this patch, but I still do not understand 
the underlying use case.

LUO should rely on a single manager agent that interacts with clients to 
create, preserve across reboots, and restore session IDs on their behalf.

In fact, systemd is the only userspace process that AFAIK survives 
across the reboot() boundary; all other processes are terminated before 
reboot() is invoked. Relying on multiple independent LUO managers is 
therefore architecturally, wrong as they will close sessionfds.

While the kernel can technically allow multiple openers for 
/dev/liveupdate, I do not see what problem this actually solves. 
Instead, it seems to encourage bad architectural decisions in userspace.

> you think it should. Userspace already works around this restriction.
> 
> So as long as we keep access to /dev/liveupdate restricted to privileged
> processes, I don't see why single open is any better.

What is the concrete use case for this patch, once we live in the world 
where systemd is fully capable of creating, storing, and retrieving 
sessions?

> 
> [0] https://github.com/systemd/systemd/releases#release-v261
> 
> >
> > Instead, sessions should be created and retrieved by a privileged 
> > process that knows to send them back to their rightful owner after 
> > retrieval.
> >
> > Also, as a minor concern, each userspace LUO manager needs its own 
> > session to maintain state. This means that by allowing multiple 
> > managers, they may run into naming conflicts for those state sessions.
> 
> -- 
> Regards,
> Pratyush Yadav
