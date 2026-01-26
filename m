Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC130E858;
	Mon, 26 Jan 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433630; cv=none; b=XyqrLUhkWqWd8lp7Xl8J+lLmukSKr/GFb6r6vvwqx8vsnPmRhsoVV2O9SGoDopU4U9TJmad9TYVVdR9lZ1Tz/d2MmaClqPqxrOJNIDv0us8W5iMT2WY7FNgEqgutAj6dad0/Xn3EXC3aYwv8RL3OzOMWU5f95MQK3dXGmkxYmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433630; c=relaxed/simple;
	bh=8jZrnzUYDUUOoK8d6xFPyab6RoA9Bm07KKnPrG5m1/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVRI3rGNzc1fxlmltU+3c4hkvrTp9kzNr/k3FkGB9w4SIsjokShml4kEby1blPfpFG8H26uDqrdZe3puHZKFVe0MMc4fRIkouN3wbTjb6NrRE4pppm18X1kyGRVGMNf6+4Xsh372BdFtBeYLYzfTFN23j7QKTwO+2YBPc8Z/ik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDb8sAud; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDb8sAud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF18AC116C6;
	Mon, 26 Jan 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769433629;
	bh=8jZrnzUYDUUOoK8d6xFPyab6RoA9Bm07KKnPrG5m1/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDb8sAud9TgQFi7+fJBqBhtKoaKp/dJWQjEfabG8ACJBNti1YBxIKRPZPFs7vOeSv
	 hL1OezN3hl9rw1Hjjg6YJh5nVLqLy59VPZcjMaPKWsQ/kGvR3m99Xm6cb20a4pu3a3
	 rvbx64x33oEZnpCacX7Ai/V5AFNCI85VMv2XCNdbAOITaAB77xk7ncrDlw/pHHuqHd
	 PXtrwSF3cYmPIG1gcPzVF120aqnzTsOYobBqrRGsQth+BiY3WKYqxRBNpTo8fK0yP8
	 AqpCK06kKc4xb01gg82EwuoY/kFH+Bg/fJB3BziiZEzDXA/+DznWfff0Q04548XKg4
	 vk7n/Xx7h5NuA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vkMW0-000000004a3-0avc;
	Mon, 26 Jan 2026 14:20:24 +0100
Date: Mon, 26 Jan 2026 14:20:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aXdqGDYPZFXzO2ST@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <20260124170535.11756-4-johan@kernel.org>
 <DFX09S7L40VL.1HVC33VXNDDBW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFX09S7L40VL.1HVC33VXNDDBW@kernel.org>

On Sat, Jan 24, 2026 at 06:46:11PM +0100, Danilo Krummrich wrote:
> On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > The revocable implementation uses two separate abstractions, struct
> > revocable_provider and struct revocable, in order to store the SRCU read
> > lock index which must be passed unaltered to srcu_read_unlock() in the
> > same context when a resource is no longer needed:
> >
> > 	struct revocable {
> > 		struct revocable_provider *rp;
> > 		int idx;
> > 	};
> >
> > 	void *revocable_try_access(struct revocable *rev)
> > 	{
> > 		struct revocable_provider *rp = rev->rp;
> >
> > 		rev->idx = srcu_read_lock(&rp->srcu);
> > 		return srcu_dereference(rp->res, &rp->srcu);
> > 	}
> >
> > 	void revocable_withdraw_access(struct revocable *rev)
> > 	{
> > 		struct revocable_provider *rp = rev->rp;
> >
> > 		srcu_read_unlock(&rp->srcu, rev->idx);
> > 	}
> >
> > Multiple threads may however share the same struct revocable and
> > therefore potentially overwrite the SRCU index of another thread which
> > can cause the SRCU synchronisation in revocable_provider_revoke() to
> > never complete.
> 
> I think the easiest fix would be to just return the index to the caller and let
> the corresponding revocable macro accessors handle it, such that it is still
> transparent to the user.

It can certainly be made to work, but it will be a very different API
since there would no longer be any need for the non-intuitive
revocable_provider and revocable split.

And that's not the kind of change that should be done incrementally
as that makes it much harder to review (and it affects all of the
current code; api, implementation, docs, tests).

Johan
