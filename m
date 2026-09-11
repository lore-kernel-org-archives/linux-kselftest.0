Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11094772B4
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142541; cv=none; b=aLWLbomy4zqRldqMn7zEJX+jmPekwa8HpXOujIG5Hha27/vdjNPkylKEwNHUGSBxLr96LTFkLuOkAhBzJIRFr9FdPotlgvMjqHLC133VI4To3rnZPSXtAxT6NjNc/2wlCGUJyqJBORPrPaeKAWvBT+PdsSYWZ10+YTAkQGE/Gvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142541; c=relaxed/simple;
	bh=aDDdC+cvRiioQIXkG9rt+YGQ3de5uvCoZwkZvLzlzAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TbGFKmHcP/FmT8b+6HphsDZnHKw12MVinBUZX+8DEAOlSH4bbhfTTLJnCvvPG24nU4rC58XQXFfKywA1KlZ9zG4SwxA8r8720+7xhcS3YUAaC0HU3fCHUHGWDXaqDTrVHUfPXIJ7LdncKQhiHDMfYN5L+Y/Cz6xBoWT+uZgGtk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B3OnQmCa; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B3OnQmCa"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1551602a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 09:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789142539; x=1789747339; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFlXnLD2eQw4jhC6UVTuIxWvif6y/Uyvo4hyizq+aXw=;
        b=B3OnQmCaTx0edTMD5jNV6idrVVB1dLOo/6231hCNwb8tDdGBmcb+TtPJL/ApGAi71K
         lvihGFjHrtOXivnkfed9l3f8f2MWwVSsMboFVdB7IFzHQQHhIjmOOFyNDSOW55qothPI
         D96GhJMZopcYsVn80JwFp3XVEJdZEjYByfSbPR+ehS98+SqiMOVJgRmIqLbv7cpzCJvx
         87avZo2v2GvQS5/8z2XsIr+XrMimCzm1BoDrbkLVdvpmoVhF9SZFcIZD2xHcq3S8uWn2
         VlLa4lmFk3YuLKYB4Oo0VTeii/IPYJjOhUfgRQXKHwLcW4KQ8rCm+CX3mFab89b3j2nv
         NoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142539; x=1789747339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFlXnLD2eQw4jhC6UVTuIxWvif6y/Uyvo4hyizq+aXw=;
        b=O3CEqgjpvqWfN8I8YTpDnbzbGayLWSiFPECFGCZUgJ0TSOL0q6uaale9Am/h8Tu9wh
         fVV+rvjb4uC8C/Nem+tPN7nW0iRpdcQUZSfZu4uQY5Qx8ZNoZSFkMZ08ibtnsh9CDtk0
         qxc3AMZIMgTPcA8rVtbnygCxQ62dS1Cez36pzgo+vfivD9x3tRyFeiEjndKkk7/EmfBl
         Otm7L93p7cPkzkte7a2BQ4DG/Du5rDeteMWAPCWQYVfrEOIHfgz741wHhCT3Ttp/Qu3g
         ZCYAzlNjAb+EiAG1kCKDXblXPBIoL5bd5pZ2kg1HarMKXqPIGbmop8wi0/CTZd2FsNsJ
         +Pqg==
X-Forwarded-Encrypted: i=1; AKwUvBxsSr/rYtdP5zvYMPnFNVGQ8WCR/I6QAOUFMT+MHt000hUHZHBrjvxfURtHlkc93rHRufJugelKxMq90vVOUVU=@vger.kernel.org
X-Gm-Message-State: AFuF++m0m1mr0y+H/iVG9Qo3Nm3+OfoKmlkv6G4p/rI+AyZhk9x0Q8bo
	RQnVJpn9gyPvinQ0Van3gJ9qDUW5ByaoYfsmbnIyVZ9fzSdT4wjciabJcV8kcW+6JBo95Qv8on7
	E0QAFiw==
X-Received: from pfbdh4.prod.google.com ([2002:a05:6a00:4784:b0:848:5395:9a78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a0:b0:3d0:88f5:f806
 with SMTP id adf61e73a8af0-3daed31ad0cmr8472051637.15.1789142538925; Fri, 11
 Sep 2026 09:02:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 09:02:18 -0700
In-Reply-To: <20260904052033.3648259-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904052033.3648259-1-nagachaithanya9911@gmail.com>
Message-ID: <aqQmCtPf_5M-BjRW@google.com>
Subject: Re: [PATCH] selftests: kvm: Fix transposed calloc() arguments in the
 uffd helper
From: Sean Christopherson <seanjc@google.com>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: pbonzini@redhat.com, shuah@kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 04, 2026, Chaithanya Lagisetty wrote:
> uffd_setup_demand_paging() passes the element size as the first argument
> to calloc() and the element count as the second:
> 
> 	uffd_desc->pipefds = calloc(sizeof(int), num_readers);
> 
> calloc() expects the number of elements first and the size of each element
> second. The product, and therefore the allocation size, is the same either
> way, so this is not a functional change, but the arguments are misleading
> and GCC 14 diagnoses them with -Wcalloc-transposed-args, which is enabled
> by -Wextra.

Heh, the calloc() implementation provided by tools/include/nolibc/stdlib.h gets
this wrong.  But KVM selftests don't use nolibc, i.e. that's someone else's problem
to deal with.
