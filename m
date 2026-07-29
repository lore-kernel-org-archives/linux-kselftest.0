Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886E3BF66D;
	Wed, 29 Jul 2026 23:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785368278; cv=none; b=p+9pilomuXLTL0gmgWXQpcPxD0IScLc5o/TFrtGMPZHEM0AQv9KGHFzJN0D4+RJtgYW5/N158zzA1L/FG4VaJbSN6lXEdD1nZ412enn6Wfi9BHQZGtpbJkzv+opkneLzBXIHZMXLY50RI6La2mZCyWcocIRW1AsQ/9oYSojwa/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785368278; c=relaxed/simple;
	bh=fObPG9D+e4sUz+uuOshC7dVO4ayj7MJfakTg7dW7W4Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvOaGoxwO8OCkQjei83n2XneOyR4C7ANv8RlCTv/JVw2wiIbNGwhb+eAO1kH2TGyeSVstIr5Fx8+ElGg/dtPYT8U9x9n7NYjY0YUj3mY5mhwaaJFVqxg92aQu3E5p2ozjfjTRCW1UTUOzWsXDlS0Xp896lGJafF1Crk13gZ6jIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=llGK7AmE; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="llGK7AmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785368277; x=1816904277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WL1QywWtj3HFHsLjoKmZr2x3oJi2hqcGK71kc7S5mzM=;
  b=llGK7AmE2IbIa1/wicJ3celzbQyItaP05H+5ZbQkfit94adaOgadgtkV
   euhWb0IttCucPgUtpgcs/FOhp1mOYynxinSQYa/wq4PgRP+sAbdrjC/gR
   UPHt7lOQtoM9HEf+QrBoOXab7FTRhR/WFFQ3qnN6pz5dvv5mWBnzqjV87
   gz0GHIPqsAspxlbEvembENUQV/rIHLJ84vR0n5tM9cYk6PLlgR8SWZFST
   Sv/DWGr3Iu2EK6VOuzZY5MgNAPNsOgsxqEGSeVccMG5EzQUp1OsJ0S06T
   ecDNeiOUzPkpteGPDlreJ9n9TKQr4hwZPdFmQybIsxYblfDVJwPnXK+Wz
   A==;
X-CSE-ConnectionGUID: ZYzMMQgbSBOujcPY0arJOA==
X-CSE-MsgGUID: 3OZJs+QsQrGdwgE8tV9Daw==
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208";a="24411255"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:37:54 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:8347]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.11:2525] with esmtp (Farcaster)
 id 27991a9a-4c76-494b-975e-1d44b5bd6f84; Wed, 29 Jul 2026 23:37:54 +0000 (UTC)
X-Farcaster-Flow-ID: 27991a9a-4c76-494b-975e-1d44b5bd6f84
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:37:54 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:37:48 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn
	<andrew@lunn.ch>, Carolina Jubran <cjubran@nvidia.com>, Wen Gu
	<guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David
 Woodhouse" <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<vadim.fedorenko@linux.dev>
Subject: [PATCH v6 net-next 0/7] ptp: Add PHC timestamp quality attributes
Date: Wed, 29 Jul 2026 23:37:29 +0000
Message-ID: <20260729233740.16516-1-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D041UWB002.ant.amazon.com (10.13.139.179) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

This series adds quality attributes to PTP Hardware Clock (PHC)
timestamps, allowing userspace to obtain error bound, clock status,
timescale, and system counter values alongside timestamps in a single
call.

Motivation
----------
The existing PTP APIs return timestamps without any indication of
their quality. Applications that need clock accuracy and
synchronization status commonly rely on external tools such as
ptp4l, which implement synchronization logic and can export their
measurement of clock accuracy. For managed PHC devices - such as
the ENA network adapter, whose clock is synchronized by the device
without userspace involvement - these tools are not available, and
the existing APIs lack a way to report quality metrics to consumers
of time.

This was previously proposed as an RFC [1] with a single ioctl.
Based on community feedback, the design was reworked to cover both
the extended (multi-sample) and precise (cross-timestamp) paths.

Design
------
The UAPI was redesigned based on Thomas Gleixner's proposal [2]:

- A unified data structure (struct ptp_sys_offset_attrs) is used
  for both extended and precise ioctls.

- A u32 valid bitmask in struct ptp_clock_attrs indicates which
  attributes are populated, replacing sentinel values. Drivers
  set only the bits for attributes they provide.

- System counter values (cycles + counter_id) are carried in
  struct ptp_sys_time alongside each system timestamp. These are
  populated by the timekeeping core cross-timestamp infrastructure,
  which is now merged in net-next [3] - drivers do not fill them.
  This series therefore applies directly to net-next with no
  out-of-tree dependency.

- Graceful degradation: the attrs ioctls work even on devices
  without attrs callbacks, falling back to gettimex64 /
  getcrosststamp and returning attrs.valid = 0. The capability
  bits reflect this fallback so cap-respecting userspace does not
  skip the ioctl on base-only drivers.

A capability flag is added to ptp_clock_caps so userspace can
discover attributes support.

Patches 2-3 add testptp support for the new ioctls.

Patch 4 implements the attributes for ptp_vmclock, reporting
error bound, clock status, and timescale.

Patches 5-7 implement the attributes for the ENA driver,
reporting error bound from the device's PHC layer.

v6:
- ptp: reject a non-zero reserved field (request.rsv[]) in the
  attrs ioctls, matching ptp_sys_offset_extended(). (Jakub Kicinski)
- ptp: zero-initialize the per-sample system-timestamp snapshot in
  ptp_sys_offset_extended_attrs() so no uninitialized or stale stack
  data can reach userspace. (Jakub Kicinski)
- ptp: translate the kernel enum clocksource_ids to the UAPI enum
  ptp_counter_id before returning sys_counter_id; sources that are
  not a raw hardware counter (e.g. kvmclock) are reported as
  PTP_COUNTER_UNKNOWN with sys_counter = 0. (Jakub Kicinski,
  David Woodhouse)
- ptp: initialize the precise cross-timestamp struct and set its
  clock_id from the validated request; validate clock_id against a
  precise-path allowlist (CLOCK_REALTIME + CLOCK_AUX) so unsupported
  clocks return -EINVAL instead of triggering a WARN in
  get_device_system_crosststamp(). (Jakub Kicinski, David Woodhouse)
- ptp: make the extended_attrs/precise_attrs capability bits reflect
  the base-callback fallback (gettimexattrs64 || gettimex64,
  getcrosststampattrs || getcrosststamp) and document the fallback
  and the att.valid semantics. (Jakub Kicinski)
- ptp: echo the full request header back from the attrs ioctls so
  valid/clock_id/num_samples/rsv round-trip. (Jakub Kicinski)
- ptp: clarify the FREE_RUNNING vs UNRELIABLE and HOLDOVER status
  comments and the @error_bound kernel-doc (a maximum bound, not a
  statistical estimate; not to be trusted when status is UNKNOWN or
  UNRELIABLE). (Carolina Jubran)
- ptp: document that both @sts and @att may be NULL in the
  gettimexattrs64 kernel-doc. (Jakub Kicinski)
- selftests/ptp: print the returned system counter value and id
  (sys_counter, sys_counter_id) in the attrs output.
- Exposing the underlying hw_csid/hw_cycles for derived clocksources
  (kvmclock, ART, ...) is left to a follow-up; the UAPI leaves room
  to add them without an ABI change. (David Woodhouse)

v5:
- ptp: simplify ptp_sys_offset_{extended,precise}_attrs() to copy
  the request header onto the stack and allocate the result buffer
  once, instead of memdup_user() + kfree() + kzalloc(). (Saeed
  Bshara)
- ptp: deduplicate the kernel-doc for gettimexattrs64 /
  getcrosststampattrs by referencing the base gettimex64 /
  getcrosststamp callbacks. (Saeed Bshara)
- ptp: add missing kernel-doc member descriptions for struct
  ptp_timestamp and struct ptp_sys_offset_attrs.
- selftests/ptp: map the clockid to a name and print once instead
  of three duplicated printfs. (Saeed Bshara)
- selftests/ptp: make -a a modifier on -x/-X instead of an
  exclusive option; drop -A (use -X -a); trim the unknown-clock
  output; print "not reported" for attributes the device does not
  report. (Saeed Bshara)
- ptp_vmclock: scope the local 'st' inside the SUPPORT_KVMCLOCK
  block to fix an unused-variable warning on !CONFIG_KVM_GUEST.
  (kernel test robot)
- No UAPI changes; the ioctl structures are unchanged from v4.

v4:
- Complete UAPI redesign per Thomas Gleixner's proposal [2]:
  unified data structure with u32 valid bitmask, system counter
  in ptp_sys_time (populated by core, not drivers), graceful
  degradation for devices without attrs callbacks. (Thomas Gleixner,
  David Woodhouse)
- Counter values moved from driver attrs callback to timekeeping
  core infrastructure - drivers no longer set counter_id or
  counter_value.
- Flexible array member for timestamps[] (kernel bounds the copy,
  userspace allocates for num_samples requested).
- Drop separate ptp_clock_attributes kernel struct - driver
  callbacks fill the UAPI ptp_clock_attrs directly.

v3:
- Remove patch 5/8 from v2 (return-code bugfix) - sent separately
  as [PATCH net] to the net tree.
- Zero-initialize struct ptp_clock_attributes in PTP core ioctl
  handlers to prevent stack leak of unset fields. (Simon Horman,
  sashiko)
- ptp_vmclock: validate counter_period_shift < 128 to prevent
  undefined behavior on untrusted hypervisor input. (sashiko)
- ptp_vmclock: add overflow check on err_hi * NSEC_PER_SEC to
  prevent silent wraparound producing erroneously small error
  bound. (sashiko)
- ptp_vmclock: report PTP_TIMESCALE_TAI after tai_adjust() to
  avoid timescale mismatch. (sashiko)
- ENA: set counter_id = 0, counter_value = 0 in gettimexattrs64
  for defense-in-depth. (sashiko)

v2:
- Fix build bisectability: move ena_com.c consumer updates into
  patch 6/8 and ena_phc.c caller update into patch 7/8 so each
  patch compiles independently.
- Add missing Cc for Amit Bernstein (co-author of ENA patches).

[1] https://lore.kernel.org/netdev/20250724115657.150-1-darinzon@amazon.com/
[2] https://lore.kernel.org/all/87se7ht25o.ffs@tglx/
[3] https://lore.kernel.org/all/20260526165826.392227559@kernel.org/

Arthur Kiyanovski (7):
  ptp: Add ioctls for PHC timestamps with quality attributes
  selftests/ptp: Extract print_system_timestamp helper in testptp
  selftests/ptp: Add testptp support for attributes ioctls
  ptp: ptp_vmclock: Implement attributes ioctls
  net: ena: Update PHC admin interface for error bound support
  net: ena: Add error bound to PHC communication layer
  net: ena: Implement gettimexattrs64 callback for PTP attributes

 .../device_drivers/ethernet/amazon/ena.rst    |   2 +
 .../net/ethernet/amazon/ena/ena_admin_defs.h  |  17 +-
 drivers/net/ethernet/amazon/ena/ena_com.c     |  51 ++--
 drivers/net/ethernet/amazon/ena/ena_com.h     |   5 +-
 drivers/net/ethernet/amazon/ena/ena_debugfs.c |   3 +
 drivers/net/ethernet/amazon/ena/ena_phc.c     |  61 +++-
 drivers/ptp/ptp_chardev.c                     | 208 ++++++++++++-
 drivers/ptp/ptp_clock.c                       |   4 +-
 drivers/ptp/ptp_vmclock.c                     | 197 +++++++++++-
 include/linux/ptp_clock_kernel.h              |  20 ++
 include/uapi/linux/ptp_clock.h                | 283 +++++++++++++++++-
 tools/testing/selftests/ptp/testptp.c         | 198 +++++++++---
 12 files changed, 939 insertions(+), 110 deletions(-)

base-commit: 2bb54b49e9d522f54dc9c0fe10ba40fbc56041c8
-- 
2.47.3

