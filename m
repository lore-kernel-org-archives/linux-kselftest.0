Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA2E313529;
	Fri, 13 Feb 2026 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974647; cv=none; b=uzE1/OLcW9hgFVzkZgNYBNj+w8ypDQisLTXaP+5Vbkpsa+4woqiuJyRwqK3OwrTwLztlJVl91kyGyW6ETfHPaD/b8wT59mwN/D5eOA7Sdd1CNSXq0p2sI+MoEITdjF7PDMdbuRQp6+C82mOsfkJeKus5ohYx4x23aAwqXl+Age4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974647; c=relaxed/simple;
	bh=HokvFizIW7Zwfvzx1UHlGYR1GRohwiP4iYCT85S00Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mUur+WHLn+UVNaaQZD2h5VUPS6gva85Kt1nDrnupt86LUytpzZQVzQl4julxedm+GLx/gZS5GZmrLNOUWvlU3ZLPPNgl2xTppp/FoOJu8mHJ2EYNUfGjEZujxTC66pM8Kol0+amiGQNM0bSDTBVUwXYK6S1yG8hkhkdZlSOCg/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHpLeFQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHpLeFQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C760C116C6;
	Fri, 13 Feb 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770974647;
	bh=HokvFizIW7Zwfvzx1UHlGYR1GRohwiP4iYCT85S00Dw=;
	h=From:To:Cc:Subject:Date:From;
	b=oHpLeFQFC6BhM+5AdgnFsslsy8+M1H+hy4JPLVmAoLKMixVOsq5nl0ZLAlkE4d1y7
	 iKU3hOqFclodsOoC0pWiA093wkqBtdIKRGw1CdYx9OSN4AhL5z7pVvyi1T2LUgs9Re
	 yw4u/RaeznK9aTkRcATFpHrliyix8QMG8nHU0zKjzeQcTo4O6U4nzV5fDwKr0u4sYU
	 l/Kn1Cgqg3/7OzoN0KsK6vOZGPVb84edV/Si3h2aeT5xUFZGcsq1qGUMo8qvKTeyIz
	 0KzSUtCRy1tLMk2ecg08KS5CAvsg9flQr7LBHATEG8AmNccCdqRbH6XOwMLLlqeHHJ
	 infHz6GiUalww==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 0/3] drivers/base: Introduce revocable
Date: Fri, 13 Feb 2026 09:23:04 +0000
Message-ID: <20260213092307.858908-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series is separated from [1] to show the independency and compare
potential use cases easier.  This is the revocable core part.  Use cases
are in other series.

The 1st patch introduces the revocable which is an implementation of ideas
from the talk [2].

The 2nd and 3rd patches add test cases for revocable in KUnit and selftest.

[1] https://lore.kernel.org/all/20251016054204.1523139-1-tzungbi@kernel.org
[2] https://lpc.events/event/17/contributions/1627/

---
v8:
- Rework on the revocable APIs.  See changelog in [PATCH v8 1/3] for details.

v7: https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org
- Rebase onto next-20260115.

v6: https://lore.kernel.org/chrome-platform/20251106152330.11733-1-tzungbi@kernel.org
- Rebase onto next-20251106.
- Separate revocable core and use cases.

v5: https://lore.kernel.org/chrome-platform/20251016054204.1523139-1-tzungbi@kernel.org
- Rebase onto next-20251015.
- Add more context about the PoC.
- Support multiple revocable providers in the PoC.

v4: https://lore.kernel.org/chrome-platform/20250923075302.591026-1-tzungbi@kernel.org
- Rebase onto next-20250922.
- Remove the 5th patch from v3.
- Add fops replacement PoC in 5th - 7th patches.

v3: https://lore.kernel.org/chrome-platform/20250912081718.3827390-1-tzungbi@kernel.org
- Rebase onto https://lore.kernel.org/chrome-platform/20250828083601.856083-1-tzungbi@kernel.org
  and next-20250912.
- The 4th patch changed accordingly.

v2: https://lore.kernel.org/chrome-platform/20250820081645.847919-1-tzungbi@kernel.org
- Rename "ref_proxy" -> "revocable".
- Add test cases in Kunit and selftest.

v1: https://lore.kernel.org/chrome-platform/20250814091020.1302888-1-tzungbi@kernel.org

Tzung-Bi Shih (3):
  revocable: Revocable resource management
  revocable: Add KUnit test cases
  selftests: revocable: Add kselftest cases

 .../driver-api/driver-model/index.rst         |   1 +
 .../driver-api/driver-model/revocable.rst     | 256 +++++++++++
 MAINTAINERS                                   |  11 +
 drivers/base/Kconfig                          |   5 +
 drivers/base/Makefile                         |   5 +-
 drivers/base/revocable.c                      | 228 ++++++++++
 drivers/base/revocable_test.c                 | 410 ++++++++++++++++++
 include/linux/revocable.h                     | 194 +++++++++
 tools/testing/selftests/revocable/Makefile    |   7 +
 .../selftests/revocable/revocable_test.c      | 177 ++++++++
 .../selftests/revocable/revocable_test.h      |  20 +
 .../selftests/revocable/test-revocable.sh     |  34 ++
 .../selftests/revocable/test_modules/Makefile |  10 +
 .../revocable/test_modules/revocable_test.c   | 234 ++++++++++
 14 files changed, 1591 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/driver-model/revocable.rst
 create mode 100644 drivers/base/revocable.c
 create mode 100644 drivers/base/revocable_test.c
 create mode 100644 include/linux/revocable.h
 create mode 100644 tools/testing/selftests/revocable/Makefile
 create mode 100644 tools/testing/selftests/revocable/revocable_test.c
 create mode 100644 tools/testing/selftests/revocable/revocable_test.h
 create mode 100755 tools/testing/selftests/revocable/test-revocable.sh
 create mode 100644 tools/testing/selftests/revocable/test_modules/Makefile
 create mode 100644 tools/testing/selftests/revocable/test_modules/revocable_test.c

-- 
2.53.0.310.g728cabbaf7-goog

