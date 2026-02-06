Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD5357A54;
	Fri,  6 Feb 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369269; cv=none; b=QNSe1ZS0aHhJYnox788ZHJLoh5EY8eXcsGyZzfZjELIe5UprFBJV3ONvYJnu/+a4F76M5HlQItOgoTMPYs9PRruNNDU3TQ4k6C6gejxvoqo8YYl9UIm0izF8vcHR4xUOLCl7JTj9Hxo76wShYWbPbG8oSGUEUiZbZSPrRECK+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369269; c=relaxed/simple;
	bh=GR8fSTSThsm9CDioVWJRxSN6y95a/im/CBM5f1ZeE1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQFn3GVUGzFibOpZw1KWyYhV8nzIaDBLBRmn/ZmiADijqHk8/LmutyFZNzdeWRdP4+/TO7WvybvQVzVC6Z0snC9gsy6SCgkobo+opEvji28xO1TCb3pm+Ccxb7W2nO0nwDfY7B7bEOjY+9boqX2zPwYwg95i8E0S34jcZVaJZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGRsEiu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGRsEiu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECBCC116C6;
	Fri,  6 Feb 2026 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369269;
	bh=GR8fSTSThsm9CDioVWJRxSN6y95a/im/CBM5f1ZeE1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QGRsEiu3AU9jqkqEBUd9fe3DyxmRQkoM2COqmCMf3ZSNgsos+K8ehdMG27obM6/Kh
	 E8UKUNVmHTYqUlffNxHJk7m8cZlzjuu8NhhRSqmKtsVsQ8Aw45OV/M/1gMT5YIyfso
	 9yfM276Yy3dSg0w4M+tkNqMRX1CbLOrMG5ccbhddZtqmhWdyHy9Ii+01slv7X+vbHD
	 pWDvg3zairuHbiFHF4DVPX/g7TAr43X3DHjFm4NKgiqw9g3fa0uaX0nOhNGAHYMck/
	 RevuvkuZxC72MCvJtVWdpzr7XAllUOAmt6WaOOFc9RMij1nkSUMMfxw6Y9Kv3RSZ1c
	 tkF/q1XayYKWA==
Date: Fri, 6 Feb 2026 09:14:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aYWw8Th89QwHAuyT@google.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
 <aYRaB5wI3mS2J54K@google.com>
 <DG70CSP8NCJ0.316VXMVLD2ARN@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG70CSP8NCJ0.316VXMVLD2ARN@kernel.org>

On Thu, Feb 05, 2026 at 12:56:47PM +0100, Danilo Krummrich wrote:
> should be
> 
> 	int revocable_init(struct revocable_provider __rcu **_rp, ...)
> 
> instead of
> 
> 	int revocable_init(struct revocable_provider __rcu *_rp, ...)
> 
> for the same reason revocable_provider_revoke() takes a double pointer.
> 
> Otherwise this seems racy:
> 
> 	int revocable_init(struct revocable_provider __rcu *_rp, struct revocable *rev)
> 	{
> 		struct revocable_provider *rp;
> 
> 		if (!_rp)
> 			return -ENODEV;
> 
> 		/*
> 		 * If revocable_provider_revoke() is called concurrently at this
> 		 * point, _rp is not affectd by rcu_replace_pointer().
> 		 *
> 		 * Additionally, nothing prevents a concurrent kfree_rcu() from
> 		 * freeing the revocable provider before we enter the RCU
> 		 * read-side critical section below.
> 		 */
> 
> 		/*
> 		 * Enter a read-side critical section.
> 		 *
> 		 * This prevents kfree_rcu() from freeing the struct revocable_provider
> 		 * memory, for the duration of this scope.
> 		 */
> 		scoped_guard(rcu) {
> 
> 		...
> 	}
> 
> Do I miss anything?

You're right.  Will fix that.
