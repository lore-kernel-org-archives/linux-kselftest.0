Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27470EED8
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908741; cv=none; b=tGsThwiZ/rzGwo4lazvC7ktrUg0/jzVGyvcVDLKkWlgJcaHWD3/WOylZpzVySViKq3FUD3WmSGCCJMFVo81xq7jHIDc0glLel27Fe0Tr3dl+d4EUrZ7WnsWS2HY5rEhQOGpUnHM+ORMIVq8ageOv6CYd6I/ExPLU/4uY/aatS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908741; c=relaxed/simple;
	bh=c19bk59QINY1kuvBH/nzmxB/WX9HqyJCd38qB52kWUw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9zp41vEzMpKL+KUiHJRlayMM64HPg413C01RM7zIbiDgNT0xlv1BOqEZba8Mk3Z9k8S6HOlKEcfdXSP/MDBaD0f4fMcrhkpOlod4hT3uQA+XfBbSOLZ1pYbzrsJ3Pj3wvCd3TLQUPFOguMDOvxYBUx0qwtNbo9zZx549KgsW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Seho5LNX; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Seho5LNX"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6e665bbeeso78247a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790908739; x=1791513539; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0JwbUYYrULzWB47hYNIr342NMFY/RUwXnmibkziqko=;
        b=Seho5LNXBedsqcD7q0ZdV5+fzIVuNSj1kDJsjg4ATz1OTyV/WHCV8nVIYmxacRLVHF
         +CrdUB8gxqCw05vGt0NgMz+MEomeICNO1btZjjFqOFXc7x8GpWD+bfLvw8i0le+XgWMp
         uy/H+ewu8TOzmj8k+PiCnOzvDTlojBwu9HQztOT+5p+kbfQsOBba8mR5USMuyObwcOWc
         3aBIaXIJwDYRJTPGW3phBRz2iqJ7nxtf/sWWYiwiOaNkAhH2i43wqzHE2tDqFx5DGHe1
         1WyRqmB2WtRC7TFBlQZRD6ui8hPmUawTX/wIRv9XQPbvd2ytxvtLStGyTd9CAqEqRMrD
         eW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790908739; x=1791513539;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W0JwbUYYrULzWB47hYNIr342NMFY/RUwXnmibkziqko=;
        b=bVfJ3rPTHsbZzeQNiWFudzBaLw1ZHrERWVKOBQLjFbUNj4A9+gyHePg7fSyv5K4Bz/
         E+Emr05z+DOB8IEUYhThdMcd1VZXPmI0mHv6uZ+xEv1H/CsZ/fp1IGeYSwlJTz6upRaL
         VGbXJ7cGVjpuNPPXBsZjd/IxyoqDfL+OBmmJQUBcG3ECqgv+dl0frFxN+t4t5PZr8H2A
         wiNTacJObgrBWK7b6GXPbjeyh6FQ5TFKuz0FMfq/0jkPXo2L/7S1nRwf8/R2w8JKJlMX
         mM7UaL8cqqWx0z/VkaHmdhjFWI2WerjFjUsKVfuWJw5w+6kDMJQ5aZA6nKrUOs+11+EV
         olUA==
X-Forwarded-Encrypted: i=1; AKwUvBzL+SdnEQZM4Jgvk0ZNts+YlRa3aFTivUsLD3uw6zjkystc0IZKRe2kZGsoIA6QqC1+TekkhESamKXvxVymsjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaCBSpr/n2Pjhsyuw7hI7DDK0ux7mt6RMneBmuuALpP6g6DCKs
	HS83AFpt5YdwRhNtAShpQd7dDi8e8PdTPyHv0U+Gl8OXx24DZ36zxAzh
X-Gm-Gg: AYBFou1vzDsb34zit8HFzEG/MviKTloh/2n7NfBvloaZJNGkz0oqiJ5Lj12udGFTo6q
	t7IjdoNFRn4a+0FnMH6nFs4mbhpwbGAoTkMsZEaT/Vz3ErGoESoVgPl15IzmMRKANTaNmV8oXPK
	/YaFIZS2PkN2nw1bVJ5iTnEIrREbkN1MjGosSEDb5X5dr7QacW9mmtqTiu4YYJwUFMHWQQw9mjo
	WYy6moO6F+zRCvLipsgbeUV0ZasiAjw41+bbsGGiAWIuwcossnza0HO5nf2LGVypOn6hKWyeg4g
	iqE+yi4cRa8MrixB0ohK6ph5N4GosnKKMjHnnyvTN9jCTz6Vs0jNxRZ0CS8/SGOya06kg8Sny5q
	26LjRmkQ4HqYyw0xp2cBYbAhoVxKUoQn2AlxUB9Acxilg0npWuybkR9tlazh+OPPrVLE4Ewbzaz
	aES17oHNWjOlDoSm12meoDZPfZyQtHocktGpXQM7FFBctXdyraZzp+3VorzEMuDHQNWnjV3pZft
	IHsghy6oadWnzuW1kojWhy7gBMXYeWevGADL+nxAZKnSRpOcw0TwJfTrvMzga0cs+XOJ2BK9fKS
	pcUnWcit6RlKnQk7cmB3+8FgVe44EGVG1MGuwclyR+FPGnuKjsOU
X-Received: by 2002:a17:90b:4ecc:b0:3a0:ca1d:b40b with SMTP id 98e67ed59e1d1-3a6cec84dffmr1148635a91.50.1790908739319;
        Thu, 01 Oct 2026 19:38:59 -0700 (PDT)
Received: from mars.local.gmail.com ([240a:61:8063:c5f3:3cbb:dbfe:34ef:b37e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bc991sm6682074a91.4.2026.10.01.19.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:38:58 -0700 (PDT)
Date: Fri, 02 Oct 2026 11:38:51 +0900
Message-ID: <m2se2o3jyc.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: johannes@sipsolutions.net
Cc: ljs@kernel.org,
	david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
In-Reply-To: <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
References: <20260929235711.2287931-1-thehajime@gmail.com>
	<20260929235711.2287931-2-thehajime@gmail.com>
	<bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
	<ar4br2vW7yZGd3gt@gremlin>
	<94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


David, Lorenzo, Johannes,

thanks for the comments and inputs.

On Thu, 01 Oct 2026 19:01:45 +0900,
Johannes Berg wrote:
> > >  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=nommu
> > > >  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=nommu
> > > >  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
> > > >    -c nommu
> > > 
> > > Is there a way we could derive that from the environment in one of these cases?
> > 
> > I thought maybe uname could help but our LLM overlords tell me no.
> 
> Hajime originally wanted uname to indicate it, but that caused
> regressions elsewhere, so we dropped that commit. I guess we could put
> _something_ back?

systemd uses uname information and our (old) patch changing the format
triggered the regression.  thus, we dropped it.

> > It pointed at something though.
> > 
> > In fs/proc/meminfo.c:
> > 
> > #ifndef CONFIG_MMU
> > 	show_val_kb(m, "MmapCopy:       ",
> > 		    (unsigned long)atomic_long_read(&mmap_pages_allocated));
> > #endif
> > 
> > So MmapCopy in /proc/meminfo tells us definitively, weirdly enough.
> 
> Hyrum's law and all that, but I guess it's not highly likely to (want
> to) change :)

a runtime detection is nice.

scanning /proc/meminfo might be useful. although it requires to mount
procfs (we can actually skip procfs mount as it is optional) so, this
is not 100% portable.

checking ENOSYS like syscall(SYS_mprotect) might be useful but I
wasn't sure if this is always the case of NOMMU or not.

My original attempt was to use include/generated/autoconf.h; with that
we can omit environmental variable or command argument of NOMMU=1,
but gave up with handling standalone build/test case which might miss
the generated file (and complicate the patch only for the NOMMU
detection).

So, specifying NOMMU=1 is my previous, though dirty, conclusion.

-- Hajime

