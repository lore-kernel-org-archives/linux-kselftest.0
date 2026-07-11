Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767E1A3166
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783740159; cv=none; b=lPGgd9pqTVznnrL8PdYkYyQu0CtJN5xqc707nN7owF83Nawu545Ho4srmWgCw7SyGcHN8Zetw93C1k1GVx0ucdr8N9Op/nLhuzyLXErs0c2nWfdmqEgWkXS6VlIVdLJsEAomvC8nWNQfqu1IKf9wHApkUWBSqkdFjPsC4iP7kYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783740159; c=relaxed/simple;
	bh=Sus7BKnPvFUSij7CjYjdJ5SdK+WtzY+EQEDkUmlaEDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzm947NXrkeSt9I0y02OwhNTL2cQYYthE/k6yAP4XSceamfekoNT5KNnUtqtJ38iGnzOQ3IFUD3NrlEfh8r13BGZROm/PbJyLDmdfuQ/tlU6BgujBw4U7oFAhsNRcztocVBk/iADbadtZRzGZIAIf/5NaXWTM7gX7vpdyVFOHbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+T7qVfQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+T7qVfQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845c92bc464so1385467b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783740158; x=1784344958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoRTmK7mqG76n1GL0uhVSS5eZwslPyOiLYDvdkV1GQU=;
        b=Y+T7qVfQB2TUolswh+PJg2roQbg2dl792e74RhbyG/9Vj8N3+WvCQ3UIjHx98pcPsv
         is2mm7ENnYmfoaDc5bE7/gq6fEKu019fp4/gbj9/v0igV96h2UO0N/1BiaC065sk8ylr
         lF8EDEi7VXvTRm98EXSCwfFSt/ImJ636rlG3ntOjBtH05FFfcE5YWPgnFnTRrAObJ9Oj
         aqesQhIYU64Em1aYmKWuSyG3xbGMAbIbH0yzO53DzB1Srir/r4KHX5GTvBRArbmp7/7c
         cUGiE5LIe23VkhT+2v07URqgvcMoex+PNjQ2n70OnLg+zdPTlwfIENkTQvj1WG5PAEtQ
         DCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783740158; x=1784344958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoRTmK7mqG76n1GL0uhVSS5eZwslPyOiLYDvdkV1GQU=;
        b=pbd3Cg8lHF9+u6AMoSc4MUotUKBU6xJ74jPyCSMYyTp0pFNkw0676rycOWC0/nY0HD
         llk/bIur/hRp/I1nvq/GB+y5tNs1f9OW11S+xaeOumg0s8ZVViRf897ObDlr6UXiMUfN
         OmH/MViYe/6myZfMEO+8lYOcc5KMPLGZMKB84NNBjdyItnxhYtwY8BedOgaVEOubekWq
         chScpYY5PJVrOyXpRzspr+s+D4zTTjkMbq9uYP1zFno4X7TjtLtYUqIiWifLNCW7rO1n
         RA7ms9YdZunQRAGIFF9jR6zQMsPYmV5gz8Lq+/iGl9b9/neCKkmVr2F/IiW+kCJjYtao
         dfog==
X-Forwarded-Encrypted: i=1; AHgh+Rqy1bjPESTxMQGwKeHpUg89cU2NsWaFq3BPrIDBol5vUxOmP5vId1zCf4zdUjq0HrGYceR0cSCXe5ppAJFaBEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzenZTlP0ChcoSUQO8+X2McptU08ZmT1f7FLjfuwPpVaTo++9Et
	nXBxiw79Lu0UxZm0ggTg5Z77FSCNKtuIVItXkl3lMv7D7WzUof3GiCqH
X-Gm-Gg: AfdE7cnxFbO7aC7oenqD8tKfwwmdFzB+aQ+CeLRIaKQX6WdJ21RnpLQ8/WVBtOdDo2w
	+SKdQ3ozKL0NN5IiuhYdfDKeDPOvpltRylpBawCTlg+t2FBM0/Z4M6lZGva+0Kgl/WYCAyjxwql
	bZq/JVGrWwgrP9sh8Kdj0Q/UQ6PPX0AUxG1Aiewr99zCMawyhHNo8wK0T1b+NdG8Thk/hsJj3u+
	Nt6L5CrIKzpRaLW9oJkBYF6Xk1XVb2xeuDSDpA/NFHA6pF5sj1YrCeuWc6H2eJJuIouc8IWJRXr
	FHGubewlUQdO0JpGFFJAnwiZCwmA/PNxS/8Pqe4zXvIx8C1RuEGGDbm8pYbvHin3DGQSaCn+eyr
	f1xCna8KGwjWibnQqfD+7ixIbt8uKL1qsZKONFLhMH3YYUDe6JKGJhYQAkJ6fnFoechhrCPPpdv
	F3OsZUhjKdKADYvUk3lVCkyGyoBt+sxOlGPnYd4OL1++W8Oj5vUC/Gz6Q=
X-Received: by 2002:a05:6a00:2303:b0:848:2f74:1d68 with SMTP id d2e1a72fcca58-84889750a60mr1542258b3a.78.1783740157808;
        Fri, 10 Jul 2026 20:22:37 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84856e7c8edsm3652647b3a.36.2026.07.10.20.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:22:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:22:33 -0700
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
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alG2-RSitzPWClAX@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> 
> Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> spin in mm.git's mm-new branch.
> 
> Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> what base you were using.  Hopefully there's a reason for a v9 so we
> can retry this.
> 

I rebased this series on top of mm-new right before sending it out.
Should I have used a different branch?

Thanks,
Stanislav

> I have a few niggles, nothing major...
