Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892949EC76;
	Thu,  1 Oct 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856512; cv=none; b=JBUsMKWM82tYGrY4LbG+Iukyul8DY/bQNhTJOLGBH22l6JtV3no+64A65Fxm5w3mZdLnjBEFHTRWrxgwv7ttoCZVGv0fdb/bUXjH1nRsJehs436YSOFGQl+xD9xLcIh5YDwV7xryvR7DZhlqvifZCwlPfMpKc7fAbwFz1eTtUK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856512; c=relaxed/simple;
	bh=wx4Mbv/Dx6UAy9KrfDT6GoeCx12UNgoBU2rSXd8LxnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5m711hv7uJB7w//4zfBhhVcqaYBMmtcapBgZ2xPxtobk04Ozo57pb0mO6Zbk5NZTKzJZHDUzD8YTMVFWOMAP0BwvWVbStBcwtS1cWr9Ffk1dOQQkrZVMEgDMPqpJYrx9Y3LVtl0nzI1eThoxSdCXIeMCrW6+wgy+b5h46uL0zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DMmQHHlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DMmQHHlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13DC1F000FF;
	Thu,  1 Oct 2026 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856500;
	bh=vVQBmByUL0b38bMZkqFlIw1DQs32Q1NlWpDovlmveUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DMmQHHlzHHm8B/O1lGgsaKmj2BPL313ItlwRbgeUMMMOrdAl6BwQBf8e2CY4SeloA
	 Wfjk3cpvfmV56flIZYv92o8jbkP9bR7j2+bfdNfuNLRODyOWUjO7q48Z4QJ8m7f/1d
	 NsBKEesLoEZU1Y4fQTtzD9vUpZ14KZ9DEruX70IY=
Date: Thu, 1 Oct 2026 14:00:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rishi Chhibber <rishi.chhibber@broadcom.com>
Cc: arnd@arndb.de, bryan-bt.tan@broadcom.com, vishnu.dasa@broadcom.com,
	corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
	rdunlap@infradead.org, bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com, yin.ding@broadcom.com,
	tapas.kundu@broadcom.com
Subject: Re: [PATCH v3 0/4] misc: vmw_zerocopy: VMware zero-copy buffer
 sharing driver
Message-ID: <2026100137-molasses-rented-5c88@gregkh>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>

On Mon, Sep 14, 2026 at 01:22:05PM -0700, Rishi Chhibber wrote:
> Summary of changes:
> - 1/4 reserves a VMCI datagram resource id for the hypervisor-side
>   zero-copy service
> - 2/4 adds the vmw_zerocopy driver: /dev/vmw_zc, a single ioctl, page
>   pinning and the VMCI datagram transport
> - 3/4 documents the userspace interface
> - 4/4 adds a kselftest covering the ioctl input-validation paths
> 
> This series adds a misc character device, /dev/vmw_zc, that lets guest
> userspace hand a buffer to a VMware hypervisor-side peer without copying
> it. The driver pins the user pages, collects their guest physical frame
> numbers and sends that list over a VMCI datagram; the hypervisor then
> reads the buffer directly out of guest memory. An optional metadata
> buffer is pinned writable so the peer can return a result through the
> same mechanism.

You are going to need to get the -mm maintainers/developers to sign off
on this thing before I can accept it due to your "fun" use of memory
buffers in here.

thanks,

greg k-h
