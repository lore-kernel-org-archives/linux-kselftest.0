Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D019C542;
	Sat, 24 Jan 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769276776; cv=none; b=Mvcj117jC0FV/XITP4zy64m/yCAAnTQ/ZTMQzYO8vRZ9WTeUCJrdRmBxAhsird0Uxe3bHOAb8jn3EP12rYDJM3jjZdkYlA50awwe4JU80E6BweAUNLixqKKrQsPr/CQk87lEmxUi5NbrUw8gVe4oJazXXvQSV/FXSco1WBEgmmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769276776; c=relaxed/simple;
	bh=FLi5x1Bv6Y+47RbLVUzrS+CBoJDWq6L3sQAn8KSrfCg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=q3GLeq98rPZHlwKbn4VihMrcgzciWt9XSLmAMB+uaWhMeO2CafsHyE/QfFjqBp88BJ2VlHOSkvxo5FaU7vhNN2FnzjIy4rnfX/u1VeAvETYaODemR7vAyR8qKqrKgypG73LkpCbl2NwZlGYAmfPOIfccAqJHjShkC9orSExfafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3B01MB7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3B01MB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872F4C116D0;
	Sat, 24 Jan 2026 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769276776;
	bh=FLi5x1Bv6Y+47RbLVUzrS+CBoJDWq6L3sQAn8KSrfCg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=E3B01MB7eYNo4vVpeJdjZ9jn2Sw06yqUAAeO2wqCCiAY+/wULR3WIMAdJQ0Pbq/BB
	 bPX7TX+yQPpvpcTx1u+DimsqAda58ls+pgvHJENI4JTn2QOEWslPXzqpr8/n25hm7p
	 TPuD/a8s/WvblrFLA+oynAybUN8c/EbBOJ9UkPmD+xWr2/DqqNR4ONE0miT9JUm5RD
	 rd6VU4LxkBsCdV0zvaykpQfWieNcKc+UMhRet1b0DON9FTatlA1gih4cweSkPLb5y+
	 0gldzaze81dcELRsHMH+I+0QuR3ZQT2r0h9AEnDUvY10BSYzfX6ivjOap4Y12CEAVf
	 lvbPy8vAWXUPg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 18:46:11 +0100
Message-Id: <DFX09S7L40VL.1HVC33VXNDDBW@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/3] Revert "revocable: Revocable resource management"
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <20260124170535.11756-4-johan@kernel.org>
In-Reply-To: <20260124170535.11756-4-johan@kernel.org>

On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> The revocable implementation uses two separate abstractions, struct
> revocable_provider and struct revocable, in order to store the SRCU read
> lock index which must be passed unaltered to srcu_read_unlock() in the
> same context when a resource is no longer needed:
>
> 	struct revocable {
> 		struct revocable_provider *rp;
> 		int idx;
> 	};
>
> 	void *revocable_try_access(struct revocable *rev)
> 	{
> 		struct revocable_provider *rp =3D rev->rp;
>
> 		rev->idx =3D srcu_read_lock(&rp->srcu);
> 		return srcu_dereference(rp->res, &rp->srcu);
> 	}
>
> 	void revocable_withdraw_access(struct revocable *rev)
> 	{
> 		struct revocable_provider *rp =3D rev->rp;
>
> 		srcu_read_unlock(&rp->srcu, rev->idx);
> 	}
>
> Multiple threads may however share the same struct revocable and
> therefore potentially overwrite the SRCU index of another thread which
> can cause the SRCU synchronisation in revocable_provider_revoke() to
> never complete.

I think the easiest fix would be to just return the index to the caller and=
 let
the corresponding revocable macro accessors handle it, such that it is stil=
l
transparent to the user.
