Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838DB339386;
	Wed, 22 Jul 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719045; cv=none; b=Zpc7vlrJXIyXXtEaVbHXgBCRsEcN68klfezHdspRZ8PrWTQ/trZjaL9P2dquK0kpjhvIx+EkQQCnj4II3i0OOtp6o/4k2jBmZi56ZbSVTCNY0vjzk7ThPQ7hmVPJZVFchKMdEbpWIqJCjmQRjAfa2aQXRxoiFqGk1G27Fjvmjq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719045; c=relaxed/simple;
	bh=mLBmad2IF7zwsxQIOXJbBcNiq/+f+c1asyvo2iE1cKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTb9PeOBCqVj6p+tHAB6Lpl3GWUO6hvpnwNckjfXCnhWUmlNVIQxAowX+ptumbNu9CQUQaoBaj6RojJkDa+6yXf0j0NRmiY8oDKJVvDSWo2qV5TMTdz5XnCiRIKj0/cDIvZlkl0rTUWFJQzjtdeV/kxVX6Y0eSPsVfVpDpvdGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxcK4iiH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxcK4iiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD051F000E9;
	Wed, 22 Jul 2026 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784719044;
	bh=W1P65/mJsa9J39SKh4UHgjj2odfTeCzXi03yQh9FyBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VxcK4iiHJ3gSdcRW158uH6wYsHetp5V/l9h08RA4Tl318X1UmfF9nlOSrfccI57cV
	 kbqVMn9Hl1/qVsV1i3NP1tv2oi6zLf3IT/g0O2w97YBg20t/yW/Xx4jmj6jzRglNNq
	 FsCzk4ApvRSt6qfUXz8UZhpDlVGRJywCqcxC+dec+mOt12cBiXT9hrhz/1k6JfEJQZ
	 A39lBkmUuJMsVcq612mjvSxCS1yymtgpgfryMnnPyH52iFjXhNIltfueE/9AJh/i0K
	 NI2o2besPIWwllq2LiiWpSYBcWJUwgC6AibEkgLQ9kN1HOZSKhpSsf3dYY5AYghmW3
	 Q/DEKxmNX4RwA==
Date: Wed, 22 Jul 2026 12:17:18 +0100
From: Simon Horman <horms@kernel.org>
To: David 'equinox' Lamparter <equinox@diac24.net>
Cc: pabeni@redhat.com, kuba@kernel.org, idosch@nvidia.com,
	dsahern@kernel.org, davem@davemloft.net, edumazet@google.com,
	corbet@lwn.net, skhan@linuxfoundation.org, fmancera@suse.de,
	lorenzo@google.com, maze@google.com, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	furry13@gmail.com
Subject: Re: [PATCH net-next 7/9] net/ipv6: support RFC6724 rule 5.5 via
 subtrees
Message-ID: <20260722111718.GB418547@horms.kernel.org>
References: <20260714094030.136317-8-equinox@diac24.net>
 <20260721135013.387122-2-horms@kernel.org>
 <al-EPInqzpka3zi6@eidolon.nox.tf>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-EPInqzpka3zi6@eidolon.nox.tf>

On Tue, Jul 21, 2026 at 04:37:48PM +0200, David 'equinox' Lamparter wrote:
> Hi Simon,
> 
> 
> On Tue, Jul 21, 2026 at 02:50:14PM +0100, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > https://sashiko.dev/#/patchset/20260714094030.136317-2-equinox@diac24.net?part=7
> 
> Thanks for forwarding the Sashiko reports, I was already aware of them & am almost done addressing them.  The external nexthop stuff is "inapplicable" since the kernel refuses subtree routes with nexthop objects, but I've made that more explicit.  Other than that it's relatively simple oversights on my end.
> 
> I just need to make it pretty & hit send, I'll hopefully get to it tomorrow.

Thanks, much appreciated on all counts.
