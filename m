Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EEF21ABB9;
	Wed,  4 Feb 2026 05:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182903; cv=none; b=JUOlqSmlhNUTIPqHB3DiqdMKq1+tvWcE1bPHERrnSb35QYbC4fLX/MJ6iZW6lBBsocbbQGkZSKOSrhfjecNnrcXvfTh2svYcXyhc3ufxVx2O11u3PF1XULfefHBPdZ8kTr6HGKbr56Bxu7bLnokRUFb0IRtWIhzSHMrt4Xp+i4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182903; c=relaxed/simple;
	bh=wiAYeO0Zy2v91IbkE9VovIGytIW74HUqn7avtTiOrho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTe4uKNXtnVp/IS//mzsfGB/ySdWn5a+cQW8cuWOW5mfZd+UIZsjMMMIFbT2Slm9+RJiGLb8B81lmEP96SejPP/Wb98JDVeYQ72A28avAttA/5uFG941InHst0W7Q3zJjZRUnWjcQ8goeqF4ft+vqXX9RRmX+IptApsJSKTuFFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjFwi7Jh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjFwi7Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7D0C116C6;
	Wed,  4 Feb 2026 05:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770182903;
	bh=wiAYeO0Zy2v91IbkE9VovIGytIW74HUqn7avtTiOrho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjFwi7JhZWF75i+n/FHiVLVymv/EpBGALUc5pvIMOTi6FjiAL9nBEQYkzzB/PpFBP
	 sUnfc12FksThlDc2jetLNd1/Bti8+gsTTlvxuSxW7Uj9twTOOPQd+laW4N0foxkNig
	 aHDfmQjYINQbosby4D37gzOTYa7g/LlNP0i6u5Zx7643H08Be9XSZgAn9tep4bT8Nr
	 7x2XdUCjl948i3rq3bBJGOJAyUz2+lrc3b4OLf6IU9UmT4c/u7l4AHncYQuWQhrCnD
	 hiVKXDlU56IY2kdD/cOXgNaSeeFTG2MTil11dfNysfS05RW62rPzaeiCjdco00bcwP
	 nN91pYbyJ1WKQ==
Date: Wed, 4 Feb 2026 05:28:18 +0000
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
Subject: [PATCH] selftests: Disable revocable code from build
Message-ID: <aYLY8lkSv4Lr2B2r@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
 <2026020307-rimmed-dreamy-5a67@gregkh>
 <aYKrdxw3fYf-y52P@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYKrdxw3fYf-y52P@google.com>

The revocable code is still under active discussion, and there is no
in-kernel users of it.  So disable it from the build for now so that no
one suffers from it being present in the tree, yet leave it in the
source tree so that others can easily test it by reverting this commit
and building off of it for future releases.

Fixes: dd7762c73b1c ("driver core: disable revocable code from build")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Greg: I realized "driver core: disable revocable code from build" is
already in driver-core-testing branch.  Sent this independent patch
in case it'd need to.

 tools/testing/selftests/Makefile | 1 -
 1 file changed, 1 deletion(-)

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
-- 
2.53.0.rc2.204.g2597b5adb4-goog
