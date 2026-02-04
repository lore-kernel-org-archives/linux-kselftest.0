Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A16410D2B;
	Wed,  4 Feb 2026 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215638; cv=none; b=j2Pf9wHPy6EhQ6kBqFCQz4gaWQdNN7KBdvzzGiDMGHhFCDNyw0sGYjLzkX09A+3gXWmv28v1nlHm6DBWxJQ+LVmIYVojnb4tMM/bylgCV8UwbPoAf2dyajR+hY9K5TwWPdbBDXgas/c8t+IYSZuZHWnF641WvqIkqOrDcuw1uHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215638; c=relaxed/simple;
	bh=920Lh5r0yh/UKXJ4YwCKmziOjZ36aSWyMTB7CZoctvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J4LmTSRojcpmIARQojHCDDp+wuU4HLsSQzAtiFMVlFSBuk4vU2Sdt97iBlvEFNE/rxq5KLp5LeB5WjJ79OACmwADWCNmoSgIvhxxwiDRab/ynHTcDLnixztwF/0y0SAu4qKsFfivJFrX9EZrepU7Djzk2ZjaKA8diVleTYqQVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxjYMlRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxjYMlRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2CCC4CEF7;
	Wed,  4 Feb 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215637;
	bh=920Lh5r0yh/UKXJ4YwCKmziOjZ36aSWyMTB7CZoctvc=;
	h=From:To:Cc:Subject:Date:From;
	b=NxjYMlRzqmuyjL8OqA7lysPloltQH6DZrwbyrixxKXO8VDnx475IOwtSiKuUb0XLr
	 NGCtGLpGr9TQ3EZ9HdI7Fd7BclI6fhj7kK5/ZhxaJFcEPQOrfzBWQ8z05RgRUPidXO
	 lf9IHl1XWgNmKvFrxUGAlaCoJYk+0BvjPnVYMjDfO58B/on9uY8DW9nJ/eEs6Y1/Dk
	 MlQGYtYvyC8phSvwQGRunkIiLEn1R5cUCNuzOVmANNmwBHOxvEtB+QoPiySg/m9LMR
	 xoG/woRKXlsSZN/aahXd9YINnTtj2DlItkt6meBgrDsrmSacjyrWT7Zv1xw9YyxSSP
	 /PJT3d7Wp/CpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vndx0-000000005q6-1ddf;
	Wed, 04 Feb 2026 15:33:51 +0100
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
Subject: [PATCH v2 0/3] Revert "revocable: Revocable resource management"
Date: Wed,  4 Feb 2026 15:28:46 +0100
Message-ID: <20260204142849.22055-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I was surprised to learn that the revocable functionality was merged the other
week given the community feedback on list and at LPC, but not least since there
are no users of it, which we are supposed to require to be able to evaluate it
properly.

The chromeos ec driver issue which motivated this work turned out not to need
it as was found during review. And the example gpiolib conversion was posted
the very same morning that this was merged which hardly provides enough time
for evaluation (even if Bartosz quickly reported a performance regression).

Turns out there are correctness issues with both the gpiolib conversion and
the revocable design itself that can lead to use-after-free and hung tasks (see
[1] and [2]).

And as was pointed out repeatedly during review, and again at the day of the
merge, this does not look like the right interface for the chardev unplug
issue.

Despite the last-minute attempt at addressing the issues mentioned above
incrementally, the revocable design is still fundamentally flawed (see patch
3/3).

We have processes like requiring a user before merging a new interface so that
issues like these can be identified and the soundness of an API be evaluated.
They also give a sense of when things are expected to happen, which allows our
scarce reviewers to manage their time (e.g. to not be forced to drop everything
else they are doing when things are merged prematurely).

There really is no reason to exempt any new interface from this regardless of
whether one likes the underlying concept or not.

Revert the revocable implementation until a redesign has been proposed and
evaluated properly.

Johan


[1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/
[2] https://lore.kernel.org/all/20260124170535.11756-4-johan@kernel.org/


Changes in v2:
 - revert also the incremental changes in driver-core-next
 - explain why the latest revocable design is still fundamentally broken


Johan Hovold (3):
  Revert "selftests: revocable: Add kselftest cases"
  Revert "revocable: Add Kunit test cases"
  Revert "revocable: Revocable resource management"

 .../driver-api/driver-model/index.rst         |   1 -
 .../driver-api/driver-model/revocable.rst     | 149 ---------
 MAINTAINERS                                   |   9 -
 drivers/base/Kconfig                          |   8 -
 drivers/base/Makefile                         |   3 -
 drivers/base/revocable.c                      | 225 --------------
 drivers/base/revocable_test.c                 | 284 ------------------
 include/linux/revocable.h                     |  89 ------
 .../selftests/drivers/base/revocable/Makefile |   7 -
 .../drivers/base/revocable/revocable_test.c   | 136 ---------
 .../drivers/base/revocable/test-revocable.sh  |  39 ---
 .../base/revocable/test_modules/Makefile      |  10 -
 .../revocable/test_modules/revocable_test.c   | 187 ------------
 13 files changed, 1147 deletions(-)
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

