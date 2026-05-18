Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A0382365
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124468; cv=none; b=JaKTMrmKBtPxPjUYsyJlzlbaUMq6JOh8UGoq/YqTY5PmLjTWPTxDIMcMYuCSL+BwEJKB1dvMWbd+PDnPkmjka97/uTYEsnBh7dHKlWA2yivfklqrPgahe6mvD+SZB6YigNeK/KBYFXL5kAHSNZB32nw5Fio8qY3ZQsMFq9p9sDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124468; c=relaxed/simple;
	bh=zE/Vm7BUS+l8KEqWic4e8QdhiPhAl0Evw0kWCWVgUWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ho/odWP85tcbZ6KzwbcNqRMIEoIf/ZW/4Du90GDjo2+FbWjIwmEdILXzVn+PNjGWPWU7TeLenYknZ60RD6kOVawBvcICf0Z6e8IR1CfCFVNmm+b0p27bxhHj+zlhhNsdPO5V4/ycVE8E7e2w65e4JMY+hfzfwI4/V8UkN6y2NBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g2vS4kEA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g2vS4kEA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b46da8c48eso1875ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779124466; x=1779729266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mie/17lkRLUMjsM0KsINx1+EcgyVqC6SUxpOF7YORKE=;
        b=g2vS4kEAxX3o7qAKPTxwEiPx7LwQ47tf6eb85+hryzS2s+gKHH3yoIqMgbbfmx5leL
         vQD6Y1BhJDIF5x+JmP6zFdOgkF3CW4tZsfcBl/u6qh5zCSCTn4wyVdt473irDo5ftgvS
         9n5DkzIlUqncC3qG6fZt66a+NXOLubWBFcKZJDM/lFgGq9O0bsdpXd7D3nQ+SsVc9ess
         4WeJ4z8ju43KkvtZkp7PjTdYtexNgA/oSMFNuhRQcwFeOc8bZqUmKjby6BsmtBS8KpXc
         +HqM6B9U+/XIB+C2H9w0MWAlLBb+ieRNMh/4r0sv9Q5RvLj4tTC6lAnWuE+7IAlp1yOx
         L8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124466; x=1779729266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mie/17lkRLUMjsM0KsINx1+EcgyVqC6SUxpOF7YORKE=;
        b=HqA7FMaCib1SuGMt2KC9MMyLdhPEFbRMA8VHJFJISmjCR4QuWhSVKGxYRBNOuM+DNE
         nsyWlonLpmPx3xxUYPUJKLdiDiOYj56yJWmMJ8UqzGbfMCZ4JAQAUc/DeIXxc89RXh96
         xCiH8kz5epV80jqZnWBLrrXJefjmxssv0714/XLY/dZHChqrtDmFg+EVkt3bXnamKO6n
         Vz3LASjHD4udXkhBPc8zJsfDFwNKGtAjq5EVYkW+jSgCWLvs7CAFAOSLngaHQmS0K4au
         oa/WNuK/bXMAlK5mqGHUV+iKiA8nH7VDDQmCBSnh+ijxz7N1WBAFHkp9zNDl4N885jB0
         zWtg==
X-Forwarded-Encrypted: i=1; AFNElJ9oGkySxCEjWWhkQby8lsq+c8vecdGu9ONu0Iv6dznLW6L+m9Zx1eWzcltt46+VMoaGc6fBnoPdJsjoJgaSS2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpImoMfkkbr8sMFU19YrRWY/HZxf6Vexl/yl8oTxCxjA8Nmt2
	qekryTM8l4DNFttHpjyEVLkqwTq62L7Pc+7yPWtDt1aTQcX3O6Ckyvyp+i3qGBXv7A==
X-Gm-Gg: Acq92OGViZACPCz5APqQs+foE+al0okGgBH6rNZes+x0ssb/Zw9VDkWI8zOVG9p40xZ
	GVDxz9r/B7SGbAhLqZCZ8sivXygXBKh62UuWsX5FWVmaybR4HH/7hc6b8WqxTF5Lr/tz+xTR/O0
	MEWJD/rgPBrwT0bx6wIL3Qy0meDDyfdOiH7GyuSjRmiKtGQx/0pjdl42R4Mog9O1NWskzRe1eN6
	66GyNwyxGqyIGkkNys2mh/1fNQ2A2/jYZjPYvEcrWk/ZXYAEfgdd2u9oiY6usnNFb5PnnthaQQ4
	uCpEkqOLtNuNbVCErWmVN6y2OqOyEGIIEK2RA9gxSLk4I6vfx/LmxHHJSrBP9mvm5h6Oq1uZrf8
	vmGlgFqwyK3Ne6KpgQ12P9ECJtHjre+9o6FkQEURhmdJRh5Lbg1PgB41Ja04QWXfW5VvvrlDR9L
	3ZdaRrQVLBR4EdAWyR3zaxuAjiK/PA83pDYDNl8Egdq7vdF3CJBmzIE6E/gEU0bW6qxiH1LgR2a
	SgUAzA=
X-Received: by 2002:a17:903:3886:b0:2ba:dfa:328d with SMTP id d9443c01a7336-2bdb30646a3mr3201165ad.1.1779124465797;
        Mon, 18 May 2026 10:14:25 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm13478319a12.16.2026.05.18.10.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:14:25 -0700 (PDT)
Date: Mon, 18 May 2026 10:14:21 -0700
From: Vipin Sharma <vipinsh@google.com>
To: tarunsahu@google.com
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
	shuah@kernel.org, dmatlack@google.com, skhawaja@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
Message-ID: <20260518170124.GA3352871.vipinsh@google.com>
References: <20260511201155.1488670-1-vipinsh@google.com>
 <20260511201155.1488670-3-vipinsh@google.com>
 <9huzy0hh3qhe.fsf@tarunix.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9huzy0hh3qhe.fsf@tarunix.c.googlers.com>

On Mon, May 18, 2026 at 11:29:49AM +0000, tarunsahu@google.com wrote:
> Vipin Sharma <vipinsh@google.com> writes:
> 
> > Add helper functions to preserve and retrieve file descriptors from an
> > LUO session. This allows library users to work with FD preservation.
> >
> > No functional change intended.
> >
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > Co-developed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> >  .../liveupdate/lib/include/libliveupdate.h    |  3 ++
> >  .../selftests/liveupdate/lib/liveupdate.c     | 41 +++++++++++++++----
> >  2 files changed, 35 insertions(+), 9 deletions(-)
> >
> > diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> > index 4390a2737930..2b04b3256382 100644
> > --- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> > +++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
> > @@ -26,6 +26,9 @@ int luo_create_session(int luo_fd, const char *name);
> >  int luo_retrieve_session(int luo_fd, const char *name);
> >  int luo_session_finish(int session_fd);
> >  
> > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
> > +int luo_session_retrieve_fd(int session_fd, __u64 token);
> > +
> >  int create_and_preserve_memfd(int session_fd, int token, const char *data);
> >  int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
> >  
> > diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > index 60121873f685..7bc6707d8bb7 100644
> > --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > @@ -54,9 +54,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
> >  	return arg.fd;
> >  }
> >  
> > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
> > +{
> > +	struct liveupdate_session_preserve_fd arg = {
> > +		.size = sizeof(arg),
> > +		.fd = fd,
> > +		.token = token,
> > +	};
> > +
> > +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> > +		return -errno;
> > +
> > +	return 0;
> > +}
> > +
> > +int luo_session_retrieve_fd(int session_fd, __u64 token)
> nit: Can add a comment that, once it is failed, retrieved status is saved,
> So it is permanent failure.

I think appropriate place will be the official documentation which is
here include/uapi/linux/liveupdate.h

I don't see it is mentioned in the documentation (yes, code does what
you have said), I will refrain from adding that comment here.

> > +{
> > +	struct liveupdate_session_retrieve_fd arg = {
> > +		.size = sizeof(arg),
> > +		.token = token,
> > +	};
> > +
> > +	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
> > +		return -errno;
> > +
> > +	return arg.fd;
> > +}
> > +
> >  int create_and_preserve_memfd(int session_fd, int token, const char *data)
> >  {
> > -	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
> >  	long page_size = sysconf(_SC_PAGE_SIZE);
> >  	void *map = MAP_FAILED;
> >  	int mfd = -1, ret = -1;
> > @@ -75,9 +101,8 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
> >  	snprintf(map, page_size, "%s", data);
> >  	munmap(map, page_size);
> >  
> > -	arg.fd = mfd;
> > -	arg.token = token;
> > -	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> > +	ret = luo_session_preserve_fd(session_fd, mfd, token);
> > +	if (ret)
> >  		goto out;
> >  
> >  	ret = 0;
> > @@ -92,15 +117,13 @@ int create_and_preserve_memfd(int session_fd, int token, const char *data)
> >  int restore_and_verify_memfd(int session_fd, int token,
> >  			     const char *expected_data)
> >  {
> > -	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
> >  	long page_size = sysconf(_SC_PAGE_SIZE);
> >  	void *map = MAP_FAILED;
> >  	int mfd = -1, ret = -1;
> >  
> > -	arg.token = token;
> > -	if (ioctl(session_fd, LIVEUPDATE_SESSION_RETRIEVE_FD, &arg) < 0)
> > -		return -errno;
> > -	mfd = arg.fd;
> > +	mfd = luo_session_retrieve_fd(session_fd, token);
> > +	if (mfd < 0)
> > +		return mfd;
> >  
> >  	map = mmap(NULL, page_size, PROT_READ, MAP_SHARED, mfd, 0);
> >  	if (map == MAP_FAILED)
> > -- 
> > 2.54.0.563.g4f69b47b94-goog
