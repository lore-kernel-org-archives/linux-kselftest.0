Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813280;
	b=4obrt/eRMSer032awtayOSmGGv+Oum9zxd+YelcgCKLfmO5LXT2RF8Ei6IgBKkxJhYlB
	 1MF8mMO8jjA3HiqSwNZJVPFX+KIWBJ2cDYyYUKTImYomZadiLXa4Ra+AUd1lfwVolpnFv
	 lyQugDv/dIWdEawYjw4UaulmdNujSRATtVB39OA+LhbRcILxOkk8RFxqc9ALPg9awaMtj
	 MVyXR63pa7W7sg1t4buZnsCCpYQYc3OcLqKuyJlrCD6skNtLaAzN8f6IjEsuOrhJbUUY3
	 XqMcNUrPhRZUiZr+nr83w/6oG8/AUG9NiKHyzNh3rS6mYdv8NKgJPmWwY1Dqu4PsKPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PPim49+jVa+ImXCDNPx+5pLKoiv5ZpP/doxdTQ1/jfk=;
	b=PfN4w7tR90cd64PfXzawgcs73WaYUCrXP8XYCT1tpFXfG3j8LFnS9M0K9ZQHdoyrkhV4
	 wxXcdztRGJyEMtSHfjKVnqIVHeXqG1dK5NheVGBUDDMcGjYbmopeQ2S95xZNhKr1t2+Xz
	 k8TOUH6Xrw30CyiQey7O/LROEIn0KDkc1mv7uzQTaTxWsRoNi8Hvq8f+SXwrbRpD10X55
	 EczBObvghaEZMR5EnRu9up85o6C4aQTPmcmTSiin6T9bPbFlqGyLBohRkWFvY6QuL/mQv
	 fPVI/x2DioY1r7EbCJlbfimMs/f4PnKh3pS5cxRmVOQ52D8wqZT4uNNFWmQTXddeEgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Kk0adAHL;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC4606A881
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BC4606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Kk0adAHL
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso2716771eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 23:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794813279; x=1795418079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPim49+jVa+ImXCDNPx+5pLKoiv5ZpP/doxdTQ1/jfk=;
        b=Kk0adAHLO2UBm3+iTCPu6Q+dxKMnuA6qxn+oy6eSxxgSK/yM23T4rf1F789nJd9oKa
         QUyBZCRrFGYaDkiIUmnLaoSxlj9sihXLtT0XpZdeI/7abNzAMsZg6PpU11lwCY/1Dw5A
         TsiINNUO/si7uc81tlqhG+/WThVH/uiLbPyNUhkydK9uVEkfXHcyG9aS5BIDsWGMqylD
         3ErgS7HREgRToyASQNCbriVeIaO0JCrCUsDo8M28lp+o4bmhv8hNa3mklcfKwlK1q5Sd
         MXy5mgfEuTojr0barcyH+WpEN9UJjlSdg8seOwrrK34E93UF45tu/3jNhCXjIHWl9sGI
         XkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813279; x=1795418079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPim49+jVa+ImXCDNPx+5pLKoiv5ZpP/doxdTQ1/jfk=;
        b=ttdAN8yFx9YXH6geDdDlO3qLz25UCxrqC1+o6fHKkWWRsRxT2RUpA3FZvKrsw8qMZ+
         jRzcvkPw0zzujI3Fjz22J8D4gN1E0RMNLLuY5eUkMMcyjsI1H63yLSQVWA4aRiqdnrEB
         E60nKjFNqg4AGd6ZiwqoIy5IRqJKlO/2ROEgj+sn/c5f3EuTVOqVromHYqWzRGHgiNlK
         0cIClXyyrtILwMP8MRhS6aTbps4d3a9NNdcz9Bp+yIMYj09zte8Cor70vKCmqj7bzOya
         EkXG/VewviA+S0gzMYX07LLA70Dp1lXRPFgSGpxkVQ2ClaPMdye/klPQG0246tZVVZ9k
         E/VA==
X-Forwarded-Encrypted: i=1; AL+hErH69w8CLO1i8VlscQVwp6i1QXVYNieb/drFhknG+1W6oKCJbKilLbrpmA4yjOLsQZ9DRb+U8VLp1jGDypQ6Tt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EazOOe1SiLjqP83Ht413B9wWpSPmegsugw3AkqpUFoEHh0h4z
	vk7lJ+7xs42TYGqpZkcQ7en5k7YaW9bnTiO8Y23fOIA7DFs7d1h7MKqMFWCJw4a7/Zk=
X-Gm-Gg: AYBFou1/vp2/L0ezSg6UDx66+7r5MtoKH6lsvm7YETXSoR0VSGY5ZqmJV8PU6mLTJGI
	ypOMUaGXXbBJgxGtQVa3VYM0j89Lo3lKwRm8343Cg6t4zJd39pJvRCYhI0KFLNislrY6XCieLnv
	hGCCx4VyhZQmsn8NbFq7c0RJ7hayhue+2tJYEIW/VwcoE+6NrR9HfC+0f765BZITkp7IGH+IG7B
	5/c2YLGzJLiLHWoVsuqIdec08sWx7rh2XzpCVpHdWklqTjclQKM9l6jE1egpOVSqvsynDQ14axm
	srL0XWO3C+msNr1Co7APrV+62yiTrvgQ2ZlHpuiGAxW/5gnpH9CsHCHwsd86SWVu1OvZdvnRCO6
	f1mKxo5ykaQJTrb2BIGQcvEaz/qz4sx9E7JVTdeH66F53jzCMEWuecPwKvPlcY9xK9pYi6Of8Jp
	TWtFi2eK6m8HJjen3vc4AVq9II6NwxjAknI+4vw61UZmcWjlppOax1TC130el1X0fSRItMjF2fj
	WiixpbepFd/l500gymCOBXfILR1gyLwy0LeXX05tbskk9YxkeWt2BPm9QWClXCgrwuWekCKiDpu
	zgtXjcJon9f49GGxraboISjQdnKjuXeRaikBITv8Qj6BDga6fVNm0k/pFKV26QH6+pkD3el9x3/
	CRceynA==
X-Received: by 2002:a05:693c:414e:20b0:36c:49a7:86ac with SMTP id 5a478bee46e88-37968b8ee68mr10638311eec.37.1794813278638;
        Sun, 15 Nov 2026 23:14:38 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm47858505eec.8.2026.11.15.23.14.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:14:38 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: fustini@kernel.org,
	jgg@ziepe.ca,
	james.morse@arm.com,
	ben.horgan@arm.com,
	xiaqinxin@huawei.com,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	kevin.tian@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	randy.dunlap@infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH v2 4/4] selftests/resctrl: Exercise device assignment and IOMMU global IDs
Date: Mon, 16 Nov 2026 15:13:43 +0800
Message-ID: <20261116071338.35991-10-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
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

Add opt-in tests with an explicitly selected disposable device or IOMMU.
Cover assignment, moves, idempotence, malformed tokens, occupied-group
removal, global register readback and restoration. Include monitor-group
checks only when explicitly requested on a monitoring-capable dependency.

Check that a task and a registered device can share a control group with
a non-default cache mask while leaving the default group's policy intact.

Document the assignment interface and how to run both selftests. These
tests do not verify downstream traffic tags or resource isolation.

The shell selftests were largely drafted with a large language model
(LLM) using the test scenarios and expected results as input.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 .../filesystems/resctrl-devices-prototype.rst |  43 ++++
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/resctrl/Makefile      |   2 +
 tools/testing/selftests/resctrl/devices.sh    | 205 ++++++++++++++++++
 .../testing/selftests/resctrl/iommu_qosid.sh  | 119 ++++++++++
 5 files changed, 370 insertions(+)
 create mode 100644 Documentation/filesystems/resctrl-devices-prototype.rst
 create mode 100755 tools/testing/selftests/resctrl/devices.sh
 create mode 100755 tools/testing/selftests/resctrl/iommu_qosid.sh

diff --git a/Documentation/filesystems/resctrl-devices-prototype.rst b/Documentation/filesystems/resctrl-devices-prototype.rst
new file mode 100644
index 000000000000..7e6eedb9bf79
--- /dev/null
+++ b/Documentation/filesystems/resctrl-devices-prototype.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Registered resctrl devices (prototype)
+=====================================
+
+Write one registered ``<bus>/<device-name>`` token to a group's
+``devices`` file to move the device there. Reading the file lists that
+group's devices; the root file lists only the default group.
+``tasks`` is unchanged.
+
+Run as root, using a test device listed in the default group::
+
+    mount -t resctrl resctrl /sys/fs/resctrl
+    cat /sys/fs/resctrl/devices
+    mkdir /sys/fs/resctrl/p1
+    echo pci/0000:00:03.0 > /sys/fs/resctrl/p1/devices
+    echo pci/0000:00:03.0 > /sys/fs/resctrl/devices
+    rmdir /sys/fs/resctrl/p1
+
+Return devices to the default group before removing their group.
+``devices`` appears only if a device was registered at mount time.
+The RISC-V IOMMU driver does not register devices with shared contexts
+for independent assignment.
+
+Selftests
+---------
+
+Use an explicitly selected disposable device in the default group::
+
+    RESCTRL_DEVICE=pci/0000:00:03.0 sh tools/testing/selftests/resctrl/devices.sh
+
+This covers device moves, invalid writes, group removal and task/device
+co-assignment with a non-default cache mask. Set ``RESCTRL_TEST_MONITOR=1``
+only with a monitoring-capable dependency.
+
+For the separate global-ID test, substitute the test IOMMU's name::
+
+    IOMMU_QOSID_DIR='/sys/class/iommu/<iommu>/qosid' \
+        sh tools/testing/selftests/resctrl/iommu_qosid.sh
+
+The global-ID test restores the original values. Each test ID defaults
+to 1; override ``IOMMU_QOSID_RCID`` and ``IOMMU_QOSID_MCID`` if needed.
+Neither test measures traffic tags or resource isolation.
diff --git a/MAINTAINERS b/MAINTAINERS
index e14fddd07882..eef4695d089a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23466,6 +23466,7 @@ R:	Babu Moger <babu.moger@amd.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 P:	Documentation/process/maintainer-tip.rst
+F:	Documentation/filesystems/resctrl-devices-prototype.rst
 F:	Documentation/filesystems/resctrl.rst
 F:	arch/x86/include/asm/resctrl.h
 F:	arch/x86/kernel/cpu/resctrl/
diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 984534cfbf1b..73646aec1284 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -4,6 +4,8 @@ CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
+TEST_PROGS += devices.sh
+TEST_PROGS += iommu_qosid.sh
 
 LOCAL_HDRS += $(wildcard *.h)
 
diff --git a/tools/testing/selftests/resctrl/devices.sh b/tools/testing/selftests/resctrl/devices.sh
new file mode 100755
index 000000000000..12176d6a3779
--- /dev/null
+++ b/tools/testing/selftests/resctrl/devices.sh
@@ -0,0 +1,205 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Explicitly select a disposable device; never choose a storage device for you.
+
+root=${RESCTRL_MOUNT:-/sys/fs/resctrl}
+token=${RESCTRL_DEVICE:-}
+count=0
+failed=0
+g1="$root/device-test-$$-a"
+g2="$root/device-test-$$-b"
+mon="$g2/mon_groups/device-test-$$"
+test_pid=
+
+echo 'TAP version 13'
+skip()
+{
+	echo "1..0 # SKIP $*"
+	exit 4
+}
+[ "$(id -u)" = 0 ] || skip 'root required'
+[ -n "$token" ] || skip 'set RESCTRL_DEVICE=bus/name for a test device'
+[ -f "$root/devices" ] || skip 'no registered resctrl device interface'
+grep -Fxq "$token" "$root/devices" || skip 'device is not in the default group'
+
+stop_test_task()
+{
+	[ -n "$test_pid" ] || return 0
+	kill "$test_pid" 2>/dev/null || :
+	wait "$test_pid" 2>/dev/null || :
+	test_pid=
+}
+
+cleanup()
+{
+	stop_test_task
+	if ! echo "$token" > "$root/devices"; then
+		echo '# ERROR: cannot restore device to default group' >&2
+		failed=1
+		return
+	fi
+	rmdir "$mon" "$g1" "$g2" 2>/dev/null || :
+}
+
+finish()
+{
+	ret=$?
+	trap - EXIT HUP INT TERM
+	cleanup
+	echo "1..$count"
+	[ "$ret" = 0 ] || failed=1
+	exit "$failed"
+}
+trap finish EXIT
+trap 'exit 1' HUP INT TERM
+
+check()
+{
+	name=$1
+	shift
+	count=$((count + 1))
+	if "$@"; then
+		echo "ok $count - $name"
+	else
+		echo "not ok $count - $name"
+		failed=1
+	fi
+}
+move()
+{
+	echo "$token" > "$1/devices" &&
+		grep -Fxq "$token" "$1/devices"
+}
+reject()
+{
+	if echo "$1" > "$g1/devices" 2>/dev/null; then
+		return 1
+	fi
+	grep -Fxq "$token" "$g2/devices"
+}
+nul()
+{
+	if printf '%s\000ignored\n' "$token" > "$g1/devices" 2>/dev/null; then
+		return 1
+	fi
+	grep -Fxq "$token" "$g2/devices"
+}
+busy()
+{
+	! rmdir "$g2" 2>/dev/null && [ -d "$g2" ]
+}
+busy_mon()
+{
+	! rmdir "$mon" 2>/dev/null && [ -d "$mon" ]
+}
+mode_busy()
+{
+	if echo exclusive > "$g2/mode" 2>/dev/null; then
+		return 1
+	fi
+	# Inspect the reason before another group read clears last_cmd_status.
+	grep -Fq 'Move assigned devices' "$root/info/last_cmd_status" &&
+		[ "$(cat "$g2/mode")" = shareable ]
+}
+empty()
+{
+	contents=$(cat "$1") || return 1
+	[ -z "$contents" ]
+}
+
+cache_entry()
+{
+	awk -F '[:=;]' -v res="$resource" '
+		$1 ~ ("^[[:space:]]*" res "$") && NF >= 3 {
+			print $2 "=" $3
+			exit
+		}' "$g1/schemata"
+}
+
+find_cache_mask()
+{
+	for resource in L3 L2; do
+		full=$(cat "$root/info/$resource/cbm_mask" 2>/dev/null) || continue
+		min=$(cat "$root/info/$resource/min_cbm_bits") || continue
+		initial=$(cache_entry)
+		[ -n "$initial" ] || continue
+
+		# Use a contiguous subset distinct from the new group's initial mask.
+		mask=$((0x$full >> 1))
+		[ "$mask" -gt 0 ] &&
+			[ "$((mask & (mask + 1)))" -eq 0 ] &&
+			[ "$((mask & 0x$full))" -eq "$mask" ] &&
+			[ "$mask" -ge "$(((1 << min) - 1))" ] &&
+			[ "$mask" -ne "$((0x${initial#*=}))" ] || continue
+		cache_setting=$(printf '%s=%x' "${initial%=*}" "$mask")
+		return 0
+	done
+	return 1
+}
+
+task_and_device()
+{
+	default_schema=$(cat "$root/schemata") || return 1
+	echo "$resource:$cache_setting" > "$g1/schemata" || return 1
+	sleep 60 &
+	test_pid=$!
+	result=1
+	if echo "$test_pid" > "$g1/tasks" &&
+	   grep -Fxq "$test_pid" "$g1/tasks" &&
+	   grep -Fxq "$token" "$root/devices" &&
+	   move "$g1" &&
+	   ! grep -Fxq "$token" "$root/devices" &&
+	   grep -Fxq "$test_pid" "$g1/tasks" &&
+	   [ "$(cache_entry)" = "$cache_setting" ] &&
+	   [ "$(cat "$root/schemata")" = "$default_schema" ]; then
+		echo "# PID $test_pid and $token share $resource:$cache_setting"
+		result=0
+	fi
+	stop_test_task
+	move "$root" && [ "$result" -eq 0 ]
+}
+
+check 'create first control group' mkdir "$g1"
+[ -d "$g1" ] || exit 1
+check 'create second control group' mkdir "$g2"
+[ -d "$g2" ] || exit 1
+if find_cache_mask; then
+	check 'task and device share a control group with a non-default cache mask' task_and_device
+else
+	count=$((count + 1))
+	echo "ok $count - task and device share a control group # SKIP no alternate cache mask"
+fi
+check 'assign device to a control group' move "$g1"
+check 'repeat the same assignment' move "$g1"
+check 'move device to another control group' move "$g2"
+check 'old group no longer lists device' empty "$g1/devices"
+check 'reject unknown device without moving the member' reject 'missing/device'
+check 'reject old IOMMU group token' reject 'iommu_group:0'
+check 'reject multiple tokens' reject "$token,$token"
+check 'reject empty token' reject ''
+check 'reject multiple lines' reject "$token
+$token"
+check 'reject embedded NUL without moving the member' nul
+check 'reject removing a group with devices' busy
+check 'reject exclusive mode with devices before testing cache masks' mode_busy
+
+# Monitoring requires a real monitoring-capable dependency, not fabricated RMIDs.
+if [ "${RESCTRL_TEST_MONITOR:-0}" = 1 ]; then
+	check 'create monitor group' mkdir "$mon"
+	if [ -d "$mon" ]; then
+		check 'assign device to monitor group' move "$mon"
+		check 'control group no longer lists monitored device' empty "$g2/devices"
+		check 'reject removing monitor group with device' busy_mon
+		check 'reject removing parent with monitored device' busy
+		check 'reject exclusive parent with monitored device' mode_busy
+		check 'restore device to control group' move "$g2"
+		check 'remove empty monitor group' rmdir "$mon"
+	fi
+else
+	count=$((count + 1))
+	echo "ok $count - monitor-group assignment # SKIP set RESCTRL_TEST_MONITOR=1"
+fi
+check 'move back to default group' move "$root"
+check 'remove empty first group' rmdir "$g1"
+check 'remove empty second group' rmdir "$g2"
+exit "$failed"
diff --git a/tools/testing/selftests/resctrl/iommu_qosid.sh b/tools/testing/selftests/resctrl/iommu_qosid.sh
new file mode 100755
index 000000000000..b10f89721dc2
--- /dev/null
+++ b/tools/testing/selftests/resctrl/iommu_qosid.sh
@@ -0,0 +1,119 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Opt in: global IDs affect IOMMU traffic, not just a disposable endpoint.
+
+dir=${IOMMU_QOSID_DIR:-}
+rcid=${IOMMU_QOSID_RCID:-1}
+mcid=${IOMMU_QOSID_MCID:-1}
+count=0
+failed=0
+
+echo 'TAP version 13'
+skip()
+{
+	echo "1..0 # SKIP $*"
+	exit 4
+}
+[ "$(id -u)" = 0 ] || skip 'root required'
+[ -n "$dir" ] || skip 'set IOMMU_QOSID_DIR for a test IOMMU'
+for field in rcid mcid; do
+	[ -r "$dir/$field" ] && [ -w "$dir/$field" ] ||
+		skip 'qosid interface unavailable'
+done
+case "$rcid:$mcid" in
+	*[!0-9:]* | :* | *:) skip 'select decimal test IDs supported by the IOMMU' ;;
+	0* | *:0*) skip 'select nonzero IDs without leading zeros' ;;
+esac
+[ "$rcid" -gt 0 ] && [ "$rcid" -le 4095 ] &&
+	[ "$mcid" -gt 0 ] && [ "$mcid" -le 4095 ] ||
+	skip 'select nonzero 12-bit test IDs supported by the IOMMU'
+original_rcid=$(cat "$dir/rcid") || exit 1
+original_mcid=$(cat "$dir/mcid") || exit 1
+
+snapshot()
+{
+	current_rcid=$(cat "$dir/rcid") || return 1
+	current_mcid=$(cat "$dir/mcid") || return 1
+	printf '%s:%s\n' "$current_rcid" "$current_mcid"
+}
+restore()
+{
+	restored=0
+	echo "$original_rcid" > "$dir/rcid" || restored=1
+	echo "$original_mcid" > "$dir/mcid" || restored=1
+	[ "$(snapshot)" = "$original_rcid:$original_mcid" ] || restored=1
+	return "$restored"
+}
+
+finish()
+{
+	ret=$?
+	trap - EXIT HUP INT TERM
+	if ! restore; then
+		echo '# ERROR: failed to restore global QoS IDs' >&2
+		failed=1
+	fi
+	echo "1..$count"
+	[ "$ret" = 0 ] || failed=1
+	exit "$failed"
+}
+trap finish EXIT
+trap 'exit 1' HUP INT TERM
+
+check()
+{
+	name=$1
+	shift
+	count=$((count + 1))
+	if "$@"; then
+		echo "ok $count - $name"
+	else
+		echo "not ok $count - $name"
+		failed=1
+	fi
+}
+write_rcid()
+{
+	other=$(cat "$dir/mcid") || return 1
+	echo "$1" > "$dir/rcid" && [ "$(snapshot)" = "$1:$other" ]
+}
+write_mcid()
+{
+	other=$(cat "$dir/rcid") || return 1
+	echo "$1" > "$dir/mcid" && [ "$(snapshot)" = "$other:$1" ]
+}
+reject()
+{
+	before=$(snapshot) || return 1
+	if echo "$2" > "$dir/$1" 2>/dev/null; then
+		return 1
+	fi
+	[ "$(snapshot)" = "$before" ]
+}
+nul()
+{
+	before=$(snapshot) || return 1
+	if printf '0\000ignored\n' > "$dir/$1" 2>/dev/null; then
+		return 1
+	fi
+	[ "$(snapshot)" = "$before" ]
+}
+
+check 'write RCID zero without changing MCID' write_rcid 0
+check 'write MCID zero without changing RCID' write_mcid 0
+check 'write nonzero RCID without changing MCID' write_rcid "$rcid"
+check 'write nonzero MCID without changing RCID' write_mcid "$mcid"
+check 'change RCID while preserving nonzero MCID' write_rcid 0
+check 'restore nonzero RCID while preserving MCID' write_rcid "$rcid"
+check 'change MCID while preserving nonzero RCID' write_mcid 0
+check 'reject malformed RCID and preserve IDs' reject rcid bad
+check 'reject malformed MCID and preserve IDs' reject mcid bad
+check 'reject trailing input and preserve IDs' reject rcid '0 1'
+check 'reject out-of-range RCID and preserve IDs' reject rcid 4096
+check 'reject out-of-range MCID and preserve IDs' reject mcid 4096
+check 'reject negative ID and preserve IDs' reject mcid -1
+check 'reject integer overflow and preserve IDs' reject rcid 4294967296
+check 'reject embedded NUL in RCID and preserve IDs' nul rcid
+check 'reject embedded NUL in MCID and preserve IDs' nul mcid
+check 'restore original global IDs' restore
+exit "$failed"
-- 
2.50.1 (Apple Git-155)

