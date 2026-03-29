Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9786C249EB
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776570; cv=none; b=A4n0a3ypadjr8WMS9zfK59WXXchutKsMtdmDSIyMB8jM8DjZKhyerOlBB500CcBq4dzGONHbY3/VS++tz1rYgMkAndLZNt4KHTZ4UCLXxYojfVD6WFIY7hO02y1EGOgMHanA/i6ktaukmNQiUF8j5+BENqEB5gkopO91vivXFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776570; c=relaxed/simple;
	bh=IUqBfh3kiiNzJ1Gj/LBXuhisIBbQ9zTjjW5Tk1XT5zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUHukEv9gfDIIhfzP2Z+GuIbqVf/w75eFGXZn/Ospm9bpKgv+beWqJ0aQ0bgzRVej6WRgHw5D+3FsklkC4l7w1Ont3UylzPXktN3o6smwVTOu7U3GKSBnSADhHsuZXAhvKz872KzqtJnfPX9UhtEs+b+N6QiuBzsYxFL3MBLpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBGfVh9o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QYtFRxwl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBGfVh9o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QYtFRxwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774776567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
	b=NBGfVh9oeoyw3pGKGQ1GP+sVW84VZNcDbARGsycVRWZNQGkZ9XXS2Gs0Dz152A63nr2J+E
	2Pzw2nXcbJmOYqcVebUwGfPyMLQZou9zn2PBQhhLImFYfFuTSaocS7yqmN7SPZOlwPkaMH
	ZeDczBYJnE4SD8vI5zlVNzDwWj9c7ZA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-cZg37j7oO--hIXdpt4rZQw-1; Sun, 29 Mar 2026 05:29:25 -0400
X-MC-Unique: cZg37j7oO--hIXdpt4rZQw-1
X-Mimecast-MFC-AGG-ID: cZg37j7oO--hIXdpt4rZQw_1774776564
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a88a2704fso1985374b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774776564; x=1775381364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
        b=QYtFRxwlGOQ4xrcgTXAzLJPQiHa45Q7+5s3bCBcoZ/6AapeYNfGUD1q1RtCbps6X0D
         Vj9zGlMEatN8SwEqWzgpGFg8H73s3/Q6cuGJrlYtyi1M/h5Q81pMoZzp+gSyi8iz1bM6
         FO5Q+vT0vKy6AwwwmRLD3Xkyr4wDab4lPqil3LdaP63qCK/VQm7wF36s190vL0LN/Qtj
         zX7qEldOFO/j3P3ef6OturMbValMIzYVG8zkkU3te2dcjS6z3uXsLHyd9IzvT268JRDW
         yHm8AYE79A5Z3ECkVyzm+UTg1UwoXdQyJc4wMeXGJCgr5krqNu9DMTl7IgaJB055MM3E
         Md4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776564; x=1775381364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
        b=BYenhcNUqi7Z7ijeDdQRDpbpBq1Nmt4P9SBnuUGWOsNklTQeKo7SsLtVkaRn7EPuHo
         1TZoY7PMGl6manqurE6Xkzar4bO5mN9FPrPrnob5EXnd+rYBy0Wh/7M6wr+C5UEaHgzV
         hhYUSchQGC0Sr8BqJiPjiWdCqPnyZMG3WDkf9YgTDzhrKZn6AxNpE8oplr462PH6d4ii
         MY3Nw/5sVQ9V+5PrkelDZqG9WbrQyjDymjp4UBeHsyMiuSTTFBntopHEWcpC3AqB1jAQ
         GQqHcnYQeamg4ZGVUwWD/RGKZ7dPyXBqfqzq1Y4z/DsjSP7ypUKb99kFNOCEd4uGtFNX
         5vyA==
X-Forwarded-Encrypted: i=1; AJvYcCWas2e6/Z1NX6JWy9VGFbe4ufJfaWIQdpgcJSkWc5tDV5GjvthNJ/b1q4ffKiYGT7ohb/mRcVhRQVd5aCh3WNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5CdeM8Y+KF1lMguroFUXd9Ao6E3XQv04+Son1f/0+YbCa6QHN
	riacK9UhR4d7oXUMHEPYdR9/O3DhHDgquSJoHm0X01P0E1KywC2mF/wp/yT+2DmWGXN6J7CVsZH
	cYIveJMj9LAq8yVIYYjk142IzeiW3WjqL0olxwrxgPWmkR6Q0CF0UMfPBQITaqnEfOiAqQw==
X-Gm-Gg: ATEYQzwKilYotqXV0ybtB9vInEkvwqRh6d9h3o8yd6xbyI3dhnsxE8tH+R02JElyH4a
	/u9ViVe7LCFvQW8VZqc/kJEuzFwDarXA5H6xHHMCKz2OOVViBYLFeLWUR8ec4FXVGRDybYQneYm
	iA5SxOK8BhTpach/K2WX6uJyYY4P7kzlsYZ6HSsaAyqloBIyPDCP/L32avIbZnlTIwWxdBuxUYW
	u2Xn/bPQ4OAX2kC/AecNbTubAEJMawXXdqanSB8yhUpfKJm0RtZqQAKvNbfY4l9s29VnBznGUY0
	dWVmH17YfY7Y/nJVaKfL6xnMvQvHlittMNRC4YxRuAgtyS7Xx21fzXR6JysbbEp37AYZS+mfmL2
	tvNoam7c8zWcIkQC+/Q==
X-Received: by 2002:a05:6a00:330d:b0:82a:7b0b:f946 with SMTP id d2e1a72fcca58-82c869f89f7mr9625500b3a.24.1774776563930;
        Sun, 29 Mar 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:330d:b0:82a:7b0b:f946 with SMTP id d2e1a72fcca58-82c869f89f7mr9625477b3a.24.1774776563436;
        Sun, 29 Mar 2026 02:29:23 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm4733804b3a.4.2026.03.29.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:29:22 -0700 (PDT)
Date: Sun, 29 Mar 2026 17:29:20 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acjw8FQNrSSpEHqM@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260327210929.f3a714186aed347f90f71246@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327210929.f3a714186aed347f90f71246@linux-foundation.org>

> > > d) within tools/testing/selftests/mm:
> > > 
> > > 	make clean
> > > 	make -j100
> > > 
> > >    compiles 3-4 things then ends.
> > > 
> > >    A subsequent `make -j1' compiles nothing.
> > 
> > Sorry, I wan't able to reproduce it.
> > Did you mean -j100 only build few source file but not the whole?
> 
> Yes.
> 
> On my 128 core machine everything up to -j50 works.  -j51 and higher do
> this.

Could it be caused by line#262 of selftests/mm/Makefile:

  local_config.mk local_config.h: check_config.sh
  	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh

check_config.sh generates two files: local_config.mk and local_config.h.
Makefile lets parallel make -j100 hit a timing race around that shared
generation step. local_config.mk is also included, so if it’s being
regenerated at the wrong moment, make may parse incomplete state and
build only part of targets.

Try this patch on your 128 core system:

--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -259,10 +259,13 @@ $(OUTPUT)/migration: LDLIBS += -lnuma

 $(OUTPUT)/rmap: LDLIBS += -lnuma

-local_config.mk local_config.h: check_config.sh
+local_config.stamp: check_config.sh
        CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh

-EXTRA_CLEAN += local_config.mk local_config.h
+local_config.mk local_config.h: local_config.stamp
+
+EXTRA_CLEAN += local_config.mk local_config.h local_config.stamp

 ifeq ($(IOURING_EXTRA_LIBS),)
 all: warn_missing_liburing


-- 
Regards,
Li Wang

