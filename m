Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8085524F
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Apr 2026 04:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177478; cv=none; b=KA/hzBlFImmryhfOb1cm6QteU2hCxEicUGcy38pUrkLHPXpNXbI4TKwJ4VWhu0W59FHmys7B+ym9GiAyZJGRBTo+6t1D+myxqcooAAXllvRYqrfg87KrGYD8w/Ob0oLLd3YHN3G27lPZJn4/y6a0KryeqmdFTa9lOAITvbv+t9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177478; c=relaxed/simple;
	bh=jqKbTvrhLLv6M2A6PKYdhZjjnEdCSJ+gACEo1eh7pTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpmnxTzsFsqKB28ntXpMEgf2doaXn5V09faYi+V0O3aleGgqLCnlGZUDB/aVcOfUpGEOtlzxhPiGjBUHO6K9xdyg5309R1iIF9vIkQBE+eFz647k+0969+WHjUH2ctkgGbEOBYaM2n4t2buCzKht65G6+qrtFGU9xMdzFJdk7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kot6lPpD; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kot6lPpD"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2de831d2b20so1203830eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 25 Apr 2026 21:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177477; x=1777782277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+YpXivrfSMMmLk2Cw2soTR91gmDOVGg4r9ajSzwj7Ls=;
        b=Kot6lPpD5s5uGfENryq2Dm2tW0UrEzpefAZCxrK5+HUs4/f0UYoQ5kaBkAwW5Oxl8G
         cyML/ME+9xKageaPHlJVdp8sJ7t5/N/9zVUpzWbPdehZY2lxZ46N0bKJ/BzJbqOV7u3N
         kOfxCwy/OBltIP0abL7WgESyQuFwYhy0Fobn3FRRcmnm8uNL2O4+awlOusrOcwWI+XBi
         xrK8/N+ijbTaOgt4jZuGHb5d0rAPd0LIv4RSrXmKeB1B0IN0nP6jJ7I/4fhLz7BdNAv3
         KQ96YQfT7LSRPGu5DeTXcngAxP/5UqSclJq+5ERhqYr5osEIlm7MrksR18MY7glNVdKL
         sVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177477; x=1777782277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YpXivrfSMMmLk2Cw2soTR91gmDOVGg4r9ajSzwj7Ls=;
        b=iaJfuRiwGNU0L2y9JcT7B2oFCyP4XL59BEbKPMCiDG35XZI6V4Z45CxAGAfW5N798X
         O5IlV7CYX9BhM8ekv31FI+9wvGl6LFcTfVUVEEe6jtoJQikI9lnBAQt7LTPZ1YYHGCPQ
         ZM2vJ/oY5mtjYonhantjzOYamDSL2IYX7U6B0HiTJZSYRj1sY4pW8GhK6xptnb9CHlYR
         k99VUkfXnOimrDEKwT4OfzQkiPlCPCypT/57nLCsbaMdU+yvL/cbUkoW6qwddfaaxLd9
         faQMdfxiZHg/Juo0VS1xSG4a4dAiYSM7XVZiTlLgotMgFJJhJzAC5iUca6NrVnFjIkOZ
         sraQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YNQ+pkboXW81mDoceyPvGVf6ldK57wR/I4xZ89W94eBxsBotn0xop0PRk/6SL7HfIlluaRDCrPotK9nve47A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzh43bE0gOsbzlrZO+tc7it9XnhTk9+5D7J6Szta77FQ9Fet3g
	bV8Kf2r60Yl7d2T1X4PywD+45Jfu8643HlLbAPo+VT6BcHviHzmO97S+
X-Gm-Gg: AeBDiesI8KOGIvUUZaHs2lkw40SAeywXKSWx2ufAObHJRDpRJH+z2/c+w9guiuEwoZH
	Lp+l6LtU7TZ9/4sbN1iH7z4Nmii2xU2uAa4STCo5T9z5zR5TJIvJf5aNhQrmw1E+YvM+I4tJIsw
	utiM4MZFOHkMCYg5fucdKtsbixBAOh1KTx7hvmEjothEjuom/SzGHknZLS6VUIOZtXAJL+xl2yL
	/1S52xumUV8t+FMVf6UycIB4YN874ZJ0rJPoXIKeHTp07zJW5cQ1q+1AdkDed9jG6O+wGQ3Wa4s
	m7yoDgp0mOOKPy0EKDiPKBLVGT0LzEF79Bl1P+Yv0LHY8mQZ9jYbcR0ozF2sP546pkZKuATKDvw
	VfkX8EDX9LwdJGdnbROOEXgomx8yyMNj6W1vucjap6HMfAzFqnNlp6VOAVErO4lDoZarm/xW1Mi
	j7TvbcDo2X8Zf5dOo0ukJFIoOEUNUM1Tl4XWZG3isWkphq5N0ZD52argdt8v8tf7ZOOEL27Qs/W
	Ro=
X-Received: by 2002:a05:693c:300c:b0:2dd:c066:bfe with SMTP id 5a478bee46e88-2e478a331bfmr24126557eec.21.1777177476748;
        Sat, 25 Apr 2026 21:24:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f359:aa0c:530d:9dfd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm38712982eec.12.2026.04.25.21.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:24:35 -0700 (PDT)
Date: Sat, 25 Apr 2026 21:24:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <ae2TMiUFAFd0-VuX@google.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
 <aepWdKzd8GPeayNJ@google.com>
 <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>

On Fri, Apr 24, 2026 at 02:26:38PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 23, 2026 at 7:32 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > >
> > > +     /*
> > > +      * If the primary firmware node is a software node and there's no
> > > +      * secondary firmware node, the primary will be affected by the call
> > > +      * to device_remove_software_node() in platform_device_release() and
> > > +      * its reference count will be dropped by one. Take another reference
> > > +      * here to make it have no effect.
> > > +      */
> > > +     if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> > > +             fwnode_handle_get(pdevinfo->fwnode);
> >
> > It is possible to pass already registered node in pdevinfo->swnode
> > (because device_add_software_node() can handle this just fine). In this
> > case we also need to take an extra reference (or figure out whether we
> > need to drop the reference when removing the device).
> >
> 
> But device_add_software_node() checks if the software node is
> registered and - if so - just bumps the reference so the effect is the
> same as when it registers the swnode.

Ah, yes, you are right.

Still please check sashiko review - I think some of the concerns about
error unwinding are correct.

Thanks.

-- 
Dmitry
