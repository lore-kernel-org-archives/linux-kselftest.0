Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD13EBF12;
	Sat, 24 Jan 2026 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769280173; cv=none; b=We8atRlwxvFOvOpkz5YvaHnkjPX5kbWKf/ZMCI3BJLpAVlkhHPjDPJ24qU3HS1rPznSYUbrcWMQjtdV/HzHx8vHMx6T4QDgQDDlQ1l0Tj07OL6fwrDpBrUyU1lldJ0vZ107u5QCceIgLwOOhZxREIAUP3UoNSRsV1MG3shhloPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769280173; c=relaxed/simple;
	bh=VvH5eA6BRfAJbzYiFIh5tJ53kLp3wfAyFAkRENkGXCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRnl6V8z7iBCvrwuNyqG+o5Jg57Qp5Xpp0Rp0Q+YSxNojR/SaNXZ60gsOlLpCeChpfWVRWfDmf02RSyTxgrA5FYl87ZxPI+iUx1iRIpanuYcyDVdpBmlHg+wmVljQyyp3OdNDeM5SgrEHonlNkweEZQPXR/DE3GxV0f7Imoas/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dO0gZ4+l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dO0gZ4+l"
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A0FC0A98;
	Sat, 24 Jan 2026 19:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769280126;
	bh=VvH5eA6BRfAJbzYiFIh5tJ53kLp3wfAyFAkRENkGXCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dO0gZ4+lXswtYuBzh6qLr4n0+hT0QSU5iUL6ChvprVLFsHqND57SPjkWrXNNvM38y
	 g+qoxVNz3YtuRCPwV2N1xE59IhqsVee6+z8N5iajqAke76fUksGVe/gt6cD5OxcIu/
	 6i3PWCJCzFlso71d7kl/IkAo881ezuU8GkJzq2Ko=
Date: Sat, 24 Jan 2026 20:42:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260124184239.GO215800@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>

On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> I was surprised to learn that the revocable functionality was merged last week
> given the community feedback on list and at LPC, but not least since there are
> no users of it, which we are supposed to require to be able to evaluate it
> properly.
> 
> The chromeos ec driver issue which motivated this work turned out not to need
> it as was found during review. And the example gpiolib conversion was posted
> the very same morning that this was merged which hardly provides enough time
> for evaluation (even if Bartosz quickly reported a performance regression).
> 
> Turns out there are correctness issues with both the gpiolib conversion and
> the revocable design itself that can lead to use-after-free and hung tasks (see
> [1] and patch 3/3).
> 
> And as was pointed out repeatedly during review, and again at the day of the
> merge, this does not look like the right interface for the chardev unplug
> issue.
> 
> Revert the revocable implementation until a redesign has been proposed and
> evaluated properly.

I have voiced some of the concerns listed above. This was merge way too
quickly, without proper review and evaluation of the API as a solution
for the problem at hand. I don't want to see this API spreading through
drivers the same way devm_kzalloc() did without developers understanding
the limitations, it's just another recipe for disaster. I trust that we
have enough knowledge and wisdom in the community to implement correct
solutions to the producer-consumer races.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> [1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/
> 
> 
> Johan Hovold (3):
>   Revert "selftests: revocable: Add kselftest cases"
>   Revert "revocable: Add Kunit test cases"
>   Revert "revocable: Revocable resource management"
> 
>  .../driver-api/driver-model/index.rst         |   1 -
>  .../driver-api/driver-model/revocable.rst     | 152 -----------
>  MAINTAINERS                                   |   9 -
>  drivers/base/Kconfig                          |   8 -
>  drivers/base/Makefile                         |   5 +-
>  drivers/base/revocable.c                      | 241 ------------------
>  drivers/base/revocable_test.c                 | 142 -----------
>  include/linux/revocable.h                     |  69 -----
>  tools/testing/selftests/Makefile              |   1 -
>  .../selftests/drivers/base/revocable/Makefile |   7 -
>  .../drivers/base/revocable/revocable_test.c   | 136 ----------
>  .../drivers/base/revocable/test-revocable.sh  |  39 ---
>  .../base/revocable/test_modules/Makefile      |  10 -
>  .../revocable/test_modules/revocable_test.c   | 195 --------------
>  14 files changed, 1 insertion(+), 1014 deletions(-)
>  delete mode 100644 Documentation/driver-api/driver-model/revocable.rst
>  delete mode 100644 drivers/base/revocable.c
>  delete mode 100644 drivers/base/revocable_test.c
>  delete mode 100644 include/linux/revocable.h
>  delete mode 100644 tools/testing/selftests/drivers/base/revocable/Makefile
>  delete mode 100644 tools/testing/selftests/drivers/base/revocable/revocable_test.c
>  delete mode 100755 tools/testing/selftests/drivers/base/revocable/test-revocable.sh
>  delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/Makefile
>  delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c

-- 
Regards,

Laurent Pinchart
