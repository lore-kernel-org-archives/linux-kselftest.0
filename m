Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393D62E7395;
	Wed,  9 Sep 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943520; cv=none; b=LBRbWFovCXC2a4akIT5U7CpsjRYhwcR5z0oufZK23PJs8wCax2Qc/se/q0ASdoxd3Fo0e0IzxHMZkhQvFedFynwo3/8DUq7D6Gsbpq8yrLbHeisGr6m89a+8vuYAuf4F5qAIC/x5tSMyCGpeUs/naaINkrcruzXC3JImaLKV1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943520; c=relaxed/simple;
	bh=IDEZ/1m0GEess8Ah5yDcc0vSlMzGhV9bGWAodPIAKZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXrK/k6IWbUromT4cZQNuzE9Em7Rd2SN6lpgeH50ivOkL5/skQk4XyIS/VlU2sWsbbt8hP+BqKCQEdGK/76QALaTVa2hcLDSNX4K79iDPycFj0HFgkoGrCMoqxLHLdFo59O+wyfr9LW/RNUoZPKzEedMCjNwt/6u781UjoRoIcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KMMHWos9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KMMHWos9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B531F00A3A;
	Wed,  9 Sep 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788943518;
	bh=eM9ktLiB61lA8CFhKE5IExmNlNZqNI8om2BER4rNQmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMMHWos9p5k+jDWn+Xts/yawooJOCC3c5VhfMSH7KCMiHPmT3syBlPbEEeajv7LCQ
	 0P7/kIjENrskNwfJC+2zYHli9kGRu5/3IZ3G5E9yAXsKNpE5Ilt4VzmLWP9w0XYoz9
	 riwWBcJmz6+77PbJhzCukjn9ALkLhUlwSRFkidSg=
Date: Wed, 9 Sep 2026 10:45:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>,
	Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <2026090900-conceal-porous-b16b@gregkh>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
 <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
 <aprVEyqOrdmuD-HN@linux.dev>
 <2026090456-unblock-elixir-7d4f@gregkh>
 <20260909-steht-nahelegen-zutrauen-7eed38304a5b@brauner>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-steht-nahelegen-zutrauen-7eed38304a5b@brauner>

On Wed, Sep 09, 2026 at 10:23:28AM +0200, Christian Brauner wrote:
> > kernfs patches go through the driver-core tree normally, not vfs.
> 
> Ok, I've taken quite a few before not too long ago. Do you mind leaving
> this set in the vfs tree?

No objection at all, sorry for the confusion.
