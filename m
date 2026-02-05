Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB634A3C1;
	Thu,  5 Feb 2026 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281484; cv=none; b=OhVtbyZ1ndWOiu7ldijA8YhslZUXBNEWBNYoIMyVc4bydlGwoFsLATSk0Xdgah4GiqFYoTqn6FPOaIgdyfYu+egN9fzVon96B0S958uQoLHbr/JmKJqZ5dSK8ml9ajoJNChNShs8It5zSxyaDjBCIIo/KEpaxOysoYPOUtrcKgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281484; c=relaxed/simple;
	bh=/SWVbyh1ixpEifEztr1IRRPKrj6UPmqtnMLLEAkPJec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0uMzmmmc+0v7NDXm9qwYqaUDR1c1DGDRxwUhE3P0PCdEGyqE0paokjt5Cc6jFdaJP/7MQs7q/bDTJ20TukGTPl7myxKtQ8Y9gnoTsBnFlC4/ls0Cu8PiScl6hsQFFQBsZE8uRz1phPkRbuFI+2TFdBgzpg3UYFFLFr/bpFRAS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxsG2kaU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxsG2kaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3576C4CEF7;
	Thu,  5 Feb 2026 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281484;
	bh=/SWVbyh1ixpEifEztr1IRRPKrj6UPmqtnMLLEAkPJec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxsG2kaUhtAT9xl4vzkVUC6QDMnwfpocmk0NWXsjRpJaDs5SmGnHfI9r0iLS4IVSf
	 Wr2xekBuWu6+NuMVLvctz6jh1iEyqHcoY5KOFMrZcM0Z23vV231tldcd5kO+svH53W
	 tim1Kfuvt5pn8cKUgnmPg81Z8a609cCOeTisImfqN39aNpqRl7ttqSpu1fd1/GRTWV
	 qdzuKeHKy8kLQWiaDkLUjy6dVhpvQ2T+7C2TJhoHNkVbcZ+TWGxBu/RjyEDFjOKCFX
	 /fKorCFK7ImZh3TPkS3OhzF2rMLxvuyj8uDy/rwl7nLbkul3bTPa5B1SaNuwPPtzOG
	 H/PQyNpKkfIcA==
Date: Thu, 5 Feb 2026 08:51:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <aYRaB5wI3mS2J54K@google.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204142849.22055-4-johan@kernel.org>

On Wed, Feb 04, 2026 at 03:28:49PM +0100, Johan Hovold wrote:
> Specifically, the latest design relies on RCU for storing a pointer to
> the revocable provider, but since the resource can be shared by value
> (e.g. as in the now reverted selftests) this does not work at all and
> can also lead to use-after-free:
[...]
> 	producer:
> 
> 	priv->rp = revocable_provider_alloc(&priv->res);
> 	// pass priv->rp by value to consumer
> 	revocable_provider_revoke(&priv->rp);
> 
> 	consumer:
> 
> 	struct revocable_provider __rcu *rp = filp->private_data;
> 	struct revocable *rev;
> 
> 	revocable_init(rp, &rev);
> 
> as _rp would still be non-NULL in revocable_init() regardless of whether
> the producer has revoked the resource and set its pointer to NULL.

You're right to point out the issue with copying the pointer of revocable
provider.  If a consumer stores this pointer directly, rcu_replace_pointer()
in the producer's revocable_provider_revoke() will not affect the consumer's
copy.  I understand this concern.

The intention was never for consumers to cache the pointer of revocable
provider long-term.  The design relies on consumers obtaining the current
valid provider pointer at the point of access.

In the latest GPIO transition series [5], the usage pattern has been refined
to avoid locally storing the pointer of revocable provider.  Instead, it's
fetched from a source of truth when needed.

I agree that the risks and correct usage patterns need to be much clearer.
I'll update the Documentation and the selftests to explicitly highlight
this limitation and demonstrate the proper way to interact with the API,
avoiding the storage of the provider pointer by value in consumer contexts.

> Essentially revocable still relies on having a pointer to reference
> counted driver data which holds the revocable provider, which makes all
> the RCU protection unnecessary along with most of the current revocable
> design and implementation.

(I'm assuming you are referring to the example in [6].)

I'm not sure I follow your reasoning.  Per my understanding:
- The reference counted driver data (e.g. `gdev` in the GPIO example) is to
  ensure the pointer of revocable provider isn't freed.
- The RCU protects the pointer value from concurrent access and updates
  during the revocation process [7].

These seem to address different aspects.  Could you provide more context
on why you see the RCU protection as redundant?

[5] https://lore.kernel.org/all/20260203061059.975605-9-tzungbi@kernel.org
[6] https://lore.kernel.org/all/20260203061059.975605-8-tzungbi@kernel.org
[7] https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org
