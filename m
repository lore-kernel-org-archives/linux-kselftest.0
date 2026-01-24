Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D8142E83;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274947; cv=none; b=PwYd7IZUoD1FCjkidDmuKVmpqPqCa0I4MqnUcRF9dZIoaRwQYnYpLtF+MWNw188LdJWeHiQgrucWr+9gaNRAky3UBs5qLfdMMPP/c/yeUa9qBRF0EqWpTnw1lTkfGOdra99csf6Ick/ZiEc1fwCPxl1IrHsTyAFDckXN1spMZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274947; c=relaxed/simple;
	bh=2XnanZCU6bBnqgyHSN8BenYR9dTGoy0/vjtV2NkWCHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3sntITEcH/3ASHh4hZ7B+ggSFis3sOV30yVVDsC/xNQiuO6v4kheDqztyMJhHn6R7hNiS5a4dXSaoXoe9NTXZqSf8cors2dDokcgkjyOwUb9gXRlo6fZnNKrDFyqS+4H93abFspw02vdMbMasGc8ZxTmT3gIx/4lq0qdnokdfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xa52+rzP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xa52+rzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186B6C16AAE;
	Sat, 24 Jan 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769274947;
	bh=2XnanZCU6bBnqgyHSN8BenYR9dTGoy0/vjtV2NkWCHs=;
	h=From:To:Cc:Subject:Date:From;
	b=Xa52+rzPtNF9R8DMUi6CC4Nva/HLOOLJGgSoahaZ76WY13WOmTyJIGPHUG6nwtu5K
	 kccWKtHlMUbXPzlFOvOOQLkdDjzmlH4J/KDcHwj0GMwR3NoxAihdQDjoS9Pp1vcgDx
	 L2TPPokscvAW4BuqZq2F3SirnbtA/LuGIRSSOnek9IMViAbjoF/CWSsFhnA2Le9z0l
	 /KL9SI9I6e4WijfTXH/bZBIUVYPjQU2gaWfwpaKtW/Moj6ptA6Co7nZPjaW3Yl7OWO
	 jACBuHo5NnEgObIQcYPizF1i53YXimNGHGx6aIhFkRxMSi+EnSSUtvqTNmaqnQ8y03
	 Oi9nDfa+bhmXg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjhEf-000000003Hs-14rg;
	Sat, 24 Jan 2026 18:15:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] Revert "revocable: Revocable resource management"
Date: Sat, 24 Jan 2026 18:05:32 +0100
Message-ID: <20260124170535.11756-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was surprised to learn that the revocable functionality was merged last week
given the community feedback on list and at LPC, but not least since there are
no users of it, which we are supposed to require to be able to evaluate it
properly.

The chromeos ec driver issue which motivated this work turned out not to need
it as was found during review. And the example gpiolib conversion was posted
the very same morning that this was merged which hardly provides enough time
for evaluation (even if Bartosz quickly reported a performance regression).

Turns out there are correctness issues with both the gpiolib conversion and
the revocable design itself that can lead to use-after-free and hung tasks (see
[1] and patch 3/3).

And as was pointed out repeatedly during review, and again at the day of the
merge, this does not look like the right interface for the chardev unplug
issue.

Revert the revocable implementation until a redesign has been proposed and
evaluated properly.

Johan


[1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/


Johan Hovold (3):
  Revert "selftests: revocable: Add kselftest cases"
  Revert "revocable: Add Kunit test cases"
  Revert "revocable: Revocable resource management"

 .../driver-api/driver-model/index.rst         |   1 -
 .../driver-api/driver-model/revocable.rst     | 152 -----------
 MAINTAINERS                                   |   9 -
 drivers/base/Kconfig                          |   8 -
 drivers/base/Makefile                         |   5 +-
 drivers/base/revocable.c                      | 241 ------------------
 drivers/base/revocable_test.c                 | 142 -----------
 include/linux/revocable.h                     |  69 -----
 tools/testing/selftests/Makefile              |   1 -
 .../selftests/drivers/base/revocable/Makefile |   7 -
 .../drivers/base/revocable/revocable_test.c   | 136 ----------
 .../drivers/base/revocable/test-revocable.sh  |  39 ---
 .../base/revocable/test_modules/Makefile      |  10 -
 .../revocable/test_modules/revocable_test.c   | 195 --------------
 14 files changed, 1 insertion(+), 1014 deletions(-)
 delete mode 100644 Documentation/driver-api/driver-model/revocable.rst
 delete mode 100644 drivers/base/revocable.c
 delete mode 100644 drivers/base/revocable_test.c
 delete mode 100644 include/linux/revocable.h
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/Makefile
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/revocable_test.c
 delete mode 100755 tools/testing/selftests/drivers/base/revocable/test-revocable.sh
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/Makefile
 delete mode 100644 tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c

-- 
2.52.0

