Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC834A771
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518101; cv=none; b=OnrzNEYAIRP7yttByx6Zcx7/wwS74RoQcTO+Q0GzpP4vjsPjvZjx6BFzEUaFbKZn2fojTmm8N5IaUOkoLlmH/qztP6904mhI2cNegdkufjCJJxEHPskS84hDceGgF2TIQIaaAsaXZSmac0jQLpYO7bJpTLsPgKwWhC4lVcaQ4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518101; c=relaxed/simple;
	bh=495kOlwnrMTCkuFmO40akfaFo9M+9mcvTROvYleSjDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP/YEgVXqLrkgWc5IrpPypo/x1PelZoL6tDk6a+grtN4INTHW8b/GsBYNh51nGYajKr8CM2HEUCxLwOj8DTZk05eE8M9AeHuV5V6ocOfkeFuDVKsfXTsddn0tzhP+w/HNiZWCWACf/LPDE6XOhVWio35Q+rn7++OFob7hrOjLeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka79Ke0Q; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka79Ke0Q"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64adabaafd6so1023096d50.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771518099; x=1772122899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yMbxlGezH4sa14/TBr2ZfFYSUw/HBsY8h6kQEV8fEQ=;
        b=ka79Ke0Q22mX7wYxaHB+HoCdoTPbbspZC/cvY/P6LTt9fVvBRz+w8iyWmptYdEehz4
         ycCEOs/QisBD5yIDdludlT0Ofx3GtnOzpYCsJABjgXx83qi2St+UvS45Cfvn/zBH5dPw
         3nRamUxQMRvhPNQeZIDURs1BkR5jK6OgKGmL2JZJrAoJH7mnsITIxyGTULpHLs39aejP
         1LoTpRLzCHOi5WCAZyEKQrr2Fm7UctcvV7kCH+MYTs8KN5PujHBdDqqx9l342fqCsDKp
         X98CXWukDhid1i4LNz4bEQw/rCrg/jkMU2YAPlX2cKsuHuQToPua22WgD8fzP3I05nNq
         +LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518099; x=1772122899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yMbxlGezH4sa14/TBr2ZfFYSUw/HBsY8h6kQEV8fEQ=;
        b=sPOwYrHKT8AtLmulgC1O8Amd7gkdtlZq7f4k3e10/FUfvfXLOm23+wq5tYFWW5BcIo
         4zlCoESguoVgJjfim64aDnsdGAMve7sneaLUaPhY5Kry/4X3eLylzheXoTegqhMqwBcy
         qZHZXT2VP3yN5alA9GBGdYBzZOzRnuiom5VrcvOVq1u4FUBIYlIlg8sMIMLpADJyB2R3
         IQfGjJjTRIZ5wWjtN2P6c/P1WXDUkku9SkoruRfqJpfKA85NAI1G8OtOGrqnyEUd5U8Z
         2WoCkQwlRXyujT0BODGvi4m5Cq0078fQ7kEQUCtd7n43snZJS6DRyXxWt1N0RFP9Yvir
         g7uw==
X-Forwarded-Encrypted: i=1; AJvYcCUtmxuI34Mzsw+SPGlRRWNnffQftpF9E0WdvnVz9j9cT0QF016uYdFyr7yW+X2vtNBq1fvPBCoQQF+K8scy9vY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2O+iUcMOIB1MjSMo3qK8ohnfWuQgJi2x7rHKKvLR/4Ng6ZWgD
	ycb0TnajNJD3c6aI9VEdRf7XkwUOL6JM7q/6lJNLRKpkXgwaDwA4Z0eJ
X-Gm-Gg: AZuq6aKdBZyQN88R2X9chzDGhrTtUK6MwgbT/+P81RfUn00/uDWy86GJjlkfIA4Od+l
	j6elfRPg495R5/HUIwjK2jer7TnVAMvYFTeYegIo7WdmvZYpd9qE8ZW9orvTGnakm95Ichi/IkB
	Dh3a+H45NH5ORg5+lXCOA9Fsgl5Cn2NziRc61Q6FdUk4o5U1/IurYhDEWNafEqFIaEOsafn/hBK
	p3Se8tX2Opi4K8IG+tXllYKrE9ZlXSO+CmZlIShXwhXK8maahwNpHXopCJ0ceA7lP67Fz/oez2B
	b10hhwjWLfP0B7G3uz+xRyEBfa+6EdkwRI9mSI4L6S1pT2s0KxUY7XwiLy+sPSxTqLcB475EmmA
	pWJfoZnqa8Snce1zKt37sPVXFZTyKCdpHrg5XCQH+r/ZsSqQJdKSHMzPg0nx1WvlQp0+SYpB73H
	2SJ+nRu9vBnj+gtztu4f4XTdLlXj5Xs/xIwBfFCffteywRaCg=
X-Received: by 2002:a05:690e:4091:b0:64a:cff3:8f3c with SMTP id 956f58d0204a3-64c556e0056mr4348350d50.91.1771518098772;
        Thu, 19 Feb 2026 08:21:38 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:5a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22e6f651sm7284854d50.5.2026.02.19.08.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:21:38 -0800 (PST)
Date: Thu, 19 Feb 2026 08:21:37 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: Re: [PATCH net] vsock: lock down child_ns_mode as write-once
Message-ID: <aZc4kUOikmKKCdhw@devvm11784.nha0.facebook.com>
References: <20260217-vsock-ns-write-once-v1-1-a1fb30f289a9@meta.com>
 <aZV6HRAIsf_rNRM2@sgarzare-redhat>
 <aZWUmbiH11Eh3Y4v@sgarzare-redhat>
 <aZXlqv5ukWymz/NI@devvm11784.nha0.facebook.com>
 <20260218164119.72368d53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218164119.72368d53@kernel.org>

On Wed, Feb 18, 2026 at 04:41:19PM -0800, Jakub Kicinski wrote:
> On Wed, 18 Feb 2026 08:15:38 -0800 Bobby Eshleman wrote:
> > > > I'm not sure what the policy is in netdev, but I would prefer to have
> > > > selftest changes in another patch (I think earlier in the series so as
> > > > not to break the bisection), in order to simplify backporting (e.g. in
> > > > CentOS Stream, to keep the backport small, I didn't backport the dozens
> > > > of patches for selftest that we did previously).  
> > 
> > Sounds good! I wasn't sure if breakage so tightly coupled should be in
> > the same patch or not, I'm happy to split it up to ease backporting.
> 
> FWIW the netdev recommendation is indeed to split the selftests out.
> Also to bungle selftest patches with the fix into one series targeting
> net, even tho the selftests patches won't have a Fixes tag.

Duly noted, thanks.

-Bobby
