Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314FA3CE4BF;
	Thu,  9 Apr 2026 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739585; cv=none; b=Jo2LRh4BhxLEx6n7KKcvYYHh0gqENzoSUDUKteznzEzjtjT5pHsp1XmFuu8k3lrA8L7BHBRP5oqucBoJBTNNEIoB/qq/9McGwPHwsweCWZQSpIWsGNRslwiSncgkRTXPplfikXvTy1r715dR+mUgApUMSgEKZ/FmSUlOFE6Pcyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739585; c=relaxed/simple;
	bh=pJ1V6OaV4o5A/yU6ydWckqPE/YtMZmCIQQetPk9+6GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0VNEZXqbvxLjB+V82cuppbtobSjN8s3djLzRGQZH0lm0X1sHkskZyu+Ak7Tv4ybJJLVFQhdAV3vzN7vHhDJskVRwWjvTIQ8Q+d7A/tJfAWvdzOrxMrTED3GHPgRYMeCzWgMGWSzG1Fujs8wsrTzWrgZqtJengIUIlyOcEVTvHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+BQhj76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+BQhj76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AD3C4CEF7;
	Thu,  9 Apr 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775739584;
	bh=pJ1V6OaV4o5A/yU6ydWckqPE/YtMZmCIQQetPk9+6GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+BQhj76uhIW1VHAnMPRnyU4bEGB/G31hFlJiSk0b0KyDzTWQVfOvq/UvdtE1obDA
	 VENorFHxAXez3YCDHQ4ahTA8f52c1hjPdedPfihbFMg5JaEZxfVhUdl6V89SIEYq94
	 ryl73MUwTEz5O4mzButyu2BD5vl3TR63OVN2JVmtBNWSeoeaOCJm4+gbUZjcIV4mQc
	 oOkijBipU0uNVHOP7c8vzPKHi1i7W0w0JpUpk3EoYbCxtbkrA0+A9HbbsF2vsSXNsI
	 nlP3uhy5Opzoxqzz9tB3A6wszAwrBGzResRmqO0ttl4Acjl5S4dKU17wdAIhKaIP+8
	 kS8CQHO2mHIqQ==
Date: Thu, 9 Apr 2026 14:59:39 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yohei Kojima <yk@y-koj.net>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/4] nstree: Fix spurious ENOENT in listns pagination
 during grace period
Message-ID: <20260409-hockt-aufguss-caffce091043@brauner>
References: <cover.1775404451.git.yk@y-koj.net>
 <adT6qbiJnTDg-Srq@desktop.y-koj.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adT6qbiJnTDg-Srq@desktop.y-koj.net>

On Tue, Apr 07, 2026 at 09:57:38PM +0900, Yohei Kojima wrote:
> On Mon, Apr 06, 2026 at 01:50:36AM +0900, Yohei Kojima wrote:
> > Yohei Kojima (4):
> >   selftests/namespace: fix selftest hang-up caused by zombie processes
> >   selftests/namespace: fix unintentional skip in ns_active_ref_test.c
> >   nstree: Fix spurious ENOENT in listns pagination during grace period
> 
> I'm sorry, the subjects of the cover letter and the third patch are
> incorrect. This bug is unrelated to the RCU grace period; instead, it
> is caused by the handling of inactive and destroyed namespaces. I'll
> fix the subject in v2.

Ok, sounds good. We can wait.
