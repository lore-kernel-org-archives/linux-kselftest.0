Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0339A07E
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911048; cv=none; b=jre4VdCLSDyjE/HvL9t1Ak7F8eDaqFIO8fKLgKFfkiq1GriOsid43QeNNyUaOVM8ucRPSNs9afWSSak6+UjEstuifYf9rRwgMhvdl/tc/KK5ufcXMDxN7GVK0FBlTtgXO682oFfpPxMKBNgqayL+9IAlqE+rsdWTeTDLfY/wYcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911048; c=relaxed/simple;
	bh=8gctiQayN9AteUHWBqHT2qKA3oPtMk+DGZXUaD6Q10Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzIn3/H9Ambl4UDa0uSVL5OS0dzzx22sVY2sPI6JYRByBGW8+1ovbZ0e1BY6DONCjd9ajQWxH3YvZKIY+vIkXQWOvv6J0mV9odd+D0T1BgINwnoRtqjg+Q89WoymHOU7n3jlK9wRigvo5s5xKk1NtCDZy57TMssPEuZwmf9GoA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XTEBVx4Q; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XTEBVx4Q"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8gctiQayN9AteUHWBqHT2qKA3oPtMk+DGZXUaD6Q10Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787911044; v=1; x=1788515844;
 b=XTEBVx4Qu/DmzBOSR6nsBd+EkLj7HdyYVdPkV9Lw7REO+OoMqMH59m/v1Aqqkl6eO0VTOud5
 Jy9KpM0QwC13hnaOxqROQaveLm2whrsvNCQTnhkydir6kINENYO39B7ax+54J2Xp8y9ro5fp3YG
 LbdSb5EpdVBKA1yqi9b1HRa8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 990eda6ec407a941;
	Fri, 28 Aug 2026 09:57:23 +0000
X-Mizu-Trace-ID: 990eda6ec407a941
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: cgroups@vger.kernel.org,
	longman@redhat.com,
	ridong.chen@linux.dev
Cc: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v2 6/6] selftests/cgroup: Add CPU release tests for type-change validation failures
Date: Fri, 28 Aug 2026 17:56:43 +0800
Message-ID: <20260828095643.13395-7-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828095643.13395-1-guopeng.zhang@linux.dev>
References: <20260828095643.13395-1-guopeng.zhang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

Exercise housekeeping validation failures for local and remote partition
type changes. Check that the requested partition type becomes invalid,
its CPUs are returned to the top cpuset and their boot-time isolation
state is preserved.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 .../selftests/cgroup/test_cpuset_prs.sh       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 72fe5ce48eff..9b236826166c 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -1419,6 +1419,97 @@ test_housekeeping_cpu_return()
 	echo "$TEST_NAME test PASSED."
 }
 
+#
+# A local type change that fails the boot housekeeping constraint must release
+# the partition CPUs and preserve their boot-isolated state.
+#
+test_partition_type_failure()
+{
+	TEST_NAME="Local partition type-change validation failure"
+	get_boot_isolated_cpu "$TEST_NAME" || return 0
+	echo "Running $TEST_NAME test ..."
+
+	cd $CGROUP2/test
+	echo member > cpuset.cpus.partition
+	echo $BOOT_CPU > cpuset.cpus
+	[[ $(cat cpuset.cpus.effective) = "$BOOT_CPU" ]] || {
+		echo "$TEST_NAME test SKIPPED: CPU $BOOT_CPU is unavailable"
+		echo "" > cpuset.cpus
+		cd $CGROUP2
+		return 0
+	}
+	test_partition isolated
+	echo root > cpuset.cpus.partition
+	grep -q '^root invalid (partition config conflicts with housekeeping setup)$' \
+		cpuset.cpus.partition || {
+		echo "Partition type failure did not produce the expected state"
+		exit 1
+	}
+	[[ $(cat $CGROUP2/cpuset.cpus.effective) = "$CPULIST" ]] || {
+		echo "Partition type failure did not release CPU $BOOT_CPU"
+		exit 1
+	}
+	check_isolcpus "." || {
+		echo "Partition type failure lost boot-isolated CPU $BOOT_CPU"
+		exit 1
+	}
+	echo member > cpuset.cpus.partition
+	echo "" > cpuset.cpus
+	cd $CGROUP2
+	echo "$TEST_NAME test PASSED."
+}
+
+#
+# Exercise the same type-change validation failure for a remote partition.
+#
+test_remote_partition_type_failure()
+{
+	TEST_NAME="Remote partition type-change validation failure"
+	get_boot_isolated_cpu "$TEST_NAME" || return 0
+	echo "Running $TEST_NAME test ..."
+
+	cd $CGROUP2/test
+	echo member > cpuset.cpus.partition
+	echo +cpuset > cgroup.subtree_control
+	echo $BOOT_CPU > cpuset.cpus
+	echo $BOOT_CPU > cpuset.cpus.exclusive
+	[[ $(cat cpuset.cpus.effective) = "$BOOT_CPU" ]] || {
+		echo "$TEST_NAME test SKIPPED: CPU $BOOT_CPU is unavailable"
+		echo "" > cpuset.cpus.exclusive
+		echo "" > cpuset.cpus
+		cd $CGROUP2
+		return 0
+	}
+	mkdir A1
+	cd A1
+	echo $BOOT_CPU > cpuset.cpus
+	echo $BOOT_CPU > cpuset.cpus.exclusive
+	test_partition isolated
+	echo root > cpuset.cpus.partition
+	grep -q '^root invalid (partition config conflicts with housekeeping setup)$' \
+		cpuset.cpus.partition || {
+		echo "Remote type failure did not produce the expected state"
+		exit 1
+	}
+	[[ $(cat $CGROUP2/cpuset.cpus.effective) = "$CPULIST" ]] || {
+		echo "Remote type failure did not release CPU $BOOT_CPU"
+		exit 1
+	}
+	check_isolcpus "." || {
+		echo "Remote type failure lost boot-isolated CPU $BOOT_CPU"
+		exit 1
+	}
+	echo member > cpuset.cpus.partition
+	echo "" > cpuset.cpus.exclusive
+	echo "" > cpuset.cpus
+	cd ..
+	rmdir A1
+	echo "" > cpuset.cpus.exclusive
+	echo "" > cpuset.cpus
+	cd $CGROUP2
+	echo "$TEST_NAME test PASSED."
+}
+
 #
 # Wait for inotify event for the given file and read it
 # $1: cgroup file to wait for
@@ -1493,5 +1584,7 @@ test_isolated
 test_boot_isolated
 test_child_owned_cpus
 test_housekeeping_cpu_return
+test_partition_type_failure
+test_remote_partition_type_failure
 test_inotify
 echo "All tests PASSED."
-- 
2.43.0

