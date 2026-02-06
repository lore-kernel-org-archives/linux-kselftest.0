Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E23350D41
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Feb 2026 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369674; cv=none; b=hd9w86ElhPS5o3a3NbdgsEQNhULQdGIEbf9+1TNTXanHdQ+3h0WBQxn8e1atywnPPtTp1ayVhB5shcGgHHK/2oJDhu1D7CA+uFrtu6ot01EGq0txVp768xHM7B/R1c01dgnaLIsjG5Vp6aX5ojUV9Rv3BJyzXgVFnzgiNKwrABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369674; c=relaxed/simple;
	bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE8NqqkdmXA629mOEEcjZI5ePa33RLS5fsnHkL1ClfBrf0kALCiN+hg/kUxcEu1kRzACK+wOHD6kdwql5S8VAY43FO8vdQ+0u14Tf3DDIkizZ6HQZwJ4Y8v1XoiP+hW9/R6J7UOVqhyPnwX4FXIsUilMJ3+Hes486u3qND7n9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=1SD7lkyc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="1SD7lkyc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480142406b3so15055175e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Feb 2026 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770369672; x=1770974472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
        b=1SD7lkychrBCkUtZgs7PjPm5kuQs14E0On+1DH2AAOVRkYXUmDkdt62pIjvCyEtsTB
         BDOkASCgvFWvIWLPjSmmRq+37Dcl7/RAl3s8OVFyO8BhVQSeIGsKyfIQKkUPPrO8G6EL
         gcBeQDKJadLj9buu7DIeEcHmiRCSS5NaQ9dV7+BCbYyzAcrMFQCmsTrPxdftsYdikH6e
         EgLSTygeRc1ju1n97ukBjdnWsThiAiM0yQi1IOjJnypPP6Xo6rVqNrSoKneyC0JHG7X/
         kNK7I3JQqD1e9wUinelrzX3v50EZTsU/RHiEr3oczDNWqJMeCYsHkOCXAS6U5QeFgMlU
         KfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369672; x=1770974472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYHqopYroroGJu4jPezMwlTHDcRYczudf62+B8v8YAg=;
        b=BHKVu6ZL6Uw5pYcFQEDEJhXZ4x+yBefDikytk1ELWWACCCCCUCmnvy70Pbq9yxpSjJ
         haEInpnvUtRTT52CNKfsziuewal4egYmYoQJq0aAJx7ut1s0UmlOt3UhNSirvAXuvrzD
         q6BpTQEI4/mPhBEH8hpSHme6pFSOrf1tuKAcNfmITn0/r/VwPbucO6V4rCfjHyQFkpwh
         5sKX8XXxT3w3tLdkEtyKjKQqnNHX71JxbLdHoV2mOaZn529PV0OnOFimrNNvZ1eo8YoM
         Vet2I0FJTSoJex7pMP9GSfmh96yOmOyHPvTZKLs7KJ3K3cjGYG0tyLfAX2Z1Pbvs9KiV
         t8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWtg9SFMvyeFvkVJ0/Kr8556/Js8FK23bNIe8VOHbhfgcdkyzbRv+YOf31yhbLR+vElAkiNfl1XWkj0dsKOayA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVy59bhuE7yH372jdpIl4GGLJ2dm77ruqs6y/7OGUK6AwyOxVs
	ANG1BYX3Etx0/ozW7wGUjSintqnpxwkT6Kh/mN2JADdm91aO8+7jATjJo0OQl68vx1s=
X-Gm-Gg: AZuq6aLebAmhXuN0PHEtz3+QLcpug7LTiNnSkzFNvZm4ljcLh+BY670yrHr1l9aFfWz
	Crg7C435l0uO7vBTW+65Yp49zkK81El+pLWK4V5GfCL7ifm2f8NtQSO+vKWuJMB8owXHZwKxn/x
	x/xmrmicEZQQptvt1H41wIIfhDUcO2bStq+5R3BsflIph4JTRxVgMWN8wLatnH5BTCFcxqtClpm
	cvSmp9sTBsbbhpKzMtYrvy8zLUIxRzbInzGqakKVWI03uqA9i+WwNJBAFS6JvjRqb9zuvYdcGEk
	RFFXux3viHQC2f9OzpDMw3CJuGQApCaGhQF+v0O+AJe/pEoKMxxPw4DyujkCKI+9Vhz2fyncHzr
	+pChCNs4ibCqJF4YlbtsDx9u0IPYbGPJyu0bYe/ZY81SLhq2GOIMS3fmVhzeaOEvoCAo0Lj069Y
	Ug7ISvfgkpBo723janOEU7Rkh96ONzhA==
X-Received: by 2002:a05:600c:8b57:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-4832021d9b3mr30466725e9.30.1770369671987;
        Fri, 06 Feb 2026 01:21:11 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d8341csm109643915e9.13.2026.02.06.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:21:11 -0800 (PST)
Date: Fri, 6 Feb 2026 10:21:09 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 2/7] devlink: Add port-level resource
 registration infrastructure
Message-ID: <oh6xvllidmtqx7wmsbmvghc7zeokvvgwkj2kbt7erwhn6jt7r5@gl4knllsp35u>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-3-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-3-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:28PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>The current devlink resource infrastructure supports only device-level
>resources. Some hardware resources are associated with specific ports
>rather than the entire device, and today we have no way to show resource
>per-port.
>
>Add support for registering resources at the port level.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
