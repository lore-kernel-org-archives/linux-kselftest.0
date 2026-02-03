Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C547342CBD;
	Tue,  3 Feb 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121841; cv=none; b=quIKmIfwC4TGGPTTTnfvSHIX6GFpa6RSpK0B9nBIOBYEhmhtWKrKwtguC6I5TOLMGF+OagNPzH04cqC/ga+W3XK4nAOYMOKRCfZN3C0sYvyx3NmMqxFKCFKv5fyVfv6QgAWZrlqPf012CQCtWFVPLTpxtIfgbb6U1jiY4mV6BKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121841; c=relaxed/simple;
	bh=iDqeoIcP/eoS31nelKKYn/IJrb6MpSlYDzZqeN/K94Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th6vQ4ryIRl7V8hN0HbhilUVAQ8YmxTw9DgT69uJQP0b9itz+luth9CSgugFa3XWkgNC3VxkbtyeNkkMDWVfZ8FDpuVD9e6uaMGdN5FxldBy3CvaiEbCq5spd+4MWJMr3r4DC8p6FdMlmmxYDelkV8b39yv8in0Sow11Dt6eA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPDBFcKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPDBFcKK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7DDC19421;
	Tue,  3 Feb 2026 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770121840;
	bh=iDqeoIcP/eoS31nelKKYn/IJrb6MpSlYDzZqeN/K94Q=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=HPDBFcKKo/WBjj81n359rA3lv8TW/4TQJViQHXz3qlAAgx8s7JtCQD0pnr5W8fCO9
	 iDPKSV09rq2iQT9aCLPGy53nu9K1eMiyLKlbZmwft54BEvUpUiVU8ttOqobfk8lb81
	 QYxCODfRt7Y5ayc8/zD2qQk1VRsS2CUt5touUMy8=
Date: Tue, 3 Feb 2026 13:30:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: disable revocable code from build
Message-ID: <2026020307-rimmed-dreamy-5a67@gregkh>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020315-twins-probe-d988@gregkh>

The revocable code is still under active discussion, and there is no
in-kernel users of it.  So disable it from the build for now so that no
one suffers from it being present in the tree, yet leave it in the
source tree so that others can easily test it by reverting this commit
and building off of it for future releases.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/Kconfig  | 2 +-
 drivers/base/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 8f7d7b9d81ac..9f318b98144d 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -254,7 +254,7 @@ endmenu
 # Kunit test cases
 config REVOCABLE_KUNIT_TEST
 	tristate "Kunit tests for revocable" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	depends on KUNIT && BROKEN
 	default KUNIT_ALL_TESTS
 	help
 	  Kunit tests for the revocable API.
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 4185aaa9bbb9..4c6607616a73 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -6,7 +6,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   cpu.o firmware.o init.o map.o devres.o \
 			   attribute_container.o transport_class.o \
 			   topology.o container.o property.o cacheinfo.o \
-			   swnode.o faux.o revocable.o
+			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
-- 
2.53.0

