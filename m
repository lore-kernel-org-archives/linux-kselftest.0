Received: from mail-dl2-f32.google.com (mail-dl2-f32.google.com [74.125.229.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9538C2D1
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 04:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790398533; cv=none; b=YeDqeubUuE8MGAMyA3NnyPvBzUvGYkmwaWrbrDisb9oGUkg14QKXc9qHuGyTO2GJYGK9dIhQ6rQAX2EvWFspU4pH2EMY+30F46ixxYsmezvk/IVfuaBF7bx0h9t9TN4qK/lzTFGPma0UCLLA1BubJN7nym3ZVN9pkhOgSaMqAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790398533; c=relaxed/simple;
	bh=ciKfv1D/qnsCEzjC7GD+5TFDDhR1fB84n6JdVYMOp60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGLemDdQvS5xDBjlCbVolyAjnkIB9T5cMLoLipDs7Xt77UBcwfSDINJ5sN114uRPy9IV+aNif+1xi/6i9r1OOPkHRsRhLVOVWSdhteW6kqqDjrdoG7Y9oirEUABO9BLSUPNvOuYtNmohVkOjexK0GD1lc98t1xap++97N5iNvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kh1QWvCm; arc=none smtp.client-ip=74.125.229.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh1QWvCm"
Received: by mail-dl2-f32.google.com with SMTP id a92af1059eb24-1437b77c274so798828c88.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790398531; x=1791003331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIz/JN9ukuZDr8dYKEEF5/6B8MoCV6AQWav6EuakVBc=;
        b=kh1QWvCmbY2QBeWZLOF9RzDMZRypbTZ8Odd0WfkC1PDEh1bJF3QzUhDtEbqGfd3WMu
         /kJfDz8ALh/32dGQLFJljLhLTFtUWssS2uCLXSxoWX7e/2+7bpgdMSVj0ZdnWirB11GP
         WmullSrXS+hOqTTeYmSdZtsPFFimaaBwwvULZIvmrCKerzmc1GFHbeChjEnDqpAWnRof
         4hubenrUzl4F9n6Zn2bdG1elUwBOq0k0j2KEM580nBGWqK2Vn0rt5RR6btrUGeBWc3co
         Y+tQmtB7IFfDKOtyf9TiB8tQbtdUMVTlUETxh9YRVH/2f0TOzAwCn9NJ1xvEO4oG2U5G
         GR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790398531; x=1791003331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIz/JN9ukuZDr8dYKEEF5/6B8MoCV6AQWav6EuakVBc=;
        b=Hl9pKAwK2KskbKKu3dtbpP92oRH57bnqaT5G9Nd7VvDu2V0d4WN9Jr5FUPksPdQ1Y7
         nQag5WDQiKCzjUbAdmqyE8Q6jgukzIpR/N9ic/XBraVFTUhh3ihkuXMTxZzSiruVRHhL
         gvE8mPfq5UwCPCk/MS57F9AkPxGrfK9TAO7lR3uMIadtGHOvXMimBBWgw2pFDlyuxh+l
         /ClLUdgBwTf3SEEjEoBJzWqWxamISYwJntdJRdcayoOYu41Rpjb4LDkv0ZVfCgsgki/B
         dCAEE0zQlF5JS6Ttrk09mmk/0q1hiLoc3jTBfNxcTuySMSpawJJ2hZVOXb1Au7gpY5ti
         01/g==
X-Forwarded-Encrypted: i=1; AKwUvBws/d0XwJF1Rb9+xF7di39v86szVbNDA9cmnCVbg4oIn9OB9rrCrqtx8ANkky8nFXmJmPuHSO/ESsCuecZ5PZY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldAVd7cOhA0tZJud65YAcivuJWAYm0IuJcExCrGiWNWTHMl/aS
	IgtyYRDpzgQ0ByONm6SawBMBL/0nOgIDXQxVSSFmVQPNJ04mLYUEhSNf
X-Gm-Gg: AYBFou0pLMmT5bQQVpZXbFlRrOmAky5E6WjywFzTah+0T+E580wpRLgFrK2AfF7CQAh
	g8sWFQrD6yl6XgGABJRVXkMolPG8Sw2dZeKUabLrlIO6F4P+Cg12j67q+CmAwqDGeR4IegKduoA
	8avhgPg+5/2LmSaBQrsReadLIZjAsEm7ufTg0sNirRbNnC+fF2uP9VcZ9VancZrcwMZiaLnb4/E
	s/nE77j827u9fUse6LdrwhHpY2+Kc45P95Wciyxb6gg8TepGfYD8wHfyTUyMlCEUG7AcblJj57z
	ePr06GnrVZmZEQXgq1UD/zhouxtjvWANN7O+dw2gsiS2br6imWllFWpM95HEZmkMQSqK3db57o6
	AW8+Wj/FFRDi+UsFZ5g5WaWitj/Xwah+IE10rPdewsd/7mp1iqnuw+M+5554AgvLSwCC5f5CJ+f
	TNSYrJRY/FsaY0XuOMt7sqzOMBh67ipvGLWvKNTvCULM3G1WbcDTy35FRfYVoZ1fVdRBBVdAMQ5
	My10hdi2+v9mZlh+DmkaRgIilcfmp9seYdpj0WZDTBDdk5rFnqjItX3zZmX036PnyNiINvnARrd
	fQeSVg7b5dG+u1wRA2DOsoeZ2OZv+KTEQZZ1IPjQa3wRUutXppI9V9LQKLAWCdFFyhEBdg==
X-Received: by 2002:a05:701b:220a:b0:13e:5c8f:ff87 with SMTP id a92af1059eb24-146cfcdabe2mr2547964c88.23.1790398530493;
        Fri, 25 Sep 2026 21:55:30 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm9334211c88.15.2026.09.25.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:55:30 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH v2 1/4] selftests: zram: track owned devices and report cleanup failures
Date: Sat, 26 Sep 2026 12:55:14 +0800
Message-ID: <20260926045517.3458413-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hot_add returns the lowest available device ID, which need not equal the
number of existing devices. With devices 0 and 2 present, the tests
allocate device 1 but configure and clean up device 2. Record the returned
IDs and successful swap and mount activations instead of assuming ranges.

Stop zram01 before filling after mount failure. Remove only directories
created for successful mounts, and preserve devices when swapoff or
unmount fails, avoiding deletion through a mount cleanup could not release.

Wait for udev probes before reset and removal: a worker holding the device
open can cause EBUSY. Bound these waits and treat timeouts as warnings,
since unrelated events can delay the global queue. Propagate actual
teardown errors while continuing cleanup of other devices. Preserve both
test results in the registered runner so zram02 cannot hide zram01 failure.

Propagate swap activation and swapoff errors to the test result.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 tools/testing/selftests/zram/zram.sh     |   9 ++
 tools/testing/selftests/zram/zram01.sh   |   9 +-
 tools/testing/selftests/zram/zram02.sh   |   9 +-
 tools/testing/selftests/zram/zram_lib.sh | 161 ++++++++++++++++-------
 4 files changed, 136 insertions(+), 52 deletions(-)

diff --git a/tools/testing/selftests/zram/zram.sh b/tools/testing/selftests/zram/zram.sh
index b0b91d9b0dc2..b597cf186835 100755
--- a/tools/testing/selftests/zram/zram.sh
+++ b/tools/testing/selftests/zram/zram.sh
@@ -5,12 +5,21 @@ TCID="zram.sh"
 . ./zram_lib.sh
 
 run_zram () {
+local ret status
+
 echo "--------------------"
 echo "running zram tests"
 echo "--------------------"
 ./zram01.sh
+ret=$?
 echo ""
 ./zram02.sh
+status=$?
+if [ "$status" -ne 0 ] &&
+   { [ "$ret" -eq 0 ] || [ "$ret" -eq "$ksft_skip" ]; }; then
+	ret=$status
+fi
+return "$ret"
 }
 
 check_prereqs
diff --git a/tools/testing/selftests/zram/zram01.sh b/tools/testing/selftests/zram/zram01.sh
index 8f4affe34f3e..185f68471b7b 100755
--- a/tools/testing/selftests/zram/zram01.sh
+++ b/tools/testing/selftests/zram/zram01.sh
@@ -33,7 +33,7 @@ zram_algs="lzo"
 
 zram_fill_fs()
 {
-	for i in $(seq $dev_start $dev_end); do
+	for i in $dev_ids; do
 		echo "fill zram$i..."
 		local b=0
 		while [ true ]; do
@@ -57,19 +57,20 @@ zram_fill_fs()
 }
 
 check_prereqs
-zram_load
+zram_load || { zram_cleanup; exit 1; }
 zram_max_streams
 zram_compress_alg
 zram_set_disksizes
 zram_set_memlimit
 zram_makefs
-zram_mount
+zram_mount || { zram_cleanup; exit 1; }
 
 zram_fill_fs
-zram_cleanup
+zram_cleanup || ERR_CODE=1
 
 if [ $ERR_CODE -ne 0 ]; then
 	echo "$TCID : [FAIL]"
+	exit 1
 else
 	echo "$TCID : [PASS]"
 fi
diff --git a/tools/testing/selftests/zram/zram02.sh b/tools/testing/selftests/zram/zram02.sh
index 2418b0c4ed13..2420dda987d4 100755
--- a/tools/testing/selftests/zram/zram02.sh
+++ b/tools/testing/selftests/zram/zram02.sh
@@ -29,16 +29,17 @@ zram_sizes="1048576" # 1M
 zram_mem_limits="1M"
 
 check_prereqs
-zram_load
+zram_load || { zram_cleanup; exit 1; }
 zram_max_streams
 zram_set_disksizes
 zram_set_memlimit
-zram_makeswap
-zram_swapoff
-zram_cleanup
+zram_makeswap || ERR_CODE=1
+zram_swapoff || ERR_CODE=1
+zram_cleanup || ERR_CODE=1
 
 if [ $ERR_CODE -ne 0 ]; then
 	echo "$TCID : [FAIL]"
+	exit 1
 else
 	echo "$TCID : [PASS]"
 fi
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 0d44d83888f9..4b134f70726d 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -5,10 +5,10 @@
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 # Modified: Naresh Kamboju <naresh.kamboju@linaro.org>
 
-dev_makeswap=-1
-dev_mounted=-1
-dev_start=0
-dev_end=-1
+# IDs returned by hot_add, in allocation order; old kernels use 0..dev_num-1.
+dev_ids=""
+dev_swap_ids=""
+dev_mount_ids=""
 module_load=-1
 sys_control=-1
 # Kselftest framework requirement - SKIP code is 4.
@@ -44,32 +44,72 @@ kernel_gte()
 	return 1
 }
 
+zram_wait_for_udev()
+{
+	# Probing triggered by device changes can still hold the device open.
+	# The queue is global; only the subsequent teardown can establish failure.
+	if command -v udevadm >/dev/null 2>&1; then
+		udevadm settle --timeout=5 ||
+			echo "udev queue did not settle; attempting cleanup" >&2
+	fi
+	return 0
+}
+
 zram_cleanup()
 {
 	echo "zram cleanup"
 	local i=
-	for i in $(seq $dev_start $dev_makeswap); do
-		swapoff /dev/zram$i
+	local ret=0
+	local busy_ids=""
+	for i in $dev_ids; do
+		case " $dev_swap_ids " in
+			*" $i "*) ;;
+			*)
+				# A signal can arrive after a helper activates swap but
+				# before its caller records the ID.
+				grep -q "^/dev/zram${i}[[:space:]]" /proc/swaps ||
+					continue
+				;;
+		esac
+		if ! swapoff /dev/zram$i; then
+			ret=1
+			busy_ids="$busy_ids $i"
+		fi
 	done
 
-	for i in $(seq $dev_start $dev_mounted); do
-		umount /dev/zram$i
+	for i in $dev_mount_ids; do
+		if ! umount /dev/zram$i; then
+			ret=1
+			busy_ids="$busy_ids $i"
+		fi
 	done
 
-	for i in $(seq $dev_start $dev_end); do
-		echo 1 > /sys/block/zram${i}/reset
-		rm -rf zram$i
+	zram_wait_for_udev
+	for i in $dev_ids; do
+		case " $busy_ids " in
+			*" $i "*) continue ;;
+		esac
+		echo 1 > /sys/block/zram${i}/reset || ret=1
+		case " $dev_mount_ids " in
+			*" $i "*) rmdir "zram$i" || ret=1 ;;
+		esac
 	done
+	# Reset emits another device-change event before removal.
+	zram_wait_for_udev
 
 	if [ $sys_control -eq 1 ]; then
-		for i in $(seq $dev_start $dev_end); do
-			echo $i > /sys/class/zram-control/hot_remove
+		for i in $dev_ids; do
+			case " $busy_ids " in
+				*" $i "*) continue ;;
+			esac
+			echo $i > /sys/class/zram-control/hot_remove || ret=1
 		done
 	fi
 
 	if [ $module_load -eq 1 ]; then
-		rmmod zram > /dev/null 2>&1
+		rmmod zram || ret=1
 	fi
+	return "$ret"
 }
 
 zram_load()
@@ -80,15 +120,23 @@ zram_load()
 	if [ -d "/sys/class/zram-control" ]; then
 		echo "zram modules already loaded, kernel supports" \
 			"zram-control interface"
-		dev_start=$(ls /dev/zram* | wc -w)
-		dev_end=$(($dev_start + $dev_num - 1))
 		sys_control=1
 
-		for i in $(seq $dev_start $dev_end); do
-			cat /sys/class/zram-control/hot_add > /dev/null
+		for i in $(seq 1 $dev_num); do
+			if ! id=$(cat /sys/class/zram-control/hot_add); then
+				echo "FAIL zram hot_add failed" >&2
+				return 1
+			fi
+			case "$id" in
+				''|*[!0-9]*)
+					echo "FAIL invalid zram hot_add ID: $id" >&2
+					return 1
+					;;
+			esac
+			dev_ids="$dev_ids $id"
 		done
 
-		echo "all zram devices (/dev/zram$dev_start~$dev_end" \
+		echo "all zram devices ($dev_ids)" \
 			"successfully created"
 		return 0
 	fi
@@ -112,8 +160,11 @@ zram_load()
 	fi
 
 	module_load=1
-	dev_end=$(($dev_num - 1))
-	echo "all zram devices (/dev/zram0~$dev_end) successfully created"
+	local last=$(($dev_num - 1))
+	for i in $(seq 0 $last); do
+		dev_ids="$dev_ids $i"
+	done
+	echo "all zram devices (/dev/zram0~$last) successfully created"
 }
 
 zram_max_streams()
@@ -127,8 +178,10 @@ zram_max_streams()
 		return 0
 	fi
 
-	local i=$dev_start
+	set -- $dev_ids
 	for max_s in $zram_max_streams; do
+		local i=$1
+		shift
 		local sys_path="/sys/block/zram${i}/max_comp_streams"
 		echo $max_s > $sys_path || \
 			echo "FAIL failed to set '$max_s' to $sys_path"
@@ -138,7 +191,6 @@ zram_max_streams()
 		[ "$max_s" -ne "$max_streams" ] && \
 			echo "FAIL can't set max_streams '$max_s', get $max_stream"
 
-		i=$(($i + 1))
 		echo "$sys_path = '$max_streams'"
 	done
 
@@ -149,15 +201,17 @@ zram_compress_alg()
 {
 	echo "test that we can set compression algorithm"
 
-	local i=$dev_start
+	set -- $dev_ids
+	local i=$1
 	local algs=$(cat /sys/block/zram${i}/comp_algorithm)
 	echo "supported algs: $algs"
 
 	for alg in $zram_algs; do
+		local i=$1
+		shift
 		local sys_path="/sys/block/zram${i}/comp_algorithm"
 		echo "$alg" >	$sys_path || \
 			echo "FAIL can't set '$alg' to $sys_path"
-		i=$(($i + 1))
 		echo "$sys_path = '$alg'"
 	done
 
@@ -167,13 +221,14 @@ zram_compress_alg()
 zram_set_disksizes()
 {
 	echo "set disk size to zram device(s)"
-	local i=$dev_start
+	set -- $dev_ids
 	for ds in $zram_sizes; do
+		local i=$1
+		shift
 		local sys_path="/sys/block/zram${i}/disksize"
 		echo "$ds" >	$sys_path || \
 			echo "FAIL can't set '$ds' to $sys_path"
 
-		i=$(($i + 1))
 		echo "$sys_path = '$ds'"
 	done
 
@@ -184,13 +239,14 @@ zram_set_memlimit()
 {
 	echo "set memory limit to zram device(s)"
 
-	local i=$dev_start
+	set -- $dev_ids
 	for ds in $zram_mem_limits; do
+		local i=$1
+		shift
 		local sys_path="/sys/block/zram${i}/mem_limit"
 		echo "$ds" >	$sys_path || \
 			echo "FAIL can't set '$ds' to $sys_path"
 
-		i=$(($i + 1))
 		echo "$sys_path = '$ds'"
 	done
 
@@ -200,46 +256,59 @@ zram_set_memlimit()
 zram_makeswap()
 {
 	echo "make swap with zram device(s)"
-	local i=$dev_start
-	for i in $(seq $dev_start $dev_end); do
+	local i
+	local ret=0
+	for i in $dev_ids; do
 		mkswap /dev/zram$i > err.log 2>&1
 		if [ $? -ne 0 ]; then
 			cat err.log
-			echo "FAIL mkswap /dev/zram$1 failed"
+			echo "FAIL mkswap /dev/zram$i failed"
+			ret=1
+			continue
 		fi
 
 		swapon /dev/zram$i > err.log 2>&1
 		if [ $? -ne 0 ]; then
 			cat err.log
-			echo "FAIL swapon /dev/zram$1 failed"
+			echo "FAIL swapon /dev/zram$i failed"
+			ret=1
+			continue
 		fi
 
 		echo "done with /dev/zram$i"
-		dev_makeswap=$i
+		dev_swap_ids="$dev_swap_ids $i"
 	done
 
-	echo "zram making zram mkswap and swapon: OK"
+	[ "$ret" -eq 0 ] && echo "zram making zram mkswap and swapon: OK"
+	return "$ret"
 }
 
 zram_swapoff()
 {
 	local i=
-	for i in $(seq $dev_start $dev_end); do
+	local failed_ids=""
+	local ret=0
+	for i in $dev_swap_ids; do
 		swapoff /dev/zram$i > err.log 2>&1
 		if [ $? -ne 0 ]; then
 			cat err.log
 			echo "FAIL swapoff /dev/zram$i failed"
+			ret=1
+			failed_ids="$failed_ids $i"
 		fi
 	done
-	dev_makeswap=-1
+	dev_swap_ids=$failed_ids
 
-	echo "zram swapoff: OK"
+	[ "$ret" -eq 0 ] && echo "zram swapoff: OK"
+	return "$ret"
 }
 
 zram_makefs()
 {
-	local i=$dev_start
+	set -- $dev_ids
 	for fs in $zram_filesystems; do
+		local i=$1
+		shift
 		# if requested fs not supported default it to ext2
 		which mkfs.$fs > /dev/null 2>&1 || fs=ext2
 
@@ -249,7 +318,6 @@ zram_makefs()
 			cat err.log
 			echo "FAIL failed to make $fs on /dev/zram$i"
 		fi
-		i=$(($i + 1))
 		echo "zram mkfs.$fs: OK"
 	done
 }
@@ -257,13 +325,18 @@ zram_makefs()
 zram_mount()
 {
 	local i=0
-	for i in $(seq $dev_start $dev_end); do
+	for i in $dev_ids; do
 		echo "mount /dev/zram$i"
-		mkdir zram$i
-		mount /dev/zram$i zram$i > /dev/null || \
+		mkdir "zram$i" || return 1
+		if mount /dev/zram$i "zram$i" > /dev/null; then
+			dev_mount_ids="$dev_mount_ids $i"
+		else
 			echo "FAIL mount /dev/zram$i failed"
-		dev_mounted=$i
+			rmdir "zram$i" || return 1
+			return 1
+		fi
 	done
 
 	echo "zram mount of zram device(s): OK"
+	return 0
 }
-- 
2.55.0

