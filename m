Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE7C324B32
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112421; cv=none; b=Z4ne+CuRFKppf4mdLwjf+IGYTD8On+Xw+SUN2HPIh2kctaNcVl+SzCCFPLxigpFA9GPka++nA7hsaDs6Wm0EmLk7ks+CjgUX3qNZ755ijrkN8zI6+apvAGqqJIHMsNfePz8ICCCHAnq6KY9SFm6XOqKCrW6EOimPkjO/T6CmBdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112421; c=relaxed/simple;
	bh=XMVpoDBLSHHbE0Mwvu9CGUL9kY1LYEBBK2ogtM2hQRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnwvbYGIZehL62ng9wc86YxzZJG4C+m06l0piiItWkIDiHcRXmSb94YidUlRsvw/XifvnN0SR9ZYMDR2Uk7BErY1EnFwPjlwGBJp/TGCV75yAX+Z0KjrQeH2iuZxpWvM3sVktEznr/kouSz0RVdGFsIjirneb1rkl+DtYYkHo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NI0zIdCb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9plMG81; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NI0zIdCb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9plMG81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775112419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxu2F3PCmiUGqsP0hxcjrN1Nn2zyXEIv5lQq4+t4q4k=;
	b=NI0zIdCb25ipXMPtELg+dRtXYfDSuLPwSFNuVqZp1YcKisvBPgnmM+k+6JS1dg/JVPcScT
	Pca8DACmdsv36AMHx/+9VXtEVF9rkEPzp7Fnhc/m+kKMI1Vw4V5hViprrhl9g6bRI4MR6P
	Nz3+dXI0tthwATI5Cwz7I+Mw012dJCA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-HcoEoIOKNimZDUe1_gefCg-1; Thu, 02 Apr 2026 02:46:58 -0400
X-MC-Unique: HcoEoIOKNimZDUe1_gefCg-1
X-Mimecast-MFC-AGG-ID: HcoEoIOKNimZDUe1_gefCg_1775112417
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23c909256so6915115ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 23:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775112416; x=1775717216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mxu2F3PCmiUGqsP0hxcjrN1Nn2zyXEIv5lQq4+t4q4k=;
        b=B9plMG811XIcJAL+Gf/iWmXpfBMGK/fWHz87sb3U4jFVdlT4Wmml9rgl21Ow12wo78
         b2UiLykZjNWSDhTV5PNXxHh7z723MMtICMPtQU6zyE1DdyDpaOC5VB4SRdSf93aWRPU3
         1Nohgh/n9OHOvBKOfioTdKS7zbgFhTrefe6cDInd1N1ISqUS02RFB1jSteShoT7TdVaX
         4AAS1EBZjmpc7zjzI0apv1CAyMT6JBismImigEwnEboy4IezUWq17cGm/SHcH9CYRXS8
         LunOFrYtmQnPWfQqC2Lbc9EdWPMRS69IEes6VTq/YRBmaoUtxeYkLf31FaVQfh0Mo9pl
         hRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112416; x=1775717216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mxu2F3PCmiUGqsP0hxcjrN1Nn2zyXEIv5lQq4+t4q4k=;
        b=b4GLtXsFMPwvhW494rCeyGen8dUQ2umAzmVTomWJzsuFxWacs421LYitPEBZR5yYfW
         nNjIJ0GaOWZ1lTou/jIeTejYOg5HneCEaa12MnIS1IkUeqCJjvSH1LSaXna8v3BDg0Gf
         BZOxNkqhZWWg0Dyyg6pdch/bpGWPyhkwBtMy6JP9d8MS/nX0YZMP1UdnDngumXVzhVRa
         v+xtof2eUPPb74zKs4KsiE9Z3IuZSNQ1H1tMZNvCOuEz7YXeC1FcJd7c8zFWleYsbd4N
         1gVrRqWkR/1P3Cu+hwEnd1RC6mvhaipWeXsPDHP154NUrNamWzQ7+7I/H6kBWuL3Wm2h
         zJxA==
X-Gm-Message-State: AOJu0YxHdStzHBqrq/l0q1owgHdxHTPnvka2AVV4MCz0Hf06p01394WH
	fESp9QjwkSibUGA6JRVG/fU131k1VM6wzf2JkH+tbhtHJCRTUEUWz8WkypXYrtZrnfvub0FAmCt
	qobSD18/nhLQFAAsUH2vjvdjDj49BhNSt4qlmoxW3Xr+QOM9zi4qFdvQqP23vq6Ig4mqkwPZ+yV
	EV9d26G6AJVwVE3ZD8RmQg4Ds2SpYnvcpSLqkj9VIHanB3CqKEbOyqKw==
X-Gm-Gg: AeBDieuV9ZUpKEuD1MANLj74zjCZusIbEcX8FsJyWgJezCIZkrVBWFxYL0rkKrjqDdC
	J2TR6ndWn/DIqieI/65wWdoaobNORidSFnlL0euqKx9HWnik4AgH15x6G6eyEAMsamW2v3oI6yX
	QNxQbhdQks0BG94Y2CxAYkb0BytUdwaPHWvcfnkrvDWZsT2dZ/tsHk4x3sexH40Wn+5hrW8/Zci
	BDfLQYNre3ToZzonoDDFqcU9CpVPymb0He01LFHQ2V1aOjSLHm5/s2ow+ePrF0w6b+kBtcJNNxv
	HMxQ18QWP8wC9fQlzSpkz4ula/uEGIMOiH+Q+fzFlpdn6tBeDmPGZKSgXsFwT6NZSio3bTG7w0j
	g4aMA+XDYvtlH/UE2aA==
X-Received: by 2002:a17:902:ef43:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b269cb704cmr65098175ad.42.1775112416477;
        Wed, 01 Apr 2026 23:46:56 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b269cb704cmr65097765ad.42.1775112415869;
        Wed, 01 Apr 2026 23:46:55 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm17647875ad.1.2026.04.01.23.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:46:55 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:46:52 +0800
From: Li Wang <liwang@redhat.com>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, mkoutny@suse.com
Cc: Waiman Long <longman@redhat.com>, Christoph Lameter <cl@linux.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeelb@google.com>, Tejun Heo <tj@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 1/2] selftests/cgroup: Fix hardcoded page size in
 test_percpu_basic
Message-ID: <ac4Q3HT4Jep51iE9@redhat.com>
References: <20260306071843.149147-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306071843.149147-1-liwang@redhat.com>

Hello All,

Gental ping~
Any more review comments will be appreciated!

-- 
Regards,
Li Wang

