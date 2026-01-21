Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5637F10C
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 17:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017014; cv=none; b=VBhHaQb7qcW17RSsHVWo7GU8rOd7+baXSLSEWvWMa8mg8UK3MmmS49z1bioU97k5DH4zVjogm55QqmPHGCwGZnci31ResBUMU7ZMMtYpW/xGwNw03pSS5QzlV/c3a8FbEibMZO1CePksQOPh/Tl9gh0rY3/5L8gXxbN9zuKQ1Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017014; c=relaxed/simple;
	bh=tpGlhPJQhs6K29z4KKdexPB885DZk84UD04BRE7PW+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+CnoypvD7dJKG/FpJuhF5w5EAahuo2lmYqsI2jdX9oIU36A5JWxNMZdFcH4k+xi0Iko/VsyULrleWr5hACrX04AGYASWvwhLmf/lKjWBV9REfua6+VGwByOFR/5jArTVUDDBz7Gnjyj0FEkEeTwPVJnsiJFYeSSEA9LocXkIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCCGwsSn; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCCGwsSn"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6446d7a8eadso162010d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769017010; x=1769621810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzQpPNktFvNOdBi7+gsCZqhpBpuEURHyo6CUuqA6z7E=;
        b=cCCGwsSnRtmoCkAf/NTQtmaBasIN2I58Q15Ljxb++/KX+GhSiZ/IiKr6dn6nIzF/Qz
         N1/VL2O9l4io6YRGd/QZx2JxTaoe3km0Ux9s5s0uFOVmfZ4DrdIx5tHlEfnGjWlwVbgD
         Mm0CVcdR9PjNS5Pqba2TWoKXbXQ3hTnsxAta+gcYwXnQvRWGmReuuAxfXK+WVJ42w7xP
         HHZznvsa4G9/Z1WE3+wi4VZWZxLvSN6FCnjetTk2698CYz0oek0L0+RMSYU9Bj7R0gsa
         sGeyyBgemZDSTFqHIlYSpvicCd74Ff+j7gr8yCi2LKY2g7AL4vOu1gPNXxgOiG2iYlT6
         ijSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769017010; x=1769621810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzQpPNktFvNOdBi7+gsCZqhpBpuEURHyo6CUuqA6z7E=;
        b=sOj3iw2CbhHA1RKXDpc6Kl2okxz8UQ3x35FsOa7jM8aef3N1Nh6kkZwSfJV65x5lSZ
         J3E8SvwLxNz4jRlaRG1+FYpFhNLSTq3ZvRQdbkvHo5So4fDH+KTV3vt8Kl8Jr7Tb1tja
         WLgROB2nBmluWQC3PKucyAdTvPXyuu1P3r0NkqRA8svtMfMKUesCeDIUIThhRXqjaGiq
         nDx89j1Ec8PXKNin78nMcgFHtTVSzi2+oeTBLYjSTaYfcxW1Wv3FfyVjglssb5cBeANA
         /MjnBPfLHvAJnTiVJY4WSvYk1SALE98rjATpnrS+TPAB/s6KceSG1lfJmXSpBs3Audo+
         2Slg==
X-Forwarded-Encrypted: i=1; AJvYcCXTPyEurXEYYVsTmRMOSM/jCgJl0j6dukVARPrshxCX3ojJoZOMG7wAw/jvTPDH6Ys8A/07nBokJWzREwC/qnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrNajHIsQkgivhDnMcUMxZ1SMhmNz/5xA6i8M787rX30L+yKy
	afIM7DBw/rQ7AX4GeZL6B6FLq8bw3/nRu6gyXnPGR+2F7pQftEJxLtSl
X-Gm-Gg: AZuq6aLRIyL9ZLQvNGZhHyi8j5KIBERjUCYE28OCq4ESRJ5e6vQV4Z3OE6OYy2tyr1p
	ECPX2sDGAweVEoI5yOG/E+AU3wDnajO7gvAJPtJlZZIwmjKG9y3r1NtjRN9qVRI9gVHDEBPiCwN
	+AbWwbfYcfEJg5JRuL3R45AYQrl9cZvwuN+bYq/YO0mCGJNRp6wu43ebIssgtOkfqLdueFRzZzs
	7J+6CddpVJWLklGsYcMXzEdUbAQsiotwLBmOVIhDSM3RxlCORgBD/BOkG1GK2V3ta2jnRSefiYk
	PG+03/Gu1IuGjqRUhe+J39aBrgOczlAcAs8m6PVWIVx2LnMbVQCHl+P5/fvAi83e4NmlCS1jq8S
	a5SnjDjjTe0tz+NU26I2FfrRakFVGrCQwDN1H5ITLCZevPcKogMrOsXOZ4a049UfMqCdGkf+3yO
	f01UF4xHPf2tlxhvzbRsC1TyqYcy62w0LjY4VncY7Op7hO
X-Received: by 2002:a05:690e:1c1c:b0:644:60d9:864d with SMTP id 956f58d0204a3-6493c872baemr4135180d50.92.1769017010185;
        Wed, 21 Jan 2026 09:36:50 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:d::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649170adf11sm8096311d50.16.2026.01.21.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 09:36:49 -0800 (PST)
Date: Wed, 21 Jan 2026 09:36:48 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kselftest@vger.kernel.org, berrange@redhat.com,
	Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v15 01/12] vsock: add netns to vsock core
Message-ID: <aXEOoCqMvsbN2gtJ@devvm11784.nha0.facebook.com>
References: <20260116-vsock-vmtest-v15-0-bbfd1a668548@meta.com>
 <20260116-vsock-vmtest-v15-1-bbfd1a668548@meta.com>
 <aXDYfYy3f1NQm5A0@sgarzare-redhat>
 <4997118e-471c-45fe-bc1f-8f6140199db5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4997118e-471c-45fe-bc1f-8f6140199db5@redhat.com>

On Wed, Jan 21, 2026 at 05:32:34PM +0100, Paolo Abeni wrote:
> On 1/21/26 3:48 PM, Stefano Garzarella wrote:
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index a8d0afde7f85..b6e3bfe365a1 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -8253,6 +8253,20 @@ Kernel parameters
> >> 			            them quite hard to use for exploits but
> >> 			            might break your system.
> >>
> >> +	vsock_init_ns_mode=
> >> +			[KNL,NET] Set the vsock namespace mode for the init
> >> +			(root) network namespace.
> >> +
> >> +			global      [default] The init namespace operates in
> >> +			            global mode where CIDs are system-wide and
> >> +			            sockets can communicate across global
> >> +			            namespaces.
> >> +
> >> +			local       The init namespace operates in local mode
> >> +			            where CIDs are private to the namespace and
> >> +			            sockets can only communicate within the same
> >> +			            namespace.
> >> +
> > 
> > My comment on v14 was more to start a discussion :-) sorry to not be 
> > clear.
> > 
> > I briefly discussed it with Paolo in chat to better understand our 
> > policy between cmdline parameters and module parameters, and it seems 
> > that both are discouraged.
> 
> Double checking the git log it looks like __setup() usage is less
> constrained/restricted than what I thought.
> 
> > So he asked me if we have a use case for this, and thinking about it, I 
> > don't have one at the moment. Also, if a user decides to set all netns 
> > to local, whether init_net is local or global doesn't really matter, 
> > right?
> > 
> > So perhaps before adding this, we should have a real use case.
> > Perhaps more than this feature, I would add a way to change the default 
> > of all netns (including init_net) from global to local. But we can do 
> > that later, since all netns have a way to understand what mode they are 
> > in, so we don't break anything and the user has to explicitly change it, 
> > knowing that they are breaking compatibility with pre-netns support.\
> 
> Lacking a clear use-case for vsock_init_ns_mode I tend to think it would
> be better to postpone its introduction. It should be easier to add it
> later than vice-versa.
> 
> If there is a clear/well defined/known use-case, I guess the series can
> go as-is.
> 
> /P
> 

Our use case also does not need the ability to set the init ns mode, so
I'll revert this bit.

Thanks,
Bobby
