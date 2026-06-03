Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5333E51DA
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456244; cv=none; b=pwo+ndO4/FpJbR1ljn/7tt2L4MdHUzNYPs1FegkkPu3M5hl75YTkcPntZQBcBmfRwt/QsGUBdt0KmZ+oAn0RR/yLBb30ZPPKotqH+VCDEFz4HJGDfblZA/qhnk+NLB3XXkbvJL4sb/+7arKEWO/Ie7Ib4lST/Ro/7v2EtZo2lMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456244; c=relaxed/simple;
	bh=HVNkOPHRvv2OjTiFyRyfjJ8pj8Jxd14in2nZP9HrCGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa/SP1EwXrzyqgFmGRnd+guf1Rk2DGYy93rdk0OWF9A3EBMoW32zf/nSgfHOaaEVmDJeOLWhzzzuTjMzgBdIjgDdeGwcVs1SE2c4xAkQUM+ARFu2cgvPdvIR/k1G249AxeVVtwUJrOnwzMCB3qdAEsXNrf5DTp0y01hVptA3WWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Spm9oXR6; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Spm9oXR6"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51761d27612so22481841cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780456242; x=1781061042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkUPkSV1yVhPwfuKkUdfLaMgLJzqLtKdtBHH9XilSKA=;
        b=Spm9oXR65xzWaE7H22QQFdPwz0C2KkpSzCOPtbWhbo44tqLfsUjVKSF9+K0RuCqaJ+
         NPsll3cF0QrelaMuEvcsaxlDoatXR2w30bA/xyBG+Es14+hoadk7T7+SD/HwO1X/Kh3Y
         jw3AP6+BM8blpFjMnkdP7WegdyJBMN95AC/M3mu9SnxV/UCxwJFU5QRRGHph6DJmnuhi
         HWvBJQ7pQsS1gNAoJ6ibmshUMgo5dR9QaCMSXlHQjMcdnRWiSphX07nPscR2hxSJLdcc
         fgztBz1V8m2Lu6s8bW0cMKXXCiWqC5U42g/ROLl9C51TDHAVlpfPOzNSN0lr5WAC0OiH
         FUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456242; x=1781061042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkUPkSV1yVhPwfuKkUdfLaMgLJzqLtKdtBHH9XilSKA=;
        b=MZyUZGy+kSbCOpfd715pl0wK0UYXR25iRF1zFvQxTScXOUKRNw2fl46cPJdpDGcEWP
         YwUxk8jLCSG4wdX7iaQSsDm/XfBwxWZ/kFDlN3P1thlD+KP/tG9B3u+BfM93XjdpKr2g
         qIebm8c0lGpUwavFUpRjMj3XowRjbP9/XcOW75f2397zvGSdDBz1srXChfFOFilmEVRF
         iz8GT0STJ4fpmtCWO+RHk2Ifl8VpatUkpFBGF2ZY/0qGY3EdyhDaUBiX1jVg5TRGHbUK
         qF4AcQoXmHPOdfc84vgM9IoAWzgMspEK1DDIvt5Ea6WAMXvykh31FtkMiGKZPCNKht7J
         +m9w==
X-Forwarded-Encrypted: i=1; AFNElJ81YnnRCOzE5EUMJsQw7mMgrDEX2X+P90SO4J+dePwPDO3kQ1o1VA3sg3EdC+iybc/BF3dDKR/Sbf5g53w6Xdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrC0juZ0Xtm8QE/21BLzNHS/+LCrCrfFNAhY+2LfZP6ZbDF07s
	b5zAUIuC71eGg8xGnzUsRhdiS2yh6aplteJLZasi2AjDit7P55uKBEoMCRSRSlRMzFc=
X-Gm-Gg: Acq92OHt70xRA7UFLALTOKondqhVL2MeSmPV8OmqNfbD7Rxa6UcplXRj3i/MuF9fgzk
	lKeYDVsxqAxvsomZJVCNeWwUPduyHgkVAYHoQNOfBgUx+pdHFQUClxkqyTG9U0iIFgTkOejJhyW
	p4sDX2YYMKoCPgpjV52XoFpkUSpi0MWie6MxvmmJzGNgTkaD9zfuryIuWACsglNIIoSTtKjoOS2
	xGM6pAIhkeFCeDGhL6jQ0Dx4pL6uL6VzxqfMRNyKVFXCazlTxUQLXl2KF0AKreTRXtIZRwqkRr/
	97mxc2d2NayiJKUi6BpfamL0ub+nKphACSM7YfP78E4VpA1fU8ePjZcBO1+UoQ8h3qBdYznheZ8
	dQHWHJm5juEgGNGfWTM+dJrR95AnqHcwvRdvELaNZ6gpFYw9tmKJqqmxzUahOo5wv1cASAZmJbB
	lcLqlib/uEj/gfpG0LssZ2z4eQklM8VfkEeJREyEoiAsbTO/Hl46fK5r648SkNbHJyUBr61wIg
X-Received: by 2002:a05:622a:2487:b0:516:510f:2dd5 with SMTP id d75a77b69052e-517786c83c7mr29904991cf.28.1780456242538;
        Tue, 02 Jun 2026 20:10:42 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07f0dsm14637641cf.3.2026.06.02.20.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:10:42 -0700 (PDT)
Date: Wed, 3 Jun 2026 03:10:40 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
Message-ID: <ah-YOeu5PYa4d8xe@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-3-pasha.tatashin@soleen.com>
 <178038801485.119771.9514973100282773342.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801485.119771.9514973100282773342.b4-review@b4>

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> > index 146414933977..8d9201c25412 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
> >  	if (argp->fd < 0)
> >  		return argp->fd;
> >  
> > -	guard(mutex)(&session->mutex);
> > -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> > -	if (err < 0)
> > -		goto  err_put_fd;
> > +	scoped_guard(mutex, &session->mutex) {
> > +		err = luo_retrieve_file(&session->file_set, argp->token, &file);
> > +		if (err < 0) {
> > +			put_unused_fd(argp->fd);
> > +			return err;
> 
> I don't like piling up error handling inside if (err) statements.
> 
> As we only need the lock only for luo_retrieve_file() I think it's better
> drop the guard and use goto:
> 
> 
> 	mutex_lock(&session->mutex);
> 	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> 	mutex_unlock(&session->mutex);
> 	if (err)
> 		...

ok, done.

> 
> -- 
> Sincerely yours,
> Mike.
> 
