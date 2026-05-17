Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC93CF03E
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043044; cv=none; b=kQepHR/Z6WKRLS+X0NK0smEcxXCPCi4AyAtUCZa1KbF92qWo5r1PpAilSqlgr3O2gSJFCAG+cCUa4W54m12sYmqWxcq0r9ru7sabZRm/sD/9Rdn2/9rrbG9qhpf+Neh0qgOnrDLOWV3tkVJ1m9YiFDBmrAjKAKpMXmw4ny3pybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043044; c=relaxed/simple;
	bh=ODINtDFFV5g4mSz8cJVlLxEbZA37tQMcdVPH8vgGrAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grrxQSGAj2nGe5m8MwLM2v896LtQ2PS822g47yanZI2TO/TrfBAP+sOtWbeiBB13AUDV48nQl3JSYGAXI/Ym5GT4GkjrYGy5clQ0cwgQbrdSnJJ1l7sAJw4lF0eZaK/tp/Q6nY8WF6IJvrkoEZnIkvokQfwUez97S2AD3gCjplw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ea0x6hxA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ea0x6hxA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-90d042fa745so321312385a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1779043039; x=1779647839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSvR3pUa7/2OkCu/xeQoYakjb0Jx3U+q13XWt8GPix0=;
        b=ea0x6hxAjQoGtU2KeJgS0o4Lgf2ssyGAeoMpbLf72HISJVxxWFNRNVbJzh0KrJwgwd
         6mP5e4l3NNqGin3xB2bKzKpKHhKGlZ6KOQHKxnTV5Ye2kI0mqMvmRNIEsPR64sEKLMfI
         4bZz+vM+dSXYaQro9O2g92IZVRVnALgJm7Gx8xrJhl7HAWHuJICVygKuVTQBDs1Ci5d4
         HqCMg+C8WXW9oWudSEcH1FkTts2JPH8eCTKOXOlqRu5Cx3OtgmC99ieraJrVbIGMtucm
         maTO2HwO7k72O1duqD0KDZwOTwTxiV/hDnV/F6dffSgyFHpLAR6BMKZXFsfNV1V0Nmot
         ja2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779043039; x=1779647839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSvR3pUa7/2OkCu/xeQoYakjb0Jx3U+q13XWt8GPix0=;
        b=J0Cn87leueT7wMgxuKf67lBDfyng4kLgYnzWUboHldhmzX4gV51KnD2pVydVifUkRK
         A7kEBvg8asZJoU5ql58GqGjpZfD7EdYR2OGf6tMasewiBxrwnnH+ee6x8Kcpn0+SYC4A
         QI3WneSnik7rV1GFFU5marEhCq6tQ2Oj0SvN24oS0artuGVhggdkx2ZjVFh4DEkVa6SM
         Nl7pFEvZxGyGGXNQZOOUFnBpqImz1QqR/3Z20dqr6E9FR/QdxXnnLdAf63f3wFOV5T43
         Fixd1ddAN7HMP6eCBOJfEua214Ad9EbNvFgbORH0VRkKELNR+TR7hQ++oDyHT4T40ggL
         ue+g==
X-Forwarded-Encrypted: i=1; AFNElJ9jkwwLWp/ryziumakfsBsXdpoPPSoG1z7wxVfNDtKD+ingVPPRzbVMEtVxKU3X93FARk5PboNZfgP4r0hQFTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUk70B9/Ne/yo6sWpDi437vgFIJR5MrER3BGze377+3pi60yX
	ct3UyQFpnf3k5pE8pD/I7JaKOHb3xQTso9VVPR9cqqRvJSEXt8OwHwyrPjaso1ARNCc=
X-Gm-Gg: Acq92OFK0hqauf06W43lPu1do7L0sEOCUx+/w9OGN7d9zJqE0l+cv4QkO0QRlTzVNBw
	eRB0cnY/9FvHcKIhJfQzrtBvdiFntLN6EEeOGg/YA1UMGx8VJGqEuB7Xt/Lnw4GFBkx6TNuKOYP
	EDYU1d53lrkd5tnddexONYIYT2aI0GaYZH+wkNA9+bfYI+WJ7b1aoHnrD5V5+BXpu1Q5cgNNSTG
	JFraCF3AV9rCLFhrExqAZqnrhBq/fyDMpg6qGgTrI7ZwCpiK32luIz8iubIRWMq1AcM+taS90+c
	jxGCFKWtOMIN/qWNTpLGbmDd9ZATh8EppJEXHfJ7A6Pvoilrk6EiHkDzmTJYk4Qb4rPXK4WfLnY
	+98JEtVT1+TycxE//poG83ih4mPnxnCmXM6kKQJCeW6F3NrM3mCaQkqBqxavlWnVHdAvWXtvkeY
	nan4NYFL5KGF3WT3XFKA6I3nH7jnITdi56OtdvOcDI02WUiV3xDJA=
X-Received: by 2002:a05:620a:258d:b0:8cf:c513:349c with SMTP id af79cd13be357-911cdd431f7mr1842710185a.9.1779043039579;
        Sun, 17 May 2026 11:37:19 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e1acsm1238613585a.3.2026.05.17.11.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:37:19 -0700 (PDT)
Date: Sun, 17 May 2026 18:37:18 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one
 helper
Message-ID: <agoKzw8mR21K7cCJ@plex>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-3-pasha.tatashin@soleen.com>
 <agn50TRvhDpGm_9v@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agn50TRvhDpGm_9v@kernel.org>

On 05-17 20:24, Mike Rapoport wrote:
> On Thu, May 14, 2026 at 10:26:20PM +0000, Pasha Tatashin wrote:
> > Extract the logic for deserializing single entries for files into
> > separate helper functions. In preparation to a linked-block
> > serialization for files.
> 
> It would be nice to mention that this is a pure code movement without
> indented changes.

OK, will do that if there is another spin.

>  
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  kernel/liveupdate/luo_file.c | 77 ++++++++++++++++++++----------------
> >  1 file changed, 44 insertions(+), 33 deletions(-)
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> -- 
> Sincerely yours,
> Mike.
