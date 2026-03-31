Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDB54763
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 01:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921964; cv=none; b=LXu3cbt4mSeHdepTQ6Cwjjdu8LFumq1mv8yGHXdq/h1/mjSuJAxzmz0/PIoU6TaR2Xgo7vJ8r6l06qye+mNEfYqy2e9ZTFOWTupw5l0VUSaEboxicOJFNLDioiP6Gw+/BHNKZ/eDKUc4/z22KAdWg9UeZG8l9GGesz+TeJ+TjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921964; c=relaxed/simple;
	bh=95rFrOHvCv7v/K+6MKBLyHqB0RhvY533VlWoYA3J5DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCUcux1kCSzQaM06rutSyJ340Utaodj8Leh0eWih3Nx8PkGQpHFCaQn4FUvgXVAwFWGOeftx6LcCiuEgKmhkbNjYcZtR5GPTSas1khmwrNBp0jXkELsJqzk5nKxWwWZbRE6nC9MunUZ/F0daM2hPKah/sqLJBMrZJUA7dCJO4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+6gSsM9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bw8Jei/2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+6gSsM9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bw8Jei/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774921962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
	b=f+6gSsM9yGzjkY18U1svJI9x69FZO2Fiz0YCr9XmW81+tYhW+lYEntK7VTbjXdbT15ZMvL
	d0bDdCmForSUJlVerB/2ip8/7f+m2hvs86FpKnR4iuASPgcLm1K9oF0K2xqb8PGBW03CR7
	b4hmWRW2pGwKe9Kuj2c9TDKnVm9+x7c=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-qjUSLarsNCimXt_tb2yooQ-1; Mon, 30 Mar 2026 21:52:41 -0400
X-MC-Unique: qjUSLarsNCimXt_tb2yooQ-1
X-Mimecast-MFC-AGG-ID: qjUSLarsNCimXt_tb2yooQ_1774921960
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24e9b4d82so24335015ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774921959; x=1775526759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
        b=bw8Jei/2aDiVHY7mCzcVehd1A3hfiw07IkMi2aCp3R65VVeCgxRvUQ8Sg0cLAvflBY
         TcvVTSyk8/9bO7Ms0IccJzqV3GdAsava68C82p0IEz3pXDDsxYw2urOSjyTbDZkZ6Wfp
         p/R6Kb9nXU8lwPMzmishYFc25RhUjvixuu4+qeLMGu3guiuWyf1APZqAHBDcQ+G5CoQv
         7krmZ1xaSl5YeIhN5rIfzmEQAb9OaGO7yRkv7/wCJooFemyhJrFmSPpqNKEc3iz1WRE+
         b9waE4/wQNVxKzHkqUK77f12UrVDgQO5bIzQMgh+7VDs14vK4oJI/veLXWMTUi4AKRwh
         gjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774921959; x=1775526759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
        b=Jb7Sg86CZ+GxpkO7Bfq+/t8GTw9SCm9/B8vRuAOnhvE1coAuV9bIm5KpXS9Bf32WfR
         WzDir52TtiaHfh4PhHj/vAqz7jqKOLh7L4lMb3trMlz4vep7u47YB5lsPOcS2k5csrOz
         4uip1Jw6ky+E5Dpa8IfXhhQaEIp4igPOky8GMy52q/LQTgSZ5HxenAl0kA9kC8pRcvDB
         SNeNV2P99OoxlytAB4apTqT1us2jr0LKkOGUbrZBlf393PtaJoHGSg+brEGEOnEeAt2y
         8aqR4wEl207OwTaEWciCzqDfSAJ43GhJ4InhRv2DvQRKnmpM6GYJAXIxPDOXDtWZ4DnH
         3xAA==
X-Forwarded-Encrypted: i=1; AJvYcCVfNqlpf2Hp/izUJWzX8Rkk9kkU0fy4OnWhibc59ung0JPMuSlkR7kIEoUHVgE04s/zrBCAbTFprUHxH8I0OFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Vmwa6Ovhfh3HR3S6CZ4cgxPL9d22knwtVbKRb4p8deFigfKI
	EX4jrmEgEB0kIVlQOupbFYsxF/6mE1++yEeHRxXxqnb1uOyKZQkp5vuJpQTA+nWsFunvRF5Ewr2
	0LtlroT83o27sKDssiEOG/UsbEu8Zu4QcePDonmNI5Kp4LnLxv9VxOoEBVdkO844UKvKIUrnxi0
	5b7g==
X-Gm-Gg: ATEYQzzYexAhd0bp75+sW7xcWNERHVWYklY6qR7Dbj3HjXZl3qlp5Rn5HhD1/+3m8WM
	BuwxTVBjY4g+M2ikLpXWRS4WIlHMD+het/38+bVzBcWsquUR6i2yRkaWoail4fYImWm1j8ycZhe
	jY8I6RuwlVCWlHA5TReNmQyqt4sPJb3wGe9iC8BAaIsTHdZrFeV1W1DTZ+hjB63M2vSsJOjpPis
	/W3bs2T2lVnFvR9gdKNteRdFbMEMZz0VGK7FGxVj6l/1rZWbSSi0tXU5MdWyHufFAgSFjGBPppx
	VYgcgTlPMZ6Ean1mTgSQCYkuP2zass7J2bbmKxvcH+dCbCC5IUSfpWeSR+1L7EpTmYXXHj3F/L/
	MgO4Iu9/B8WTtTpGDhw==
X-Received: by 2002:a17:902:da8f:b0:2b0:51be:f9d7 with SMTP id d9443c01a7336-2b25ef347c4mr15587655ad.18.1774921958970;
        Mon, 30 Mar 2026 18:52:38 -0700 (PDT)
X-Received: by 2002:a17:902:da8f:b0:2b0:51be:f9d7 with SMTP id d9443c01a7336-2b25ef347c4mr15587375ad.18.1774921958436;
        Mon, 30 Mar 2026 18:52:38 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b3a82f8sm64351325ad.63.2026.03.30.18.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 18:52:37 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:52:35 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acso4-02tZhFBnKI@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
 <acj5RK3lze7o704Y@redhat.com>
 <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>

On Mon, Mar 30, 2026 at 05:09:54PM -0700, Andrew Morton wrote:
> On Sun, 29 Mar 2026 18:04:52 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > > ts:/usr/src/25> cat Makefile
> > > # Automatically generated by /usr/src/25/Makefile: don't edit
> > > export KBUILD_OUTPUT = .
> > > export KBUILD_EXTMOD = /usr/src/25
> > > export KBUILD_EXTMOD_OUTPUT = /usr/src/25
> > > include /usr/src/25/Makefile
> > > 
> > > I've done this twice in succession now.  Any suggestions where I should
> > > look?
> > 
> > When build selftests from the top-level, sub-makes entered via `-C` may
> > still inherit the caller's PWD from the environment.
> > 
> > Some selftests use $(PWD) in recursive kbuild invocations, which can
> > then incorrectly resolve to the kernel top directory instead of the
> > current test directory.
> > 
> > Maybe try export PWD in the ../selftests/lib.mk?
> > 
> >   export PWD := $(CURDIR)
> 
> Thanks, I'll get onto this stuff soon.
 
I have created a patchset for those build tiny issues,
let me send out to you to have a early try?

> Meanwhile, shouldn't this work?
> 
> ts:/usr/src/25/tools/testing/selftests/mm> make merge.i
> make: *** No rule to make target 'merge.i'.  Stop.

That's probably because Makefile explicitly disables the implicit .c to .i rule.

In line#43 of Makefile:

    MAKEFLAGS += --no-builtin-rules

I doubt do we really need to add back the 'gcc -E' approach? 
The selftests build system intentionally kills built-in rules to prevent
half-broken implicit builds.
(the comment line# 33~42 in the Makefile explains why)

-- 
Regards,
Li Wang

