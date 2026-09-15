Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A062457E75;
	Tue, 15 Sep 2026 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456529; cv=none; b=jjOp0sHDlddYjZFIKZMLssI0f+eKW7WtD83DbbmbtiVfa8AbYRS6365cRUBrYVqS8EDK3fr+LMBJoOwjhanUVvU75mZFXQWlJByaC+DQNUnpesGLQ40m+knBDIDyjHCZg+eyvB4STUONB9KdJ92jqPn1hgs6fVML1uo06FcrvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456529; c=relaxed/simple;
	bh=CtMJZR9/Cn4tMxlmoCblJ3igncANUdD/mhKvDH5l9Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR+Zg+94lJ5sbG5By2XR2hAPJvccY8GmscvxbmzIPGHbIXOurl5zH4Qt/C7d2zmXScz/ABs0SrnzEZCQeTHEC0Xitp+vck7LLPC0P/ZdyICQZDxneVWOkyb+ea1GYWlJ2cjlGSMxEynJJQtQK0iPsg9OT+scbzATC2CxQuNZM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cu33uKG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cu33uKG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED281F000FF;
	Tue, 15 Sep 2026 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789456527;
	bh=sw87GboPi5Te0pCGs6fvfTQZG/KMrAQlf2xDi4GROQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cu33uKG9wCHLKs+LItnNpMIjOYx3f1i/takKq+rwp+fu8329YbUiAZUXskj3dqliH
	 dG8Ltw92LE45xsDSC0V7jg7s4VGVwHAa3cdzeOz6pS5B/K+R1+rta3891AA6UnGz82
	 ttwEAc9W8a1z/euo/9S2Xh2D2QO9niyRzY8TF0dM=
Date: Tue, 15 Sep 2026 09:13:34 +0200
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
Subject: Re: [PATCH v3 2/4] misc: vmw_zerocopy: Add VMware zero-copy buffer
 sharing driver
Message-ID: <2026091522-sprig-shrunk-392a@gregkh>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
 <9318be9d4da2392586d4ce72428592a3e5a02b99.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9318be9d4da2392586d4ce72428592a3e5a02b99.1789413109.git.rishi.chhibber@broadcom.com>

On Mon, Sep 14, 2026 at 01:22:07PM -0700, Rishi Chhibber wrote:
> Summary of changes:
> - Add drivers/misc/vmw_zerocopy_core.c: the misc character device
>   /dev/vmw_zc, its single ioctl, page pinning and PFN collection
> - Add drivers/misc/vmw_zerocopy_vmci.c: the VMCI datagram transport backend
> - Add drivers/misc/vmw_zerocopy_priv.h: the wire-format message structs and
>   the struct vmw_zc_transport_ops interface that joins the two
> - Add include/uapi/linux/vmw_zerocopy.h: struct vmw_zc_guest_message and
>   VMW_ZC_IOCTL_MSG
> - Register ioctl magic 0xDC in
>   Documentation/userspace-api/ioctl/ioctl-number.rst
> - Add the VMW_ZC Kconfig symbol and a MAINTAINERS entry

This all goes below the --- line, right?  Otherwise it would show up in
the changelog which doesn't make sense :(

The kernel documentation should explain all of this, how did this pass
internal review?

thanks,

greg k-h
