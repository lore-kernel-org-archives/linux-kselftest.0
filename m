Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389872;
	b=EIC3jEs+rPTbTOaE4DpdLVPZG/3XIsU8Vab2Q7jA37YVXcvFKGDCjHg6XO3R2KqCTPKm
	 GIHfnYy62eyucl5QcY+6akH9j1Vet64RTi24q6tIFgygvf3B5dwC4DSTkFKsAzC9qeQGG
	 6G9mOjV0UuHth5gHjl9aM1A1th1LxPvvQPWi7qQ5HYazumhleLYKYmYcXXySwnumkJpKm
	 yzJ9+QM5hv/tql4cFRqk1a9ofGI9Ub2J8D/FogjFw2M4NJGJqGMy1QC9CQ+NEFh/m0RZo
	 7m5p7ER4XBmSh3WK/M5oaVnZxySm5vSYQeVaD4CxVRewVWQ/OFzQG4mUek08jf7Q0BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389872;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Jf34nUYagtUsm0J4vH04XIusOTapqGFGBrJgolxtR6Q=;
	b=kLvITKbN/Off3uAZ/FvYQetYknWhXcHOGcY2j235Fe+O8DgtAia/79vyOQJtTU4Bh0pN
	 9FSm4LrvixjF5BxErAaeM+iI/Fyy416cuCkvP2osvc3jF3pO5GvpbfehJoKWhQv82xU+R
	 DCIhkiJaYzzc0YO3f4LUNee3/ZPUSbVem9FcNIe7Au6kMgiBBPR8MrFmVHQ5wUbKZleHr
	 +rfRNrh6s2znEl/9fHpew9t2RVKRaJ7yth1IIPlB2NoH8YBEEWj7Qv/upaiyVi66x/M7K
	 F8nL56Jtvoi31xalWtM1un44lp8OyZI7XdZgAULF4eunUfTT9qKjSouRhbqa66lGIeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0SdHdhO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042760A2604;
	Wed, 11 Nov 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J0SdHdhO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705711F00A08;
	Wed, 11 Nov 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389872;
	bh=Jf34nUYagtUsm0J4vH04XIusOTapqGFGBrJgolxtR6Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J0SdHdhO7ZSFLawIs/g3tOFOZ7uXm2XauiX/4QZ350dlsaBj3Egh4HC4wqDxWQEHO
	 L2tFUGm1mtcGH1JGaJB67asthCh2eK89r5XWEqJc7311mfa8qn7xoQFyXT/UUj4zRG
	 JP/nLYzs1J4oKPQjo3jtSI7ppN3bM7XxSh6JuFx6lBdM0uGHZiEve1OOfiRx8vAtU+
	 DmgpqAd0LzoqN8FWefIeMNN7b2XA0YgRpopJZFQ6Q2LCQ50y/19nXJq02lF2bjIelw
	 kH+ftmVhQkayKETyojIyaRLFLoff+3B+9VpM442SWE4yUmLuuZ1VOdu3quqQg8gV0m
	 y19qGqgMGkhnw==
Subject: Re: [PATCH net-next v3 09/14] dpll: dpllsim: Add support to set
 frequency on pins
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:51 +0000
Message-ID: <179438987104.2199510.5757095747677707211@kernel.org>
In-Reply-To: <20261109093523.931201-10-poros@redhat.com>
References: <20261109093523.931201-10-poros@redhat.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch adds dpllsim_pin_frequency_set()
  (drivers/dpll/dpllsim/dpll.c).

--

dpll: dpllsim: Add support to set frequency on pins

This adds a netlink frequency_set callback to the dpllsim input and output
pin ops. The callback stores the value in sim_pin->frequency under
dev->lock. The DPLL core has already checked it against the pin's
supported frequency list.

> diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
> index 5e36059609761..8590d2db808e4 100644
> --- a/drivers/dpll/dpllsim/dpll.c
> +++ b/drivers/dpll/dpllsim/dpll.c
> @@ -79,6 +79,19 @@ static int dpllsim_pin_frequency_get(const struct dpll_pin *pin,
>  	return 0;
>  }
>  
> +static int dpllsim_pin_frequency_set(const struct dpll_pin *pin,
> +				     void *pin_priv,
> +				     const struct dpll_device *dpll,
> +				     void *dpll_priv, u64 frequency,
> +				     struct netlink_ext_ack *extack)
> +{
> +	struct dpllsim_pin *sim_pin = pin_priv;
> +
> +	guard(mutex)(&sim_pin->dev->lock);
> +	sim_pin->frequency = frequency;
> +	return 0;
> +}

[Severity: Low]
This isn't a bug, but should Documentation/driver-api/dpllsim.rst be
updated along with this?

dpllsim_pin_frequency_set() writes sim_pin->frequency. That is the same
field the configfs frequency attribute stores and shows through
dpllsim_pin_frequency_store() and dpllsim_pin_frequency_show() in core.c.
dpllsim_pin_frequency_valid() checks it again on the next live=1.

Nothing on the undeploy path resets it, so a frequency set over netlink:

  - shows up when the configfs frequency attribute is read,
  - is still there after live=0,
  - is used on the next live=1 instead of the value written to configfs.

The rst describes pin attributes only as configuration written before
going live:

  Attributes are written while the instance is not live, then ``live`` is
  set to 1 to register the device and its pins with the DPLL subsystem.

  ``frequency``  Frequency in Hz, must be supported by the pin type
                 (default 0, which is rejected)

The struct dpllsim_pin comment in dpllsim.h was updated to say "The netlink
setters change prio and frequency at runtime under dev->lock", but the rst
still doesn't mention runtime changes or that they carry over to the next
deploy. Prio, added by the earlier "dpll: dpllsim: Add support to get/set
priority on input pins" commit, has the same gap.

Could a sentence be added to dpllsim.rst covering both prio and frequency?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
