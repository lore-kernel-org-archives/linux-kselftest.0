Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200A285068
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292774; cv=none; b=bxhgThzs9/WfiU+8kJRXQahwmSgoCvWOUZj+pFwO8aVcCIsYc22dyHosa7YHqTBFkiOW8GIGLEuNfkVKaTV80xZODTpMXBEMpTrxXY94WGmn/T+f8H1jsDWnHQ48RmFnIyDjPWSErseX13OglijnibT5MTB99qQ5Mx6024d9dQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292774; c=relaxed/simple;
	bh=LeHYuo9szS41qFozUvOvQQMg2Zib78CELJoZiTfPrCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNG3/OTiHBLbhSNxVBVV0rQD2V052wlyEDQZaBk3jQqWKSXZgpUD42VR9YmpIRC/T5BcSwtWyeeMIyx74nu/Etoqtn3ZOchua1nIu2UXfWGf5IpmMgFWsAl0B5G896j2cCQYaah9bRStHlvejBtWER2FBhKXT+2knVJz0ebXZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=arclwpuB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="arclwpuB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf22c18ad3so18605ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292773; x=1781897573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdP+1KaTR40VhK3ScPAjSIhJkFP1yviJa4xgMjReCWw=;
        b=arclwpuBfPkoR+wJbtne/P7tLtc7BFQqHDSB8erAn8mjupIv5JZg7WXmBizjL2V+GW
         B5FqAWHcvAK1uZNjw/ub7GMOXx+GBg2kFeaXZ2C2xWrD1Jc6mghMCXHYiMV0JA/Ml44Q
         g+N8SndaEaJhg7jDSgyyOVBn1tMD7rlOs8mGANmcdZgThHQukzcWpoUaIgA5yQfOYKxj
         q35CMJUAIBK84Ipu2MclxqCfHXAtu69YQNUOHNocu4QwXMCo2Fwmp0IiXJibLQwdkel9
         TFGdo6VCvJ+Vr/8lrjO/0YVA6a6zO5WyJcMUFrgJhfyo0q4f+SEX1Fn2d1wDpO1YLqAS
         XbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292773; x=1781897573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdP+1KaTR40VhK3ScPAjSIhJkFP1yviJa4xgMjReCWw=;
        b=oMFKa2dYKlSn0fFSFmIs+vceJZyaZ/PgwhL1DP8bn7dUEPtR9sYLuTSkPHmVQAOjc/
         7ExcszhT+dAAzawwj+rJ0Qpa+mnjm/gOAzQ/Lvef5dzLAKiAhNo15iABy6vNF1l39LlO
         jf3/ZOx6XQlcLL+FT4/TtLm84VfC6lB7RmLtaBp3jy6EyYPfn+Pv/sBuVBvdwL8SLceC
         OGk7q6e61OwQo214gPWoIdTToGomdwebQjYqgzNJmAEd8g0jBsClXSHLExqFLqI5BM+0
         rFbmuyAJltOw9vJK9MwmZIMtP2q5+BLYmj5f7W+ZB9eiBAm24phi/WqjVtelWWVccu6C
         upYw==
X-Forwarded-Encrypted: i=1; AFNElJ9dmELB1cFimyv5EbV+bes4BzsgCYN8f1IeOZRqzO4zbdhlAg2y4EG6yimDhyr2QDyMPiGOGelO06CrUfOuL70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuEzvLbT6W+3Xmr1gHm8hGab3O752SYBsCSLlVM6rO1LByTKdL
	/PEe16vyi+LLln1PhbY5uRElWV8hl35dFvCw0Gxesa/bZxqAcjjYLvLwSnIk3lltBQ==
X-Gm-Gg: Acq92OEAEu/3UBu+3TvWCEoZIfqO+SzsBF4+AOZNf/3TMRPTuu7eJZcrakXDF8Mhgrz
	9KygrXCeAk4q3hwFkM7iIqXGxzX/zfL3HHryZ6OR4A23uHJHtvZoFwEgqrNaQG6NJI6TcfB9Sg7
	SCtTvUM6+HfIpIDcPqUl5dwrumWrfmnSdm2VP2lZpGlicO+mJ9WB5VtZiH+/iThmaRLVF4RG2xl
	9RL6SSJ1SYP7PtqpWVLguam6nDIm2t1YFiofybQHa6ONTGbhCWAdVssf8o3qC/4XyOihHswBegt
	vZAvuOYgZNm/RzvOjJWnwZPAANOKWkn6A/DlPtJHfjmvKmdrItIVG16Gu2YdskBaiQ8z5/UqBmP
	TQyhilETPoSJ14wAkE/eOEoL9JUIdG0Ic3TqJ1peKrvBq6VAgtmDROF3ifNIbm5HsBBG0cayoGm
	pmURVn/6mUHKdf337kFqUsq49HMwdSqClThk5gRRb+X0bU9cXM6etQmVHhGwULL7tgZrKrv0Q=
X-Received: by 2002:a17:902:f541:b0:2bf:2e8c:db96 with SMTP id d9443c01a7336-2c665e349c0mr9395ad.5.1781292772339;
        Fri, 12 Jun 2026 12:32:52 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm25141365ad.30.2026.06.12.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:32:51 -0700 (PDT)
Date: Fri, 12 Jun 2026 12:32:47 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: rppt@kernel.org, pratyush@kernel.org, tarunsahu@google.com, 
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
Message-ID: <20260612193000.GB232424.vipinsh@google.com>
References: <20260610230909.876546-1-vipinsh@google.com>
 <20260610230909.876546-3-vipinsh@google.com>
 <178123377287.908199.15268768789704684712.b4-review@b4>
 <20260612173145.GB40404.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612173145.GB40404.vipinsh@google.com>

On Fri, Jun 12, 2026 at 10:34:32AM -0700, Vipin Sharma wrote:
> On Fri, Jun 12, 2026 at 03:09:32AM +0000, Pasha Tatashin wrote:
> > On Wed, 10 Jun 2026 16:09:08 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> > > diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > > index 897c200f3845..961a732b541d 100644
> > > --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > > +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> > > @@ -78,9 +78,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
> > >  	return arg.fd;
> > >  }
> > >  
> > > +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
> > > +{
> > > +	struct liveupdate_session_preserve_fd arg = {
> > > +		.size = sizeof(arg),
> > > +		.fd = fd,
> > > +		.token = token,
> > > +	};
> > > +
> > > +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> > > +		return -errno;
> > 
> > We do not return positive values on success either, so !ioctl() would 
> > be a tighter check, but < 0 is also acceptable.
> > 
> > Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> I have to send v3 for other feedbacks, I will address this also in that
> version.

I forgot this before, other two ioctls LIVEUPDATE_IOCTL_CREATE_SESSION
and LIVEUPDATE_IOCTL_RETRIEVE_SESSION are using the same pattern of
checking with '< 0'. Lets keep it same, I can send a separate patch if
there is a desire to use tighter check.
