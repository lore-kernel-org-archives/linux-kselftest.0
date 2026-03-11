Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27A32868AB
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235394; cv=none; b=FIVyMNDWjhjAARcfOY2zbGS34diKLFnPDjnwL3T3f7HiM+Bwex49Zl6qtMr+dJm0xBRVs7gyoouVVTaotm4AYgJ3k+pZoljlfyLExEoVcuwncjN5g7qjGKU/DDOxL4cyyca1gPSM6oZrsQy30hGQOb5La+udDqVGp74eo5pQaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235394; c=relaxed/simple;
	bh=xlIe232Pjbgx5P/lvUuP/9vc3tHDKa9x4I9fpHA6aM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj0nZZnYFMCtij1j0Xuh61TIz5wy0b/puZVqQ8I1bVMFOiS3APWSFsVxfs/0HClkiiZbEvySpTuGgWPdFl0jw6jFQNIS1RCBejQwMcCqTnbay7B2LveHfj2YkoZ2pjH4NJow47pitxeJPbJwpt/e8KRnKcqrTLaJwxx8seZaoZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f/+ougkR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gP77C/9a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f/+ougkR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gP77C/9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773235391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFU9zj5y+YlkWb3+Ey9JDNkm49VSOYC3zbNZmg5ZPAU=;
	b=f/+ougkRHCsi9EgeOvsJJRwRGyNWGOvusInGUyFinlhAhcftWjw0ayjDWWcLDqs9IolkC9
	4eHMLulKnzkDHCq9JZrNLkharKwj+bY7sJwHdxnqGPgOGDn3gDXV81wzVTpKqgltyhmfNs
	a6cya438FW/bcQ9zqaWy3woI2bD7FjA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-JpbXDwvMPO2jUVy5Sgv7vA-1; Wed, 11 Mar 2026 09:23:10 -0400
X-MC-Unique: JpbXDwvMPO2jUVy5Sgv7vA-1
X-Mimecast-MFC-AGG-ID: JpbXDwvMPO2jUVy5Sgv7vA_1773235390
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-485397788b3so40377465e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773235389; x=1773840189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFU9zj5y+YlkWb3+Ey9JDNkm49VSOYC3zbNZmg5ZPAU=;
        b=gP77C/9aSZAA8zX0R0Pfq2/W5dMW8tmbMSiWaDtYlFev4TO43QlHccoL0c/gfl5Cax
         TdcnvQ+yNdQWTvcPANQxchkCl3D0m2SjUqNorAi5aKlusa1fIxwk/bOmtrX9uEO60fJe
         /8k/PCi8zKCmY918djpoHxXK2HN320wdFa/W550lJfp4poLKakvS7dsAm67H4qrR/8he
         8Z+6JLqlCp/ou6XZfEx+xGzfHJP3vbNGWu+gf0qWmxsGNoClGFv+k9ni4/1REYyDawZs
         GPcchbt5gxNhLLWjZMjY4FgoIHbZz6VA3VF43au3UIES9l7G1bhMhdRmlvXh5QViFHLL
         35ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235389; x=1773840189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFU9zj5y+YlkWb3+Ey9JDNkm49VSOYC3zbNZmg5ZPAU=;
        b=f+NWNY8hMcy8Hh5XIaM2ds+YrWiOq2PcPo0MDpH7KbkNZCYCAs4gZ0SGhTioWHAs7Z
         KINQhYIjb6txrzY+1Zkwhx2kdW/kSoIuG0zZGo2C3DNgJEtjhzDd/dJ/sOF7dE2rOoi2
         92GpLFPmJqDcPqL3rPHQj17SJIe3Vx7O4fDmtJyKsLO3gQR7OyLgvrcnQOiM3iAbPJQC
         gT6YtJO38A/SiaxG3BJU+RfJ1hE/G3g44XMehkslmV/COx3T2BqdP9O3HhdnysmdnC+6
         V3dgivGDOiJ1DQoVU3yMAQlBs9T3XAqWIOI6MCWXv9Q1IFxdpEgMi7+VGJh0HvM0kQuR
         oCxA==
X-Forwarded-Encrypted: i=1; AJvYcCVkgUsdUcN6ZoCZ5cmLj8L7eQHXC1thq5iHt5J5JctmUXTChk5SISdyJkne+wzGXeCvlWPy5Ni7l18P5v5+iU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEB9JHNgu3OunpmVhD7pkftnHxwCd2/RId15TRziEj8PolTiq
	GBhckiEn9O7dY8S9tEmH75mXujXS5ua79PvBNKFbeDwwBusSIZK21fz/fKrVrAwaaig2vfFurFs
	NOIbvtx4B5Bc38YrWKu1OyUq9qt8Ygrl6owmLtMqyWeTuyxWP0epQdglUnwl20phEcSW5wg==
X-Gm-Gg: ATEYQzxU6RwFtQyHRRrjAOmx4RkCCQhqA57WL1uEFotsUWzz8BeUouRrpXT88akM6dm
	Hhl1ETCwk5mNN7ar+v+MCg36VFwLGT4YbOctZCTmsk/VP6caBD0luXzoGuoiXOYXBvYwntyJMnE
	bZxFmT1Ul1gwmKK4GhPWzbCGD3yYQZhyME/yD1WCTHTUwWJcQPdR1+xgV9u0/+bkh1wXWxggAZv
	Z7/kV0e0pRyTsuGwAVsQdtDXUNpZtDhClehd9r8wkqVYlvjuivgTxAPQEPvcGdLzwhFzDqfLpdG
	3xrtc/RNPFt/sSM2OUkO/El8uTUPghDOMAhSfV+I/gqQvntR5r87Wi0thUyyhLDFHVfNv47SrJw
	K+5L9G/oMdAIedgxD5QauZ21zOFBXQwwz7e7oh57ufFiKxBQewWQ=
X-Received: by 2002:a05:600c:1f87:b0:485:42ba:fc8 with SMTP id 5b1f17b1804b1-4854b0a547cmr41170805e9.4.1773235389324;
        Wed, 11 Mar 2026 06:23:09 -0700 (PDT)
X-Received: by 2002:a05:600c:1f87:b0:485:42ba:fc8 with SMTP id 5b1f17b1804b1-4854b0a547cmr41169975e9.4.1773235388832;
        Wed, 11 Mar 2026 06:23:08 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7352427f8f.8.2026.03.11.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:23:08 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:23:06 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 5/7] selftests/sched: Add SCHED_DEADLINE bandwidth
 tests to kselftest
Message-ID: <abFsuvsmEdoypYs4@jlelli-thinkpadt14gen4.remote.csb>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
 <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>

On 11/03/26 09:31, Christian Loehle wrote:
> On 3/6/26 16:10, Juri Lelli wrote:

...

> > +	/* Start one cpuhog per CPU at max bandwidth */
> > +	printf("  Starting %d cpuhog tasks at max bandwidth...\n", num_cpus);
> > +
> > +	for (i = 0; i < num_cpus; i++) {
> > +		pids[i] = dl_create_cpuhog(runtime_ns, deadline_ns, period_ns, 0);
> > +		if (pids[i] < 0) {
> > +			printf("  Task %d failed to start: %s\n",
> > +			       i + 1, strerror(errno));
> > +			goto cleanup;
> > +		}
> > +		started++;
> > +	}
> 
> Would it be okay to just have one task per max-cap CPU to make this pass on HMP?
> Or something more sophisticated?
> 

On HMP we should probably have max bandwidth hogs on big CPUs and then
scale runtime (bandwidth) considering smaller CPUs capacities. Cannot
quickly check atm, but that info (max cap per-CPU) is available
somewhere in sys or proc, is it?

Thanks,
Juri

