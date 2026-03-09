Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E3B376BCE
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047499; cv=none; b=c5CsxX+OvR/LsdatGbmWMXbnWkzRDeefUoLLTCDG096bInLF4XxXWK1UC2IYKI3BaW2caJZM6XzirC0YZ663iw697QrX4frC7GLpZafvo78Xb/2S+gko8scxeFl3AQgB34bAaqyZJ0lILJlW7TEk9t5YUA79htQmtfAihX77YYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047499; c=relaxed/simple;
	bh=X8hMRIAkzVTHYeJ+gXphdD0BWPvXLc/GBaAY5hI8UFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAmS2l8MMZbtjifQ5oqoRCNcsHaPdvIOcQPifxd9bb2qEy+G1TxJthTcWDe42ISqDkL6wwVdz3xDTZcnqYWlTe1LNM7VrSTBwQzgFBYzfg9HyL1cGX+ZgTJZZTj5IPBONjSp9cVmh/hGF1UjIIaiGaYYVrpWPRmJ8ruEYQMY+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OE/MHp+T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mT1ZHdNM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OE/MHp+T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mT1ZHdNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773047497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oWnQ6pc6nNaZ1IGr6HMkh6VJu+iJZRS4rFk9lFROKi4=;
	b=OE/MHp+Ts0p5flqNIuohxIblQ77JtQOQYdgZJmgjL2/XH7GUmo7qFDPJgVkWYgCtzuSDYW
	tHRKukZPV8tV2s5p6+BGbl58/ZxRL6EKh1JtQuzRSOaGPvp7LJovSb//kcSXsKrdKDfKGb
	suG3qC9sGlH8D/K87y6vkp/UO5Se9xM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-VStWNqWXPV-EW5rfR6K_hg-1; Mon, 09 Mar 2026 05:11:34 -0400
X-MC-Unique: VStWNqWXPV-EW5rfR6K_hg-1
X-Mimecast-MFC-AGG-ID: VStWNqWXPV-EW5rfR6K_hg_1773047493
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so125473155e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773047493; x=1773652293; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWnQ6pc6nNaZ1IGr6HMkh6VJu+iJZRS4rFk9lFROKi4=;
        b=mT1ZHdNM2+uYo1TGH1wAUBWcWHlgyLq56XXl959ajNpraRAMIkHCTRF/8ooXfzrSow
         fQMIC2flV1SQkeSWgpnFq6dmmLWujBiQ8w9mVRlumpCALhGrneUdzRLMtrSOmwInf/WK
         2Lahl2SmxczeLPEP1SGwam4in5aEJjS5hhIafP2AQhcX1NjDnmmoxHa9/j2UnlikQLse
         aefqnIhVBOvLKDeh+EAOiCg1va4owqvbh8+a42rQzIpflIr3oUhTIj7bX8Uw6g787VEt
         +ffP8jGOcluGEyrAtTCKFCQTisStg6Gb5fG212rXeCpSX0NhkJovzhytWKIw/G8fFyIi
         YDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047493; x=1773652293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWnQ6pc6nNaZ1IGr6HMkh6VJu+iJZRS4rFk9lFROKi4=;
        b=bcAP9p720bNGlqYIZOoRmiVPcuzEuBvbIasX3wrn0/nyFtCb1A2T67V4jV16mIBJNP
         jDW1GZ4nhYFjyUN9sIjPwC1zV0HV8SBlHAuEjEpzEZlKdW0ZuayZ9qYyTMR0kkw3rvvy
         d8nghzwFMlMnhuniEFp/3/tC+1nTzcCg6rGjUnRaPq1DE6ZaT9G3X2VTaRy3jWfg42Bv
         90yl+SyYq2dW6zf5UnayCsm8qdgW9xzrZ0cEg3h0wtk+/aUOME+amtxwc4PY+A7Iq+1+
         N6h1lhcp69JvXJz/KqXjvrByNt7+NKvk4WFHQSHLFmmjFrVmiwnVyBrDaPqzzAGIvzZn
         SGMg==
X-Forwarded-Encrypted: i=1; AJvYcCV1iC2luoDkOgG1n/tM4/zDx7SjQFC47UmWn/aAdKhLLw9/y5GJY1Imh7InvuysxkkNah1Ww2XBNTV1uPz3XEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT4wR7H5dyOTHXErisSa3ZlCbl2+xxBz7qDfQHbvBF/SZh/Mbd
	vSM+mD8/2/cUsKwHuQVsl/XYFWJL65JmoimtEGK8TcHt7u2FBB6pxkaraSRBT15g3dVzPmyLv47
	yYK47Oj63HT/bvTGM4QUCnW5SKKbByPqNZZz4b9qjro5/2hpUxPsr5lTmCsjq4PNJSWPLzQ==
X-Gm-Gg: ATEYQzxmwurcfKdUHXcWYxDZGFLVhe5JMoI4uaF967BTzbxOU/7WBtHKiNifst2eT2S
	y/vAs3ogaZaw8KsTj8n0MJFQs/7OdE0SSsQZNWeTvTgkAvur7YFuDb1WGasmcYKz26XsgqosZ6V
	fGqnZAL9BehPM23QkC7ERZOj2OZXQ3DGLpGR0u+zV4Wzt7jP8+lcG6uCrq0irl59KIoSJ+ySJFs
	2UXyTIqKW9qsHMtaJFoBLUjMunSngfcb17HEJ1CzU92lVbZE3dMBMl6EGRDIvGJHCyzwwsojqVR
	IfwC1x7K7OeMmuX7QqNDuN4buP4Tnz40btj97ThjSxp+u/0Zlz2MoA7Kqcjcpw+pROFfe1mKvbS
	EXSQm65kqE/dmXIOv0H6K+fJY9IzsDdM1uW50Qko/UOuMtRcNPJ0=
X-Received: by 2002:a05:600c:c8f:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4852695aec4mr174709415e9.18.1773047492642;
        Mon, 09 Mar 2026 02:11:32 -0700 (PDT)
X-Received: by 2002:a05:600c:c8f:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4852695aec4mr174709005e9.18.1773047492134;
        Mon, 09 Mar 2026 02:11:32 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm321998295e9.0.2026.03.09.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:11:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:11:29 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] selftests/sched: Add basic SCHED_DEADLINE
 functionality tests
Message-ID: <aa6OwVhOn2sHyMcc@jlelli-thinkpadt14gen4.remote.csb>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-4-2b23ef74c46a@redhat.com>
 <64fa81f453d7909e5669cc32284f7c9f48f2fea9.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64fa81f453d7909e5669cc32284f7c9f48f2fea9.camel@redhat.com>

On 09/03/26 09:15, Gabriele Monaco wrote:
> Hello,
> 
> On Fri, 2026-03-06 at 17:10 +0100, Juri Lelli wrote:
> > Add initial test coverage for SCHED_DEADLINE scheduler functionality.
> > This patch introduces two fundamental tests that validate core
> > SCHED_DEADLINE behavior using the test framework and utility library.
> > 
> > The basic_scheduling test creates a cpuhog process with SCHED_DEADLINE
> > policy and verifies the scheduling policy is correctly set to policy 6
> > (SCHED_DEADLINE). It confirms the task executes successfully for the
> > specified duration using reasonable parameters with 30ms runtime, 100ms
> > deadline, and 100ms period. This validates the fundamental operation of
> > setting SCHED_DEADLINE policy and running deadline-scheduled tasks.
> > 
> > The parameter_validation test ensures the kernel properly validates
> > SCHED_DEADLINE parameters. It tests that invalid parameter combinations
> > such as runtime greater than deadline are correctly rejected with
> > EINVAL, while valid parameter configurations are accepted. This confirms
> > the kernel's parameter validation logic is working correctly and
> > prevents misconfigured deadline tasks from being scheduled.
> > 
> > Both tests use the dl_util library for SCHED_DEADLINE operations and
> > follow the framework pattern with automatic registration via
> > REGISTER_DL_TEST(). The tests pass cleanly in VM environments with 2
> > tests passing, 0 skipped, and 0 failed.
> > 
> > Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > ---
> ...
> >  
> > +# Test files
> > +$(OUTPUT)/basic.o: basic.c dl_test.h dl_util.h | $(OUTPUT_DIR)
> > +	$(CC) $(CFLAGS) -c $< -o $@
> > +
> 
> This seems a constant in all tests, what about just having make do the trick:
> 
>   $(OUTPUT)/%.o: %.c dl_test.h dl_util.h | $(OUTPUT_DIR)
>   	$(CC) $(CFLAGS) -c $< -o $@

That should work, thanks!

> The rest looks neat.

Cool. Thanks again for reviewing.

Best,
Juri

