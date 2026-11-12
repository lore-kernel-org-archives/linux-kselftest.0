Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488725;
	b=FxtZq+ieGIi41js1O0ns7LThjR2MkDJPgviuCv+1FcebN/V+97D40TMrsODdI0bb3Ral
	 NFoETuJEdXgaDU4ysQ0ozoSmNHYzVKKAJde+Y9wguGWq1VD0i1Ym09zWWIL1Zzu+Owz4I
	 ExmkEnV5FBYpLxrmY59Jfr/Bqx1UNPeQPNIDzXHc5yN7f5sHP1jkvE3bBn4/6yjGV7/jk
	 35+LFF7wNixHWcuqCZkoWfvzMZ08Raq3IIGLTqWa6fjHnUKlSZp9nSxEacMLuC+tlUjxG
	 uLLc0jeVThmBvgVa/t1DBRrMqX/1ivbvWCB79l4ENDW586t6Y9OJHWbEEn7z5dcAsmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488725;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=yijBSnqPwae2vG5mhhORqjbMhYAf/94QM5QU+HQV9YY=;
	b=jTW7Wfn2nHhGxjdkQ+T5mXAHnXRqTjDgjvsRbbLDAFwDPtGzNScikiYIqpqC0RdWmUCH
	 9MbQDrz3zFwz6k6sz+6oSbgW2erh3fx6S1AdqsMkT/5/++DcNQO0IdrF5kPIcpU7dTUh6
	 vIS0d/CD6ZA5S1v5wivS9sRyAb2S3HPsn/NZ4GQWU5nA+NKp7XRikX6rjccVWjwsOtcAF
	 /Q5ApbOlNZIoADblkn5YVRmTwUkX7pli6+SYOtsQMYm9/vPp/MYZorE6RmuWoJr8r2Ksk
	 kJAr3FT2GwUiUzqmS+O3BOIVPrLy8vuzmRdn5T2pyqfVB/RRvu7dRGbSTbTmmwhrZww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1cCRXHo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70488606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70488606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1cCRXHo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yijBSnqPwae2vG5mhhORqjbMhYAf/94QM5QU+HQV9YY=;
	b=U1cCRXHoC7YZc4l4N2BJ+8dsgH6EYMbbwt54tDaO7wiTgZ2Cnx5rAsFYxC6MV5Ih4pNRus
	mmhtH4zNDwoVVOWO8l/Cl0sXQVH8+5OyQtSxuO7d7w9joOAHbQM14lH11CjTVKHSRB1qYl
	b16VfpfcLrnOClGSQgttY11pZCrachM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-zwfH77COMNWwvVSBEEOGQQ-1; Thu,
 12 Nov 2026 08:05:20 -0500
X-MC-Unique: zwfH77COMNWwvVSBEEOGQQ-1
X-Mimecast-MFC-AGG-ID: zwfH77COMNWwvVSBEEOGQQ_1794488718
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF098195399E;
	Thu, 12 Nov 2026 13:05:17 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D31B31956087;
	Thu, 12 Nov 2026 13:05:12 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@nvidia.com>,
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
Subject: [PATCH net-next v4 13/14] selftests: dpll: add concurrency stress tests
Date: Thu, 12 Nov 2026 14:03:58 +0100
Message-ID: <20261112130359.840795-14-poros@redhat.com>
In-Reply-To: <20261112130359.840795-1-poros@redhat.com>
References: <20261112130359.840795-1-poros@redhat.com>
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

Extend the stress script with tests that register and unregister
devices from several processes at once and that keep a number of
devices with many pins live at the same time, checking that every one
of them is visible on netlink with all its pins.

The workers run in subshells, so the parent cannot track the device a
worker has in flight. Each worker removes it from its own exit trap
instead, and the parent reserves a range of clock IDs for every worker,
so that the devices of a worker cannot collide with those of another
worker or of the parent and whatever a killed worker left behind can
be removed by name, at the end of the test and from the cleanup
handler. The handler stops the recorded workers together with the jobs
of the shell, gives them a few seconds to run their exit traps before
forcing the survivors, and goes on without a worker that does not die,
since one stuck in the kernel would hang the teardown. A worker that
a signal interrupts exits with the status of the signal, inside a trap
$? is the status of whatever ran last and the worker could pass for one
that finished. bash reaps a worker as soon as it exits, so a recorded
pid may have been handed out again by the time the handler runs, and it
signals a pid only while that is still a child of the script. Deleting
a device treats a part of it that is gone by the time its step runs as
removed, so that a removal running concurrently with the one of a
worker does not turn into a spurious failure. The workers inherit the
open lock file of the library, so the lock is held until the script and
every worker have exited.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- signal a recorded pid only while it is still a running child of the
  script, bash reaps finished workers on its own and the pid may have
  been reused
- rename the "maximum devices" test to "many devices" and check that
  every device shows all its pins
- say what happens to a helper of a worker that is stuck in the kernel
- exit a signalled worker with the status of the signal, it could pass
  for one that finished

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v2:
- quote the failed and ret expansions (netdev CI shellcheck)

v3: https://lore.kernel.org/all/20261109093523.931201-14-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-14-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-14-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_lib.sh        |  30 ++-
 .../selftests/drivers/dpll/dpll_stress.sh     | 237 +++++++++++++++++-
 2 files changed, 259 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 6b99dae5a4f379..1dfe15943f3431 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -55,8 +55,10 @@ dpll_lib_check_prereqs()
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
@@ -644,8 +646,12 @@ dpllsim_undeploy()
 
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
@@ -653,12 +659,12 @@ dpllsim_delete_device()
 
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
 
 	return "$ret"
 }
@@ -670,6 +676,16 @@ dpllsim_alloc_clock_id()
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
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index 1745643955da16..2abfacc43b48be 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -15,13 +15,24 @@ source "$SCRIPTDIR/dpll_lib.sh"
 
 ALL_TESTS="
 	test_rapid_create_delete
+	test_concurrent_workers
 	test_pin_state_flooding
+	test_many_devices
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
@@ -39,18 +50,111 @@ untrack_device()
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
+# Return 0 while the process is a running child of this shell. bash
+# reaps a background child as soon as it exits and only keeps its status
+# for a later wait, so the pid of a worker that is gone can be handed
+# out again. A process that reused it has another parent, which is how
+# it is told apart, and it must never be signalled. A child that has
+# exited but was not reaped yet is a zombie, state Z in
+# /proc/<pid>/stat, and counts as gone, or a wait on it would spin until
+# the forced kill.
+pid_running()
+{
+	local stat state ppid
+
+	# The state and the parent pid follow the parenthesized command
+	# name, which may contain spaces and parentheses. The ".*" is
+	# greedy, so the expression strips everything up to the last ") "
+	# of the line, and a ")" inside the name is harmless.
+	stat=$(sed 's/^.*) //' "/proc/$1/stat" 2>/dev/null) || return 1
+	read -r state ppid _ <<< "$stat"
+	[ "$ppid" = "$$" ] && [ "$state" != "Z" ]
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
+	# Only a process that is still a running child of this shell is
+	# signalled, see pid_running, a recorded pid may have been reused
+	# since its worker finished.
+	for pid in "${pids[@]}"; do
+		pid_running "$pid" && kill "$pid" 2>/dev/null
+	done
+	# Give the workers a few seconds to run their exit traps, then
+	# force the survivors and give those a few seconds to die. A
+	# worker stuck in the kernel does not die of the forced kill
+	# before whatever it waits for returns, and neither does a helper
+	# it runs, the mkdir of a device for one, which outlives the
+	# worker then. So only the workers that are gone are waited for
+	# and the teardown goes on without the rest. The removal of what
+	# such a worker or helper left behind can then fail or race with
+	# it, which is logged like any other failed removal, and what a
+	# stuck helper creates afterwards stays behind.
+	pids_gone "${pids[@]}"
+	for pid in "${pids[@]}"; do
+		pid_running "$pid" && kill -KILL "$pid" 2>/dev/null
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
@@ -138,6 +242,88 @@ test_rapid_create_delete()
 	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
 }
 
+# The exit trap of a worker. The worker runs in a subshell, so
+# track_device() cannot reach CREATED_DEVICES of the parent. Remove the
+# device in flight from the exit trap instead, or killing the worker
+# leaks it. The trap saves the exit status first, so that the removal
+# cannot mask a failed iteration. TERM and INT exit through it with the
+# status a shell reports for the signal, inside a trap $? would be the
+# status of whatever ran last and an interrupted worker could pass for
+# one that finished.
+worker_exit()
+{
+	local status=$?
+
+	trap - EXIT
+	trap '' TERM INT
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
+	trap worker_exit EXIT
+	trap 'exit 143' TERM
+	trap 'exit 130' INT
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
+	check_err "$failed" "some concurrent workers failed"
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
 	local clock_id name dev_id pin_ids pin_id i last state fails=0
@@ -209,6 +395,55 @@ test_pin_state_flooding()
 	log_test "DPLL pin state flooding"
 }
 
+test_many_devices()
+{
+	local i clock_id created=0 visible dev_id pin_ids
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
+	# Every created device must be visible on netlink with all its
+	# pins.
+	visible=0
+	for clock_id in "${clock_ids[@]}"; do
+		dev_id=$(dpll_device_wait_by_clock_id "$clock_id" dpllsim) ||
+			continue
+		visible=$((visible + 1))
+		dpll_pin_ids_read pin_ids dpll_pin_get_ids "$dev_id"
+		check_err $? "pin dump failed"
+		if [ "${#pin_ids[@]}" -ne "$STRESS_PINS_PER_DEVICE" ]; then
+			check_err 1 "device $dev_id has ${#pin_ids[@]} pins"
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
+	log_test "DPLL many devices ($STRESS_DEVICES devices)"
+}
+
 test_deploy_cycle()
 {
 	local clock_id name i
-- 
2.56.0

