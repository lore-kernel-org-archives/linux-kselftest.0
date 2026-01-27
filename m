Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827073043DD;
	Tue, 27 Jan 2026 15:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529435; cv=none; b=K3lnKn5qLGYGPZMJpUjG3DSfvRsWtamGDFcn6AIeXAt2B6VsqEohinYsyZ/YphuP003+HA63SozcOSxLHWfFCTvqYrNxwap8JyPHFgoHuRqzsM9zsAgXvo7ghEg5AnNl1gV3yDqEKERZkw3LLPuWRPsk1Fc+1a24gi0Pvp3GhhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529435; c=relaxed/simple;
	bh=vNklnJ5wXDtWmxbcq0nis1bhhEFR6gbrn7Cuy5hWVDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6fvDzPaGOaI9ypUV2qrDl6rr+lK5a0Wy47hcso6YAFJoIJORwPI1zNZojSxlPiypv74ICwrt6JoCxtOfFowSZYXo40w6xgNFYKQ0/iz3TcTRx3IYq+cIA5Zkp9aVTQgw7Bokijk7lzK9yse+WvOIpoSNsQG4lS5HY2PcN9eyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5VAiH5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5VAiH5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D037EC116C6;
	Tue, 27 Jan 2026 15:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529435;
	bh=vNklnJ5wXDtWmxbcq0nis1bhhEFR6gbrn7Cuy5hWVDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5VAiH5ZPto2JwnelhLy7T7Y4Xa/PIEfQ4TNbtouJkbCLtnwr2V4/EMpQVoKYse6p
	 3E8plSjKUUdAYE6E5D/1uXNXPzhXQtX5YifTpB8DuqBMFy7yFTUWLJGoPQilVLau4w
	 ToNX1Y9q/sU5BUYOQEYu9i5HiZhq/VsOPBZxY2CreSwE2EACcb/O7gu40AAi22nePF
	 N+mKrkTM3uEYoM635yij7hi10HBLS75QQYVYJt3O/BEFBCcVe1RrQG8+B7vUMinuZD
	 qGX4OqwzZErOEZ1waRfpfRnyKOB37R5KfeAmNtlsawuCnvSinQl6vWQq1ajry5krFN
	 b0lMgtzoxnByQ==
Date: Tue, 27 Jan 2026 15:57:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
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
Subject: Re: [PATCH 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aXjgVtUPSKS7zH_K@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <20260124170535.11756-4-johan@kernel.org>
 <DFX09S7L40VL.1HVC33VXNDDBW@kernel.org>
 <aXdqGDYPZFXzO2ST@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdqGDYPZFXzO2ST@hovoldconsulting.com>

On Mon, Jan 26, 2026 at 02:20:24PM +0100, Johan Hovold wrote:
> On Sat, Jan 24, 2026 at 06:46:11PM +0100, Danilo Krummrich wrote:
> > On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > > The revocable implementation uses two separate abstractions, struct
> > > revocable_provider and struct revocable, in order to store the SRCU read
> > > lock index which must be passed unaltered to srcu_read_unlock() in the
> > > same context when a resource is no longer needed:
> > >
> > > 	struct revocable {
> > > 		struct revocable_provider *rp;
> > > 		int idx;
> > > 	};
> > >
> > > 	void *revocable_try_access(struct revocable *rev)
> > > 	{
> > > 		struct revocable_provider *rp = rev->rp;
> > >
> > > 		rev->idx = srcu_read_lock(&rp->srcu);
> > > 		return srcu_dereference(rp->res, &rp->srcu);
> > > 	}
> > >
> > > 	void revocable_withdraw_access(struct revocable *rev)
> > > 	{
> > > 		struct revocable_provider *rp = rev->rp;
> > >
> > > 		srcu_read_unlock(&rp->srcu, rev->idx);
> > > 	}
> > >
> > > Multiple threads may however share the same struct revocable and
> > > therefore potentially overwrite the SRCU index of another thread which
> > > can cause the SRCU synchronisation in revocable_provider_revoke() to
> > > never complete.
> > 
> > I think the easiest fix would be to just return the index to the caller and let
> > the corresponding revocable macro accessors handle it, such that it is still
> > transparent to the user.
> 
> It can certainly be made to work, but it will be a very different API
> since there would no longer be any need for the non-intuitive
> revocable_provider and revocable split.

Thank you both for the suggestions.  I'll try it out.
