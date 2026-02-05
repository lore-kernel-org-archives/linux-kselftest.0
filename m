Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527193B8D7B;
	Thu,  5 Feb 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770292612; cv=none; b=V2BGka9kt0PsZDM4bIi8qZgK3L8gHPhjSZS8WKYOyTH6BCNMJGZow0ghwSDqfbmEdW/el4epoTdRyai2+/6vYbAaCW2NUj0Wnq59HleEv7KedctWWzoEfnIuHNiW9J4dRTFOKtgxzDG8mbYbI0eeSFN+MHcG1MlTckWQs+6Ud0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770292612; c=relaxed/simple;
	bh=Lq1WS/feqcmneRYONaUcKaBFbqjoIGbWkZe7TeY1dWw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=I08URq6uQgw3F2hs+y0JM5L2Tnf+rJcFjWuChTDPDEnXjVDtX1dJU0S7wavT++U3V08Vu63brafH6r9sPb9hxDzsziqMV5x9U6TnmsJ7uCxLMjs75n86yevmpI0g883d9t8XUfnCRthZmPBBiqhiJFr3c5rvgg4PNv0dlC2/cyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJegvFl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJegvFl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FE7C4CEF7;
	Thu,  5 Feb 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770292611;
	bh=Lq1WS/feqcmneRYONaUcKaBFbqjoIGbWkZe7TeY1dWw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=MJegvFl8zNIFEdCVsIfXc9m0ZW29CQwqJPCT9HtZw3FosEk3mDUAvJOclzswdx19S
	 0ll4ypcwSaqi3hJFow0sazMsqH8SJOp5Gxc79l2PEpZ5JcB0jCo7aqGcnNy/oLaGW4
	 KCzj7uEuGcjXiNUcftTNdkgmHzQSYn6UEKjEp1MryzamEvymy98JdyeK4AkQl/hnHo
	 7sKwf4YHu42Q3Tn7VGRYfrwb3QglQcw/H50T4zoPXyKPy7LXxPDwcrjaE82jU5nwr9
	 KMf10liy6QaT9sMKhpUzgXTFWMkpEBeAxAB+0e3zVXkRsxsFEr9f3kDyzH8S6MSq4O
	 7rtFcoWpJxvBg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 12:56:47 +0100
Message-Id: <DG70CSP8NCJ0.316VXMVLD2ARN@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/3] Revert "revocable: Revocable resource
 management"
Cc: "Johan Hovold" <johan@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus
 Walleij" <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <shuah@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org> <aYRaB5wI3mS2J54K@google.com>
In-Reply-To: <aYRaB5wI3mS2J54K@google.com>

On Thu Feb 5, 2026 at 9:51 AM CET, Tzung-Bi Shih wrote:
> On Wed, Feb 04, 2026 at 03:28:49PM +0100, Johan Hovold wrote:
>> Specifically, the latest design relies on RCU for storing a pointer to
>> the revocable provider, but since the resource can be shared by value
>> (e.g. as in the now reverted selftests) this does not work at all and
>> can also lead to use-after-free:
> [...]
>> 	producer:
>>=20
>> 	priv->rp =3D revocable_provider_alloc(&priv->res);
>> 	// pass priv->rp by value to consumer
>> 	revocable_provider_revoke(&priv->rp);
>>=20
>> 	consumer:
>>=20
>> 	struct revocable_provider __rcu *rp =3D filp->private_data;
>> 	struct revocable *rev;
>>=20
>> 	revocable_init(rp, &rev);
>>=20
>> as _rp would still be non-NULL in revocable_init() regardless of whether
>> the producer has revoked the resource and set its pointer to NULL.
>
> You're right to point out the issue with copying the pointer of revocable
> provider.  If a consumer stores this pointer directly, rcu_replace_pointe=
r()
> in the producer's revocable_provider_revoke() will not affect the consume=
r's
> copy.  I understand this concern.
>
> The intention was never for consumers to cache the pointer of revocable
> provider long-term.  The design relies on consumers obtaining the current
> valid provider pointer at the point of access.

Yeah, I think this part is not a bug in the API, but I think revocable_init=
()
should be

	int revocable_init(struct revocable_provider __rcu **_rp, ...)

instead of

	int revocable_init(struct revocable_provider __rcu *_rp, ...)

for the same reason revocable_provider_revoke() takes a double pointer.

Otherwise this seems racy:

	int revocable_init(struct revocable_provider __rcu *_rp, struct revocable =
*rev)
	{
		struct revocable_provider *rp;

		if (!_rp)
			return -ENODEV;

		/*
		 * If revocable_provider_revoke() is called concurrently at this
		 * point, _rp is not affectd by rcu_replace_pointer().
		 *
		 * Additionally, nothing prevents a concurrent kfree_rcu() from
		 * freeing the revocable provider before we enter the RCU
		 * read-side critical section below.
		 */

		/*
		 * Enter a read-side critical section.
		 *
		 * This prevents kfree_rcu() from freeing the struct revocable_provider
		 * memory, for the duration of this scope.
		 */
		scoped_guard(rcu) {

		...
	}

Do I miss anything?
