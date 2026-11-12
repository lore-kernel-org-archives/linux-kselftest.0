Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488658;
	b=Yt9u18odhAcV7BYfJtqM3xL1c6emwysJ/Yso07yv7H/FMLFqmusI76n6iAA7XyvgTvnB
	 cT4ptrHYNjJYt23BdyHOlus6jrMYOzVA4BfPKCSi2yaKa30/77TJihhey2zk6AalqhuKO
	 6c+0wPdLLw0NvNPWRNdVZ+ErKfaUN8f2IMfYoiLs2i3MRruGyfi1M+NkNkhWeIE486vTj
	 XtNAKjafZvjNs5VT/7C1twbBdFvs2ZePMCuWDMTyes80VXIqQ4hlhTEZZ7eO9PajAh2q1
	 BZeAzmlKN8qmyc9Xmc/P2FE0pE+8VhQTNcJ88JZXEqgYb3d5r5rYQc0LHPy0R1KM8bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488658;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=0tj6mONKQs4uxuQAiKsmAs+vaFP71pgTJSVc6t5mh5c=;
	b=ZuAV8xMzjx7uDKqPZExZV+6wu9KMf2ffLyyi54ZHaUt24A4wT9ISs6h9U+0wtQnXoYxv
	 HD/xX7FtTqv6GuGjWl+9wRem5u2s9IFYUo00q9cZJU8aXsNAoM0PF3CJyVd64vGF88FbW
	 XHpVTK3pLx2QhyrXhGDIhgwkEMNBnxI6GL3BltJMhRQ0VI9WOiDt+uhlrK207xYT1s55v
	 zvJ5QKanmyS+OuNxzFhWu77ABHCHD8GjGtGNNNGfeHiISnP2njt+5xCb+PaS4P+eWXrMQ
	 uX8J3P2w2kZUrJMiV5UUTT3k+Xa3VkW88zHB6Qilzfjqvp+B9xJsE1UMmJKJNt/gJFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dW2TRwfk;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E5606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE7E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dW2TRwfk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0tj6mONKQs4uxuQAiKsmAs+vaFP71pgTJSVc6t5mh5c=;
	b=dW2TRwfknHDGuwbVE3wphZN3UKwy3WnyTQ4ZUgdXlv2K/MClk2P9MWHX+rZpzOCh2M+B7E
	wE2QIy9h5ox7mbZyahtJg50aXY3vBbu7doleSGa+3zPpdyIs7z9j+EoaNybKOWACisS9D6
	Rpm/N+W+60hUlbuKcpboItRXDULNDlo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-05S6PDg1NX6TgKk1Y-jqbw-1; Thu,
 12 Nov 2026 08:04:12 -0500
X-MC-Unique: 05S6PDg1NX6TgKk1Y-jqbw-1
X-Mimecast-MFC-AGG-ID: 05S6PDg1NX6TgKk1Y-jqbw_1794488650
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EFF4A18011E1;
	Thu, 12 Nov 2026 13:04:09 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC1F91956087;
	Thu, 12 Nov 2026 13:04:04 +0000 (UTC)
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
Subject: [PATCH net-next v4 00/14] dpll: add a simulated DPLL device driver
Date: Thu, 12 Nov 2026 14:03:45 +0100
Message-ID: <20261112130359.840795-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
without reloading the module.

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

The selftests live in tools/testing/selftests/drivers/dpll and run
with "make -C tools/testing/selftests TARGETS=drivers/dpll run_tests".
By default they create dpllsim devices; with DPLL_DEV_ID=<id> the basic
and feature scripts run against an existing device instead, so the same
suite exercises real hardware, and DPLL_DRIVER=<module name> picks the
first device of that driver, dpllsim for a simulated one. The whole
suite was run through the kselftest runner in a KVM guest and on an ice
E810 host with CONFIG_KASAN, CONFIG_PROVE_LOCKING and
CONFIG_DPLL_REFCNT_TRACKER enabled, against the simulator and, with
DPLL_DRIVER=ice, against the ice DPLL, where the tests that need a
simulator skip and the pin state and priorities of the hardware are
left as they were. All pass with no warnings in dmesg.

---
v4:
- address the findings of the netdev AI review of v3
- dpllsim: keep the priority and the frequency set over netlink apart
  from the configured values, so that every live transition starts from
  what configfs holds and the attributes keep showing it
- dpllsim: document the pin limit, the frequencies per pin type, the
  errors of the live write and what happens to values set over netlink;
  correct the comments on what the subsystem mutex covers
- selftests: tell a failed device or pin dump from a system without
  devices or pins, and fail instead of skipping when the simulated
  device cannot be created
- selftests: pick the spare input pin by all its parent devices, bail
  out before touching a pin whose current priority, frequency or phase
  adjust could not be written back, restore the reference after the
  test pin in manual mode, do not let a refusal hide an earlier failure
- selftests: signal only workers that are still children of the script,
  never delete a device named by the environment or one that existed
  before, record the mounts before mounting
- selftests: keep the files of freed objects out of the reference
  tracker snapshot, fail when the tracker is built in but records
  nothing, skip the final leak check when a device was left behind
- selftests: log deferred restores that fail, tell failed pin queries
  from missing attributes in the remaining places, fail a stress worker
  that a signal interrupted, enable CONFIG_IKCONFIG_PROC for the
  tracker probe
- drop the claim that configfs implies no stable ABI
- add the Reviewed-by given to patches 2, 5, 6 and 14 of v3 (Ivan
  Vecera) and keep the other tags, except on patches 7 and 9, where
  the behaviour of the driver changed and which ask for a new look

v3:
- move the selftests from tools/testing/selftests/drivers/net/dpll to
  tools/testing/selftests/drivers/dpll, with the shared library as a
  TEST_FILES entry of that directory, so that the tests sit where the
  drivers do
- let dpllsim refuse pin states that are not valid in the device mode:
  connected is refused in automatic mode, which the simulator runs in,
  as Documentation/driver-api/dpll.rst reserves it for manual mode
  (Ivan Vecera)
- make the pin state test follow the mode of the device under test and
  check on the simulator that connected is refused in automatic mode;
  cycle the stress tests through the states of automatic mode only
- add DPLL_DRIVER to pick the device of a given driver, or the simulator
  with DPLL_DRIVER=dpllsim, on a system that has hardware DPLL devices
- describe what the leak check waits for instead of a concurrent dump
  holding references, which nothing does (Ivan Vecera)
- carry the Reviewed-by and the set Acked-by of v2 over to the patches
  whose code did not change or only moved; patches 2, 5 and 6 changed
  and ask for a new look

v2:
- sort tools/testing/selftests/drivers/net/dpll/config alphabetically
  and make the scripts clean under the shellcheck run of the netdev CI
  (quoted exit and return values, shellcheck directives for the globals
  shared between the library and the scripts and for the optional
  argument of dpllsim_setup_standard_device())

v3: https://lore.kernel.org/all/20261109093523.931201-1-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-1-poros@redhat.com/
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

 Documentation/driver-api/dpllsim.rst          |  95 ++
 Documentation/driver-api/index.rst            |   1 +
 MAINTAINERS                                   |   8 +
 drivers/dpll/Kconfig                          |   1 +
 drivers/dpll/Makefile                         |   1 +
 drivers/dpll/dpllsim/Kconfig                  |  16 +
 drivers/dpll/dpllsim/Makefile                 |   4 +
 drivers/dpll/dpllsim/core.c                   | 480 +++++++++
 drivers/dpll/dpllsim/dpll.c                   | 500 +++++++++
 drivers/dpll/dpllsim/dpllsim.h                | 101 ++
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/drivers/dpll/Makefile |  17 +
 tools/testing/selftests/drivers/dpll/config   |   8 +
 .../selftests/drivers/dpll/dpll_basic.sh      | 242 +++++
 .../selftests/drivers/dpll/dpll_features.sh   | 605 +++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 989 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_reftrack.sh   | 190 ++++
 .../selftests/drivers/dpll/dpll_stress.sh     | 610 +++++++++++
 tools/testing/selftests/drivers/dpll/settings |   1 +
 19 files changed, 3870 insertions(+)
 create mode 100644 Documentation/driver-api/dpllsim.rst
 create mode 100644 drivers/dpll/dpllsim/Kconfig
 create mode 100644 drivers/dpll/dpllsim/Makefile
 create mode 100644 drivers/dpll/dpllsim/core.c
 create mode 100644 drivers/dpll/dpllsim/dpll.c
 create mode 100644 drivers/dpll/dpllsim/dpllsim.h
 create mode 100644 tools/testing/selftests/drivers/dpll/Makefile
 create mode 100644 tools/testing/selftests/drivers/dpll/config
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_basic.sh
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_features.sh
 create mode 100644 tools/testing/selftests/drivers/dpll/dpll_lib.sh
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_reftrack.sh
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_stress.sh
 create mode 100644 tools/testing/selftests/drivers/dpll/settings

-- 
2.56.0

