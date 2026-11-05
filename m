Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891950;
	b=BTyXHlMuwW04dTtpNBo9HAkylu/RNbdY1Zg92f51XMBFKv45xhIQWQBJ/UXp0TUCK9Xv
	 0M2xHmunG28i7T2hL/Byj+fyiHr2tTegnqDzT6pm6j1THAoty03gdQJeJzdhZN0bl/tr1
	 A3dXWWI7JId95Yo5XU+QL/yFQBK6zwtve5Wbp4jSqpc9I9XwlACAUTldXLTJDnACRMF6g
	 Rq5GuDgZ27TGZ9dB5TP5LtpetkQMIReRH5GWbXocNR8M/ArDdKJYlZ/Q1EIm1Jr7iwsGY
	 hLaGS7FPRVG4dZTxSP575hDpPNwwzDvZ4UVeaCKP1h+SVJbEmZT5t9J/uH4mSGgsuZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891950;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=aRQh8dS+XR3vQe5ltm+KXlmY2JqIDhKFiUkIbtcENcY=;
	b=gzh8v/rqFhyYWgH8BlZREiBnlnAisBGtrZqFldocECchrcun+/7T7iHJduI5jis1BP/V
	 GrRvGXxyKHKBe/HnbaD0GRO+xm/xKSGUWAiCva6YBH6i7CUs8bqHkrNSACH6LUUnHLwdp
	 hDpqS9Br5EZa4HYdk1+XuZinKlDZ2iW32ORVxsXTHFrC+vYQ5kacLBh1JiKGcp4lp7iZN
	 M/cvfzYy9l6HGABsLKKVAnUh2/SbIQlCkCVGz7/wApDhrfwkjp0qCVGVnj4uyZmZwbQne
	 PL927Al9wRpf7tPktfDjdKstL2RbhekeRPdY57wmAj7o7tw4gHHo3wO4NxDNo9vjrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=US+YJR4s;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992C606EEA6
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E992C606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=US+YJR4s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aRQh8dS+XR3vQe5ltm+KXlmY2JqIDhKFiUkIbtcENcY=;
	b=US+YJR4skcck34Ps2FS99ZNUUuPkDFDFhJD1rP9aZ992sVfyTd0XiAngjx5coKjFJXxuAb
	EoD0CEJIhCp0wdv8IusjI09tzhYQsPKseDk+yLKWfdfQruWzXPtDnnG5lpAACHQfnXa+P6
	21WxiOor/evP9kzzwuWkeKynIFI87Lw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-ps5Y5IFtP2CKd5FELX8ghg-1; Thu,
 05 Nov 2026 10:19:04 -0500
X-MC-Unique: ps5Y5IFtP2CKd5FELX8ghg-1
X-Mimecast-MFC-AGG-ID: ps5Y5IFtP2CKd5FELX8ghg_1793891942
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 483EA1955F0E;
	Thu,  5 Nov 2026 15:19:01 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1CC01956089;
	Thu,  5 Nov 2026 15:18:55 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 00/14] dpll: add a simulated DPLL device driver
Date: Thu,  5 Nov 2026 16:18:38 +0100
Message-ID: <20261105151852.1844305-1-poros@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The DPLL subsystem has no in-tree driver that can run without real
hardware, so core changes and userspace tooling are hard to exercise in
CI, and the pin-on-pin and reference sync paths see almost no coverage
outside the vendors' labs. This series adds dpllsim, a simulated DPLL
device driver, together with selftests that run against it.

The driver is controlled through configfs, following gpio-sim. Writing a
clock ID into a device directory and setting "live" to 1 registers a
DPLL device with the core. Pins are directories under pins/ with their
type, frequency, direction and priority as attributes, and all of them
are registered when the device goes live. The split between creating
the configuration and going live keeps the register and unregister
paths reachable from userspace, so they can be exercised repeatedly
without reloading the module. Nothing in the simulator is a stable ABI.

The patches follow the shape of the zl3073x introduction. The
driver starts with the device alone, then gains pins and the static pin
operations one at a time (state, priority, frequency, phase adjustment),
and every feature patch is followed by the selftest that covers it. The
last two patches add concurrency stress tests and reference tracker
leak tests for the lifecycle paths.

The simulation loop (lock state machine, phase and frequency
measurements, monitoring features), the topology features (MUX pin
hierarchies, reference sync, media failure injection), netdevsim
integration and device mode setting follow in two further series once
this one is in, to stay within the 15 patch limit.

The driver and the selftests were developed with an LLM coding
assistant (Claude Code) working under my direction. I chose the
configfs design, the split into one feature per patch and the test
scenarios, and I reviewed every line. The assistant wrote most of the
code and the first drafts of the changelogs, and it found and fixed
bugs by running the suite on the lab host. The series then went
through several rounds of an LLM based patch reviewer whose findings
were fixed, and through a mutation test in which deliberately broken
driver and core code was caught by the tests.

The selftests live in tools/testing/selftests/drivers/net/dpll and run
with "make -C tools/testing/selftests TARGETS=drivers/net/dpll
run_tests". By default they create dpllsim devices; with
DPLL_DEV_ID=<id> the basic and feature scripts run against an existing
device instead, so the same suite exercises real hardware. The whole
suite was run through the kselftest runner on an ice E810 host with
CONFIG_KASAN, CONFIG_PROVE_LOCKING and CONFIG_DPLL_REFCNT_TRACKER
enabled, against the simulator and, with DPLL_DEV_ID, against the ice
DPLL, where the tests that need a simulator skip and the pin state and
priorities of the hardware are left as they were. All pass with no
warnings in dmesg.

---
v2:
- sort tools/testing/selftests/drivers/net/dpll/config alphabetically
  and make the scripts clean under the shellcheck run of the netdev CI
  (quoted exit and return values, shellcheck directives for the globals
  shared between the library and the scripts and for the optional
  argument of dpllsim_setup_standard_device())

v1: https://lore.kernel.org/all/20261103093910.596225-1-poros@redhat.com/
---
Petr Oros (14):
  dpll: dpllsim: Add simulated DPLL device driver
  selftests: dpll: add test library and device lifecycle tests
  dpll: dpllsim: Add configurable pins
  selftests: dpll: add pin enumeration and property tests
  dpll: dpllsim: Add support to set input pin state
  selftests: dpll: add pin state tests
  dpll: dpllsim: Add support to get/set priority on input pins
  selftests: dpll: add pin priority test
  dpll: dpllsim: Add support to set frequency on pins
  selftests: dpll: add pin frequency test
  dpll: dpllsim: Add support to adjust phase
  selftests: dpll: add pin phase adjust test
  selftests: dpll: add concurrency stress tests
  selftests: dpll: add reference leak tests

 Documentation/driver-api/dpllsim.rst          |  72 ++
 Documentation/driver-api/index.rst            |   1 +
 MAINTAINERS                                   |   9 +
 drivers/dpll/Kconfig                          |   1 +
 drivers/dpll/Makefile                         |   1 +
 drivers/dpll/dpllsim/Kconfig                  |  16 +
 drivers/dpll/dpllsim/Makefile                 |   4 +
 drivers/dpll/dpllsim/core.c                   | 471 ++++++++++
 drivers/dpll/dpllsim/dpll.c                   | 475 ++++++++++
 drivers/dpll/dpllsim/dpllsim.h                |  99 ++
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/drivers/net/dpll/Makefile       |  16 +
 .../testing/selftests/drivers/net/dpll/config |   6 +
 .../selftests/drivers/net/dpll/dpll_basic.sh  | 221 +++++
 .../drivers/net/dpll/dpll_features.sh         | 397 ++++++++
 .../drivers/net/dpll/dpll_reftrack.sh         | 184 ++++
 .../selftests/drivers/net/dpll/dpll_stress.sh | 562 ++++++++++++
 .../selftests/drivers/net/dpll/settings       |   1 +
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  | 850 ++++++++++++++++++
 19 files changed, 3387 insertions(+)
 create mode 100644 Documentation/driver-api/dpllsim.rst
 create mode 100644 drivers/dpll/dpllsim/Kconfig
 create mode 100644 drivers/dpll/dpllsim/Makefile
 create mode 100644 drivers/dpll/dpllsim/core.c
 create mode 100644 drivers/dpll/dpllsim/dpll.c
 create mode 100644 drivers/dpll/dpllsim/dpllsim.h
 create mode 100644 tools/testing/selftests/drivers/net/dpll/Makefile
 create mode 100644 tools/testing/selftests/drivers/net/dpll/config
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_basic.sh
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_features.sh
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_reftrack.sh
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
 create mode 100644 tools/testing/selftests/drivers/net/dpll/settings
 create mode 100644 tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh

-- 
2.56.0

