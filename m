Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ADB3AA1A8
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957877; cv=none; b=Mg47YsbVpUtASDJb7lf92luRVXKxB3WHvaTHDooZ0ptrWRU4PYEtPHLivArNDIP0WmgFDGrxlLXm7Ry4CbXKov3WIgHBlfZM6P8x05gVYSmH69xEaEc41hOanr2rdoVWauPUbmAudaktzI2DX9s/uOECpPsWJga/5FDgh1rwAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957877; c=relaxed/simple;
	bh=MOHg8GNucDfsNquw43LHOfCrdChFF0YE3N1a8S/iBrA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bWcxnevZeGSmpQUv7xM1UGVshMA330Beg6boEuiP4X1id0gE28lTZ+q9GR93RJ/8AXXhzEUz2onDkEyzrjt/DQcmi1/a+V0xno364UoJde4m6gmz+vhCbTnn2VauSQDjCer9SNDHLLWELQ7SjnlsnMjBvDbfL4VYJQ9ZpURv5YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WuMEOKSw; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WuMEOKSw"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-66aab34ff9cso7608973a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774957874; x=1775562674; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WRloscZyoQNUj+6jOFuo3gKcXIEEqAMmJol3GtAnhZc=;
        b=WuMEOKSwDPh3h3OkCFSCZTH8PnSJbor1sFst0kaUDmp86rGU2Aw3q/txvsStEafhi3
         0U5bdLNC3XwTUYcE2MLaGmg4H4OofsrDipNfCKIGzNcUivNQvHGbJE8F5vib5WPjXlBQ
         hozVGIMlJOav3BduL26sAiV4Lhx1gtXrIoky0yEHkEHjRWrmuQV6sEcf8cTT1fTgxV5S
         qpcbQgwnzcqQMCMLv4cBZrUfJ9zr2PE82AqXZaQdK6xgOUZ3u1HZquK88gD8/XV32Sqo
         WbKyBTDlMSwEUYBzh60UQ1bYovbP7BLugWjctaKUfiC6y2dDvLZR38eNoonAMfq7FttL
         2Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774957874; x=1775562674;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRloscZyoQNUj+6jOFuo3gKcXIEEqAMmJol3GtAnhZc=;
        b=QgQrnRcxwv0ohdr9+1/c4w6YCNpnQJTEMZZYaW9zNYJQJVr3CAVrxLmP5T435iYLrP
         fW+o1WiXESUZGrLgow2ajPsqliLerLyLpljRWY3kORYMAe75TFCXwX2OEGJFu7JlZA1t
         dgnQ11INzxvm6dezws9ECmCoANanyXO2jC4QVYG0/AaT9SFDqsBLbdKZTp7ReayNTQrC
         J8Z7PK50+pUrYDm3d5ncrvA6YMIVUHqODrGimSJMpduAEwHGnYAMfidwFdCgMhIpNdhp
         Y0VIIIhpdgzYB3xgzZVNdFQyOUs0DO50pVC0zQJFtB7gWFA4NJD3kvHsKqRkeYPbEyFI
         70vg==
X-Forwarded-Encrypted: i=1; AJvYcCXUNWgy7JU9LfnusMtrWgI9Fu8ucf2n7Co68bohURJEr3Mb5UwV1rwjr6UrdtGBVNtaWx7Wy7FEZ1kKM8PB8ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd58JqBkdm6Ous3oGX5ii+enkReVKHbUhYSQm5YVSN1mc9zAo9
	rulcTjv8N9vL18Np7oo4kVbVVHD2TmWo/bPU+5qrVtsmFGJ7W1I4sSipCjsB4epPgRSPdmhdeI/
	r7fonlA==
X-Received: from eddz21.prod.google.com ([2002:a05:6402:2755:b0:662:582d:af8e])
 (user=hmazur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:21da:b0:668:3afb:a775
 with SMTP id 4fb4d7f45d1cf-66b28c6ad07mr8185674a12.18.1774957873686; Tue, 31
 Mar 2026 04:51:13 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:51:10 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331115111.1522473-1-hmazur@google.com>
Subject: [PATCH v2] selftests/cpu-hotplug: Make the script complaint with sh shell
From: Hubert Mazur <hmazur@google.com>
To: Shuah Khan <shuah@kernel.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: Lukasz Majczak <lmajczak@google.com>, Slawomir Rosek <srosek@google.com>, Wake Liu <wakel@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hubert Mazur <hmazur@google.com>
Content-Type: text/plain; charset="UTF-8"

The script uses by default the bash shell that is inaccessible in
the x86 embedded devices. This leads to the syntax errors. To mitigate
this, change the interpreter to /bin/sh and rework the prints from echo
to printf to make it more robust and posix compliant. Change the
conditional check for being a root from not existent UID and replace
with command execution "id -u".

Signed-off-by: Hubert Mazur <hmazur@google.com>
---

Changes in v2:
- Fix issues reported with sashiko.dev
  - https://sashiko.dev/#/patchset/20260318080825.3063959-2-hmazur%40google.com
- Make sure the script is compliant with strict posix shells
- Test the script syntax on busybox

Link to v1:
- https://lore.kernel.org/all/20260318080825.3063959-2-hmazur@google.com/

 .../selftests/cpu-hotplug/cpu-on-off-test.sh  | 74 ++++++++++---------
 1 file changed, 40 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 6232a46ca6e1..a91c8e47fe46 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
 SYSFS=
@@ -10,8 +10,8 @@ prerequisite()
 {
 	msg="skip all tests:"
 
-	if [ $UID != 0 ]; then
-		echo $msg must be run as root >&2
+	if [ $(id -u) -ne 0 ]; then
+		printf "%s must be run as root\n" "$msg" >&2
 		exit $ksft_skip
 	fi
 
@@ -20,37 +20,37 @@ prerequisite()
 	SYSFS=`mount -t sysfs | head -1 | awk '{ print $3 }'`
 
 	if [ ! -d "$SYSFS" ]; then
-		echo $msg sysfs is not mounted >&2
+		printf "%s sysfs is not mounted\n" "$msg" >&2
 		exit $ksft_skip
 	fi
 
 	if ! ls $SYSFS/devices/system/cpu/cpu* > /dev/null 2>&1; then
-		echo $msg cpu hotplug is not supported >&2
+		printf "%s cpu hotplug is not supported\n" "$msg" >&2
 		exit $ksft_skip
 	fi
 
-	echo "CPU online/offline summary:"
+	printf "CPU online/offline summary:\n"
 	online_cpus=`cat $SYSFS/devices/system/cpu/online`
 	online_max=${online_cpus##*-}
 
-	if [[ "$online_cpus" = "$online_max" ]]; then
-		echo "$msg: since there is only one cpu: $online_cpus"
+	if [ "$online_cpus" = "$online_max" ]; then
+		printf "%s since there is only one cpu: %s\n" "$msg" "$online_cpus"
 		exit $ksft_skip
 	fi
 
 	present_cpus=`cat $SYSFS/devices/system/cpu/present`
 	present_max=${present_cpus##*-}
-	echo "present_cpus = $present_cpus present_max = $present_max"
+	printf "present_cpus = %s,  present_max = %s\n" "$present_cpus" "$present_max"
 
-	echo -e "\t Cpus in online state: $online_cpus"
+	printf "\t Cpus in online state: %s\n" "$online_cpus"
 
 	offline_cpus=`cat $SYSFS/devices/system/cpu/offline`
-	if [[ "a$offline_cpus" = "a" ]]; then
+	if [ "a$offline_cpus" = "a" ]; then
 		offline_cpus=0
 	else
 		offline_max=${offline_cpus##*-}
 	fi
-	echo -e "\t Cpus in offline state: $offline_cpus"
+	printf "\t Cpus in offline state: %s\n" "$offline_cpus"
 }
 
 #
@@ -62,7 +62,7 @@ hotpluggable_cpus()
 
 	for cpu in $SYSFS/devices/system/cpu/cpu*; do
 		if [ -f $cpu/online ] && grep -q $state $cpu/online; then
-			echo ${cpu##/*/cpu}
+			printf "%s\n" "${cpu##/*/cpu}"
 		fi
 	done
 }
@@ -99,39 +99,44 @@ offline_cpu()
 
 online_cpu_expect_success()
 {
+	FUNC="online_cpu_expect_success()"
 	local cpu=$1
 
 	if ! online_cpu $cpu; then
-		echo $FUNCNAME $cpu: unexpected fail >&2
+		printf "%s %s: unexpected fail\n" "$FUNC" "$cpu" >&2
 		retval=1
 	elif ! cpu_is_online $cpu; then
-		echo $FUNCNAME $cpu: unexpected offline >&2
+		printf "%s %s: unexpected offline\n" "$FUNC" "$cpu" >&2
 		retval=1
 	fi
 }
 
 online_cpu_expect_fail()
 {
+
+	FUNC="online_cpu_expect_fail()"
 	local cpu=$1
 
 	if online_cpu $cpu 2> /dev/null; then
-		echo $FUNCNAME $cpu: unexpected success >&2
+		printf "%s %s: unexpected success\n" "$FUNC" "$cpu" >&2
 		retval=1
 	elif ! cpu_is_offline $cpu; then
-		echo $FUNCNAME $cpu: unexpected online >&2
+		printf "%s %s: unexpected online\n" "$FUNC" "$cpu" >&2
 		retval=1
 	fi
 }
 
 offline_cpu_expect_success()
 {
+
+	FUNC="offline_cpu_expect_success()"
 	local cpu=$1
 
 	if ! offline_cpu $cpu; then
-		echo $FUNCNAME $cpu: unexpected fail >&2
+		printf "%s %s: unexpected fail\n" "$FUNC" "$cpu" >&2
 		retval=1
 	elif ! cpu_is_offline $cpu; then
-		echo $FUNCNAME $cpu: unexpected offline >&2
+		printf "%s %s: unexpected offline\n" "$FUNC" "$cpu" >&2
 		retval=1
 	fi
 }
@@ -139,12 +144,13 @@ offline_cpu_expect_success()
 offline_cpu_expect_fail()
 {
 	local cpu=$1
+	FUNC="offline_cpu_expect_fail()"
 
 	if offline_cpu $cpu 2> /dev/null; then
-		echo $FUNCNAME $cpu: unexpected success >&2
+		printf "%s %s: unexpected success\n" "$FUNC" "$cpu" >&2
 		retval=1
 	elif ! cpu_is_online $cpu; then
-		echo $FUNCNAME $cpu: unexpected offline >&2
+		printf "%s %s: unexpected offline\n" "$FUNC" "$cpu" >&2
 		retval=1
 	fi
 }
@@ -182,9 +188,9 @@ while getopts ah opt; do
 		allcpus=1
 		;;
 	h)
-		echo "Usage $0 [ -a ]"
-		echo -e "\t default offline one cpu"
-		echo -e "\t run with -a option to offline all cpus"
+		printf "Usage %s [ -a ]\n" "$0"
+		printf "\t default offline one cpu\n"
+		printf "\t run with -a option to offline all cpus\n"
 		exit
 		;;
 	esac
@@ -195,25 +201,25 @@ prerequisite
 #
 # Safe test (default) - offline and online one cpu
 #
-if [ $allcpus -eq 0 ]; then
-	echo "Limited scope test: one hotplug cpu"
-	echo -e "\t (leaves cpu in the original state):"
-	echo -e "\t online to offline to online: cpu $online_max"
+if [ "$allcpus" -eq 0 ]; then
+	printf "Limited scope test: one hotplug cpu\n"
+	printf "\t (leaves cpu in the original state):\n"
+	printf "\t online to offline to online: cpu %s\n" "$online_max"
 	offline_cpu_expect_success $online_max
 	online_cpu_expect_success $online_max
 
-	if [[ $offline_cpus -gt 0 ]]; then
-		echo -e "\t online to offline to online: cpu $present_max"
+	if [ "$offline_cpus" -gt 0 ]; then
+		printf "\t online to offline to online: cpu %s\n" "$present_max"
 		online_cpu_expect_success $present_max
 		offline_cpu_expect_success $present_max
 		online_cpu $present_max
 	fi
 	exit $retval
 else
-	echo "Full scope test: all hotplug cpus"
-	echo -e "\t online all offline cpus"
-	echo -e "\t offline all online cpus"
-	echo -e "\t online all offline cpus"
+	printf "Full scope test: all hotplug cpus\n"
+	printf "\t online all offline cpus\n"
+	printf "\t offline all online cpus\n"
+	printf "\t online all offline cpus\n"
 fi
 
 online_all_hot_pluggable_cpus
-- 
2.53.0.1018.g2bb0e51243-goog

