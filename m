Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81729363C6F
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 09:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047447; cv=none; b=FRi32+KWdumWxa4df/2KigB9OvzESLC/1hRxo9YOIZ2wjT631d/NjIk9B6S0KKjv73En9dUqbemFfrwwB4yVj8Jbgt+43GpFqrW4SaaDA/0WX/nJUJnp8NDFu1iw56PCMqcMMbMaJE6jQqyTWNcazqjLLjhrfygocWosorTu3L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047447; c=relaxed/simple;
	bh=WUccMRkzf6Qk+kbuVnKg/sZcU7t7Gka4bhy9zPTITHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLrXu5SGKUCruDN2t/gnp/5vJkY22YIJsFpXdSqMjmYTF4MjtX4BarSQhdfBtyBwnHZkVjUhqonq96Szlyhe+tIFbcm3lql4+M10Tx/Q4wLa8RZU8Tc9rSmNEJg+5qQ8TaE154iEuzlHRPI0kPzKyNokRPQD3X5qZHIikqrKNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eal9u/K0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pF1gmBbi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eal9u/K0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pF1gmBbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773047445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNVBxlG0xm+vtJnrptEsNtPSmD5f3ZCzl1RfGegbr5A=;
	b=Eal9u/K0BGzvhVdjrjHCtf4dA0zvK1tOg+v8suv5298jCto/myyoZbH5gBBSNLkPXEYP9h
	vXnvCLads947AGHonZ9RXDFkeV5U/NUx0/n4OHcobOwy9nvWbq2PAlA0FRchZkLAuyTGSG
	nr1xQdK2CRKEHlg+6oHWoqO3ttyBds8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-W2ZNNS5lP3a86D2EUyMSeg-1; Mon, 09 Mar 2026 05:10:44 -0400
X-MC-Unique: W2ZNNS5lP3a86D2EUyMSeg-1
X-Mimecast-MFC-AGG-ID: W2ZNNS5lP3a86D2EUyMSeg_1773047443
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4853040372fso17529225e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773047443; x=1773652243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qNVBxlG0xm+vtJnrptEsNtPSmD5f3ZCzl1RfGegbr5A=;
        b=pF1gmBbij6wT3YUnQ6mM+LXSAKtqYHlucv9TnOtMvHKkFi/Ta7u69Npp3JMoGHfGjx
         lpg6BLaQSfkSVodBv7ikt/m0vGEKM0M44PXXXA+t2RQN7LKpAMjO4aQxKLk6V2xeG1/j
         qO3zM0kvMWU4HHxvoTwqrcPQAwiYQD+MBNTjPmdvD+wDmHMz3rL53qCOIUD4FJv3U/eA
         oVw5YrXi+K9Y10RA/s4pHUPgDIucJLNtDqF0v02Q73vYKBLb5l8rZhMbM/g/0jaofauo
         Ct1b6Grm80zgkME6W/c3cfo9TIcggbtuuySKLdnz42f1KpFsPhwYwUahBEpGg73ygqc6
         pPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047443; x=1773652243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNVBxlG0xm+vtJnrptEsNtPSmD5f3ZCzl1RfGegbr5A=;
        b=T1SyjcJPIEK+x/53dQLFEwuaxlEoKx3f3rczZCQFe55smUVH6mBiSSgrN4WobqFSfZ
         GW4XdtFx6nAT4UT9Uf37T4Aqa57mhiMdTTsw0N9SgQLluS/HQ5ZATLw69pWFEOnUOZHh
         hdeyCe3jf2mp37xMvct4r2TltrWU43HOYEr5/tgfIuwOA0J/FKM77+BSHF2WIAZq8zd4
         9A8mbZIMMzsLSRiZlBpF2J/kWgUBnr2xMBUtd8mmIcPLocSzV/XeUa8NTUKXO86nddpj
         XzmhCcsXV/BlLgeXdrl8G1ONb2/ybFnopimktstX4ff3RuQCEUqixgeHCvc39KTzusks
         oBtA==
X-Forwarded-Encrypted: i=1; AJvYcCWeq0eo4Q4LbdZM8TONH8wA/YuHbC3sOmaUxEMhtLB4wmLxI9Qy/HUdqItUNfaZuJ/n/98OmFwHrrqfltpTq7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxhQQsgqASRpZLCszuisURTvy35Ph/UDkpXUyu3IX+39J+0yPl
	+WfHU4uyooao3pdUaRGn90u22Czhli5z5W+2AHwTI+LZYLAh0eCS0+Fg9hL148BEewjSpABfZ+5
	D3dM3veXJO6eZ7ra3oXtevM7x3kKdokUDXR7OtN2HP0dqWrK84z0siPvkwG1Na4kShXa2VQ==
X-Gm-Gg: ATEYQzwU90GZNXasG+zlioTTvXFTkJK+SU8TdgGO+ObcB8JS84fxjeSraOZmnX//0vg
	77cVQxZUQ87diyzG8XHa6avpkElsdTOy2Eq7vT2+O6dDMvJi+QDK8E0j6QKCWIEafNB+sP07dtG
	0d9wyv7glU+rndoSN4NF2F3zQk7fcUSA8q+MnEgZDw0TSVwkHIDyv/EE3bQsaiOKHBj2ygqtTCh
	MVHbMnbTWmse0kLNw7TwMj0TcMQOBr97taHOKTmSpVNSGjCGiX5x2huQUkL7tpsOLl6Hba/AiOP
	b/wZ3El62BRQtU6fhzboafocWQ+5HNueH98cV4x/7TCgGmEwF/l3IuqbsJtL+YQ7orIynHs4d0R
	Ppvyw6FbDQZrmkbIM/tNmlhfK+OBVB0wAltJxOOGDbsQRgSTP7zM=
X-Received: by 2002:a05:600c:3acf:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48526978d48mr183083475e9.30.1773047443130;
        Mon, 09 Mar 2026 02:10:43 -0700 (PDT)
X-Received: by 2002:a05:600c:3acf:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48526978d48mr183082835e9.30.1773047442607;
        Mon, 09 Mar 2026 02:10:42 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9fbsm25044496f8f.23.2026.03.09.02.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:10:41 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:10:39 +0100
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
Subject: Re: [PATCH RFC 1/7] selftests/sched: Add SCHED_DEADLINE test
 framework infrastructure
Message-ID: <aa6Oj9beuCtpS0nk@jlelli-thinkpadt14gen4.remote.csb>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-1-2b23ef74c46a@redhat.com>
 <2c4e24ac7c9f39804d2122316cb42a7cabdda2e6.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c4e24ac7c9f39804d2122316cb42a7cabdda2e6.camel@redhat.com>

On 09/03/26 09:20, Gabriele Monaco wrote:
> On Fri, 2026-03-06 at 17:10 +0100, Juri Lelli wrote:
> > Add the foundational infrastructure for SCHED_DEADLINE scheduler tests
> > following the pattern established by sched_ext selftests. This provides
> > a clean, extensible framework for testing SCHED_DEADLINE functionality.
> > 
> > The framework uses ELF constructors for automatic test registration,
> > allowing new tests to be added simply by defining a struct dl_test and
> > calling REGISTER_DL_TEST(). The runner discovers all registered tests
> > at runtime and executes them serially, providing a simple and consistent
> > way to expand test coverage without modifying the test runner itself.
> > 
> > The framework provides a complete test lifecycle with setup, run, and
> > cleanup phases for each test. Tests can be filtered by name, listed for
> > inspection, or run in quiet mode for automated testing environments. The
> > framework includes assertion macros such as DL_EQ and DL_FAIL_IF to
> > simplify test authoring and provide consistent error reporting. Signal
> > handling ensures graceful interruption and cleanup when tests are
> > terminated early.
> > 
> > This commit establishes the framework without any actual tests. Tests
> > will be added in subsequent patches. The framework design is inspired by
> > tools/testing/selftests/sched_ext/ but tailored for SCHED_DEADLINE
> > testing needs.
> > 
> > Assisted-by: Claude Code: claude-sonnet-4-5@20250929
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > ---
> >  tools/testing/selftests/sched/deadline/.gitignore |   3 +
> >  tools/testing/selftests/sched/deadline/Makefile   |  34 ++++
> >  tools/testing/selftests/sched/deadline/dl_test.h  | 238
> > ++++++++++++++++++++++
> >  tools/testing/selftests/sched/deadline/runner.c   | 219 ++++++++++++++++++++
> >  4 files changed, 494 insertions(+)
> > 
> 
> I wonder if this runner couldn't be made generic, something like not mentioning
> DL in any of the helpers, keep runner.c in tools/testing/selftests/sched/ and
> have a tools/testing/selftests/sched/deadline/Makefile glue all required objects
> together for the deadline tests (or anything else).
> 
> That would probably make adding new tests much easier without code duplication.

Yeah, guess we can do that. I started this with DEADLINE in mind, but if
people think the infra might be of help for adding tests for other
classes/policies, we can definitely restructure as you suggest.

Thanks for taking a look!

Best,
Juri

