Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488729;
	b=RGE3CmGboh3Jk79aesky6C7RyFhTz1tkrxl6rEI3bFYH+9sDFMaVuK/aCDxDB+g9Q53C
	 IgHbEaheilA30MFz+6QDcxS4qXf2JOl8BewdTdAE8yKOLgvAV0fhqiOMs3oJUarjQgBY6
	 /wyKWaVN65tvlePg/um+49YzEsXMaIW2m+qnM5NTHf46u0T2NpHnozF1PHrHS+XkOuf46
	 EW7uYn+XzM7ndnaZFFZVjTE8Ki4EGu4ns7nPugA4xSPl9ELC19jpDxp//wLr+oWcU5MqI
	 ETrHnVsLsS7FC8Cd/46BRSZSjAyFFlYKJvtXd6BrlJy5Qxydb5jbbJjhsMs0TnG9r4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488729;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=sV/mTR1kVgkfbC0c2KsvQmJuWHrsS0RpK6tXRNWxsPk=;
	b=cXwoHymMVVGy3KF1eq9OpWGJVcBaq2/QHDp0lhBZV8SMkO1wt1lvSuycfwxjwVzmPH1a
	 Ojt744AJis2dkGIfJv6joTzJBcPYUaSqqDJp9j5rQhiM/Ypsuto1Az52NCw10KovRbmKA
	 sp5RFTzg9ANDzV4Sl+VxAkHT4ElQsueeqfRrAlYk7OsCZ5e5WJUkEkLucXxncBEk9g95a
	 wkR2uiEchdyVjQ2KSVpsJePwQqUDZJHOVJCBFwi95/nn4pQsRZlS0yKhtxIfriQDkDmCn
	 s2Gtt2dSFkZcAPNzykAfy+aeIJVyXtcWhlGtQjtpm0fWZV2EvP9guyGa6dGVBz0m+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="cUYY3/tj";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E993606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E993606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cUYY3/tj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sV/mTR1kVgkfbC0c2KsvQmJuWHrsS0RpK6tXRNWxsPk=;
	b=cUYY3/tjwubTW5ValX3VUuMnq/G9fBODbAuiVVAELlp/rAFAH1Alfgwjat3+s+zn3DVWfI
	e6zJ12imO8SaFL+BXnxv7svq34SFrDmO/SuV9EkseTa6dsoIXAmqC1TboO5MTmh/cfmazz
	IdKY8M5zwHw2tMp+ZJ5Qz2dtS9P/b30=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-5fza1J6cNpqNbkh3H1QQ4Q-1; Thu,
 12 Nov 2026 08:05:26 -0500
X-MC-Unique: 5fza1J6cNpqNbkh3H1QQ4Q-1
X-Mimecast-MFC-AGG-ID: 5fza1J6cNpqNbkh3H1QQ4Q_1794488723
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A8DD1800EF5;
	Thu, 12 Nov 2026 13:05:23 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3DA541956087;
	Thu, 12 Nov 2026 13:05:18 +0000 (UTC)
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
Subject: [PATCH net-next v4 14/14] selftests: dpll: add reference leak tests
Date: Thu, 12 Nov 2026 14:03:59 +0100
Message-ID: <20261112130359.840795-15-poros@redhat.com>
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

With CONFIG_DPLL_REFCNT_TRACKER the DPLL core keeps the stack traces of
unreleased device and pin references in debugfs. The entries do not
name their owner, so add library helpers that snapshot the entries
present before a test creates its devices and fail when an entry that
is not in the snapshot still holds references afterwards. An entry in
the snapshot belongs to an object of another driver and is ignored
even when its content changed, since other drivers take and drop
references while the tests run. The teardown of a device releases its
references before the write to live returns, so the entries are
expected to be gone at the first look; the check still polls for a
while before it reports a leak, so that it does not fail on a single
read. Attributing by name means that a leak of an earlier run goes
unnoticed, that an object reusing the address of a freed one from the
snapshot can hide a leak and that an object another driver registers
while a script runs is reported as a leak, which is accepted, the
entries carry nothing better to go by. ref_tracker removes the file of
a freed object from a work item and a read of it fails until then, so
the snapshot waits for such files to go away and records only entries
it can read, or the file of the probe device could get into it and hide
the next object allocated at that address. A second run alongside would
have its devices attributed to this one, which is one more reason for
the lock every script takes.

Whether the tracker works is probed with a throwaway device, which has
to show entries while it is live and to drain them once it is deleted,
so that a kernel without the tracker is told apart from a broken
simulator and from a leak. The entries exist without
CONFIG_DPLL_REFCNT_TRACKER too and just stay empty, so a probe that saw
no reference is a skip unless /proc/config.gz says the tracker is built
in, which makes it a failure. The probe runs as the first test of the
stress script, which gains a final leak check that is skipped when an
earlier test left a device behind, and of the new dpll_reftrack.sh,
which registers a device, removes it and verifies that no reference
survived. The snapshot file lives next to the lock file under /run, for
the same reason the lock file does not live in /tmp. The library mounts
debugfs when nothing else did, like it does for configfs, and the
selftest config enables the tracker together with CONFIG_DEBUG_KERNEL,
which it depends on, debugfs and CONFIG_IKCONFIG_PROC for the look at
/proc/config.gz.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- wait for the files of freed objects to go away before a snapshot and
  record only entries that can be read
- a probe that saw no reference is a failure when /proc/config.gz says
  the tracker is built in, a skip otherwise
- skip the final leak check of the stress script when an earlier test
  left a device behind
- record the debugfs mount before mounting
- say that objects another driver registers during a run are reported
- enable CONFIG_IKCONFIG_PROC in the selftest config, the probe reads
  /proc/config.gz
- say that the probe device could not be created or deployed, not only
  created
- add the Reviewed-by given to v3 (Ivan Vecera)

v3:
- say what the leak check waits for instead of a concurrent dump
  holding references, which nothing does (Ivan Vecera)
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v2:
- keep the config file sorted and quote the ret expansions (netdev CI
  shellcheck)

v3: https://lore.kernel.org/all/20261109093523.931201-15-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-15-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-15-poros@redhat.com/
---
 tools/testing/selftests/drivers/dpll/Makefile |   1 +
 tools/testing/selftests/drivers/dpll/config   |   5 +
 .../selftests/drivers/dpll/dpll_lib.sh        | 308 ++++++++++++++++--
 .../selftests/drivers/dpll/dpll_reftrack.sh   | 190 +++++++++++
 .../selftests/drivers/dpll/dpll_stress.sh     | 105 +++++-
 5 files changed, 584 insertions(+), 25 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_reftrack.sh

diff --git a/tools/testing/selftests/drivers/dpll/Makefile b/tools/testing/selftests/drivers/dpll/Makefile
index 1349d078fa2660..d292ea049edfa3 100644
--- a/tools/testing/selftests/drivers/dpll/Makefile
+++ b/tools/testing/selftests/drivers/dpll/Makefile
@@ -10,6 +10,7 @@ TEST_FILES := dpll_lib.sh
 TEST_PROGS := \
 	dpll_basic.sh \
 	dpll_features.sh \
+	dpll_reftrack.sh \
 	dpll_stress.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/dpll/config b/tools/testing/selftests/drivers/dpll/config
index e2c90b6970bd43..69ff54875712c6 100644
--- a/tools/testing/selftests/drivers/dpll/config
+++ b/tools/testing/selftests/drivers/dpll/config
@@ -1,3 +1,8 @@
 CONFIG_CONFIGFS_FS=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_KERNEL=y
 CONFIG_DPLL=y
+CONFIG_DPLL_REFCNT_TRACKER=y
 CONFIG_DPLLSIM=m
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 1dfe15943f3431..f7bfe046edf936 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -16,6 +16,8 @@
 
 CONFIGFS_DIR="/sys/kernel/config"
 DPLLSIM_CFG="$CONFIGFS_DIR/dpllsim"
+DEBUGFS_DIR="/sys/kernel/debug"
+DPLL_REF_TRACKER_DIR="$DEBUGFS_DIR/ref_tracker"
 
 # Next clock-id handed out by dpllsim_alloc_clock_id. The lookups of the
 # dpllsim helpers match on the module name as well, which is what keeps
@@ -53,12 +55,12 @@ dpll_lib_check_prereqs()
 }
 
 # The scripts that create dpllsim devices share the one dpllsim directory
-# and cannot run alongside each other, so each takes a lock on
-# DPLL_LOCK_FILE before it mounts or creates anything and skips when
-# another run holds it. The workers a script forks inherit the open file
-# and keep the lock until they exit. The file lives under /run rather
-# than in the world-writable /tmp, where a planted symlink could
-# redirect the open.
+# and the leak check attributes every new ref_tracker entry to the run,
+# so each takes a lock on DPLL_LOCK_FILE before it mounts or creates
+# anything and skips when another run holds it. The workers a script
+# forks inherit the open file and keep the lock until they exit. The
+# files live under /run rather than in the world-writable /tmp, where a
+# planted symlink could redirect the open.
 DPLL_RUN_DIR="/run/dpll-selftest"
 DPLL_LOCK_FILE="$DPLL_RUN_DIR/lock"
 DPLL_LOCK_FD=""
@@ -523,10 +525,11 @@ dpll_pin_set_phase_adjust()
 # device is not live.
 #
 # dpllsim_available loads the dpllsim module and mounts configfs when
-# nothing else did. Scripts call dpll_lib_cleanup last from their exit
-# trap to undo the mount, the module stays loaded. The only other trace
-# the library leaves outside the dpllsim directory is DPLL_RUN_DIR with
-# the lock file.
+# nothing else did, dpll_debugfs_available below does the same for
+# debugfs. Scripts call dpll_lib_cleanup last from their exit trap to
+# undo the mounts, the module stays loaded. The only other trace the
+# library leaves outside the dpllsim directory is DPLL_RUN_DIR with the
+# lock file.
 
 DPLLSIM_MOUNTED_CONFIGFS=0
 # Name of the device dpllsim_create_device created last. Set here, so
@@ -549,26 +552,40 @@ dpllsim_available()
 	[ -d "$DPLLSIM_CFG" ]
 }
 
-# Unmount configfs again when dpllsim_available mounted it. Call after
-# the devices of the script are gone. A dpllsim device the script could
-# not remove keeps the mount, so that what is left can be looked at.
+__dpll_lib_umount()
+{
+	# The mount recorded up front may have failed.
+	mountpoint -q "$1" || return 0
+	umount "$1" 2>/dev/null || log_info "cannot unmount $1"
+}
+
+# Unmount configfs and debugfs again when the library mounted them. Call
+# after the devices of the script are gone. A dpllsim device the script
+# could not remove keeps both mounted, so that what is left can be
+# looked at, the device in configfs and the references it still holds
+# in the ref_tracker entries of debugfs.
 dpll_lib_cleanup()
 {
-	local dev_path name
+	local dev_path name dir kept
+	local mounted=()
 
-	[ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] || return 0
+	[ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] && mounted+=("$CONFIGFS_DIR")
+	[ "$DPLL_MOUNTED_DEBUGFS" -eq 1 ] && mounted+=("$DEBUGFS_DIR")
 	DPLLSIM_MOUNTED_CONFIGFS=0
-	# The mount recorded up front may have failed.
-	mountpoint -q "$CONFIGFS_DIR" || return 0
+	DPLL_MOUNTED_DEBUGFS=0
+	[ "${#mounted[@]}" -gt 0 ] || return 0
 
 	for dev_path in "$DPLLSIM_CFG"/*/; do
 		[ -d "$dev_path" ] || continue
 		name=$(basename "$dev_path")
-		log_info "device $name left behind, $CONFIGFS_DIR kept mounted"
+		kept=${mounted[*]}
+		kept="${kept/ / and } kept mounted"
+		log_info "device $name left behind, $kept"
 		return
 	done
-	umount "$CONFIGFS_DIR" 2>/dev/null ||
-		log_info "cannot unmount $CONFIGFS_DIR"
+	for dir in "${mounted[@]}"; do
+		__dpll_lib_umount "$dir"
+	done
 }
 
 dpllsim_check_module()
@@ -719,3 +736,254 @@ dpllsim_setup_standard_device()
 		return 1
 	fi
 }
+
+##############################################################################
+# ref_tracker leak checking
+#
+# With CONFIG_DPLL_REFCNT_TRACKER=y the DPLL core creates regular files
+# named dpll_device@<ptr> / dpll_pin@<ptr> under the ref_tracker debugfs
+# dir. Reading one prints the stack traces of currently unreleased
+# references; an empty (or removed) file means no leaks.
+#
+# The entries do not name their owner, so leaks are attributed by
+# snapshot, a non-empty entry whose name is not in the snapshot taken
+# before the test created its devices is a leak, an entry that is in it
+# belongs to another driver and is ignored even when its content changed.
+# An object another driver registers while a script runs cannot be told
+# from one of the script and is reported as a leak, the scripts need a
+# system where no other DPLL driver is probed or reloaded meanwhile.
+#
+# ref_tracker removes the file of a freed object from a work item. Until
+# that ran the file is still there and a read of it fails. Such an entry
+# must not get into a snapshot, an object allocated at the same address
+# later has the same name and would be ignored.
+
+DPLL_MOUNTED_DEBUGFS=0
+# The snapshot files are kept in DPLL_RUN_DIR, see the lock above for
+# why that is not /tmp, as refsnap.<pid>.<random>.
+DPLL_REF_SNAPSHOT_PREFIX="$DPLL_RUN_DIR/refsnap"
+# Name of the probe device while it exists, so that the cleanup handler
+# of a script can remove it when the probe could not.
+DPLLSIM_PROBE_DEVICE=""
+
+# Create the file a snapshot is recorded in and print its name. The
+# scripts take the lock first, which creates DPLL_RUN_DIR. A run that
+# is killed with SIGKILL cannot remove its file, so the files of earlier
+# runs whose process is gone are removed first, the pid of the run is
+# the component after the first dot of the name. A pid that was reused
+# by a process that lives long would keep such a file forever, so files
+# older than a day are removed whatever their pid is. Return 1 when the
+# file cannot be created.
+dpll_ref_tracker_snapshot_file()
+{
+	local file pid
+
+	find "$DPLL_RUN_DIR" -maxdepth 1 \
+	     -name "${DPLL_REF_SNAPSHOT_PREFIX##*/}.*" -mmin +1440 -delete \
+	     2>/dev/null
+	for file in "$DPLL_REF_SNAPSHOT_PREFIX".*; do
+		[ -f "$file" ] || continue
+		pid=${file#"$DPLL_REF_SNAPSHOT_PREFIX".}
+		pid=${pid%%.*}
+		[[ "$pid" =~ ^[0-9]+$ ]] || continue
+		[ -d "/proc/$pid" ] || rm -f "$file"
+	done
+	mktemp "$DPLL_REF_SNAPSHOT_PREFIX.$$.XXXXXX"
+}
+
+# Mount debugfs when nothing else did, so that the ref_tracker entries
+# can be read, and remember that for dpll_lib_cleanup. Return 0 when
+# debugfs is mounted afterwards, whether the tracker dir exists is for
+# the caller to check.
+dpll_debugfs_available()
+{
+	if ! mountpoint -q "$DEBUGFS_DIR"; then
+		# Recorded before the mount, so that a cleanup run by a
+		# signal right after it knows about the mount.
+		DPLL_MOUNTED_DEBUGFS=1
+		mount -t debugfs none "$DEBUGFS_DIR" &> /dev/null ||
+			DPLL_MOUNTED_DEBUGFS=0
+	fi
+	mountpoint -q "$DEBUGFS_DIR"
+}
+
+__dpll_ref_tracker_hash()
+{
+	printf '%s' "$1" | md5sum | cut -d' ' -f1
+}
+
+# Return 0 when every dpll_device@* / dpll_pin@* entry can be read,
+# which means that no file of a freed object is waiting for its removal.
+__dpll_ref_tracker_reaped()
+{
+	local entry
+
+	for entry in "$DPLL_REF_TRACKER_DIR"/dpll_device@* \
+		     "$DPLL_REF_TRACKER_DIR"/dpll_pin@*; do
+		[ -f "$entry" ] || continue
+		cat "$entry" &> /dev/null || return 1
+	done
+}
+
+# Write "<name> <content hash>" for every dpll_device@* / dpll_pin@*
+# entry of a live object to the given file, one entry per line. The
+# files of freed objects are given a while to go away first, one that is
+# still there afterwards cannot be read and is left out. The file ends
+# up empty when the tracker dir is missing.
+dpll_ref_tracker_snapshot()
+{
+	local file=$1
+	local entry content
+
+	busywait "$BUSYWAIT_TIMEOUT" __dpll_ref_tracker_reaped > /dev/null
+	for entry in "$DPLL_REF_TRACKER_DIR"/dpll_device@* \
+		     "$DPLL_REF_TRACKER_DIR"/dpll_pin@*; do
+		[ -f "$entry" ] || continue
+		content=$(cat "$entry" 2>/dev/null) || continue
+		echo "$(basename "$entry")" \
+		     "$(__dpll_ref_tracker_hash "$content")"
+	done > "$file"
+}
+
+# Print the leak candidates, the non-empty entries whose name is not in
+# the snapshot, each followed by its content. Prints nothing when there
+# is no candidate.
+__dpll_ref_tracker_new_entries()
+{
+	local file=$1
+	local entry name content
+
+	for entry in "$DPLL_REF_TRACKER_DIR"/dpll_device@* \
+		     "$DPLL_REF_TRACKER_DIR"/dpll_pin@*; do
+		[ -f "$entry" ] || continue
+		name=$(basename "$entry")
+		grep -q "^$name " "$file" && continue
+		content=$(cat "$entry" 2>/dev/null)
+		[ -n "$content" ] || continue
+		echo "Unreleased references in $name:"
+		echo "$content"
+	done
+}
+
+# Return 0 when there is no leak candidate. Otherwise print the
+# candidates and return 1, busywait hands the output of its last failed
+# check to the caller when it times out.
+__dpll_ref_tracker_settled()
+{
+	local leaks
+
+	leaks=$(__dpll_ref_tracker_new_entries "$1")
+	[ -z "$leaks" ] && return 0
+
+	echo "$leaks"
+	return 1
+}
+
+# Log the entries of the snapshot whose content changed since and record
+# the new content, so that the same change is logged once.
+__dpll_ref_tracker_note_changed()
+{
+	local file=$1
+	local entry name content hash changed=""
+
+	for entry in "$DPLL_REF_TRACKER_DIR"/dpll_device@* \
+		     "$DPLL_REF_TRACKER_DIR"/dpll_pin@*; do
+		[ -f "$entry" ] || continue
+		name=$(basename "$entry")
+		grep -q "^$name " "$file" || continue
+		content=$(cat "$entry" 2>/dev/null)
+		hash=$(__dpll_ref_tracker_hash "$content")
+		grep -qx "$name $hash" "$file" && continue
+		sed -i "s/^$name .*/$name $hash/" "$file"
+		changed="$changed $name"
+	done
+
+	[ -n "$changed" ] && log_info \
+		"references of another driver changed (ignored):$changed"
+	return 0
+}
+
+# $1: snapshot file written by dpll_ref_tracker_snapshot before the
+# objects under test were created. Return 0 when no reference to an
+# object created since the snapshot is held any more. The teardown of a
+# device releases its references before the write to live returns, so
+# the entries are expected to be gone at the first look; the check still
+# polls for a while rather than failing on that look, so that a leak is
+# reported only when the references stay. A timeout means they never
+# drained, the candidates seen by the last check are then printed and
+# count as leaked.
+dpll_ref_tracker_check_leaks()
+{
+	local file=$1
+	local leaks ret=0
+
+	[ -d "$DPLL_REF_TRACKER_DIR" ] || return 0
+
+	if ! leaks=$(busywait "$BUSYWAIT_TIMEOUT" __dpll_ref_tracker_settled \
+			      "$file"); then
+		echo "References not released within $BUSYWAIT_TIMEOUT ms:"
+		echo "$leaks"
+		ret=1
+	fi
+	__dpll_ref_tracker_note_changed "$file"
+
+	return "$ret"
+}
+
+# Return 0 when the kernel configuration says that the DPLL reference
+# tracker is built in. The entries exist without it as well, they just
+# stay empty, so a probe that saw no reference cannot tell a kernel
+# without the tracker from a tracker that records nothing. Return 1
+# when the tracker is not configured or there is no /proc/config.gz to
+# ask.
+dpll_ref_tracker_configured()
+{
+	zcat /proc/config.gz 2>/dev/null |
+		grep -q '^CONFIG_DPLL_REFCNT_TRACKER=y'
+}
+
+# Probe whether the kernel tracks DPLL references with a throwaway
+# dpllsim device, the entries that exist before it are recorded in the
+# scratch file $1. Return 0 when the tracker works, 1 when no entry
+# appeared, which dpll_ref_tracker_configured helps to interpret, 2 when
+# the probe device could not be created or deployed, 3 when its entries
+# did not drain after its deletion and 4 when it could not be deleted,
+# its name then stays in DPLLSIM_PROBE_DEVICE for the cleanup handler to
+# retry. Must not be called from a subshell, it allocates clock-ids.
+dpll_ref_tracker_probe()
+{
+	local file=$1
+	local name attempt ret=2
+
+	dpll_ref_tracker_snapshot "$file"
+
+	# A directory of that name left behind by an earlier run takes a
+	# fresh clock-id, anything else is a broken simulator.
+	for attempt in 1 2 3; do
+		dpllsim_alloc_clock_id
+		name="probe$DPLLSIM_CLOCK_ID"
+		dpllsim_create_device "$name" "$DPLLSIM_CLOCK_ID" && break
+		[ -d "$DPLLSIM_CFG/$name" ] || return 2
+		[ "$attempt" -lt 3 ] || return 2
+	done
+	DPLLSIM_PROBE_DEVICE=$name
+
+	if dpllsim_add_pin "$name" ext0 ext 10000000 input &&
+	   dpllsim_deploy "$name"; then
+		ret=1
+		[ -n "$(__dpll_ref_tracker_new_entries "$file")" ] && ret=0
+	fi
+
+	if dpllsim_delete_device "$name"; then
+		DPLLSIM_PROBE_DEVICE=""
+	else
+		log_info "cannot delete device $name"
+		return 4
+	fi
+	if [ "$ret" -eq 0 ] &&
+	   ! busywait "$BUSYWAIT_TIMEOUT" __dpll_ref_tracker_settled "$file" \
+		      > /dev/null; then
+		ret=3
+	fi
+	return "$ret"
+}
diff --git a/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh b/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh
new file mode 100755
index 00000000000000..f2871b5ad84723
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh
@@ -0,0 +1,190 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL reference tracking test. With CONFIG_DPLL_REFCNT_TRACKER=y the DPLL
+# core tracks device and pin references through ref_tracker; the debugfs
+# files dpll_device@<ptr> / dpll_pin@<ptr> list the stack traces of
+# currently unreleased references. This test records the entries that
+# exist before it starts, registers dpllsim devices and verifies that
+# every entry that appeared since is released again after unregistration.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../net/lib.sh"
+source "$SCRIPTDIR/dpll_lib.sh"
+
+ALL_TESTS="
+	test_ref_tracker_probe
+	test_basic_reftrack
+	test_final_leak_check
+"
+
+CREATED_DEVICE=""
+
+# The device stays recorded when its removal fails, so that the cleanup
+# handler tries again.
+destroy_device()
+{
+	[ -n "$CREATED_DEVICE" ] || return 0
+
+	dpllsim_delete_device "$CREATED_DEVICE" || return 1
+	CREATED_DEVICE=""
+}
+
+cleanup()
+{
+	# A second signal must not abort the teardown half way.
+	trap '' INT TERM
+
+	defer_scopes_cleanup
+	destroy_device || log_info "cannot delete device $CREATED_DEVICE"
+	# The device whose creation a signal interrupted is recorded by the
+	# library alone, a double delete of a tracked one is harmless.
+	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
+		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
+			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
+	fi
+	if [ -n "$DPLLSIM_PROBE_DEVICE" ]; then
+		dpllsim_delete_device "$DPLLSIM_PROBE_DEVICE" ||
+			log_info "cannot delete device $DPLLSIM_PROBE_DEVICE"
+	fi
+	[ -n "$REF_SNAPSHOT" ] && rm -f "$REF_SNAPSHOT"
+	dpll_lib_cleanup
+}
+
+##############################################################################
+
+# Probe for the reference tracker and record the entries that exist
+# before the first test that creates devices, so that every entry that
+# appears from here on is attributed to this script. A probe device
+# that cannot be created says nothing about the tracker, the simulator
+# is broken. A probe device whose references do not drain is the kind
+# of leak the tests look for, found before the first test. One that
+# cannot be deleted is a failure too, it stays recorded for the cleanup
+# handler to try again. The tests skip when REF_TRACKER is 0 afterwards.
+test_ref_tracker_probe()
+{
+	RET=0
+
+	REF_TRACKER=0
+	if ! dpll_debugfs_available || ! [ -d "$DPLL_REF_TRACKER_DIR" ]; then
+		log_test_skip "DPLL ref_tracker probe" \
+			      "ref_tracker debugfs not available"
+		return
+	fi
+
+	# The snapshot file doubles as the scratch file of the probe, so
+	# it is needed before anything is recorded.
+	if ! REF_SNAPSHOT=$(dpll_ref_tracker_snapshot_file); then
+		check_err 1 "cannot create a temporary file for the snapshot"
+		log_test "DPLL ref_tracker probe"
+		return
+	fi
+
+	dpll_ref_tracker_probe "$REF_SNAPSHOT"
+	case $? in
+	0)
+		REF_TRACKER=1
+		;;
+	1)
+		# The probe device held no tracked reference. That is a
+		# kernel without the tracker, unless its configuration
+		# says otherwise.
+		if ! dpll_ref_tracker_configured; then
+			log_test_skip "DPLL ref_tracker probe" \
+				      "no DPLL reference tracked"
+			return
+		fi
+		check_err 1 "tracker enabled but no reference recorded"
+		;;
+	3)
+		REF_TRACKER=1
+		check_err 1 "references of the probe device not released"
+		;;
+	4)
+		check_err 1 "cannot delete the dpllsim probe device"
+		;;
+	*)
+		check_err 1 "cannot create or deploy the dpllsim probe device"
+		;;
+	esac
+	dpll_ref_tracker_snapshot "$REF_SNAPSHOT"
+
+	log_test "DPLL ref_tracker probe"
+}
+
+test_basic_reftrack()
+{
+	RET=0
+
+	if [ "$REF_TRACKER" -eq 0 ]; then
+		log_test_skip "DPLL basic reference tracking" \
+			      "DPLL reference tracker not available"
+		return
+	fi
+
+	if ! dpllsim_setup_standard_device; then
+		check_err 1 "cannot create dpllsim device"
+		log_test "DPLL basic reference tracking"
+		return
+	fi
+	CREATED_DEVICE=$DPLLSIM_CREATED_NAME
+
+	destroy_device
+	check_err $? "cannot delete device $CREATED_DEVICE"
+
+	if ! dpll_device_wait_gone_by_clock_id "$DPLLSIM_CLOCK_ID" dpllsim; then
+		check_err 1 "device still on netlink after delete"
+	fi
+
+	dpll_ref_tracker_check_leaks "$REF_SNAPSHOT"
+	check_err $? "leaked references after device removal"
+
+	log_test "DPLL basic reference tracking"
+}
+
+test_final_leak_check()
+{
+	RET=0
+
+	if [ "$REF_TRACKER" -eq 0 ]; then
+		log_test_skip "DPLL final ref_tracker check" \
+			      "DPLL reference tracker not available"
+		return
+	fi
+	# A device an earlier test could not remove still holds its
+	# references, the failure to report is that one.
+	if [ -n "$CREATED_DEVICE" ]; then
+		log_test_skip "DPLL final ref_tracker check" \
+			      "device from an earlier test still present"
+		return
+	fi
+
+	dpll_ref_tracker_check_leaks "$REF_SNAPSHOT"
+	check_err $? "leaked DPLL references at end of test"
+
+	log_test "DPLL final ref_tracker check"
+}
+
+##############################################################################
+
+dpll_lib_check_prereqs
+# Another run would find the devices of this one left behind and see
+# them as leaks, see the lock in the library.
+dpll_lib_lock
+
+REF_SNAPSHOT=""
+REF_TRACKER=0
+# The module check and the probe test may mount configfs and debugfs, so
+# the exit trap that unmounts them again has to be in place before. INT
+# and TERM exit through it as well, so that a timeout imposed by the
+# harness still removes the device.
+trap cleanup EXIT
+trap 'exit 1' INT TERM
+dpllsim_check_module
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index 2abfacc43b48be..226e2767ee8970 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -14,11 +14,13 @@ source "$SCRIPTDIR/../../net/lib.sh"
 source "$SCRIPTDIR/dpll_lib.sh"
 
 ALL_TESTS="
+	test_ref_tracker_probe
 	test_rapid_create_delete
 	test_concurrent_workers
 	test_pin_state_flooding
 	test_many_devices
 	test_deploy_cycle
+	test_ref_leaks
 "
 
 STRESS_ITERATIONS=${STRESS_ITERATIONS:-20}
@@ -161,6 +163,11 @@ cleanup()
 		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
 			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
 	fi
+	if [ -n "$DPLLSIM_PROBE_DEVICE" ]; then
+		dpllsim_delete_device "$DPLLSIM_PROBE_DEVICE" ||
+			log_info "cannot delete device $DPLLSIM_PROBE_DEVICE"
+	fi
+	[ -n "$REF_SNAPSHOT" ] && rm -f "$REF_SNAPSHOT"
 	dpll_lib_cleanup
 }
 
@@ -216,6 +223,66 @@ create_stress_device()
 
 ##############################################################################
 
+# Probe for the reference tracker and record the entries that exist
+# before the first test that creates devices, so that the final check
+# attributes every entry that appears from here on to this script. A
+# probe device that cannot be created says nothing about the tracker,
+# the simulator is broken. A probe device whose references do not drain
+# is the kind of leak the final check looks for, found before the first
+# test. One that cannot be deleted is a failure too, it stays recorded
+# for the cleanup handler to try again. REF_TRACKER tells the leak
+# check whether the tracker was seen at work.
+test_ref_tracker_probe()
+{
+	RET=0
+
+	REF_TRACKER=0
+	if ! dpll_debugfs_available || ! [ -d "$DPLL_REF_TRACKER_DIR" ]; then
+		log_test_skip "DPLL ref_tracker probe" \
+			      "ref_tracker debugfs not available"
+		return
+	fi
+
+	# The snapshot file doubles as the scratch file of the probe, so
+	# it is needed before anything is recorded.
+	if ! REF_SNAPSHOT=$(dpll_ref_tracker_snapshot_file); then
+		check_err 1 "cannot create a temporary file for the snapshot"
+		log_test "DPLL ref_tracker probe"
+		return
+	fi
+
+	dpll_ref_tracker_probe "$REF_SNAPSHOT"
+	case $? in
+	0)
+		REF_TRACKER=1
+		;;
+	1)
+		# The probe device held no tracked reference. That is a
+		# kernel without the tracker, unless its configuration
+		# says otherwise.
+		if ! dpll_ref_tracker_configured; then
+			log_test_skip "DPLL ref_tracker probe" \
+				      "no DPLL reference tracked"
+			return
+		fi
+		check_err 1 "tracker enabled but no reference recorded"
+		;;
+	3)
+		REF_TRACKER=1
+		check_err 1 "references of the probe device not released"
+		;;
+	4)
+		check_err 1 "cannot delete the dpllsim probe device"
+		;;
+	*)
+		check_err 1 "cannot create or deploy the dpllsim probe device"
+		;;
+	esac
+	dpll_ref_tracker_snapshot "$REF_SNAPSHOT"
+
+	log_test "DPLL ref_tracker probe"
+}
+
 test_rapid_create_delete()
 {
 	local i clock_id name
@@ -496,16 +563,44 @@ test_deploy_cycle()
 	log_test "DPLL deploy/undeploy cycling"
 }
 
+test_ref_leaks()
+{
+	RET=0
+
+	# The probe test found the tracker inactive or could not run.
+	if [ "$REF_TRACKER" -eq 0 ]; then
+		log_test_skip "DPLL stress ref_tracker check" \
+			      "DPLL reference tracker not available"
+		return
+	fi
+
+	# A device an earlier test could not remove still holds its
+	# references, the failure to report is that one.
+	if [ "${#CREATED_DEVICES[@]}" -gt 0 ]; then
+		log_test_skip "DPLL stress ref_tracker check" \
+			      "device from an earlier test still present"
+		return
+	fi
+
+	dpll_ref_tracker_check_leaks "$REF_SNAPSHOT"
+	check_err $? "leaked DPLL references after stress"
+
+	log_test "DPLL stress ref_tracker check"
+}
+
 ##############################################################################
 
 dpll_lib_check_prereqs
-# Another run would find the devices of this one left behind, see the
-# lock in the library.
+# Another run would find the devices of this one left behind and see
+# them as leaks, see the lock in the library.
 dpll_lib_lock
 
-# The module check may mount configfs, so the exit trap that unmounts it
-# again has to be in place before. INT and TERM exit through it as well,
-# so that a timeout imposed by the harness still removes the devices.
+REF_SNAPSHOT=""
+REF_TRACKER=0
+# The module check and the probe test may mount configfs and debugfs, so
+# the exit trap that unmounts them again has to be in place before. INT
+# and TERM exit through it as well, so that a timeout imposed by the
+# harness still removes the devices.
 trap cleanup EXIT
 trap 'exit 1' INT TERM
 dpllsim_check_module
-- 
2.56.0

