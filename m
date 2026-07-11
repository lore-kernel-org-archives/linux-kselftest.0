Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D52264C0
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739805; cv=none; b=uRocUnC6Ci4Osmx3zv7QyCnRaeVFflMerAjvYNvUyXPRLHMCb1PPa8fn7HCiceOv67aH0cgeZ3GqQGnwvxAY2A1Jgd2fNFtUbBw9iwJi8LO7uSN7+ybo19X3OWSJlhLQKtmbNj4pJi3lbGx5StvJq85KC1341RVSTlknRqgcvM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739805; c=relaxed/simple;
	bh=B3DNccZp5dt31xSN8qydp5e80M3HHyRBCHgLNJEVo70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEssx+CEuAAKZ2jhR6QOxJSWLW9VGxKvbdmXdp2CUdGM37arB0t51PBEVFQoW5ZD6hPdfDvV8fSsSYJ8rBz6uZKL3bJlKkyMNV0jOzbHOgCPqCLlXy5730mSPOuQgTjiJSiF2xN+KP9zW6MzZeS9zcx1gFR0R+UeX/E0qDYLRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcLxFmF6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcLxFmF6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485fad302bso1581328b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739804; x=1784344604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=KcLxFmF6Yn9X45t/A6xxKDCYHrBSJ41t8fEBK9PkCHLXW/K0gjuF+pSG12tQVenpXI
         N3z4OgZMhVUgrhCG5U+TVI5t8KErmisE08WqJko8sdkfeloCaffPgjPDyfXaA/gjWl9J
         5pBqSNIcy87Uwm9vJ2mbkTghXmS2k6qvfxKk4qLohwOSo/GfAlVNaFa6Q5QUidhTz3uc
         eEDzYFDkJOPdqIx1mwH7enFnVOOSv2zLCNTm8Wmy2hNVfcJmwf/PSC534His1I5bGm4E
         pOOtvYLdgpI+kh5bLvFNDsocLdlhBtfcCKx3sMe4z7CEgfUfFnqEeBEaWYZOTvMjJkP/
         3WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739804; x=1784344604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBlRq40n+WQNoah/jqkKv0Mdb6DSXF7flMHY66vmfak=;
        b=Jp7FXUd5+l2FX3B2sD6Oj2d1wHO4p9nbcLh/MMLogfjVH7i+xLiRa5xBU8ZyFV6QuS
         h0L6LY9QIaQaDYoFTpg42EEbF0v95FneR/sH9NIrJZ9yxxY3FUD9Jr+ECJdCQv9bzO7b
         7wQ392fjIuq1vGk+CMiBG9yz9rUvIVPwdYRlh7gyXff0sCUsV/RukgIRKwbrpOp4hNRe
         GELCnapRlehXxDSSHQ210iIofJQJ7dxecKHi6YmW7blqKrAcEfsyBK+CcIl3DRHZMWmc
         9AoyBM6QOPo5c9Or/umWGyotHB4UVtuUT1AhaCp9MJDyKdKXNzBy0WHpqWRuX/SPC+uQ
         6hFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQkByLwWH3KT1wrb2RjQE3Nvk7fSQthSowwDOUcvwWcV9flSqroxcKM5gYoH1gzMNtr+AjzNacAxrM3Qf+EZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YytZBhJ9lKiNTroxsQSHD3WGjl8LLAfec6fpySAjNhRKfv5uphX
	Q7rjVjREVI8KtXvPUKKVVrgvwzWFxQ2AUcw6yac2j1q7ZDVAaWVuEhyk
X-Gm-Gg: AfdE7ck1SWqBgjJTuOa20t/a5PFwmm5EgO852WrLCNmq50hvLICyDmkBmEpF+S6Llyn
	81dyAhMzrAiiTavS7t/gtSk5lSdjuTpf8NDXrFZ3dafxrNxMtgWBfbeeBnfkhy03Qwva+8qCXfg
	V1ztUThRYy9H1wc8R/R07sfe88VgeQQDs5aScuLJQZZVSYhuHZfdYxmNzVMNFhBN5JN+qU+oqTS
	9r+oG6o8vNefuDJ9/LOTA3WAeMy3/kuvDrmq0O327MPmV9UWYd2M1WVVdmbg8sITF41DTQjjrwq
	CWOPXICMwuKOoM6rXkXkq5SqmaevkCk2EXPaG4b1pphGCJoaBOXURDrZUnn1JnEpmCv3jk1tVoI
	pKMzkB9mMMetzU6QNsOYIISKb/uZr0M4SRTp5x2peDEedGY2RYnSRG17zY9G45teYbc9/gMF71m
	wwThWVhVZIwpbf5yJ8+vG52BS15XPT/lqiSOPwfR1MPpowtJ+HnoP5L4I=
X-Received: by 2002:a05:6a00:b4f:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-8488979d33dmr1391764b3a.67.1783739803838;
        Fri, 10 Jul 2026 20:16:43 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84870d76ce7sm2041406b3a.55.2026.07.10.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:16:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:16:35 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alG1k3JsoywE2CBM@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881847.900500.8789369230260725500.stgit@skinsburskii>
 <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:22PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> >  			goto out;
> >  		}
> >  
> > -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > -		mmap_read_lock(mm);
> > -		ret = hmm_range_fault(&range);
> > -		mmap_read_unlock(mm);
> > -		if (ret) {
> > -			if (ret == -EBUSY)
> > -				continue;
> > +		ret = hmm_range_fault_unlocked_timeout(&range,
> > +						       max(timeout - jiffies,
> > +							   1L));
> 
> "1UL" here?  I'd have expected min() to warn, as it likes to do.

I'm not sure... The "timeout - jiffies" can become negative.
Won't 1UL convert both of them to "UL" and thus make the comparison
overflow?

Thanks,
Stanislav
