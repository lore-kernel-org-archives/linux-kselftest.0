Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597564;
	b=dmegusEcv3YWktH7wtAAYzbp3wYYaoyifWjOnD/hxBkXzP5pPzKl/pcEn3BiUy933oIc
	 My551QIYtCgmcciozCGqLTu91gmxgschUcoi95HOsbRTmsy/r7bqsTqlc7lLvRPIgSglO
	 SKN7k93Ofpfcbd6zjLQ1eX/kChC3c3ZcdJ0ujkglLuhO3pIz+Vs5NzWY/GRPK9CDBDVCa
	 BYlYpRhiopMW1FD32rsIrZQLGzMjdvPtUNkIt32DQmhVww7jIjA8x6BxGu8LsvgmsIR65
	 DqyggpZthq/OUye62UdIbsU7AW+HU0t3j05ob4NHCZCnRRN+ai62A/YHh3F2VW6k7HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597564;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=wRfLEupMmPLkLMkHVnXsAYqsP5mrWLdoRQEyhESOZZw=;
	b=t32+lT4wAFkE026Md9lDlPQaoKwFT1kVlKuoMvx1adCZusGEcqpbuS3BlxHl/XKd3M/o
	 7SBi1Lr16CCPiIZujw+vx4xYjdaA3uMpeuaRGzy7YB8mNb4RCj1ySga65sh1Q21IvKKHE
	 Y+1gNvKT704yxPfwUgIL+b5kKM1Y8gWGKB40aL4WmZ/RZJJC9LA9Y+VyFGm/I6/N9TaGy
	 b0HmrxMnrUS19L6SxKC8gqto05++CHSKZ46Rj9TR/IM4/K+Qfvds8nk3D1TnCgK5ZqzCm
	 LR43vOPfjouG19A7HYRNjzEcecOEsRiBTa5ciBr4/7GY3kh1ofnQbWl8jcYxhr0xr1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R8g2YGlD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A60606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R8g2YGlD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRfLEupMmPLkLMkHVnXsAYqsP5mrWLdoRQEyhESOZZw=;
	b=R8g2YGlDl8hDg5LPlkiq093d+uWAld50ZTWJ2Dh43eiNU0zrG2eh8MGhWJWDdiXbXHfj2P
	ZdACDaSqie82YR6CBO0n3/lRHBlpX4Lg061H4SriEUO44BE6Dq/Wfn3zRPOabg5OV/baBe
	O+2yVuEXi7UtVBE9FhlUzb1I+J6SgkY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-nrxRfjsVOA-NfMV2cCP1yA-1; Wed,
 25 Nov 2026 09:05:57 +0000
X-MC-Unique: nrxRfjsVOA-NfMV2cCP1yA-1
X-Mimecast-MFC-AGG-ID: nrxRfjsVOA-NfMV2cCP1yA_1795597555
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 581E6180047A;
	Wed, 25 Nov 2026 09:05:54 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6FB38195B3C5;
	Wed, 25 Nov 2026 09:05:49 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v5 02/14] selftests: dpll: add test library and device lifecycle tests
Date: Wed, 25 Nov 2026 10:05:09 +0100
Message-ID: <20261125090522.3777494-3-poros@redhat.com>
In-Reply-To: <20261125090522.3777494-1-poros@redhat.com>
References: <20261125090522.3777494-1-poros@redhat.com>
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

Add a shell library for DPLL selftests with wrappers around the iproute2
dpll tool and around the dpllsim configfs interface, and the first two
test scripts built on it. The library resolves devices by the clock ID
chosen at creation time, since netlink ids depend on what else exists on
the system, and the dpllsim helpers restrict the lookup to their module,
so that a device of another driver with the same clock ID is never
picked up. Every query runs the tool first and jq on what it printed, so
that a failed query is told apart from a missing attribute. That
includes the device dump the device selection reads. A dump that fails
is a failure, not a system without a device, unless the dpll tool
reports that the kernel has no DPLL subsystem, which is a skip. The
library loads the dpllsim module and mounts configfs when nothing else
did, and the cleanup of each script undoes the mount, removes the
devices the script created and runs on exit and on INT and TERM, so that
a timeout imposed by the harness still cleans up, and ignores any
further signal from then on, an exit inside it would end the teardown
half way. The module stays loaded. The scripts find the devices of the
simulator by the module name they report, which is "kernel" for a driver
that is built in, so they skip when dpllsim is not a module.

Two runs of scripts that create dpllsim devices would share the one
dpllsim directory and could draw the same clock IDs, so every such
script takes a lock before it mounts or creates anything and skips when
another run holds it. The lock file lives under /run rather than in
/tmp, since the scripts run as root and open the file for writing, and a
symlink planted in the world-writable /tmp would redirect that open. Its
directory is made private whatever the umask, for the same reason.

dpll_basic.sh checks that a device reports the mandatory attributes over
netlink. It runs against the device named by DPLL_DEV_ID, the first
device of the driver named by DPLL_DRIVER, or the first device that is
not a dpllsim one, and creates a dpllsim device when there is none or
when DPLL_DRIVER asks for dpllsim, so the same script serves the
simulator and real drivers and picks one of several drivers on a host. A
simulated device that cannot be created, registered or found on netlink
is a failure, only a missing module is a skip. dpll_stress.sh is
simulator only and exercises the lifecycle paths of the core by creating
and deleting devices in a loop and by cycling one device through
repeated register and unregister transitions. The new directory goes
into the dpllsim MAINTAINERS entry and into the one of the DPLL
subsystem, since the basic test checks the netlink interface of any DPLL
driver.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- skip when dpllsim is built in, the scripts find its devices by
  the module name, which is "kernel" for a built in driver
- ignore further signals in the INT and TERM handler and as the first
  thing of every cleanup, an exit inside the exit trap ends the
  teardown half way, and run the cleanup from the handler, a signal
  that came while the script exited ended the exit trap before the
  cleanup started
- say in the comments that a built in simulator is taken like any
  other device, what the unmount of configfs at exit means to others
  and that the name of a device is recorded before its directory is
  created
- describe the stress script in its header by what it is for, the
  header listed tests that later patches add
- correct two comments on the output of the tool, a query by id prints
  a flat object in every iproute2 version and the clock ID is always a
  JSON number
- list the selftest directory under the DPLL subsystem in MAINTAINERS
  as well, the basic test checks the netlink interface of any driver
- keep the name of a device whose directory cannot be removed after a
  failed clock ID write, so that the cleanup handler tries again
- take no lock in dpll_basic.sh for a run against a device the user
  named, by DPLL_DEV_ID or by a hardware driver in DPLL_DRIVER, it only
  reads that device, and say so in the library header
- create the run directory with mode 0700 and make an existing one
  private, whatever the umask, a symlink planted in a directory others
  can write to would redirect the open of the lock file
- skip a stress test whose count of rounds is not a positive number
- pass over a clock-id that a device in the dpllsim directory holds or
  ends the name of, a device left behind or one of someone else, the
  simulator refuses a second live instance with the same clock-id
- look a device the user named up in the dump, a device that is there
  but cannot be queried fails instead of passing for one that is absent
- require mountpoint, without it the cleanup cannot tell whether
  configfs is mounted
- skip on a failed device dump only when the dpll tool reports a kernel
  without the DPLL netlink family, a built in simulator or a kernel
  that has DPLL for another driver but no dpllsim took a broken dump
  for a skip
- track a stress device that fails half way and cannot be removed, the
  next device took over the name the cleanup handler retries
- record the devices that are there before the script, the cleanup took
  one of them for a device the script left behind and kept configfs
  mounted
- name the clock-id check dpllsim_clock_id_taken, the stress script of
  patch 13 uses it as well
- say in comments that a failed redirection makes exec return non-zero,
  bash exits for it only in POSIX mode, and that the waits of the
  deploy cycle cannot add up, the live write completes the transition
- track the device of the deploy cycle when it fails half way and cannot
  be removed, as for the stress devices
- a failed device dump is not made good by loading the simulator, DPLL
  is a bool its drivers select, so its netlink family is there from
  boot or not at all
- the rapid create and delete test deploys every device before it
  deletes it, so its loop goes through the register and unregister
  paths of the core as the description says
- keep the prereq check on the help of the dpll tool, every release
  prints it without connecting to the kernel, so a kernel without DPLL
  passes the check and the failed device dump is the skip it reports,
  and say so above the check

v4:
- tell a failed device dump from a system without a device, the dump
  is a failure unless the simulator is missing as well
- fail instead of skipping when the simulated device cannot be created,
  registered or found on netlink
- initialize DPLLSIM_CREATED_NAME, so that a value inherited from the
  environment cannot make a cleanup handler delete a device, and never
  record a directory that existed before as a device of the run
- record the configfs mount before mounting, so that a signal handled
  right after the mount still unmounts it
- correct the comments on the side effects of the library and on how it
  is used, drop the shellcheck directive of a function without
  arguments
- add the Reviewed-by given to v3 (Ivan Vecera)

v3:
- move the selftests to tools/testing/selftests/drivers/dpll, next to
  where the drivers live, with the library in that directory as a
  TEST_FILES entry; the TARGETS and MAINTAINERS entries follow
- add DPLL_DRIVER, which picks the first device of the named driver
  or, as dpllsim, a created simulated device on a system that has
  hardware DPLL devices
- the Reviewed-by and Acked-by of v2 are not carried over, the
  device selection changed

v2:
- sort the config file alphabetically (netdev CI check_selftest)
- quote the ksft_skip and ret expansions and add shellcheck directives
  for the globals read by the scripts, for ksft_skip, which comes from
  net/lib.sh, and for the optional argument of
  dpllsim_setup_standard_device() (netdev CI shellcheck)

v4: https://lore.kernel.org/all/20261112130359.840795-3-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-3-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-3-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-3-poros@redhat.com/
---
 MAINTAINERS                                   |   2 +
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/drivers/dpll/Makefile |  15 +
 tools/testing/selftests/drivers/dpll/config   |   3 +
 .../selftests/drivers/dpll/dpll_basic.sh      | 107 +++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 446 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_stress.sh     | 201 ++++++++
 tools/testing/selftests/drivers/dpll/settings |   1 +
 8 files changed, 776 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/dpll/Makefile
 create mode 100644 tools/testing/selftests/drivers/dpll/config
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_basic.sh
 create mode 100644 tools/testing/selftests/drivers/dpll/dpll_lib.sh
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_stress.sh
 create mode 100644 tools/testing/selftests/drivers/dpll/settings

diff --git a/MAINTAINERS b/MAINTAINERS
index f714b4e61b418d..137b974d5819a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8121,6 +8121,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/driver-api/dpllsim.rst
 F:	drivers/dpll/dpllsim/
+F:	tools/testing/selftests/drivers/dpll/
 
 DPLL SUBSYSTEM
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
@@ -8136,6 +8137,7 @@ F:	Documentation/netlink/specs/dpll.yaml
 F:	drivers/dpll/
 F:	include/linux/dpll.h
 F:	include/uapi/linux/dpll.h
+F:	tools/testing/selftests/drivers/dpll/
 
 DRBD DRIVER
 M:	Philipp Reisner <philipp.reisner@linbit.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c55d7792b27c44..3978b20d87e0b3 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -20,6 +20,7 @@ TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
+TARGETS += drivers/dpll
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
diff --git a/tools/testing/selftests/drivers/dpll/Makefile b/tools/testing/selftests/drivers/dpll/Makefile
new file mode 100644
index 00000000000000..7e839ae71cd22f
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_INCLUDES := \
+	$(wildcard ../../net/lib/sh/*.sh) \
+	../../net/lib.sh \
+# end of TEST_INCLUDES
+
+TEST_FILES := dpll_lib.sh
+
+TEST_PROGS := \
+	dpll_basic.sh \
+	dpll_stress.sh \
+# end of TEST_PROGS
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/drivers/dpll/config b/tools/testing/selftests/drivers/dpll/config
new file mode 100644
index 00000000000000..e2c90b6970bd43
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/config
@@ -0,0 +1,3 @@
+CONFIG_CONFIGFS_FS=y
+CONFIG_DPLL=y
+CONFIG_DPLLSIM=m
diff --git a/tools/testing/selftests/drivers/dpll/dpll_basic.sh b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
new file mode 100755
index 00000000000000..a713f3651a603a
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
@@ -0,0 +1,107 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Basic DPLL subsystem test. Read-only validation of the device properties
+# exposed over netlink. Runs against a hardware DPLL device when one is
+# present (or when DPLL_DEV_ID is set), otherwise against a freshly
+# created dpllsim device. DPLL_DRIVER names the driver to take the
+# device from, dpllsim for a created one although hardware is present.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../net/lib.sh"
+source "$SCRIPTDIR/dpll_lib.sh"
+
+ALL_TESTS="
+	test_device_properties
+"
+
+test_device_properties()
+{
+	local json
+
+	RET=0
+
+	# A device that cannot be queried at all would be reported as one
+	# that misses every attribute, so bail out on that first.
+	if ! json=$(dpll_device_json "$DPLL_DEV_ID") || [ -z "$json" ]; then
+		check_err 1 "device query failed"
+		log_test "DPLL device properties"
+		return
+	fi
+
+	local field
+	for field in '.id' '.["module-name"]' '.["clock-id"]' '.type' \
+		     '.mode' '.["lock-status"]'; do
+		if ! jq -e "$field" <<< "$json" &> /dev/null; then
+			check_err 1 "device is missing the $field attribute"
+		fi
+	done
+
+	log_test "DPLL device properties"
+}
+
+##############################################################################
+
+cleanup()
+{
+	# A second signal must not abort the teardown half way.
+	trap '' INT TERM
+
+	if [ -n "$CREATED_DEVICE" ]; then
+		dpllsim_delete_device "$CREATED_DEVICE" ||
+			log_info "cannot delete device $CREATED_DEVICE"
+	fi
+	# The device whose creation a signal interrupted is recorded by the
+	# library alone, a double delete of a tracked one is harmless.
+	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
+		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
+			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
+	fi
+	dpll_lib_cleanup
+}
+
+dpll_lib_check_prereqs
+# Another run would find the devices of this one left behind, see the
+# lock in the library. A run against a device the user named, by
+# DPLL_DEV_ID or by a hardware driver in DPLL_DRIVER, only reads that
+# device and goes without the lock.
+if [ -z "${DPLL_DEV_ID:-}" ] &&
+   { [ -z "${DPLL_DRIVER:-}" ] || [ "$DPLL_DRIVER" = dpllsim ]; }; then
+	dpll_lib_lock
+fi
+
+CREATED_DEVICE=""
+# The module check may mount configfs, so the exit trap that unmounts it
+# again has to be in place before. INT and TERM run the cleanup as well,
+# so that a timeout imposed by the harness still removes the device, and
+# ignore any further signal, an exit inside the cleanup would end the
+# teardown half way. Their handler drops the exit trap and calls the
+# cleanup itself, a signal that comes while the script exits is handled
+# before the exit trap gets to the cleanup, and the exit of the handler
+# would end the exit trap there.
+trap cleanup EXIT
+trap 'trap "" INT TERM; trap - EXIT; cleanup; exit 1' INT TERM
+
+dpll_lib_init
+
+# With the module there, a device that cannot be created, registered or
+# found on netlink is a failure of what the test covers, not a skip.
+if [ -z "$DPLL_DEV_ID" ]; then
+	dpllsim_check_module
+	if ! dpllsim_setup_standard_device; then
+		echo "FAIL: cannot create dpllsim device"
+		exit "$ksft_fail"
+	fi
+	CREATED_DEVICE=$DPLLSIM_CREATED_NAME
+	DPLL_DEV_ID=$DPLLSIM_DEV_ID
+	DPLL_MODULE_NAME="dpllsim"
+fi
+
+log_info "testing DPLL device $DPLL_DEV_ID (module $DPLL_MODULE_NAME)"
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
new file mode 100644
index 00000000000000..467527a4343afb
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -0,0 +1,446 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Helpers for DPLL selftests. Provides wrappers around the iproute2 dpll
+# tool and around the dpllsim configfs interface for creating virtual DPLL
+# devices. Sourcing this file only defines functions and variables. A
+# script calls dpll_lib_check_prereqs first, then dpll_lib_lock unless it
+# only reads a device the user named, and dpll_lib_init when it can run
+# against an existing device. net/lib.sh
+# must be sourced first, it provides ksft_skip, ksft_fail, busywait and
+# log_info.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+#
+# shellcheck disable=SC2034,SC2154 # the globals set here are read by the
+# scripts and ksft_skip is defined by net/lib.sh
+
+CONFIGFS_DIR="/sys/kernel/config"
+DPLLSIM_CFG="$CONFIGFS_DIR/dpllsim"
+
+# Next clock-id handed out by dpllsim_alloc_clock_id. The lookups of the
+# dpllsim helpers match on the module name as well, which is what keeps
+# the tests away from the devices of other drivers whatever clock-id
+# those use. The random start only avoids collisions between runs, as
+# the devices are named after their clock-id in configfs.
+DPLLSIM_NEXT_CLOCK_ID=$((96000 + RANDOM))
+
+##############################################################################
+# Prerequisites and device selection
+
+dpll_lib_check_prereqs()
+{
+	if [ "$EUID" -ne 0 ]; then
+		echo "SKIP: must be run as root"
+		exit "$ksft_skip"
+	fi
+
+	local cmd
+	for cmd in jq dpll mountpoint; do
+		if ! command -v "$cmd" &> /dev/null; then
+			echo "SKIP: $cmd not found"
+			exit "$ksft_skip"
+		fi
+	done
+
+	# Every release of the dpll tool prints the help of an object
+	# without connecting to the kernel, main() skips the netlink init
+	# for it. A kernel without DPLL passes here and is a skip once the
+	# device dump of dpll_lib_init fails, see __dpll_lib_dump_failed.
+	if ! dpll device help 2>&1 | grep -q "show"; then
+		echo "SKIP: dpll tool too old, missing 'device show'"
+		exit "$ksft_skip"
+	fi
+}
+
+# The scripts that create dpllsim devices share the one dpllsim directory
+# and cannot run alongside each other, so each takes a lock on
+# DPLL_LOCK_FILE before it mounts or creates anything and skips when
+# another run holds it. The file lives under /run rather than in the
+# world-writable /tmp, where a planted symlink could redirect the open.
+DPLL_RUN_DIR="/run/dpll-selftest"
+DPLL_LOCK_FILE="$DPLL_RUN_DIR/lock"
+DPLL_LOCK_FD=""
+
+# Create DPLL_RUN_DIR private when it is missing and make an existing
+# one private too, whatever the umask, others that can write to it
+# could plant a symlink in place of the lock file. Skip when that fails.
+dpll_lib_run_dir()
+{
+	mkdir -m 0700 "$DPLL_RUN_DIR" 2>/dev/null
+	if ! [ -d "$DPLL_RUN_DIR" ] ||
+	   ! chmod 0700 "$DPLL_RUN_DIR" 2>/dev/null; then
+		echo "SKIP: cannot set up $DPLL_RUN_DIR"
+		exit "$ksft_skip"
+	fi
+}
+
+dpll_lib_lock()
+{
+	if ! command -v flock &> /dev/null; then
+		echo "SKIP: flock not found"
+		exit "$ksft_skip"
+	fi
+	dpll_lib_run_dir
+	# A redirection that fails makes exec return non-zero here, bash
+	# exits the shell for it only in POSIX mode.
+	if ! { exec {DPLL_LOCK_FD}> "$DPLL_LOCK_FILE"; } 2>/dev/null; then
+		echo "SKIP: cannot open $DPLL_LOCK_FILE"
+		exit "$ksft_skip"
+	fi
+	if ! flock -n "$DPLL_LOCK_FD"; then
+		echo "SKIP: another dpll selftest run is in progress"
+		exit "$ksft_skip"
+	fi
+}
+
+# Detect the DPLL device to test. DPLL_DEV_ID may be set by the user to
+# force a specific device. Otherwise DPLL_DRIVER names the driver whose
+# first device is taken, by the module name the device reports, dpllsim
+# standing for a simulated device the script creates, and a system
+# without a device of that driver is a skip. With neither set the first
+# device that is not a dpllsim one is taken, so that an instance of the
+# simulator left behind by an earlier run is not mistaken for hardware.
+# A simulator that is built in reports the module name "kernel", an
+# instance of it is taken like any other device. Sets DPLL_DEV_ID (may
+# end up empty) and DPLL_MODULE_NAME. A device dump that fails must not
+# be taken for a system without a device, see __dpll_lib_dump_failed.
+dpll_lib_init()
+{
+	local out
+
+	DPLL_MODULE_NAME=""
+
+	if [ -n "${DPLL_DEV_ID:-}" ]; then
+		# A device that is there but cannot be queried fails below,
+		# only one missing from the dump is a skip.
+		out=$(dpll device show -j 2>/dev/null) || __dpll_lib_dump_failed
+		if ! jq -e --arg id "$DPLL_DEV_ID" \
+		     'any(.device[]?; (.id | tostring) == $id)' \
+		     <<< "$out" > /dev/null; then
+			echo "SKIP: DPLL device \"$DPLL_DEV_ID\" not found"
+			exit "$ksft_skip"
+		fi
+	elif [ "${DPLL_DRIVER:-}" = "dpllsim" ]; then
+		DPLL_DEV_ID=""
+	elif [ -n "${DPLL_DRIVER:-}" ]; then
+		out=$(dpll device show -j 2>/dev/null) || __dpll_lib_dump_failed
+		DPLL_DEV_ID=$(jq -r --arg mod "$DPLL_DRIVER" '[.device[]? |
+				      select(.["module-name"] == $mod)
+				     ][0].id // empty' <<< "$out")
+		if [ -z "$DPLL_DEV_ID" ]; then
+			echo "SKIP: no DPLL device of driver \"$DPLL_DRIVER\""
+			exit "$ksft_skip"
+		fi
+	else
+		out=$(dpll device show -j 2>/dev/null) || __dpll_lib_dump_failed
+		DPLL_DEV_ID=$(jq -r '[.device[]? |
+				      select(.["module-name"] != "dpllsim")
+				     ][0].id // empty' <<< "$out")
+	fi
+
+	if [ -n "$DPLL_DEV_ID" ] &&
+	   ! DPLL_MODULE_NAME=$(dpll_device_get_module "$DPLL_DEV_ID"); then
+		echo "FAIL: cannot query DPLL device $DPLL_DEV_ID"
+		exit "$ksft_fail"
+	fi
+}
+
+# The device dump failed. The dpll tool reports a kernel without the
+# DPLL netlink family with the same message in every release, such a
+# kernel is a skip. With the family there the failed dump is a failure
+# of what the tests cover, whichever drivers provide the devices. The
+# simulator says nothing about it, other drivers select DPLL as well.
+__dpll_lib_dump_failed()
+{
+	if { dpll device show -j > /dev/null; } 2>&1 |
+	   grep -q "DPLL subsystem not available"; then
+		echo "SKIP: DPLL subsystem not available"
+		exit "$ksft_skip"
+	fi
+	echo "FAIL: cannot dump DPLL devices"
+	exit "$ksft_fail"
+}
+
+##############################################################################
+# Device queries
+#
+# "dpll device show id X -j" prints a flat object, a dump wraps its
+# objects in {"device":[...]}. The helpers normalize with
+# (.device[0]? // .) before extracting fields, so that either shape
+# works. The tool is run first and jq only on what it printed, so that a
+# failed query returns an error instead of the empty output a missing
+# field produces too.
+
+dpll_device_json()
+{
+	local dev_id=$1
+	local out
+
+	out=$(dpll device show id "$dev_id" -j 2>/dev/null) || return 1
+	jq '(.device[0]? // .)' <<< "$out"
+}
+
+__dpll_device_field()
+{
+	local dev_id=$1; shift
+	local out
+
+	out=$(dpll device show id "$dev_id" -j 2>/dev/null) || return 1
+	jq -r "(.device[0]? // .) | $1 // empty" <<< "$out"
+}
+
+dpll_device_get_module()
+{
+	__dpll_device_field "$1" '.["module-name"]'
+}
+
+# Look up the netlink device id by the clock-id chosen at create time,
+# restricted to the devices of the given module when one is named. The
+# clock-id is the only reliable handle on a device the test created, as
+# netlink ids depend on what else exists, and the module name keeps a
+# lookup for a dpllsim device from returning a device of another driver
+# that happens to use the same clock-id. The tool prints the clock-id as
+# a JSON number, which jq may round above 2^53. The clock-ids the tests
+# hand out stay far below that, so the comparison of its string form is
+# exact. Return 1 when the dump itself failed, a caller must not take
+# that for a device that is gone.
+# $1: clock-id, $2: module name (optional)
+dpll_device_get_id_by_clock_id()
+{
+	local clock_id=$1
+	local module=${2:-}
+	local out
+
+	out=$(dpll device show -j 2>/dev/null) || return 1
+	jq -r --arg cid "$clock_id" --arg mod "$module" \
+	   '[.device[]? |
+	     select((.["clock-id"] | tostring) == $cid and
+		    ($mod == "" or .["module-name"] == $mod))
+	    ][0].id // empty' <<< "$out"
+}
+
+# The two checks below fail when the lookup itself failed, so that a
+# failed dump neither counts as a device that is present nor as one
+# that is gone, the wait helpers keep polling instead.
+__dpll_device_present_by_clock_id()
+{
+	local dev_id
+
+	dev_id=$(dpll_device_get_id_by_clock_id "$@") || return 1
+	[ -n "$dev_id" ] && echo "$dev_id"
+}
+
+__dpll_device_absent_by_clock_id()
+{
+	local dev_id
+
+	dev_id=$(dpll_device_get_id_by_clock_id "$@") || return 1
+	[ -z "$dev_id" ]
+}
+
+# Wait until a device with the given clock-id (and module, when given) is
+# visible on netlink and print its netlink id. Callers must check the
+# exit status rather than the output, busywait prints the output of the
+# last failed check when it times out.
+dpll_device_wait_by_clock_id()
+{
+	busywait "$BUSYWAIT_TIMEOUT" __dpll_device_present_by_clock_id "$@"
+}
+
+dpll_device_wait_gone_by_clock_id()
+{
+	busywait "$BUSYWAIT_TIMEOUT" __dpll_device_absent_by_clock_id "$@"
+}
+
+##############################################################################
+# dpllsim configfs interface
+#
+# Each directory under $DPLLSIM_CFG is one simulated device. Writing 1 to
+# <dev>/live registers the device with the DPLL core, writing 0
+# unregisters it. The structure (clock_id) can only be changed while the
+# device is not live.
+#
+# dpllsim_available loads the dpllsim module and mounts configfs when
+# nothing else did. Scripts call dpll_lib_cleanup last from their exit
+# trap to undo the mount, the module stays loaded. The only other trace
+# the library leaves outside the dpllsim directory is DPLL_RUN_DIR with
+# the lock file.
+
+DPLLSIM_MOUNTED_CONFIGFS=0
+# Name of the device dpllsim_create_device created last. Set here, so
+# that a value inherited from the environment is never taken for a
+# device of this run by a cleanup handler.
+DPLLSIM_CREATED_NAME=""
+# The device directories in DPLLSIM_CFG when dpllsim_check_module found
+# the simulator, one per line. It stays unset until then, no script
+# creates a device before. See dpll_lib_cleanup.
+unset DPLLSIM_DEVICES_BEFORE
+
+dpllsim_available()
+{
+	[ -d "$DPLLSIM_CFG" ] && return 0
+
+	modprobe dpllsim &> /dev/null
+	if ! mountpoint -q "$CONFIGFS_DIR"; then
+		# Nothing had configfs mounted, so the cleanup unmounts it
+		# again. Something that starts to use it meanwhile without
+		# mounting it would lose it then, which is accepted, the
+		# tests are not meant to run next to such a user. The mount
+		# is recorded before it is made, so that a cleanup run by a
+		# signal right after it knows about it.
+		DPLLSIM_MOUNTED_CONFIGFS=1
+		mount -t configfs none "$CONFIGFS_DIR" &> /dev/null ||
+			DPLLSIM_MOUNTED_CONFIGFS=0
+	fi
+	[ -d "$DPLLSIM_CFG" ]
+}
+
+# Unmount configfs again when dpllsim_available mounted it. Call after
+# the devices of the script are gone. A dpllsim device the script could
+# not remove keeps the mount, so that what is left can be looked at. A
+# device that was there before the script is not one it left behind.
+dpll_lib_cleanup()
+{
+	local dev_path name
+
+	[ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] || return 0
+	DPLLSIM_MOUNTED_CONFIGFS=0
+	# The mount recorded up front may have failed.
+	mountpoint -q "$CONFIGFS_DIR" || return 0
+
+	for dev_path in "$DPLLSIM_CFG"/*/; do
+		[ -d "$dev_path" ] || continue
+		# Without the record the script created no device, and one in
+		# the record was there before it.
+		[ -n "${DPLLSIM_DEVICES_BEFORE+set}" ] || break
+		grep -qxF -- "$dev_path" <<< "$DPLLSIM_DEVICES_BEFORE" &&
+			continue
+		name=$(basename "$dev_path")
+		log_info "device $name left behind, $CONFIGFS_DIR kept mounted"
+		return
+	done
+	umount "$CONFIGFS_DIR" 2>/dev/null ||
+		log_info "cannot unmount $CONFIGFS_DIR"
+}
+
+# The scripts find the devices of the simulator by the module name they
+# report, which is "kernel" for a driver that is built in, so the tests
+# need dpllsim as a module. Records the devices that are there already in
+# DPLLSIM_DEVICES_BEFORE.
+dpllsim_check_module()
+{
+	if ! dpllsim_available; then
+		echo "SKIP: dpllsim module not available"
+		exit "$ksft_skip"
+	fi
+	DPLLSIM_DEVICES_BEFORE=$(compgen -G "$DPLLSIM_CFG/*/")
+	if ! grep -q '^dpllsim ' /proc/modules 2>/dev/null; then
+		echo "SKIP: dpllsim is built in, the tests need it as a module"
+		exit "$ksft_skip"
+	fi
+}
+
+# $1: device name, $2: clock-id. Sets DPLLSIM_CREATED_NAME before the
+# directory is created, so that the cleanup handler of a script can
+# remove a device whose creation a signal interrupted before the script
+# recorded it. The name stays set once the device is complete, and when
+# the directory of a device that failed half way cannot be removed.
+dpllsim_create_device()
+{
+	local name=$1
+	local clock_id=$2
+	local dev_path="$DPLLSIM_CFG/$name"
+
+	# A directory of that name was left behind by something else and
+	# must never be recorded as a device of this run.
+	[ -e "$dev_path" ] && return 1
+
+	# Record the name before the directory exists, so that a cleanup
+	# run by a signal between the two still finds it.
+	DPLLSIM_CREATED_NAME=$name
+	if ! mkdir "$dev_path" 2>/dev/null; then
+		DPLLSIM_CREATED_NAME=""
+		return 1
+	fi
+	if ! echo "$clock_id" 2>/dev/null > "$dev_path/clock_id"; then
+		rmdir "$dev_path" 2>/dev/null && DPLLSIM_CREATED_NAME=""
+		return 1
+	fi
+}
+
+dpllsim_deploy()
+{
+	echo 1 2>/dev/null > "$DPLLSIM_CFG/$1/live"
+}
+
+dpllsim_undeploy()
+{
+	echo 0 2>/dev/null > "$DPLLSIM_CFG/$1/live"
+}
+
+# Take the device offline and remove it. Every step is attempted even
+# when an earlier one failed, the return value is non-zero when any did.
+# A device that does not exist counts as deleted.
+dpllsim_delete_device()
+{
+	local dev_path="$DPLLSIM_CFG/$1"
+	local ret=0
+
+	[ -d "$dev_path" ] || return 0
+
+	dpllsim_undeploy "$1" || ret=1
+	rmdir "$dev_path" || ret=1
+
+	return "$ret"
+}
+
+# Return 0 when a device in DPLLSIM_CFG, of this run or not, holds the
+# given clock-id or has a directory name that ends with it. The
+# simulator refuses a live instance with a clock-id another live one
+# uses, and the tests name their devices after their clock-id.
+dpllsim_clock_id_taken()
+{
+	local f
+
+	compgen -G "$DPLLSIM_CFG/*$1" > /dev/null && return 0
+	for f in "$DPLLSIM_CFG"/*/clock_id; do
+		[ -f "$f" ] || continue
+		[ "$(cat "$f" 2>/dev/null)" = "$1" ] && return 0
+	done
+	return 1
+}
+
+# Set DPLLSIM_CLOCK_ID to a clock-id unique within this test run that no
+# device in DPLLSIM_CFG takes yet, see dpllsim_clock_id_taken. Must
+# not be called from a subshell, the counter increment would be lost.
+dpllsim_alloc_clock_id()
+{
+	while dpllsim_clock_id_taken "$DPLLSIM_NEXT_CLOCK_ID"; do
+		DPLLSIM_NEXT_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID + 1))
+	done
+	DPLLSIM_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID++))
+}
+
+# Create a device, deploy it and resolve the netlink device id. Sets
+# DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and DPLLSIM_DEV_ID.
+dpllsim_setup_standard_device()
+{
+	local clock_id name
+
+	dpllsim_alloc_clock_id
+	clock_id=$DPLLSIM_CLOCK_ID
+	name="std$clock_id"
+	dpllsim_create_device "$name" "$clock_id" || return 1
+
+	if ! dpllsim_deploy "$name"; then
+		dpllsim_delete_device "$name"
+		return 1
+	fi
+
+	if ! DPLLSIM_DEV_ID=$(dpll_device_wait_by_clock_id "$clock_id" \
+							  dpllsim); then
+		dpllsim_delete_device "$name"
+		return 1
+	fi
+}
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
new file mode 100755
index 00000000000000..2c60ac9faefda4
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -0,0 +1,201 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL subsystem stress test. Uses dpllsim to put the DPLL core under
+# load, the tests below say what each of them exercises.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../net/lib.sh"
+source "$SCRIPTDIR/dpll_lib.sh"
+
+ALL_TESTS="
+	test_rapid_create_delete
+	test_deploy_cycle
+"
+
+STRESS_ITERATIONS=${STRESS_ITERATIONS:-20}
+
+CREATED_DEVICES=()
+
+track_device()
+{
+	CREATED_DEVICES+=("$1")
+}
+
+untrack_device()
+{
+	local name=$1 dev
+	local remaining=()
+
+	for dev in "${CREATED_DEVICES[@]}"; do
+		[ "$dev" = "$name" ] || remaining+=("$dev")
+	done
+	CREATED_DEVICES=("${remaining[@]}")
+}
+
+cleanup()
+{
+	# A second signal must not abort the teardown half way.
+	trap '' INT TERM
+
+	local dev
+
+	for dev in "${CREATED_DEVICES[@]}"; do
+		dpllsim_delete_device "$dev" ||
+			log_info "cannot delete device $dev"
+	done
+	# The device whose creation a signal interrupted is recorded by the
+	# library alone, a double delete of a tracked one is harmless.
+	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
+		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
+			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
+	fi
+	dpll_lib_cleanup
+}
+
+# Create a device named after the given clock-id and deploy it. Sets
+# DPLLSIM_CREATED_NAME. A device that fails half way and cannot be removed
+# is tracked, so that the cleanup handler tries again, the next device
+# takes DPLLSIM_CREATED_NAME over.
+create_stress_device()
+{
+	local clock_id=$1
+	local name="st$clock_id"
+
+	if ! dpllsim_create_device "$name" "$clock_id"; then
+		[ "$DPLLSIM_CREATED_NAME" = "$name" ] && track_device "$name"
+		return 1
+	fi
+
+	if ! dpllsim_deploy "$name"; then
+		dpllsim_delete_device "$name" || track_device "$name"
+		return 1
+	fi
+}
+
+##############################################################################
+
+# Log a skip of the test named $1 and return 1 unless every variable
+# named by the further arguments holds a positive number, a test of zero
+# rounds or devices would pass without testing anything.
+stress_counts_valid()
+{
+	local name=$1 var
+
+	shift
+	for var in "$@"; do
+		[[ "${!var}" =~ ^[1-9][0-9]*$ ]] && continue
+		log_test_skip "$name" "$var is not a positive number"
+		return 1
+	done
+}
+
+test_rapid_create_delete()
+{
+	local i clock_id name
+
+	RET=0
+
+	stress_counts_valid \
+	    "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)" \
+	    STRESS_ITERATIONS || return
+
+	for i in $(seq 1 "$STRESS_ITERATIONS"); do
+		dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
+
+		if ! create_stress_device "$clock_id"; then
+			check_err 1 "failed to create device (iteration $i)"
+			break
+		fi
+		name=$DPLLSIM_CREATED_NAME
+		track_device "$name"
+
+		if ! dpllsim_delete_device "$name"; then
+			check_err 1 "failed to delete device (iteration $i)"
+			break
+		fi
+		untrack_device "$name"
+	done
+
+	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
+}
+
+test_deploy_cycle()
+{
+	local clock_id name i
+
+	RET=0
+
+	stress_counts_valid "DPLL deploy/undeploy cycling" \
+	    STRESS_ITERATIONS || return
+
+	dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
+	name="cycle$clock_id"
+	if ! dpllsim_create_device "$name" "$clock_id"; then
+		# Kept for the cleanup handler when it failed half way and
+		# could not be removed, see create_stress_device.
+		[ "$DPLLSIM_CREATED_NAME" = "$name" ] && track_device "$name"
+		check_err 1 "cannot create device"
+		log_test "DPLL deploy/undeploy cycling"
+		return
+	fi
+	track_device "$name"
+
+	# The live write registers or unregisters the device before it
+	# returns, so a wait passes at its first look and one that times
+	# out ends the loop, the waits cannot add up to more than one
+	# timeout.
+	for i in $(seq 1 "$STRESS_ITERATIONS"); do
+		if ! dpllsim_deploy "$name"; then
+			check_err 1 "deploy failed (iteration $i)"
+			break
+		fi
+		if ! dpll_device_wait_by_clock_id "$clock_id" dpllsim \
+		     > /dev/null; then
+			check_err 1 "device not on netlink (iteration $i)"
+			break
+		fi
+		if ! dpllsim_undeploy "$name"; then
+			check_err 1 "undeploy failed (iteration $i)"
+			break
+		fi
+		if ! dpll_device_wait_gone_by_clock_id "$clock_id" dpllsim; then
+			check_err 1 "device still on netlink (iteration $i)"
+			break
+		fi
+	done
+
+	if dpllsim_delete_device "$name"; then
+		untrack_device "$name"
+	else
+		check_err 1 "cannot delete device $name"
+	fi
+
+	log_test "DPLL deploy/undeploy cycling"
+}
+
+##############################################################################
+
+dpll_lib_check_prereqs
+# Another run would find the devices of this one left behind, see the
+# lock in the library.
+dpll_lib_lock
+
+# The module check may mount configfs, so the exit trap that unmounts it
+# again has to be in place before. INT and TERM run the cleanup as well,
+# so that a timeout imposed by the harness still removes the devices, and
+# ignore any further signal, an exit inside the cleanup would end the
+# teardown half way. Their handler drops the exit trap and calls the
+# cleanup itself, a signal that comes while the script exits is handled
+# before the exit trap gets to the cleanup, and the exit of the handler
+# would end the exit trap there.
+trap cleanup EXIT
+trap 'trap "" INT TERM; trap - EXIT; cleanup; exit 1' INT TERM
+dpllsim_check_module
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/dpll/settings b/tools/testing/selftests/drivers/dpll/settings
new file mode 100644
index 00000000000000..a62d2fa1275c6b
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/settings
@@ -0,0 +1 @@
+timeout=600
-- 
2.56.1

