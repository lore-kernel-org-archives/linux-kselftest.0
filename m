Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226592;
	b=okDF1fzCVL3pmFM7HuHtI7CzUPC68Op1GRorTin8LAVrj9IXjfTUBxAf4LHryIuySBj9
	 UVaBt5eHpmgiKRHZgKnkf+cQzYFNpr1lG+VqgjiIm8buIzc0SGxzqg7Q746iv2XEHbVEL
	 m9teqfb2l6NAlR2CEoaVTwrG0JFnTGmJMvjC8Dob+yYFLIsBDMpT9HJHZjYX/AqSmlEg2
	 zcgflJsXh3UQ3g5qHPY6rvKL3+mA/58ApjQ02THBM6+Iea0gfCj7NtsruQBe3d0jFuk/R
	 LmogvsFNoYgIY86TBg7vbiBB2xAFh8E0j2yHnqInlq1mbCtMnPhGQFbZOhlOsoApqCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226592;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CnLgalneGXfo1o/H5Wfgn+z4AXuIaw49pj0NsQlWZtw=;
	b=2/GsoWuMlHQM66J1zC0XRw5HFAvkbdjklG+TvKKEVQx0UsXiDL/HrD4G3ED1dzNaBwnY
	 XHa1jXFCqIg63ZB6RnRe2q/OVjvY0I9D52Y7GexwYQG5/3n2GP8E4LTYLmalzGmstZ6uv
	 Vf1d4zms97y5GsbHKrpTJLgnCJQS6FzCdV5CTG+Fa0mA1vWwhR2yRtwpk3Y9LFc4FNziH
	 AL0r/BBPDeCo+yxA7/fc+UEbm2og8z1GeWLjex2lrBYVCOH561maSxzsobaLBzprRx82B
	 aV9FL2XxRHlGHGXaexef1G5We8HJmYneXvUiGZeyCb9OsLxypP8cEOhVVvdA5/sk3bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFhsS9if;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02D606A31A;
	Wed, 28 Oct 2026 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFhsS9if
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7781F01825;
	Wed, 28 Oct 2026 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793226591;
	bh=CnLgalneGXfo1o/H5Wfgn+z4AXuIaw49pj0NsQlWZtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hFhsS9ifGXOMEgzaP/cGN1hL3KZKC2VqoCTIdggWorbzH0xFkpZ3mG/is+S+r72H/
	 Xdu4l3Ftr8aVWc5OR+RUEpXthW2RywXpp91PNwc5Pw2BokJWp5IEAjxDygWka2Bzyp
	 8O5QDGbyI6kT3IqW32pzKbpdmYqT7XStX9JmIAyF6djhYfgKsGuvgUJ7lqjB6DXnDa
	 +t0w0iuA3qq0pkQJ1jtPan1+RCLD6rGNEiKA8uhe1Jhpqwu+W/Llppi8uokBV6EQcm
	 W5DakhVbX2twXyQdzxdc2SfHVs+zZ9YMV2UFTzHSQbtQfRhICmu9Tj8wkxaevq8IUF
	 RqpvCH5ZE+W9Q==
Date: Wed, 28 Oct 2026 15:29:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kiran Kella <kiran.kella@broadcom.com>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Donald
 Hunter <donald.hunter@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
Message-ID: <20261028152950.6624ee83@kernel.org>
In-Reply-To: <CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
References: <20261009-psp-v2-0-5596ab50f677@gmail.com>
	<20261009-psp-v2-4-5596ab50f677@gmail.com>
	<CAPHeo3erVfzLE0wTmz4=0HKWdOL63+7W2KXO67OuEfRXhf_M8Q@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 17:16:17 +0530 Kiran Kella wrote:
> > +      -
> > +        name: tx-key-count
> > +        type: uint
> > +        doc: |
> > +          Current number of Tx keys installed on the device.
> > +          Only visible if the driver stores keys on device.
> > +          Kernel statistic.
> >  
> 
> Maybe it is good to have a counter that denotes the number of PSP
> sessions set up on a device, which is managed in
> psp_dev_tx_key_add/psp_dev_tx_key_del operations similar to the
> tx-key-count. That way, even in non-SADB drivers the user can know the
> scale of the PSP sessions set up on a device at any time.

AFAIR the thinking was to also implicitly flag that the device has 
an SADB here. So this stat should probably be called tx-sadb-key-count.
We couldn't think of a reason to count the tx keys when SADB is not
present. Rx keys? maybe, because of SPI exhaustion. Tx keys - why..
