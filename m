Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698839;
	b=r2ud5ZOqDpH6danfMgHEbnhNnVgge5u5G1j7S+n36IVFRUq+LzqPuZ89D2d2Um6vB/10
	 Y0hW+1f+VQ7HOwAbx0G0533gdQOjOY2UCXSy91/QS1ScaXJ0hu/oohdbY/EYJ6eyfKsd1
	 FSCAt6HiBgTBSSLD5TvsYMExZRw0XsEfSOn2KG01kBSJjbb5ccuQ5crqz2CqfdlOW9n/W
	 jwwzyqGfXYvBtOk1/fsDKKr5RASUKw6Kgo57HVeMP/wAUVs8cUPMDIdaXSe8CNgVceNXW
	 OgAhnvELUUon81EnemEPpNhB9la7fb1+EHhgCKBIu6yEuAqYsvjjSkk1mcqUhBRMn+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698839;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=yvTcIHfFbGc9fbiJKgSiI/eoSYNNk3yXAXe9yrI3DJ8=;
	b=nVJR26D2Dw2+8cX6ugoep5+n71EQi+R5Ys4ZXcv5r1ggqH8+uo4zgN7fR73lIY4EgAk6
	 0ePmwfEFSqIyMzFj0GenPwe29Dj5Oo97mP/1h4i+X+dYjWdPKNVeiBt1+LPTqwm1KvV2Q
	 gvNofvH8eT+F3KlSgb1XlZJfugiUP0D4g9vO7osvrFABoT2ESFpWRFf7piDV/KNoonUnV
	 yds2g7I2U/XU5WbVuCjjNZL86UiMaW7EzTveIjEIQxE/1dpWogKbRiVZ7CyWaZ2KOboSW
	 BmgT1Eoif/MNh8M/z8cv7AMaITn6b8l/fiffDwqU/n1uCoyZEkgBTyo+Gdibt63q0rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MB5MC+NX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7860A606D83E
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7860A606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MB5MC+NX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvTcIHfFbGc9fbiJKgSiI/eoSYNNk3yXAXe9yrI3DJ8=;
	b=MB5MC+NXpng4+6BwycnBoN5vauyKLbSV90cH85ehHLnR/uGuXyT8hxYTbUlFozQ5rVFHQa
	vGMYK3lb+g7ius+/Giv7QKo4RLtohaKm8H2SFprjib+wryqV7ohj5OpkL5umg2kTMYwlcL
	cx85J4hT/Hki9Yo4ADVzWg1C4/ZTSxo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-6CEDMx-0PAic4unlimosDQ-1; Tue,
 03 Nov 2026 04:40:34 -0500
X-MC-Unique: 6CEDMx-0PAic4unlimosDQ-1
X-Mimecast-MFC-AGG-ID: 6CEDMx-0PAic4unlimosDQ_1793698832
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A24F180075A;
	Tue,  3 Nov 2026 09:40:32 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C597F26C;
	Tue,  3 Nov 2026 09:40:28 +0000 (UTC)
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
Subject: [PATCH net-next 13/14] selftests: dpll: add concurrency stress tests
Date: Tue,  3 Nov 2026 10:39:09 +0100
Message-ID: <20261103093910.596225-14-poros@redhat.com>
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>
References: <20261103093910.596225-1-poros@redhat.com>
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

Extend the stress script with tests that register and unregister
devices from several processes at once and that keep a number of
devices with many pins live at the same time, checking that every one
of them is visible on netlink.

The workers run in subshells, so the parent cannot track the device a
worker has in flight. Each worker removes it from its own exit trap
instead, and the parent reserves a range of clock IDs for every worker,
so that the devices of a worker cannot collide with those of another
worker or of the parent and whatever a killed worker left behind can
be removed by name, at the end of the test and from the cleanup
handler. The handler stops the recorded workers together with the jobs
of the shell, gives them a few seconds to run their exit traps before
forcing the survivors, and goes on without a worker that does not die,
since one stuck in the kernel would hang the teardown. Deleting a
device treats a part of it that is gone by the time its step runs as
removed, so that a removal running concurrently with the one of a
worker does not turn into a spurious failure. The workers inherit the
open lock file of the library, so the lock is held until the script
and every worker have exited.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 .../selftests/drivers/net/dpll/dpll_stress.sh | 219 +++++++++++++++++-
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  |  30 ++-
 2 files changed, 241 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
index 60e42107c67efe..6742bfc71832d4 100755
--- a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
@@ -15,13 +15,24 @@ source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
 
 ALL_TESTS="
 	test_rapid_create_delete
+	test_concurrent_workers
 	test_pin_state_flooding
+	test_max_devices
 	test_deploy_cycle
 "
 
 STRESS_ITERATIONS=${STRESS_ITERATIONS:-20}
+STRESS_DEVICES=${STRESS_DEVICES:-5}
+# The simulator accepts up to 128 pins per device (DPLLSIM_MAX_PINS)
+STRESS_PINS_PER_DEVICE=${STRESS_PINS_PER_DEVICE:-10}
+STRESS_CONCURRENT_PROCS=${STRESS_CONCURRENT_PROCS:-4}
+STRESS_WORKER_ITERATIONS=${STRESS_WORKER_ITERATIONS:-10}
 
 CREATED_DEVICES=()
+BACKGROUND_PIDS=()
+# Base clock-ids of the workers in flight, their devices are named
+# st<base + iteration>
+WORKER_BASES=()
 
 track_device()
 {
@@ -39,18 +50,103 @@ untrack_device()
 	CREATED_DEVICES=("${remaining[@]}")
 }
 
+# Remove whatever a worker started from the given base clock-id left
+# behind, which is the device in flight when the worker had to be killed.
+# A device that does not exist counts as deleted.
+delete_worker_devices()
+{
+	local base=$1
+	local i name
+
+	for i in $(seq 1 "$STRESS_WORKER_ITERATIONS"); do
+		name="st$((base + i))"
+		dpllsim_delete_device "$name" ||
+			log_info "cannot delete device $name"
+	done
+}
+
+# Return 0 while the process still runs. A process that has exited but
+# has not been reaped yet is a zombie, state Z in /proc/<pid>/stat, and
+# counts as gone, or a wait on it would spin until the forced kill.
+pid_running()
+{
+	local stat
+
+	kill -0 "$1" 2>/dev/null || return 1
+	# The state follows the parenthesized command name, which may
+	# contain spaces and parentheses. The ".*" is greedy, so the
+	# expression strips everything up to the last ") " of the line, and
+	# a ")" inside the name is harmless.
+	stat=$(sed 's/^.*) //' "/proc/$1/stat" 2>/dev/null) || return 1
+	[ "${stat%% *}" != "Z" ]
+}
+
+# Return 0 once none of the given processes runs any more, 1 when some
+# still does after about five seconds.
+pids_gone()
+{
+	local i pid alive
+
+	for i in $(seq 1 50); do
+		alive=0
+		for pid in "$@"; do
+			pid_running "$pid" && alive=1
+		done
+		[ "$alive" -eq 0 ] && return 0
+		sleep 0.1
+	done
+	return 1
+}
+
 cleanup()
 {
-	local dev
+	local pid dev base
+	local pids=() shell_jobs=()
 
 	# A second signal must not abort the teardown half way.
 	trap '' INT TERM
 
+	# A worker forked right before the signal arrived may not be
+	# recorded yet, so the jobs of the shell are taken as well. The
+	# jobs builtin reports them from a subshell only when it is the
+	# whole command of that subshell.
+	mapfile -t shell_jobs < <(jobs -p)
+	mapfile -t pids < <(printf '%s\n' "${BACKGROUND_PIDS[@]}" \
+				   "${shell_jobs[@]}" | grep . | sort -u)
+	for pid in "${pids[@]}"; do
+		kill "$pid" 2>/dev/null
+	done
+	# Give the workers a few seconds to run their exit traps, then
+	# force the survivors and give those a few seconds to die. The
+	# kernel cannot recycle the pid of a child until it is reaped,
+	# which the wait below does, so the forced kill cannot hit a
+	# process that reused one. A worker stuck in the kernel does not
+	# die of the forced kill before whatever it waits for returns, so
+	# only the workers that are gone are waited for, which reaps them,
+	# and the teardown goes on without the rest. The removal of what
+	# such a worker left behind can then fail or race with it, which
+	# is logged like any other failed removal.
+	pids_gone "${pids[@]}"
+	for pid in "${pids[@]}"; do
+		kill -KILL "$pid" 2>/dev/null
+	done
+	pids_gone "${pids[@]}"
+	for pid in "${pids[@]}"; do
+		if pid_running "$pid"; then
+			log_info "worker $pid did not exit, giving up"
+		else
+			wait "$pid" 2>/dev/null
+		fi
+	done
+
 	defer_scopes_cleanup
 	for dev in "${CREATED_DEVICES[@]}"; do
 		dpllsim_delete_device "$dev" ||
 			log_info "cannot delete device $dev"
 	done
+	for base in "${WORKER_BASES[@]}"; do
+		delete_worker_devices "$base"
+	done
 	# The device whose creation a signal interrupted is recorded by the
 	# library alone, a double delete of a tracked one is harmless.
 	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
@@ -138,6 +234,83 @@ test_rapid_create_delete()
 	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
 }
 
+# The exit trap of a worker. The worker runs in a subshell, so
+# track_device() cannot reach CREATED_DEVICES of the parent. Remove the
+# device in flight from the exit trap instead, or killing the worker
+# leaks it. The trap saves the exit status first, so that the removal
+# cannot mask a failed iteration, and drops the traps, since bash runs
+# the EXIT trap again when a signal handler exits.
+worker_exit()
+{
+	local status=$?
+
+	trap - EXIT TERM INT
+	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
+		dpllsim_delete_device "$DPLLSIM_CREATED_NAME"
+		DPLLSIM_CREATED_NAME=""
+	fi
+	exit "$status"
+}
+
+# Create and delete STRESS_WORKER_ITERATIONS devices with clock-ids
+# following the given base, in a subshell. Each worker derives its own
+# unique clock-ids from a range reserved for it, so its devices can never
+# be confused with those of another worker or of the parent. The parent
+# records the base of every worker, so that the device a killed worker
+# left behind can be removed by name.
+concurrent_worker()
+{
+	# The workers inherit the state of the generator from the parent
+	# and would draw the same pin layouts, so reseed it with the pid of
+	# the subshell first.
+	RANDOM=$BASHPID
+	local base=$1
+	local i name failed=0
+
+	trap worker_exit EXIT TERM INT
+
+	for i in $(seq 1 "$STRESS_WORKER_ITERATIONS"); do
+		if ! create_stress_device $((base + i)) 3; then
+			failed=$((failed + 1))
+			continue
+		fi
+		name=$DPLLSIM_CREATED_NAME
+		dpllsim_delete_device "$name" ||
+			failed=$((failed + 1))
+	done
+
+	[ "$failed" -eq 0 ]
+}
+
+test_concurrent_workers()
+{
+	local pid base failed=0
+
+	RET=0
+
+	for _ in $(seq 1 "$STRESS_CONCURRENT_PROCS"); do
+		dpllsim_alloc_clock_id_range $((STRESS_WORKER_ITERATIONS + 1))
+		base=$DPLLSIM_CLOCK_ID
+		WORKER_BASES+=("$base")
+		concurrent_worker "$base" &
+		BACKGROUND_PIDS+=($!)
+	done
+
+	for pid in "${BACKGROUND_PIDS[@]}"; do
+		wait "$pid" || failed=1
+	done
+	BACKGROUND_PIDS=()
+
+	check_err $failed "some concurrent workers failed"
+
+	for base in "${WORKER_BASES[@]}"; do
+		delete_worker_devices "$base"
+	done
+	WORKER_BASES=()
+
+	log_test "DPLL concurrent workers ($STRESS_CONCURRENT_PROCS processes)"
+}
+
 test_pin_state_flooding()
 {
 	local clock_id name dev_id pin_id i last state fails=0
@@ -193,6 +366,50 @@ test_pin_state_flooding()
 	log_test "DPLL pin state flooding"
 }
 
+test_max_devices()
+{
+	local i clock_id created=0 visible
+	local test_devs=() clock_ids=()
+
+	RET=0
+
+	for i in $(seq 1 "$STRESS_DEVICES"); do
+		dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
+		create_stress_device "$clock_id" \
+				     "$STRESS_PINS_PER_DEVICE" || break
+		track_device "$DPLLSIM_CREATED_NAME"
+		test_devs+=("$DPLLSIM_CREATED_NAME")
+		clock_ids+=("$clock_id")
+		created=$((created + 1))
+	done
+
+	if [ "$created" -lt "$STRESS_DEVICES" ]; then
+		check_err 1 "created only $created of $STRESS_DEVICES devices"
+	fi
+
+	# Every created device must be visible on netlink.
+	visible=0
+	for clock_id in "${clock_ids[@]}"; do
+		if dpll_device_wait_by_clock_id "$clock_id" dpllsim \
+		   > /dev/null; then
+			visible=$((visible + 1))
+		fi
+	done
+	if [ "$visible" -ne "$created" ]; then
+		check_err 1 "only $visible of $created devices visible"
+	fi
+
+	for i in "${test_devs[@]}"; do
+		if dpllsim_delete_device "$i"; then
+			untrack_device "$i"
+		else
+			check_err 1 "cannot delete device $i"
+		fi
+	done
+
+	log_test "DPLL maximum devices ($STRESS_DEVICES devices)"
+}
+
 test_deploy_cycle()
 {
 	local clock_id name i
diff --git a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
index a968f780393d75..12823048cbbce2 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -51,8 +51,10 @@ dpll_lib_check_prereqs()
 # The scripts that create dpllsim devices share the one dpllsim directory
 # and cannot run alongside each other, so each takes a lock on
 # DPLL_LOCK_FILE before it mounts or creates anything and skips when
-# another run holds it. The file lives under /run rather than in the
-# world-writable /tmp, where a planted symlink could redirect the open.
+# another run holds it. The workers a script forks inherit the open file
+# and keep the lock until they exit. The file lives under /run rather
+# than in the world-writable /tmp, where a planted symlink could
+# redirect the open.
 DPLL_RUN_DIR="/run/dpll-selftest"
 DPLL_LOCK_FILE="$DPLL_RUN_DIR/lock"
 DPLL_LOCK_FD=""
@@ -542,8 +544,12 @@ dpllsim_undeploy()
 
 # Take the device offline and remove it together with all its pins.
 # Every step is attempted even when an earlier one failed, the return
-# value is non-zero when any did. A device that does not exist counts as
-# deleted.
+# value is non-zero when any did. A device that does not exist counts
+# as deleted, and so does a part of it that is gone by the time its
+# step runs, the live file of the undeploy and the pin or device
+# directory of an rmdir, so that a removal running concurrently, or an
+# earlier one whose later steps failed, does not turn into a spurious
+# failure here.
 dpllsim_delete_device()
 {
 	local dev_path="$DPLLSIM_CFG/$1"
@@ -551,12 +557,12 @@ dpllsim_delete_device()
 
 	[ -d "$dev_path" ] || return 0
 
-	dpllsim_undeploy "$1" || ret=1
+	dpllsim_undeploy "$1" || [ ! -e "$dev_path/live" ] || ret=1
 	for pin_path in "$dev_path"/pins/*/; do
 		[ -d "$pin_path" ] || continue
-		rmdir "$pin_path" || ret=1
+		rmdir "$pin_path" || [ ! -d "$pin_path" ] || ret=1
 	done
-	rmdir "$dev_path" || ret=1
+	rmdir "$dev_path" || [ ! -d "$dev_path" ] || ret=1
 
 	return $ret
 }
@@ -569,6 +575,16 @@ dpllsim_alloc_clock_id()
 	DPLLSIM_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID++))
 }
 
+# Set DPLLSIM_CLOCK_ID to the first of $1 consecutive clock-ids unique
+# within this test run and move the allocator past them, for a worker
+# that derives the clock-ids of its devices from it. A device the parent
+# creates afterwards cannot collide with one of the worker.
+dpllsim_alloc_clock_id_range()
+{
+	DPLLSIM_CLOCK_ID=$DPLLSIM_NEXT_CLOCK_ID
+	DPLLSIM_NEXT_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID + $1))
+}
+
 # Create a device with the standard 3-pin layout, deploy it and resolve
 # the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
 # DPLLSIM_DEV_ID.
-- 
2.56.0

