Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427272F1FE3
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512169; cv=none; b=emQWQdQDGnt8mwUwOx4xtL78tmEZ2dVbYRfVp+cZZGEfzCWT4r6HNOHEnYsXT3diXJ+gx8n88Foi2ViZxzNaWlB5YzDFibIUgHIS2erCXzw57d2ykN0nn4K7JtwzYFePis2KWGx5FLosXKQe+HGGdAsIpW/v05SABZ0Jk2AvIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512169; c=relaxed/simple;
	bh=bg9GTPM4qZhMdSfg11A/iGfcWjT8zOB9yw1Am0GGvQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdaEAVl63hFsPsWUgTU11wWsyOpfSqOdtkIR0yjVkK31SS84/0gGUkmGBNKpofE2tmgY/RhLYu7VZzALOICwKPhkphwp7+fSwA7SnxFJfD+JB8I0lQvO7nD6glalex9IE8QgG6oIjtxuOl7eEUfWOduSFh+hXUXWRuPfv6ZpCMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQXayTiz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQXayTiz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so6967688a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778512167; x=1779116967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOSaj4W1IEQKE4qx0BHHr2CD6pWbcRcUhaSAZDeDA+g=;
        b=XQXayTiz2JobX/nWyKgZPEmxSzluuS9aefX76sDxT3ibyakvBtZiCSqHXrVD1hKevT
         MFC7I3UxVgJKoMRIYmJdG4vISgwjJ2uNVP+j5FWx8GqDYv2sFVgR7yQaEuwpS1NUILnO
         3GuAmQu/5BeC9IYnJmdxOum39lk4syzSCR2tp8gsG3xSV05WDaXgQEaPKIR5krpzGPSE
         UAsu+6DN9c/nBWlCGhpFg2FFjvqnqxFTMUczf77pgq5TUppNZw4JcKaxxCDGXcYi9If0
         +UEKwStjNB9N5ETtpzY4rm7K4kfL59n1sNLoNtFp0hwbJzOIK+ycm9sqKARccaF0wFDR
         XSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512167; x=1779116967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOSaj4W1IEQKE4qx0BHHr2CD6pWbcRcUhaSAZDeDA+g=;
        b=KyMR/V/I1qqhE7PdFJefYEj0KNJ4ke3NAFFxffNml4v9LvYuQLf5yWc8wupoM3sMZG
         fuYkFNDbXhpOAV6lzqb4YGHpNfvQi4MbYd2eFPjggrhqyESFtKpjq9N/fgkDCr+WqNzX
         hdAioDtVv3G1M4xwzZcWtzOLfxk0YQ3sn7BF3IIjsb6pvIitEZPWxsPx+i/1286woko5
         tp3cz55++XmHRyeBnNtjetiT36hXpVJHDUObZcB1cmBPbzk70GsZ/jgHJ35bWuukqalw
         L17bftioaxCP9wyXf4VyR6mvCdaSPfpEmFDsLR0tZcql/U2fwCA2gjrhSBGeSYrr3KaE
         5cxw==
X-Forwarded-Encrypted: i=1; AFNElJ+PyrjTjFIlqjyCdncFO6/zTVTtLbpIvn4VzCggOUjq2MUGB/X8SI8QAdWJ3bgQUo/lt+RZeQaaOlWb4lIBr4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3vtKSQ6Q04FYXCuEYn8TwbnMMPIk8VKafKklnzpCwz47SViu
	tF+axsGaR3UMM5+Q+emA1LyWHlWah8YaGR4miPA2hVINdXmaZs8XSSP7
X-Gm-Gg: Acq92OGnjAfGZzhhPn6yUM+t6eaB36B2gVq2UpCj/Cnmnrq3DbbbH04DFhf5OIoH2U3
	aEP9aQQmZDATwOaWJnEhCzWbGJ+3nF35Z6cX6VokYoMZWUI0HyU2OtuWNxkeuD+bo1X5PP0qG7m
	Q6fjuig5tXFSKC+5idryG8Jh+TGJ5HZFrbs9Zm8NvxCsKuifyOknMaO6NLwDVKFib43n3s8tMUc
	lqy4Epp7RKOdN3oMsYu8d73RaKve8d0lYBENB9+jHHGM4oUG5Yvv1A77zZYOkZm10U03CaY8EWW
	BW1p3Tbab1perJUZaDHTkazo6RVenOu9+HbNJaHzfn8vHZl/XMRmi+AaCpOoa15Vt9FJaDHycB+
	hsxkCLMn/DSa5yzr9/UVbWMx6Nk4jyVmNJkewGPQMMeFK8TA+iV3TEmqhhN0mxLunIZbxoJ45Sc
	PGpwhMctsvsDcusPihUEy+kiqAc1+HjnNDC6Pvfefiu+PCEWDMldMbXDFXzDCTSYPBFhvPSVRel
	x6RepzCfIjF
X-Received: by 2002:a05:6402:2749:b0:66d:d2f9:520c with SMTP id 4fb4d7f45d1cf-67d645baa54mr11817516a12.19.1778512166447;
        Mon, 11 May 2026 08:09:26 -0700 (PDT)
Received: from localhost (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d4bdsm3938024a12.23.2026.05.11.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:09:25 -0700 (PDT)
Date: Mon, 11 May 2026 17:09:25 +0200
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, shuah@kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: sync_regs_test: use
 KVM_SYNC_X86_VALID_FIELDS
Message-ID: <agHwV8Btww3ku3Xf@arch-piotr>
References: <20260511143426.1242013-1-piotr.zarycki@gmail.com>
 <agHuMh96_kDr3ENG@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agHuMh96_kDr3ENG@google.com>

On Mon, May 11, 2026 at 07:56:50AM -0700, Sean Christopherson wrote:
> On Mon, May 11, 2026, Piotr Zarycki wrote:
> > Use KVM_SYNC_X86_VALID_FIELDS instead of open-coding the same three
> > flags, ensuring the test stays in sync with any future additions.
> > 
> > Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
> > ---
> >  tools/testing/selftests/kvm/x86/sync_regs_test.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
> > index e0c52321f87c..8f9239f9d357 100644
> > --- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
> > +++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
> > @@ -79,7 +79,7 @@ static void compare_vcpu_events(struct kvm_vcpu_events *left,
> >  {
> >  }
> >  
> > -#define TEST_SYNC_FIELDS   (KVM_SYNC_X86_REGS|KVM_SYNC_X86_SREGS|KVM_SYNC_X86_EVENTS)
> > +#define TEST_SYNC_FIELDS   KVM_SYNC_X86_VALID_FIELDS
> 
> Explicitly defining the set of fields to test is very deliberate.  (a) we want
> to detect ABI breakage, e.g. if KVM removes a valid field.  (b) if a field is
> added in the future, the test likely needs to be updated, i.e. would break if
> KVM extends KVM_SYNC_X86_VALID_FIELDS.  (c) KVM_SYNC_X86_VALID_FIELDS probably
> shouldn't be defined in a uapi header; for all intents and purposes it's a KVM-
> internal details.
> 
> >  #define INVALID_SYNC_FIELD 0x80000000
> >  
> >  /*
> > @@ -255,7 +255,6 @@ KVM_ONE_VCPU_TEST(sync_regs_test, req_and_verify_all_valid, guest_code)
> >  	struct kvm_regs regs;
> >  
> >  	/* Request and verify all valid register sets. */
> > -	/* TODO: BUILD TIME CHECK: TEST_ASSERT(KVM_SYNC_X86_NUM_FIELDS != 3); */
> >  	run->kvm_valid_regs = TEST_SYNC_FIELDS;
> >  	vcpu_run(vcpu);
> >  	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
> > -- 
> > 2.54.0
> > 

Thanks for the explanation. What's the preferred way to implement the build-time check mentioned in the TODO? 
