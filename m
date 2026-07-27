Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733540D58B;
	Mon, 27 Jul 2026 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158130; cv=none; b=PSYUQjC1lmLc/hPpap6a3siSVtBZYQEwWKYjFvX6k5+rZc0BT1KeoHR8goQcDsCfKNyPNPtOPgGFJMZg9o97w+gjaRVfb9ehquht0m9tqIyhIJFEdou2EbtEBtGhOcYwP1yuY34BzTctP7eTrbUPr66rQ35w6dw0Gm/5WvznAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158130; c=relaxed/simple;
	bh=jb65JNu+UNJZ7XxS0A0BAp8VZMAFyr1O0pLAcBARRU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZn38it87ziFWzoMfusxF1IQCYfV9m/CART+HG3LXgSgs4WG+5dlj/pbhFEne4BT07mNenIxDmWLi9YmHWQw7CuynrSrVJA+Xep+u96ZehdNU0LECEG14YJnioNyomKV5pH2wPzE+M7g3dK9YlsdKpkklGp1RVpVgn5jS+aCcI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=StH6xpNG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="StH6xpNG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=H+51EgHOKspxgW8Hywzq4ki6/I5isR2xZzVYCJDryuE=; b=StH6xpNGh2Aco3SR7btSc8Lmpi
	J7oOxQ+CWjVWbjLNDhmqygx+lHvxABNlcEiNEL8OyusK3iFd0CCo5Y9C9IGxwXFk9SJw1yaZ1s2qD
	m7FJEFItVRWc0nu8nWBSy+LNdB7+HaJCdxaD6VX11VKmFaiTDujGgDzeuNz0PfCbb1+Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1woLAc-00EQut-OI; Mon, 27 Jul 2026 15:15:02 +0200
Date: Mon, 27 Jul 2026 15:15:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arthur Kiyanovski <akiyano@amazon.com>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, vadim.fedorenko@linux.dev
Subject: Re: [PATCH v5 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
Message-ID: <2a042252-3225-4cd6-8301-8865bc07a387@lunn.ch>
References: <20260717065924.2556-2-akiyano@amazon.com>
 <1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5c0883140d470657b2cba24b964f5ce71b9a15.camel@infradead.org>

> > +static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
> > +{
> > +	struct ptp_sys_offset_attrs *data __free(kfree) = NULL;
> > +	struct ptp_attrs_request request;
> > +	struct ptp_system_timestamp sts;
> > +	unsigned int n_samples;
> > +	int err;
> > +
> > +	if (copy_from_user(&request, arg, sizeof(request)))
> > +		return -EFAULT;
> > +
> > +	if (request.valid ||
> > +	    request.num_samples > PTP_MAX_SAMPLES ||
> > +	    request.num_samples == 0)
> > +		return -EINVAL;
> > +
> > +	err = ptp_validate_sys_offset_clockid(request.clock_id);
> > +	if (err)
> > +		return err;
> > +
> > +	n_samples = request.num_samples;
> > +	sts.clockid = request.clock_id;
> > +
> > +	data = kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->request.num_samples = n_samples;
> > +
> > +	for (unsigned int i = 0; i < n_samples; i++) {
> > +		struct ptp_clock_attrs att = {};
> > +		struct timespec64 ts;
> > +
> > +		if (ptp->info->gettimexattrs64)
> > +			err = ptp->info->gettimexattrs64(ptp->info, &ts,
> > +							 &sts, &att);
> > +		else if (ptp->info->gettimex64)
> > +			err = ptp->info->gettimex64(ptp->info, &ts, &sts);
> > +		else
> > +			return -EOPNOTSUPP;
> > +
> > +		if (err)
> > +			return err;
> > +
> > +		/* Filter out disabled or unavailable clocks */
> > +		if (!sts.pre_sts.valid || !sts.post_sts.valid)
> > +			return -EINVAL;
> > +
> > +		data->timestamps[i].pre_systime.sys_time =
> > +			ktime_to_ns(sts.pre_sts.systime);
> > +		data->timestamps[i].pre_systime.sys_rawtime =
> > +			ktime_to_ns(sts.pre_sts.monoraw);
> > +		data->timestamps[i].pre_systime.sys_counter =
> > +			sts.pre_sts.cycles;
> 
> I hate all this line wrapping, btw. I'll defer to the net coding style
> if they insist, but my preference would just be just to have longer
> lines. Especially when it's a block of assignments like this, the
> wrapped form is *much* harder to read.

This is a long function, probably longer than the coding style
suggests. So one option is to move the code within the for loop into a
helper. That might then allow unwrapped lines?

That is kind of the point of the line length limit, to make you break
code up into lots of small functions which do one thing.

     Andrew
