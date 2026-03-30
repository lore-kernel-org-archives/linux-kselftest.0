Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA63CF027
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878244; cv=none; b=ZlBD5GNaBj/RaP9E2iTkTBA/ryDMHvsHT7tryE3BiT9ZxWA2Imle71B19m0j8wX9FrddWE6veVNrf8QMWbnbGYkUQMJCNTVwK/k/Zp/6nvSmb43mDjGaghhOhrl16AZqpV+BygwHw2DS82Q3D007R+tSgFuOe5qW5TTC312Q2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878244; c=relaxed/simple;
	bh=xAkSICz3YbYbLRx33yS/PX4Q5TGmnFPmB+CxO/HhMQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au0ef7cOrrjJRz52OMbeLa4GWnXcDS6rV+moOSvFJB2Zj0Lt3CRJqaJBibu54MsuM5KL9GjcdPm3EdI9Q8G49ejzSn1iaBNl1vLQed+p0sX5a2Nr3ZEuFOmsB+oWeU2YIZ5OlHsMHmqcM55p33wdu8Ymtks/zMdNFQx4fLRSQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ggQ/nLNz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ggQ/nLNz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfbd17589so1180843f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774878240; x=1775483040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3ZGzJVCnNmeNCqoUl4L/iCu0K897W7KXdQ1Y7sD5VE=;
        b=ggQ/nLNz/QC5rGkzz6kNlzqhwiOa1yc880L9DRaJFWmXEjoX/cIg5JxKDinY1C8G4U
         geP0HGQbZRb+091DObiY4kquf9Au+omFv0E9kuOQ5FPjgYA8CKmY7b0ISz1kEw+igbed
         ofHN5Q74SCGQSmKW6Qfg2FQjIx8onHyCT5HE8nWKzuIz0FBbL7hbfy81kPufWyBY4FH6
         6qtl9VBv9cMHRSSk4XJvTK05Az7cwh3DIKAmd3KCsdf9qWUKLb+OQXO547CccLhQIWYI
         GQc+IaMlmKlcY/zBVT6U+sd5XEp8p0CvEF9TvXDS03bh2KzhUPBpOnN3HVdZ7fnsc103
         H/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878240; x=1775483040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3ZGzJVCnNmeNCqoUl4L/iCu0K897W7KXdQ1Y7sD5VE=;
        b=EksRVPGMAV5qHYvq83/NOxfaQRPYMZvjec6k8mjN93yxyacKlFsGhgz3B8ToE0UCJ6
         InveHW4peLQHXbfvzLpsFQ72vWSBEBm03CFVjx1Ubft4/gL5S79xiS1X252SZ67Jeynk
         CX9NeIyXcs4MmRfiMAeybVFOk0HavaOIjN7+sIVj6EJvFSTXvWZ4UYUAeQA9SgZGBF9t
         aCeNJSdgHMrSAaQ80JhBYSsD5dczOWuPAC2T6W1b3OHS9Az0IINojZsRwzaPxnae+Z7h
         iIjhTw7tnvO/5vPu4uUoSWvgymvrV3+6HEkgYxH9Y02Ox4xlfyf1Kul70ukuAK2wqdQf
         jg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIZ5k5MWf8lS7wpcXP8r3aUf377PQ7ACx2nH/cdXVjLS37AO+kTDPmpy0UIMTkq96hTZ8NLNHOy+sgjD2zVxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDAHeWnI4ReCRL8CnbbbKWdkEIh54MI/2iTadl8bdUssiYgoG
	pB0nsXH2bXzM3W7fIvSprFDbQiwAiCiJe3PRX+qHoFX7/uziGEk6mOoVsNPG1yuk+91YuUY4hjF
	g7YREPKQ=
X-Gm-Gg: ATEYQzx0Og0gJGRinVuVwTNIem1zb2NPGB1SXW3tfKom2sTvLJz3VHcDFHsKx2X/KRf
	ln9X8MNVZ7uPeLRnXfL6uCrT/i/oaDSLCyc9utTuQ6MEBdww8nGRjLsYILX6z5yKMx1+aQC95oP
	yzaSEO5TUo/isMKCld2/9PYIu7KeuFT+0ciHQiGDbQbZgPt3nRQ0EPFcshGewtIW3N3EJJ8Yf0E
	dSZ72x0F+XoaRpIwVQLaGpKJOyJ3geyE27a1TYE1by4AQmBnnTNldC+WAPqH5DxEe/3RRFrC30o
	lSd8KtFzerZO/WpoS+mbj2DCpG3RBbXMILYEgWSEKQeE0I0WVTi3XpiL5XSCxWbYqjtrg60s+ts
	ocF/GDPWBqcfU6VXsAZmC8WvlzAD8s8ufvqMphPdF5MldzOqSOps1rkZFdZuXfpFfGDYqfq06Tr
	7tP9tPG/vWAJ51QnCA0ezaVqJxMA==
X-Received: by 2002:a05:6000:2505:b0:43b:962b:5314 with SMTP id ffacd0b85a97d-43b9e9e8f39mr21060657f8f.19.1774878240171;
        Mon, 30 Mar 2026 06:44:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21ebef9sm20099592f8f.13.2026.03.30.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:43:59 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:43:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Pablo Hugen <phugen@redhat.com>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/livepatch: add test for module function
 patching
Message-ID: <acp-HYTmlaWYhS-h@pathway.suse.cz>
References: <20260320201135.1203992-1-phugen@redhat.com>
 <acVD_NPu4JVRoaVK@pathway.suse.cz>
 <acWZ3r2CoSDy_NLf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acWZ3r2CoSDy_NLf@redhat.com>

On Thu 2026-03-26 16:41:02, Joe Lawrence wrote:
> On Thu, Mar 26, 2026 at 03:34:36PM +0100, Petr Mladek wrote:
> > On Fri 2026-03-20 17:11:17, Pablo Hugen wrote:
> > > From: Pablo Alessandro Santos Hugen <phugen@redhat.com>
> > > 
> > > Add a target module and livepatch pair that verify module function
> > > patching via a proc entry. Two test cases cover both the
> > > klp_enable_patch path (target loaded before livepatch) and the
> > > klp_module_coming path (livepatch loaded before target).
> > 
> > Summary:
> > 
> > IMHO, this patch is perfectly fine as is if we accept that it will get
> > eventually obsoleted by my patchset (hopefully in a year or two).
> > 
> > On the other hand, this patch would deserve some clean up,
> > (helper functions, don't die in the middle of the test) if
> > you planned to work on more tests. It would help to maintain
> > the tests.
> > 
> 
> Right, I think this was a good intro patch for Pablo and that the
> revised execution flow would be a great follow on series, if he is
> interested.  How about that?

JFYI, I have committed the patch into livepatching.git,
branch for-7.1/module-function-test.

Best Regards,
Petr
