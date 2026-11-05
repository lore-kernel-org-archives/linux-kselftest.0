Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891960;
	b=kduTpTIUppo4VHNJEEauhsjNHkNJQYmttZj0N6PgMN6+vzj+XNEZKbNjkUzkbKYwhBbz
	 GaYKPrHJuAGiWcLR2n7zS7D+cBHc/QtH45gEdAPKwF7bP7HohvXqCsBzYetfgy5sLqBhb
	 EqTWZROHSOb8S+h8zH4Dbt4o/50pI4r/Jzm6AIqKnLBf8J4nCSEYKQOc9xZdBgcHIDu24
	 O+2IB207X3FnP9bOOQEZXmOrGpgqo5rnLi3XUAWRqNJV8xcLkQOm73DgFgY5ArQd8xMEX
	 GvDXlEqrbXmENypdM2JcxIA3+EdJEFLhs26L2ZnZ/+6ptuNYQLjiokq8UpwX69vST0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891960;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Jd8s614DPs2rz60nnaKlPOi9rlTbba7oykSyjoeRH4M=;
	b=n5kY7K4ZcsPcuQxqXlKjmdC5Ps+aWqZnhjH1LES6zTX7uQIVFWzNhb4+HWs0vdPnMuaa
	 jvF4h8yWlIqf98q/zNEJOwO3rZQXldVmT6rYxeuVVjsJy82TABr7K6//BIwfXiCocL4h2
	 w9Kv0aZl1Bw/xhWNBQuWbKLrsDfx/XbfdAPSx6qGfeWopb8BeQECoS8m6DmaX5B6CetCV
	 pVnix6Qx3hGirnKgws1QbUnPxvmi641YhJQw4kEEX43pDI9Vg5QDww5+0KqMNGMDh5U8J
	 qPKYTS9nyOD23KzFfMCzNMvMtxcdU8FtD2jJ/qzvrdh7dkbV+MYM4KZ2FQxVeECO5RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VC7A0+8C;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3D9606A333
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3D9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VC7A0+8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jd8s614DPs2rz60nnaKlPOi9rlTbba7oykSyjoeRH4M=;
	b=VC7A0+8C0zv3ERfqx+bRGyo4E1h6IysCG6jhGbcLSWrXE24qgI6/zq5ujm7QjPQnC0Eid4
	bqa5c2JeWqbNf0rgchmofRF5ja7HeVTSwNKwjw3OHQD4Xz7WgPR9+vGP7FSg0BIhTaO/y8
	BvQnYXtIO0v3EjzXDlfokMuMChkANkQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-gAvus_6ON-y1jgNbg_SK-Q-1; Thu,
 05 Nov 2026 10:19:17 -0500
X-MC-Unique: gAvus_6ON-y1jgNbg_SK-Q-1
X-Mimecast-MFC-AGG-ID: gAvus_6ON-y1jgNbg_SK-Q_1793891953
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B42F4180063B;
	Thu,  5 Nov 2026 15:19:13 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EFF441956089;
	Thu,  5 Nov 2026 15:19:07 +0000 (UTC)
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
Subject: [PATCH net-next v2 02/14] selftests: dpll: add test library and device lifecycle tests
Date: Thu,  5 Nov 2026 16:18:40 +0100
Message-ID: <20261105151852.1844305-3-poros@redhat.com>
In-Reply-To: <20261105151852.1844305-1-poros@redhat.com>
References: <20261105151852.1844305-1-poros@redhat.com>
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
chosen at creation time, since netlink ids depend on what else exists
on the system, and the dpllsim helpers restrict the lookup to their
module, so that a device of another driver with the same clock ID is
never picked up. Every query runs the tool first and jq on what it
printed, so that a failed query is told apart from a missing attribute.
The library mounts configfs when nothing else did, and the exit trap of
each script undoes that, removes the devices the script created and
runs on INT and TERM as well, so that a timeout imposed by the harness
still cleans up.

Two runs of scripts that create dpllsim devices would share the one
dpllsim directory and could draw the same clock IDs, so every such
script takes a lock before it mounts or creates anything and skips when
another run holds it. The lock file lives under /run rather than in
/tmp, since the scripts run as root and open the file for writing, and
a symlink planted in the world-writable /tmp would redirect that open.

dpll_basic.sh checks that a device reports the mandatory attributes
over netlink. It runs against the device named by DPLL_DEV_ID or the
first device that is not a dpllsim one, and creates a dpllsim device
when there is none, so the same script serves the simulator and real
drivers. dpll_stress.sh is simulator only and exercises the lifecycle
paths of the core by creating and deleting devices in a loop and by
cycling one device through repeated register and unregister
transitions. The dpllsim MAINTAINERS entry covers the new directory
and the shared library.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v2:
- sort the config file alphabetically (netdev CI check_selftest)
- quote the ksft_skip and ret expansions and add shellcheck directives
  for the globals read by the scripts, for ksft_skip, which comes from
  net/lib.sh, and for the optional argument of
  dpllsim_setup_standard_device() (netdev CI shellcheck)

v1: https://lore.kernel.org/all/20261103093910.596225-3-poros@redhat.com/
---
 MAINTAINERS                                   |   2 +
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/drivers/net/dpll/Makefile       |  14 +
 .../testing/selftests/drivers/net/dpll/config |   3 +
 .../selftests/drivers/net/dpll/dpll_basic.sh  |  93 +++++
 .../selftests/drivers/net/dpll/dpll_stress.sh | 164 +++++++++
 .../selftests/drivers/net/dpll/settings       |   1 +
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  | 334 ++++++++++++++++++
 8 files changed, 612 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/dpll/Makefile
 create mode 100644 tools/testing/selftests/drivers/net/dpll/config
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_basic.sh
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
 create mode 100644 tools/testing/selftests/drivers/net/dpll/settings
 create mode 100644 tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 147a5466902bc7..d4e0a7e97d3808 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8076,6 +8076,8 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/driver-api/dpllsim.rst
 F:	drivers/dpll/dpllsim/
+F:	tools/testing/selftests/drivers/net/dpll/
+F:	tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
 
 DPLL SUBSYSTEM
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 6c77beba0956ef..d8991f43c70e46 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -24,6 +24,7 @@ TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
 TARGETS += drivers/net/bonding
+TARGETS += drivers/net/dpll
 TARGETS += drivers/net/netconsole
 TARGETS += drivers/net/team
 TARGETS += drivers/net/virtio_net
diff --git a/tools/testing/selftests/drivers/net/dpll/Makefile b/tools/testing/selftests/drivers/net/dpll/Makefile
new file mode 100644
index 00000000000000..7752fb518b6e9b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_INCLUDES := \
+	$(wildcard ../../../net/lib/sh/*.sh) \
+	../lib/sh/dpll_lib.sh \
+	../../../net/lib.sh \
+# end of TEST_INCLUDES
+
+TEST_PROGS := \
+	dpll_basic.sh \
+	dpll_stress.sh \
+# end of TEST_PROGS
+
+include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/net/dpll/config b/tools/testing/selftests/drivers/net/dpll/config
new file mode 100644
index 00000000000000..e2c90b6970bd43
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/config
@@ -0,0 +1,3 @@
+CONFIG_CONFIGFS_FS=y
+CONFIG_DPLL=y
+CONFIG_DPLLSIM=m
diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_basic.sh b/tools/testing/selftests/drivers/net/dpll/dpll_basic.sh
new file mode 100755
index 00000000000000..0d823fbc943a84
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_basic.sh
@@ -0,0 +1,93 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Basic DPLL subsystem test. Read-only validation of the device properties
+# exposed over netlink. Runs against a hardware DPLL device when one is
+# present (or when DPLL_DEV_ID is set), otherwise against a freshly
+# created dpllsim device.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../../net/lib.sh"
+source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
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
+# lock in the library.
+dpll_lib_lock
+dpll_lib_init
+
+CREATED_DEVICE=""
+# The module check may mount configfs, so the exit trap that unmounts it
+# again has to be in place before. INT and TERM exit through it as well,
+# so that a timeout imposed by the harness still removes the device.
+trap cleanup EXIT
+trap 'exit 1' INT TERM
+
+if [ -z "$DPLL_DEV_ID" ]; then
+	dpllsim_check_module
+	if ! dpllsim_setup_standard_device; then
+		echo "SKIP: cannot create dpllsim device"
+		exit "$ksft_skip"
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
diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
new file mode 100755
index 00000000000000..74bb6e8b3a8ed4
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
@@ -0,0 +1,164 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL subsystem stress test. Uses dpllsim to exercise rapid device
+# registration/unregistration, concurrent operations from multiple
+# processes, pin state change flooding and notification load, then
+# verifies via ref_tracker that no references leaked.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../../net/lib.sh"
+source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
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
+	local dev
+
+	# A second signal must not abort the teardown half way.
+	trap '' INT TERM
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
+# DPLLSIM_CREATED_NAME.
+create_stress_device()
+{
+	local clock_id=$1
+	local name="st$clock_id"
+
+	dpllsim_create_device "$name" "$clock_id" || return 1
+
+	if ! dpllsim_deploy "$name"; then
+		dpllsim_delete_device "$name"
+		return 1
+	fi
+}
+
+##############################################################################
+
+test_rapid_create_delete()
+{
+	local i clock_id name
+
+	RET=0
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
+	dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
+	name="cycle$clock_id"
+	if ! dpllsim_create_device "$name" "$clock_id"; then
+		check_err 1 "cannot create device"
+		log_test "DPLL deploy/undeploy cycling"
+		return
+	fi
+	track_device "$name"
+
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
+# again has to be in place before. INT and TERM exit through it as well,
+# so that a timeout imposed by the harness still removes the devices.
+trap cleanup EXIT
+trap 'exit 1' INT TERM
+dpllsim_check_module
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/net/dpll/settings b/tools/testing/selftests/drivers/net/dpll/settings
new file mode 100644
index 00000000000000..a62d2fa1275c6b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/settings
@@ -0,0 +1 @@
+timeout=600
diff --git a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
new file mode 100644
index 00000000000000..fc81f149d1d0b7
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -0,0 +1,334 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Helpers for DPLL selftests. Provides wrappers around the iproute2 dpll
+# tool and around the dpllsim configfs interface for creating virtual DPLL
+# devices. Sourcing this file has no side effects; call
+# dpll_lib_check_prereqs and dpll_lib_init explicitly. net/lib.sh must be
+# sourced first, it provides ksft_skip, busywait and log_info.
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
+	for cmd in jq dpll; do
+		if ! command -v "$cmd" &> /dev/null; then
+			echo "SKIP: $cmd not found"
+			exit "$ksft_skip"
+		fi
+	done
+
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
+# Create DPLL_RUN_DIR when it is missing, skip when that fails.
+dpll_lib_run_dir()
+{
+	mkdir -p "$DPLL_RUN_DIR" 2>/dev/null
+	if ! [ -d "$DPLL_RUN_DIR" ]; then
+		echo "SKIP: cannot create $DPLL_RUN_DIR"
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
+# force a specific device; an empty value means auto-detect, which takes
+# the first device that is not a dpllsim one, so that an instance of the
+# simulator left behind by an earlier run is not mistaken for hardware.
+# Sets DPLL_DEV_ID (may end up empty) and DPLL_MODULE_NAME.
+dpll_lib_init()
+{
+	DPLL_MODULE_NAME=""
+
+	if [ -n "${DPLL_DEV_ID:-}" ]; then
+		if ! dpll device show id "$DPLL_DEV_ID" &> /dev/null; then
+			echo "SKIP: DPLL device \"$DPLL_DEV_ID\" not found"
+			exit "$ksft_skip"
+		fi
+	else
+		DPLL_DEV_ID=$(dpll device show -j 2>/dev/null | \
+			      jq -r '[.device[]? |
+				      select(.["module-name"] != "dpllsim")
+				     ][0].id // empty')
+	fi
+
+	if [ -n "$DPLL_DEV_ID" ]; then
+		DPLL_MODULE_NAME=$(dpll_device_get_module "$DPLL_DEV_ID")
+	fi
+}
+
+##############################################################################
+# Device queries
+#
+# "dpll device show id X -j" may print either a flat object or a dump-style
+# {"device":[...]} wrapper depending on the iproute2 version, so normalize
+# with (.device[0]? // .) before extracting fields. The tool is run first
+# and jq only on what it printed, so that a failed query returns its
+# status instead of the empty output a missing field produces too.
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
+# that happens to use the same clock-id. The clock-id is compared as a
+# string, so that it does not matter whether the tool prints it as a
+# JSON number or as a string. Return 1 when the dump itself failed, a
+# caller must not take that for a device that is gone.
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
+# dpllsim_available mounts configfs when nothing else did, which is the
+# one side effect the library has outside the dpllsim directory. Scripts
+# call dpll_lib_cleanup last from their exit trap to undo it.
+
+DPLLSIM_MOUNTED_CONFIGFS=0
+
+dpllsim_available()
+{
+	[ -d "$DPLLSIM_CFG" ] && return 0
+
+	modprobe dpllsim &> /dev/null
+	if ! mountpoint -q "$CONFIGFS_DIR"; then
+		mount -t configfs none "$CONFIGFS_DIR" &> /dev/null &&
+			DPLLSIM_MOUNTED_CONFIGFS=1
+	fi
+	[ -d "$DPLLSIM_CFG" ]
+}
+
+# Unmount configfs again when dpllsim_available mounted it. Call after
+# the devices of the script are gone. A dpllsim device the script could
+# not remove keeps the mount, so that what is left can be looked at.
+dpll_lib_cleanup()
+{
+	local dev_path name
+
+	[ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] || return 0
+	DPLLSIM_MOUNTED_CONFIGFS=0
+
+	for dev_path in "$DPLLSIM_CFG"/*/; do
+		[ -d "$dev_path" ] || continue
+		name=$(basename "$dev_path")
+		log_info "device $name left behind, $CONFIGFS_DIR kept mounted"
+		return
+	done
+	umount "$CONFIGFS_DIR" 2>/dev/null ||
+		log_info "cannot unmount $CONFIGFS_DIR"
+}
+
+dpllsim_check_module()
+{
+	if ! dpllsim_available; then
+		echo "SKIP: dpllsim module not available"
+		exit "$ksft_skip"
+	fi
+}
+
+# $1: device name, $2: clock-id. Sets DPLLSIM_CREATED_NAME as soon as the
+# directory exists, so that the cleanup handler of a script can remove a
+# device whose creation a signal interrupted before the script recorded
+# it. The name stays set once the device is complete.
+dpllsim_create_device()
+{
+	local name=$1
+	local clock_id=$2
+	local dev_path="$DPLLSIM_CFG/$name"
+
+	# Record the name before the directory exists, so that a cleanup
+	# run by a signal between the two still finds it.
+	DPLLSIM_CREATED_NAME=$name
+	if ! mkdir "$dev_path" 2>/dev/null; then
+		DPLLSIM_CREATED_NAME=""
+		return 1
+	fi
+	if ! echo "$clock_id" 2>/dev/null > "$dev_path/clock_id"; then
+		rmdir "$dev_path" 2>/dev/null
+		DPLLSIM_CREATED_NAME=""
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
+# Set DPLLSIM_CLOCK_ID to a clock-id unique within this test run. Must
+# not be called from a subshell (the counter increment would be lost);
+# derive per-worker id ranges in the parent instead.
+dpllsim_alloc_clock_id()
+{
+	DPLLSIM_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID++))
+}
+
+# Create a device, deploy it and resolve the netlink device id. Sets
+# DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and DPLLSIM_DEV_ID.
+# shellcheck disable=SC2120 # the argument is optional
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
-- 
2.56.0

