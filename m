Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B419357CF3
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073212; cv=none; b=LbTxbix3S3QbfplkTBz8DLXgHqyVzlqhSvnsEiBYvBaioGxTJqdWodLEGBdZeqEdxOK2RRD3rOQch2w8m6FBgmLcoWgpGw+1YyD1V9qfaqhyrfSCU12DTvLejOVqtEy7zppDKQYazoEvP3LwbsTONjNlTHYS3fZyBk4ZCNBPrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073212; c=relaxed/simple;
	bh=laBEFR0I3RWvs1+Is2iqG1fnTejy7x7hXOUjl6aoww4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCSOaS2knsKmlIRZo/KUkMZvM9pCSrm48Z2IWiGTxTHLRZS+B0tJ5ELc/ZIaUtg168xsEGcR36oYIOneBo8PfC0XoQ7U3utZVPjAzSL3l6wFEd32eBbt2iouMVnW2MaozMhSkyFI+0XXO6y+e0Dqvcj2c1pL+Uj7oIAqZHP5ti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AXSqgqyP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AXSqgqyP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso2411705e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Jul 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783073208; x=1783678008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=AXSqgqyPkphxZTpDJjdfE/o0kG7+xOXP741IGKwTN9NxNBPQaNgzZ9tesMhVLMQb4b
         zn7mvGPDPSpB4EhOQBUSwSZpzM/uodes4u2rr0ewOgkNuCnAVrOFapNFvdUSJMrHsvTU
         TjZp4qmoJPME64API5/BTz1uKPR5sYwcW0x83JLycC7vFcm7puBQ/ZhDjVXFobcc+aTi
         7yaHP3V3njXIqPG7Veb6yxmrVnPO1wiJIr7W0BuAs5GhVzdTiSlfytvmjDwLcmdH0r9s
         LRZdvhpzo0gnCDkuxRDwh/JIOc96x2bFCJ5PNsFUMx0tFVbPiDx/osMGur4B2MBNfRjO
         itnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073208; x=1783678008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=Uk4O/abybG20fVkL7UjtBbekeSHCweEsEsOlqB+57BHHeFXxk7sRYbpa4HYdfktzk8
         cXCzHbRtWB8L+hkDa0fYnbCXuRY0KGkzsTmh8pl+vDkWTZMk7DFrgrEanCC2Ff9ltEv6
         PpVl5eh2VdpCfjh8MWoagVEiq6lwmG2ZrAWbhEe9o2FM4VGnYYI3ogH6of8JEMTJJGQG
         PFoEFhQGfays02Ijyi7Z+aMHFravsOTEqs0tPvkLmmtHoJaKGLuXanfFkNnIdglU3THy
         SFWBgSqQy04inGSkNx1ttmnKG+yPWHYW+D5SG0pSWHS0epb4Toel5LXgQJYzOpwRcmSr
         AohA==
X-Forwarded-Encrypted: i=1; AFNElJ/Uq3XBv/t8x6PCcLLkgv0XUbtSU/O3kmc+FfpnRrrP5yUoWvozBv33HuLMdjt1qyS2PJlL9CSYFxQTji6I8Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGjnrU30oAItYrTWdgJ8NdarqsiHlVxi/sAbpFRU77O6syZ/a
	qPqurkxKRqDHljIjx86jaiXK1NPVg3hqNeAAnEC+cHlTR3EoQs6tlrhnZ8Wb1kzFHJI=
X-Gm-Gg: AfdE7clVwcAEbQ1tytMaH9xiRk0UOxXyQcl5jLLnNQLTAth3tabFY4S5PU+ILX8zipT
	YG3Hea/S+Zu2ye66Hn82Qo555ZpiTqg2S06iek423XuZLIsJsinZRlJhspLSnLwGZQvj8kZERiB
	FkbdsXTEkD6HhzZtAw+gTktPxPA+sGO5JZQ6PZwUUvsnnn/xlZsx4uM/ahCKv/j9SIK2yk56Q7i
	AJIGNFQDVdFX7pHClrW0m+1rmcBVxB0ricmgZXE+fbZ87JOxKypiLc9KRdE0W9G+l0H7vmg9kfC
	9JPgnBxrr909HOVVBYXXqwDBHgllYSwO+kZayZExLeXo/TtrXPrA/iN2hrO0iIXbcrgQWpMe4S0
	emd6bP79ZNBSgULpHLEogiNfsCDefYKjUQWb+j7GRlks5Y6HFUyXgWsjC7MLDh7RFZrKIJpegP/
	lKWD71UJDUdTn6uPs=
X-Received: by 2002:a05:600c:350f:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493c2b6e607mr144501925e9.19.1783073208553;
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm222444665e9.2.2026.07.03.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Date: Fri, 3 Jul 2026 12:06:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akeJto1TC2CSs4Yw@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
 <akdyH7rRV1WHtBJ3@pathway.suse.cz>
 <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>

On Fri 2026-07-03 11:32:30, Thomas Weiﬂschuh wrote:
> On Fri, Jul 03, 2026 at 10:26:07AM +0200, Petr Mladek wrote:
> > On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> > > --
> > > 
> > > commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> > > Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > 
> > > kbuild: unset sub_make_done before calling kselftest build system
> > > 
> > > This commit unsets sub_make_done before invoking the kselftest build system to
> > > ensure Kbuild reevaluates command-line flags when building test modules. It
> > > mirrors a previous fix done for scripts/install.sh.
> > > 
> > > > diff --git a/Makefile b/Makefile
> > > > index b9c5792c79e01..f717a4dc96d6a 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> > > >  
> > > >  PHONY += kselftest
> > > >  kselftest: headers
> > > > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > 
> > > [Severity: Medium]
> > > Will make tools/selftests still fail after this change?
> > > 
> > > The tools/ and tools/% targets in Makefile delegate to the tools build
> > > system, which can also trigger external kernel module builds (like bpf_testmod).
> > > 
> > > Because sub_make_done is not unset for these targets, invoking commands like
> > > make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> > > 
> > > Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> > > consistency across the build entry points?
> > 
> > This might make sense. I see that the tools: and tools/%: targets are
> > defined right above the kselftest*: ones. And they are even advertised
> > in "make help" or "make tools/help".
> 
> I am not sure how the tools/ targets can reach back into kbuild.
> The example with bpf_testmod above is bogus, as tools/* is only for
> top-level tools directories. Subdirectories in tools/testing/selftests/
> don't seem to be reachable.

I see.

> > Well it probably should be done in a separate patch. It would be better
> > for bisecting potential regressions. Thomas, Zelin, what do you think, please?
> 
> If we do it for consistency it should be its own patch, agreed.

I would keep it as is until anyone reports a real problem.

Thanks a lot for explanation.

Best Regards,
Petr
