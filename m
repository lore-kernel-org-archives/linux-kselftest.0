Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C918935DA43
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976281; cv=none; b=ISTRg57PyyKI9cIb22Mjk+pOlINnPYTs0zqU/Y4qot23NnE57W9mZ9pu9J+nbTWqK+vexbTZ7/fBVnp6MLCRT4Ux36h15TZkjf/yN7eRvh9PYU+szWNrnPbYGnnQMqnis4r+xyHrbU84KbvUo9gEuXP7lhpTY2BK6GypEv2DUmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976281; c=relaxed/simple;
	bh=D3eahPIAIk1fvhyOZkYEJP6bQ6n0at+bhFjOvvkmzpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUnr3sIqyRU0OHbp1QRBE77py2vECuVMuh3dnW7GuSbw/J/qBE20TWvNn/84STTt+8KZWZ/1qus83jiGVfEqeBTbEkzV9rlEBSLUUsDjXAIltTMtQvf4Xd3AVLhSVqJcepNDSVCFRd+ub387/ke+3fdn2JgX92l6SQ5tRS0F4Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgBrxDlp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgBrxDlp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9414so272118a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783976279; x=1784581079; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=NgBrxDlpDoknd6Zv5Ca/Oeewg5yuANlXmHDRnnhqXDWhgDP2P44OrR0s0/MTMy34mZ
         n3zXMmcIfGoNR7Sd680LfEr1/geQl8EGetahP7W6fUt1MxIqIdI/L1VUVBggJAmQ51v0
         jXoSwvwvp/CrIoMSWg71PL3DRpm2hdJGate6aUcUOOKGl8xTstjSeqi6gEKS96UO7Zjd
         lb2a22B/uNSSHg5FZmQ48yi/TVkiA9sVtHA1/za6mSwdA5n6CL1pr/nmcJGtyJ1Z/Prh
         VUKEcE5b/3E9zbq5R57HBRuSsc33Y7ePwJV08k/0UBOriBpPl9MhiDN0KZiEmLww+N0n
         mgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976279; x=1784581079;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oNqruOZIzwruIpGvkzB4DJORZxeTGWU0clCn+vXfCzI=;
        b=gWK2OlfqfrghERk7BXVo0ysrF5orUWNWKwd29luBEHuquLrEoPNF3fm/0CWYP0f0mS
         iGnSS+sec+pg/LFnOMv2uaMK7nbgBMacmlgakUBQ1H0mJgvF1QQljcnZS10yJqUhCwYf
         Dtu2apRs+MqP/IHda8s8leOMFo830ykRIMRbjJ5TDNd2j6l1q5/hYIaOGUfxDs2/tC02
         X9FrhNbZg40wNlvMz9tTqz+ohyZbrtaMA/h3qliEccbqH53+aKQ9+FI+1T++ySIKWqvn
         /c112vHIxcVGyjbuAsCvpYke+3b6CYqOee6hMOsW2W/zabtxXOaz8BD9QXUZWjLPfr2v
         KMXw==
X-Forwarded-Encrypted: i=1; AHgh+RrFXqbAoBCRTS5gRWZ9Pcz2ne9dB2gxhFUskse/ehnRjg5UDWP92defBxYEX0RIfGtxkAm14m279NUx3I1d2vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOK7YnfAkYNjl7SigbXKyXkPL7h8abHsK/+6qgSNqWwaWKSiGT
	hQFib/8Plh8zKcG8Nn0DQ4S1GwOUTXasfZmbVENS5RntsWbAc9aGbwBY
X-Gm-Gg: AfdE7cnCpjTT5/X0gWJqHhei293hyKNx8otUQAkbWFuzNpzvR0U8Kmfw5/AvYnWp4qD
	bdpysXHWbU5TOG3B3HUe3Z38c/Q8J4fWfzhVup4RpDLjJisIqISN+nm+omsb3LW7GLKMQ7pmI/D
	lyJF13HGezZyts1FCnngZluhWgGi36V/q9L1V5tMslSW7pH2VG+tGXzbR9TRo44XllW3lzzjf+h
	2H7RIIIBRJWGLPxvVNCEEeDZBFWSy5Zop4WLhzYGLuB0HCGrovruZGErXGaTRVg/zECrgzq7qav
	nxTSTX5MhAg5QlTm8YWTdCgQQoR8YzKfxBWngDDY28+ncOv1q5QwUhcO8t9eZPz8keyoop0lClo
	c+kqH1C5HfvJbN2k54DHv00NLyLE3ghHpEqYccCpqwLQjUO+gmRYw8tEiNCcHT85lkQu9MFv41F
	Ln7o1YHoF/N+nNHgFq9RuGJUXAler2mgpOOQ4ab7do+2autZ8MAzA+x8NieEbySqUDtA==
X-Received: by 2002:a17:90a:d88b:b0:381:528a:808c with SMTP id 98e67ed59e1d1-38dc75e3d4fmr9572711a91.12.1783976279067;
        Mon, 13 Jul 2026 13:57:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6ce6sm403816a91.1.2026.07.13.13.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:57:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 13:57:55 -0700
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
Message-ID: <alVRU38lMfvmUFqJ@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>

On Fri, Jul 10, 2026 at 10:49:50PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:22:33 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> > > On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > This series extends the HMM framework to support userfaultfd-backed memory
> > > > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > > 
> > > Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> > > spin in mm.git's mm-new branch.
> > > 
> > > Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> > > what base you were using.  Hopefully there's a reason for a v9 so we
> > > can retry this.
> > > 
> > 
> > I rebased this series on top of mm-new right before sending it out.
> > Should I have used a different branch?
> 
> mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> this point in the development cycle.
> 

I’d like to send another revision addressing a few comments and also
replace the `max/max_t` check with something simpler.

Which branch should I base it on so that Sashiko can apply it
successfully?

Or would it be better to send fixups against `mm-new`?

Thanks, Stanislav
