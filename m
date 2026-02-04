Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888628980E;
	Wed,  4 Feb 2026 02:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171260; cv=none; b=SDROBgzO1s5TJDjm7NX8tlVLxzw1b/b2pYB7tT+z/TpfElcxaUWHAFFcaReLAcXiaEictDgUL2BaVw1kTrYK0+KJ8R67benghV3GGXJI9wLaOhYmvL3smaq/nR/LGPFPYNBiDaUAv65adeIr8HuyYpmJkzOUtyq7FzXKxr2GjEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171260; c=relaxed/simple;
	bh=Un5Ao1i2HGVwBkHeGiBEE4V1wnLL8+sWjW5dihBWKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrhGrKpo0M82IWfvHm9xmpJaTSi7Li3scXLHf4Gz79TCSdfNRWUPvAxIASgqTq7ysW9PGMMEOetnvBZxk1WQDMMimhcj5slUuMBSeqelhDLEK7cbWYKIjAbV0y69O+U5MpUpGi3TdYq9gL8X83XaWNDbUOeKci1lYO74YQBG4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahKnpcSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahKnpcSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A16C116D0;
	Wed,  4 Feb 2026 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770171259;
	bh=Un5Ao1i2HGVwBkHeGiBEE4V1wnLL8+sWjW5dihBWKWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahKnpcSmufQ3wRTr42dWbiKE7df9t2yNNMbdJ3PL3ErArqxtA1GnF/QZPXp92wDvd
	 o3Lm98oUZW7JqTwjjmTKSqfuiFMRs89EjNWBP2HLD0lRKrzCO5/p75QYIp8htjSgU7
	 9zJyAxpZ104+Qz+nii7qNXjMPiYQ+x6qSuEDOwMuwwhM204c6XTvxdJsmRFlEpwQWo
	 2PM9Pr0Rny2kIejzlOgIwamZpR/3I5FwLT0AQHe0YAVn2ZWGVwajMNET/YCWFBMgiE
	 +oDHQ/nj05/t0SGH+pSN5l40TOXlmIKDlWrU/bZLtHpovfuuJEJ7r9AhOR1LYX7u4H
	 Ww3lE9XYnpq/A==
Date: Wed, 4 Feb 2026 02:14:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
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
Subject: Re: [PATCH] driver core: disable revocable code from build
Message-ID: <aYKrdxw3fYf-y52P@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
 <2026020307-rimmed-dreamy-5a67@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020307-rimmed-dreamy-5a67@gregkh>

On Tue, Feb 03, 2026 at 01:30:37PM +0100, Greg Kroah-Hartman wrote:
> The revocable code is still under active discussion, and there is no
> in-kernel users of it.  So disable it from the build for now so that no
> one suffers from it being present in the tree, yet leave it in the
> source tree so that others can easily test it by reverting this commit
> and building off of it for future releases.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And also:

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 11b6515ce3d0..56e44a98d6a5 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -17,7 +17,6 @@ TARGETS += damon
 TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
-TARGETS += drivers/base/revocable
 TARGETS += drivers/dma-buf
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
