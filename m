Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698783;
	b=eBM8z/Smh4C8Rkzwxn8xhGUISoeVdzDzEySn00RodxryeA+1d+VUwnRs9LarStM5IGQn
	 dEslTTGbE5ya00YFG3WvNgq05oTGjgYlsx4ACceQ1WRrfCFI0lGb6T7YPUnpaI/UTEOQu
	 Cz8KrerULUbd9uBQlPxfprCBP5IJitvLUeHpQ6IA4+t7S16T7dHsWWxyiRfJsBa5rMJOa
	 RJfDBRiZaRXwKuUtuOtABdrQFhF4paQQySVvxOl1Wt/0bvsXJfdl0H6AyCxPiOoO1fseM
	 edi75tgknyTdpqJCZDYNRI8krkxIg3LKnUfnZTs0yXzkPP5MIHEpJx6blKytXDRghww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698783;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=7d8gzhDUjE6cAC5QCfcfmVcim9VIYMGgmAjyZNUqNNY=;
	b=Ww3qow79YPdk5jXMzPw4by+yedJfFCfgYi4Kpxn88/IKraHt+bUJtTYNUtMc/Zh5YvL2
	 ggMEQuUblE67F2eIsrE68sHGCK4hfJ0SfAOKAaXVfmBzXJaaSEcYnMsY9NpCqvdHz59Jb
	 JZi0KRveH5T+5ZSlvynnmgH63EVvsaR6NuNT30zJVfVv6fHT7rkXM+l61yR/PjoBNMZAs
	 tgWEn6ZzI39rEmjAmWXOqmG1FViQHXuRvDYZ0qs9TYjyOCH6nf54Oa1iDcOPoxIYr693O
	 NdVHRDBB5I1alrwApDBagS3yGVjc5mWBlVi/8J/oh0cfAfX75G4O1CGhNqBQpinlVEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cx0iV+mG;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C93606A330
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C93606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cx0iV+mG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7d8gzhDUjE6cAC5QCfcfmVcim9VIYMGgmAjyZNUqNNY=;
	b=cx0iV+mGCFBRf/WV/qcMH5DI8zRkD4sgQ8DxO+Y8d1QBReBLBoFVplr+q+vvtoAtcu8CPy
	BpUicpsBnEYsJmMg9fK86caz91eUoYiQItvViza7q6PFkrWXchAmv+FLW4GmLTyDn5TSpT
	K6iiV9EguYivVbNgLx6gTWV+EApBOAY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-YHw4y3KfOAaFHZ8abmjsHw-1; Tue,
 03 Nov 2026 04:39:36 -0500
X-MC-Unique: YHw4y3KfOAaFHZ8abmjsHw-1
X-Mimecast-MFC-AGG-ID: YHw4y3KfOAaFHZ8abmjsHw_1793698774
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B804D195399E;
	Tue,  3 Nov 2026 09:39:33 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37B3726C;
	Tue,  3 Nov 2026 09:39:28 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next 00/14] dpll: add a simulated DPLL device driver
Date: Tue,  3 Nov 2026 10:38:56 +0100
Message-ID: <20261103093910.596225-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

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
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  | 846 ++++++++++++++++++
 19 files changed, 3383 insertions(+)
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

