Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6A72D1914
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778701; cv=none; b=R9iCfrIdOJlX5ITJD3Iwl0s8kdi+qxz5r6WsPnftP6X+vu9qy5INrXZhmIGajUBJHXs8yLsx1u64xCd5k2cRY4VJv4WOPyhG1k0mE4LUoENfw3XA8Cve7WNvteIx2XXodZUX7nDZEuNkHLQvXMVGH5jmUpk8puLi1dP64vmzbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778701; c=relaxed/simple;
	bh=gvGHC1vYZBsOAAWNUlWuTZOWh+DVU+X7VvCKIF8RYmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO7q6TL2bJMo/jjscLiaehZwWQ8anuBujJCX2GYYKxqoiGpE/tCwzlwin0is0Dk0tbBJEBZTQqCM/ez+MFx1g+9CBja0PUum0A64PIdkvMDmhvBZ2FEWCNGN686G0RUx0mhEG726iEi7GJTiKFCliDOi02T0cw3bvP1N/0RSEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzJs5c4P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qQtcEWsW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JzJs5c4P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qQtcEWsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774778699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
	b=JzJs5c4PreLLfkew2f4GZWcyZkKt49TbU3vQLL7+0zOTcGDoa4N+p674PcD8KxCVhCO7dk
	mMaExu2+2ENqDCKyEi86cqoRKigvX//mF0Yj5Qa7RsxD81Fqi5O3hO8s0CJbgaY1n9v5Ep
	QkWcfp5/pO70S//5Q7fRKACi6NyDzw8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-qzH-YiE5OmKccf1ni6yq5g-1; Sun, 29 Mar 2026 06:04:58 -0400
X-MC-Unique: qzH-YiE5OmKccf1ni6yq5g-1
X-Mimecast-MFC-AGG-ID: qzH-YiE5OmKccf1ni6yq5g_1774778697
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b069bfa817so44055155ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774778696; x=1775383496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
        b=qQtcEWsW3CfhblaNrJCYRI3oR/tmg5Lhk6LwPO+/igBnQKje6jgos14qeQ1guF82gj
         dfOWQs6xI/ZgghGfBOD1LWL745V8GcAFISZrlrrCn2dWN8jI5vZfoGmBXFDVEfSPOEd7
         SVGbokeo11K0AnY1fExMBswz26XovKMeY0NVKuFf7N3WfwfDSeA1L0pHpHcLOyqPYvg3
         vaxOinskOB/+dnf2JT/Bu4wOtwQNp+PDjIpr3Qxmuk7PcbSIOCmrrOFvP0q1zyJgdE+J
         Z6WE7iymFrE5rRrs7Oo36eDMQA6lGNdzfUOYJ1iV/QgO/u2n+Ij8cWMVNjKWDUvl00X5
         in8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778696; x=1775383496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
        b=SYQ3jU9zrxhyAg3hh69AP6j4zDhBqaYU1Q6B2cNgvecQ/yU102bb+myGJJexdRbDBr
         IsPRcew+gkHxUfsRzTbDOnlO5hOXXawXbVqDdCgOcElYxN+b4HTJ742PZxothRuhPf/0
         3hnMtyHzb6C/Kjym+5WPn4oYydpB07WeZqXY4o2h0XAGN0CvC+ZpJmOMph6rIYI7ubKo
         vLFaxyaGdqJKm7KuYNP3ZuOAItCxzTXHzi4RoIQML23rxXtcpjWPYAhlbDbA63ZUzwrS
         78cbOR4HJd9c/lyEPZ0942b0yoLCdQN+IhSjrtlCBNuT49OOZgwivwjJ3IrfdxoirN/w
         jdOA==
X-Forwarded-Encrypted: i=1; AJvYcCX/x4mPM0d+RV+Wo8OchOP04EKGkJqi5XkCQS5svuikTFPGWd4Vo2O7zY32x7SHIckmStjxA6s05gLvdGybHk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YweVZFUtEZdwOQDpj5ioKt1sgjQTgt3nrYNY2nWCo/mWnN9p6Xe
	Jw0VVYI2K+jFfXVnQxgIfeDBc9VUmTXZdvMyUMKhILl++rhzE9ECEIGHdSfG1bRsSOXjLYCx54z
	p1smWqnwsU4uxZAOTYT+yx6SR6UEHcZLVnF2sKop2ZDZyKglknoDJ6M9Rp149f23tOrWmNf5Js2
	9nng==
X-Gm-Gg: ATEYQzy1dcw4W/BDj95IyVlw4YBGRQjfAU8/EvVR7BoZ+hIWOgSYQEB1kwg33hU/RU9
	7sVtn511wugVRtt32CD+tSWEWsupk1mqWnA0nLv3HN9RPrK/r4rqArrKMx8/nEwflCIGBdPo6pQ
	Yy1ghpqYsy8rI1t2njuFi3m1JXohLFygcRq7nePtsz9/XjwYvi6+tZqVhPklMzrcofTlMm58I4O
	CZkGAvZLogcRV2pjnwj1YpjZmTaeZZQhrb4BJ5uXnRjV/ll4g6e7pLBvfUup9P1+//dylH4ndNy
	H7D3JL13n5bYDQOvFjU9Mls2j/2EnUBS6b1gSTEV0WEbd8cTpcZAAQcT0WRpqOlvs1WNcjeoTM9
	etQHgQWA5VtwWpWUNuA==
X-Received: by 2002:a17:902:e885:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b0cdc9b555mr90550935ad.13.1774778695930;
        Sun, 29 Mar 2026 03:04:55 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b0cdc9b555mr90550785ad.13.1774778695455;
        Sun, 29 Mar 2026 03:04:55 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766219sm44817195ad.53.2026.03.29.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:04:54 -0700 (PDT)
Date: Sun, 29 Mar 2026 18:04:52 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acj5RK3lze7o704Y@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>

On Sat, Mar 28, 2026 at 02:03:11PM -0700, Andrew Morton wrote:
> On Sat, 28 Mar 2026 13:56:50 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Sat, 28 Mar 2026 10:12:06 +0800 Li Wang <liwang@redhat.com> wrote:
> > 
> > > > from the top level?
> > > 
> > > Should use:
> > > 
> > >     make kselftest
> > 
> 
> I'm probably doing something wrong, but `make -j50 kselftest-all'
> appears to have scribbled on my top-level Makefile, so now I'm getting
> 
> ts:/usr/src/25> make kselftest-all 
> /usr/src/25/Makefile:5: *** Too many open files.  Stop.
> 
> ts:/usr/src/25> cat Makefile
> # Automatically generated by /usr/src/25/Makefile: don't edit
> export KBUILD_OUTPUT = .
> export KBUILD_EXTMOD = /usr/src/25
> export KBUILD_EXTMOD_OUTPUT = /usr/src/25
> include /usr/src/25/Makefile
> 
> I've done this twice in succession now.  Any suggestions where I should
> look?

When build selftests from the top-level, sub-makes entered via `-C` may
still inherit the caller's PWD from the environment.

Some selftests use $(PWD) in recursive kbuild invocations, which can
then incorrectly resolve to the kernel top directory instead of the
current test directory.

Maybe try export PWD in the ../selftests/lib.mk?

  export PWD := $(CURDIR)

-- 
Regards,
Li Wang

