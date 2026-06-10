Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049BF9E8
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114821; cv=none; b=quHwEFxdjGhuTyLjDCCmPU46r1XWAYsZamKyWOyaCmY+E0F6h09GYaeLPoyXr6ub94Tr9SFMXQ4HyhKvHZiJSBytesVUC+wsOLJCwoGmUEIYAMypZd+3rboZuksxx7laYQS4E4xP2Ft8N6ETBXTQyOHgu1t1m7U53AVT6jUbC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114821; c=relaxed/simple;
	bh=gSOkpRQ1quPlQN6lRnIHqRnL53jp7xQqYZvpnyw9t3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDbQlm+zDRn8AmZYl+ThVSAZmkXWQVGgwbPP8DZLu4xHMhzIA3GO5JCEXaEmr2+FZpw60AkXm3Nr929KlRFNu+4sQD5RrBm8KueMGI2iTcFx1/7BrJk3y5RBrXVHpR6kfFs/NJMicss7zBP+LqwEsKfLcKnMhEyIofeNJkm3nlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5cobSLD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5cobSLD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2d865383so11205ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 11:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781114820; x=1781719620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFGu26dN8BqgyfJrrBjH4o8dhOALdzqo9pBHmzVqc78=;
        b=V5cobSLDD3oe4eGvaSjye4zJZVFShZ87j+T0sUqjWrhkbHOoQrEZTzhk4z4qWUwxUc
         jh6fq2r7wt/oCS7gZjXUyDQRwbTfwrXpnrU9JeJB+28aAYnhAMIeSwfUz7079lgNI6mf
         L33Me7MT4/GdQswl4bz0viu+Fjx3RldeymbDSZUdEgaccq451hpV6nsOSQrorjDJKLOp
         0aeNHhKQ7nLttfhwDeDCOCSkVTaeL1hdd3oK3RA7HrhvE5xVzFUhmJqJ0Q1evXfavgHi
         VJh7/3zKBchtUOoMx1hAO1iSQEYRSLGa3eKPXIGkUvIOhZvxUYiJdubmYa0lr8Ny2KFz
         nmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114820; x=1781719620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFGu26dN8BqgyfJrrBjH4o8dhOALdzqo9pBHmzVqc78=;
        b=Ewx1VmHAuKqB2yGMv8i6vlBV5gQZWp9bKZ/pg3ItIuexf9U9juz9NuAKRd/6ZPyGal
         X/uGNxx7LgOZwVl7ywgwYdS6nSGP77aWkWVbXTrjA2F3Gm3fJbcaTzaAoNx8IGDCJLtx
         9AmQ7PYL1LtRQ3XObn5ajXueo5qK5aL6WtTM+zWdU7BDMZerFouLSvGJqQ13kMCMxXy1
         smmGlU3vGOq0Oz/pmY1qHDK9zeSzS3tp720P+q3Io4tqHvR5dXBKRDze+IaZ0rE3H+7o
         +WWiTgHYv4mK50I0YPXTMXT1KLtV5ioY5Kh1SluAGGqmO+80si2FDJXKh7EhrSshRQ7c
         3Uvg==
X-Forwarded-Encrypted: i=1; AFNElJ88QGwbMl4l9rF0EMJ03vN3HMxOtTZFCRbgXskwK8sNBtEU3VV4QDN2uMbxsX8svR1e+nh9ZbamtnQqAOgejz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+RvmgAivcQPT1DAdKjW6O1SushkNCfgs6camfHzWB4zV8KNs
	AWpbuWcjStGbHUZHp0c2U8PhWWSTRbJQn55+0VrVJeh11fAfhknWsICb6vG2IJVW76QV54D/3Qe
	9t1MiwA==
X-Gm-Gg: Acq92OGDUy14nQABWfBq7Za+OSwmtkVJQmK/Sy08XshEjU8jKy04hZARFxM/IqeGRvA
	FUnK8k7AZsrBnXbOPDprRJ1XzzSLx0dIK6SpTzTxNOoynK/cy3xSbnqffccuk307zdMNSnG4bOJ
	VY1xyyeO5sMEANx1wRygJNbaePhikluts8nhmq1q0AG5LtAdRKXItVl0db7VAbBKhabDwwCcllz
	Ua58snERmyqsi8vSdiQkOGTymWIInIrpqzI9oJnKpenLbZvywCBHNdz9DjMkmzoBLDTyTOXc4XX
	Ts+gpH8aua18o3LEjTWY6fI6gQB3ZsFjeWyqZuH55Iyp9frdKWcCvcai1fG0pY1S6qyzx8rOtvV
	SlJGUlpxIIHxSP6rN/9HFpAfnz6z/LevGZaKLsycsXoPuhuwXq3mpMUr63oSZMbJEw1Jq3KVwiK
	7v0c2YT/u8fUET4K0EC8HDstdBBul4kgm83TeBKXxAhGfFJIECY/OeDu3EuoIma5S2Iim/VVb+K
	dROUO93Bg==
X-Received: by 2002:a17:903:3203:b0:2b7:b03d:9dce with SMTP id d9443c01a7336-2c2d93807cemr693025ad.18.1781114819544;
        Wed, 10 Jun 2026 11:06:59 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm122656955ad.38.2026.06.10.11.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:06:58 -0700 (PDT)
Date: Wed, 10 Jun 2026 11:06:54 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, shuah@kernel.org, 
	dmatlack@google.com, skhawaja@google.com, tarunsahu@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/liveupdate: Move luo_test_utils.* into a
 reusable library
Message-ID: <20260610180329.GA224168.vipinsh@google.com>
References: <20260511201155.1488670-1-vipinsh@google.com>
 <20260511201155.1488670-2-vipinsh@google.com>
 <2vxzo6hlt86a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzo6hlt86a.fsf@kernel.org>

On Mon, Jun 08, 2026 at 04:31:57PM +0200, Pratyush Yadav wrote:
> On Mon, May 11 2026, Vipin Sharma wrote:
> 
> > Move luo_test_utils.[ch] into a lib/ directory and pull the rules to
> > build them out into a separate make script. This will enable these
> > utilities to be also built by and used within other selftests (such as
> > VFIO).
> >
> > No functional change intended.
> >
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > Co-developed-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> >  tools/testing/selftests/liveupdate/.gitignore |  1 +
> >  tools/testing/selftests/liveupdate/Makefile   | 14 ++++---------
> >  .../include/libliveupdate.h}                  |  8 ++++----
> 
> Nit: perhaps libluo is a bit less wordy?
> 
> No strong opinions on it though, so I am fine with anything.
> 

Thought more about it, I think libliveupdate seems more appropriate:

- VFIO is using similar strategy libvfio
- Name matches selftest folder name, so, kind of easy to know where the
  library is from.

As you seem fine with anything, I will keep it libliveupdate. Thanks!

