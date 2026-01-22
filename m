Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A703C0881
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118278; cv=none; b=GseGhzUAIyvUQKlZwE2apj72nxU9j76Hvc0gYXD3q3e0h49WI1NeqbF7mxMOVBIjviDuyXIFx7Rvz8UFyYT5l841a2ulD4hbLE9mt/4iZ7Jh1yNfMbMOqRIZFV2JvNsrTJIC3ITph4swDEfxVSEIdgM+AZIAYos+zmFfDgJ9adM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118278; c=relaxed/simple;
	bh=aadm7jOZAi1kOC8JS9AGpDTaYFuNRw6u/dHgv9v63cw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tssdbERPmhdmxWTErBnoEV28ddjxvt9gBTOLH3q/d9e0Qi31rq8vWoYnwx3CtVQgQU+qOsYy9vqKBEqEdiw/ur9CI/+wwScSStiIBcKuKFCVt2BsJkn5kVF5BK0wEX4gUxN6lgdQpGA6Kt9NAyaMJv0Ny3+eWnMM6qjCP9YrYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JJdiBxTM; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JJdiBxTM"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b72c11c64dso2470699eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 13:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769118268; x=1769723068; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKtdJ1Um+ioXTalulgc0FZS9uRQNlR4c3Y/lciWq6zo=;
        b=JJdiBxTMDmZfNWjEhdQiN366CvJ/f98VYfbPmztPcBU2Y+6UUp3iPWuuYWrivndN9z
         T3gSBL9aLFe87vyrzOLVGQSAwbUEEHDepysnQ8Pu/52AY5j9/u3KchhxZB1uDhwQVqLp
         3Eudv1vUOTY/B46Y/3eOH81juFsd2RrrNj2ZsyUZL6FBsgl6XfWKOqKcXYuOZjs5ZQsl
         kfTKm83dahVeqptC4hUAGQU1J+3jhHCEO/GACvNcpR79u4Ed+bFH6Sm3zvbvQ/doUoHw
         QWdRKfc4xRgGnNM558EdPLMr8VaClkN79XnZtmmzKD8tHioX4lOoUz4y5kUHVJGCR+is
         oZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769118268; x=1769723068;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKtdJ1Um+ioXTalulgc0FZS9uRQNlR4c3Y/lciWq6zo=;
        b=MWdrtEj8+EY8bALvS8zs+2wCi3t4yaIMqNalUT+71I1x40cdxXVJQbY7fI2E12pN0i
         aluLYx4HtXLadJjY0WCT5Ln1XUV8bDq3UqCzUvQc5+vroEhnhCzLzX78uqxV2UtPWkws
         I2/EygPaSpPasN55RoyW2xoui7bRySGjfNxZd9hU/wSOyspR3R/q3AQSAqaaqqHL4sRX
         7e5uRoGBM81DmYv6WNlY3khu/UN7tcG9ZAR3+iSDN1ZX69krsfltRsH708vP3ogROekc
         u5lVP17gQQOFjxwDnpU7unyW5VNI5umWzk2x9nqXm1JsihMuLca/reanNA/5/xBS2q3J
         WZmA==
X-Forwarded-Encrypted: i=1; AJvYcCXUlACVsOkxZuQPCibbuBjrxOiN2Z7QYHUS0FEz0g5QEg1xRN/m4pKqixm8Wzd9v7Gv+07sZng7gKKXgmUigns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWkjrHo3lPjBeY81ilgwx54xM78xf1qnJGfoAVL0GNEVJ1kXC
	wtqLJU5lPFwAye/tkOVUI5c4aDpiP36OQgNJMoFhdmrhGdC3KC2sgHB5nZUHx1rzz5Ysu8ZuKmA
	dlj30D8FaBSHVDdcwsUlMzkh68/bClR/PpuawpQ==
X-Received: from dlb34.prod.google.com ([2002:a05:7022:622:b0:123:35cc:b60f])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1f12:b0:2b1:7486:3a6e with SMTP id 5a478bee46e88-2b739998ca8mr411363eec.12.1769118268376;
 Thu, 22 Jan 2026 13:44:28 -0800 (PST)
Date: Thu, 22 Jan 2026 21:44:27 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122214427.3568647-1-jordanrichards@google.com>
Subject: [PATCH] selftests/liveupdate: add end to end test infrastructure and scripts
From: Jordan Richards <jordanrichards@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Jason Miu <jasonmiu@google.com>, David Matlack <dmatlack@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jordan Richards <jordanrichards@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Add the end to end testing infrastructure required to verify the
liveupdate feature. This includes a custom init process, a test
orchestration script, and a batch runner.

The framework consists of:

init.c:
A lightweight init process that manages the kexec lifecycle.
It mounts necessary filesystems, determines the current execution
stage (1 or 2) via the kernel command line, and handles the
kexec_file_load() sequence to transition between kernels.

luo_test.sh:
The primary KTAP-compliant test driver. It handles:
- Kernel configuration merging and building.
- Cross-compilation detection for x86_64 and arm64.
- Generation of the initrd containing the test binary and init.
- QEMU execution with automatic accelerator detection (KVM, HVF,
 or TCG).

run.sh:
A wrapper script to discover and execute all `luo_*.c`
tests across supported architectures, providing a summary of
pass/fail/skip results.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Co-developed-by: Jordan Richards <jordanrichards@google.com>
Signed-off-by: Jordan Richards <jordanrichards@google.com>
---
Changelog since luo v7 [1]:
- Build test binaries with `-nostdlib -nostdinc`
- Use minimal per-arch config instead of defconfig
- Unhandled test errors now cause the test to fail instead of skip

[1] https://lore.kernel.org/all/20251122222351.1059049-20-pasha.tatashin@soleen.com/


 tools/testing/selftests/liveupdate/.gitignore |   2 +
 tools/testing/selftests/liveupdate/config     |   1 +
 .../selftests/liveupdate/config.aarch64       |   2 +
 .../selftests/liveupdate/config.x86_64        |   2 +
 tools/testing/selftests/liveupdate/init.c     | 179 +++++++++++
 .../testing/selftests/liveupdate/luo_test.sh  | 303 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     |  35 +-
 tools/testing/selftests/liveupdate/run.sh     |  68 ++++
 8 files changed, 579 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/config.aarch64
 create mode 100644 tools/testing/selftests/liveupdate/config.x86_64
 create mode 100644 tools/testing/selftests/liveupdate/init.c
 create mode 100755 tools/testing/selftests/liveupdate/luo_test.sh
 create mode 100755 tools/testing/selftests/liveupdate/run.sh

diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/testing/selftests/liveupdate/.gitignore
index 661827083ab6..7dc1e8aec44c 100644
--- a/tools/testing/selftests/liveupdate/.gitignore
+++ b/tools/testing/selftests/liveupdate/.gitignore
@@ -6,4 +6,6 @@
 !*.sh
 !.gitignore
 !config
+!config.aarch64
+!config.x86_64
 !Makefile
diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 91d03f9a6a39..016d009dba13 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -1,4 +1,5 @@
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_DEVTMPFS=y
 CONFIG_KEXEC_FILE=y
 CONFIG_KEXEC_HANDOVER=y
 CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=y
diff --git a/tools/testing/selftests/liveupdate/config.aarch64 b/tools/testing/selftests/liveupdate/config.aarch64
new file mode 100644
index 000000000000..445716403925
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/config.aarch64
@@ -0,0 +1,2 @@
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
diff --git a/tools/testing/selftests/liveupdate/config.x86_64 b/tools/testing/selftests/liveupdate/config.x86_64
new file mode 100644
index 000000000000..810d9c9d213e
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/config.x86_64
@@ -0,0 +1,2 @@
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
diff --git a/tools/testing/selftests/liveupdate/init.c b/tools/testing/selftests/liveupdate/init.c
new file mode 100644
index 000000000000..52a96d45f164
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/init.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+#include <fcntl.h>
+#include <linux/kexec.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/reboot.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#define COMMAND_LINE_SIZE 2048
+#define KERNEL_IMAGE "/kernel"
+#define INITRD_IMAGE "/initrd.img"
+#define TEST_BINARY "/test_binary"
+
+static int mount_filesystems(void)
+{
+	if (mount("devtmpfs", "/dev", "devtmpfs", 0, NULL) < 0) {
+		fprintf(stderr, "INIT: Warning: Failed to mount devtmpfs\n");
+		return -1;
+	}
+
+	if (mount("debugfs", "/debugfs", "debugfs", 0, NULL) < 0) {
+		fprintf(stderr, "INIT: Failed to mount debugfs\n");
+		return -1;
+	}
+
+	if (mount("proc", "/proc", "proc", 0, NULL) < 0) {
+		fprintf(stderr, "INIT: Failed to mount proc\n");
+		return -1;
+	}
+
+	return 0;
+}
+
+static long kexec_file_load(int kernel_fd, int initrd_fd,
+			    unsigned long cmdline_len, const char *cmdline,
+			    unsigned long flags)
+{
+	return syscall(__NR_kexec_file_load, kernel_fd, initrd_fd, cmdline_len,
+		       cmdline, flags);
+}
+
+static int kexec_load(void)
+{
+	char cmdline[COMMAND_LINE_SIZE];
+	int kernel_fd, initrd_fd, err;
+	ssize_t len;
+	int fd;
+
+	fd = open("/proc/cmdline", O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "INIT: Failed to read /proc/cmdline\n");
+
+		return -1;
+	}
+
+	len = read(fd, cmdline, sizeof(cmdline) - 1);
+	close(fd);
+	if (len < 0)
+		return -1;
+
+	cmdline[len] = 0;
+	if (len > 0 && cmdline[len - 1] == '\n')
+		cmdline[len - 1] = 0;
+
+	strncat(cmdline, " luo_stage=2", sizeof(cmdline) - strlen(cmdline) - 1);
+
+	kernel_fd = open(KERNEL_IMAGE, O_RDONLY);
+	if (kernel_fd < 0) {
+		fprintf(stderr, "INIT: Failed to open kernel image\n");
+		return -1;
+	}
+
+	initrd_fd = open(INITRD_IMAGE, O_RDONLY);
+	if (initrd_fd < 0) {
+		fprintf(stderr, "INIT: Failed to open initrd image\n");
+		close(kernel_fd);
+		return -1;
+	}
+
+	err = kexec_file_load(kernel_fd, initrd_fd, strlen(cmdline) + 1,
+			      cmdline, 0);
+
+	close(initrd_fd);
+	close(kernel_fd);
+
+	return err ? : 0;
+}
+
+static int run_test(int stage)
+{
+	char stage_arg[32];
+	int status;
+	pid_t pid;
+
+	snprintf(stage_arg, sizeof(stage_arg), "%d", stage);
+
+	pid = fork();
+	if (pid < 0)
+		return -1;
+
+	if (!pid) {
+		char *const argv[] = {TEST_BINARY, "-s", stage_arg, NULL};
+
+		execve(TEST_BINARY, argv, NULL);
+		fprintf(stderr, "INIT: execve failed\n");
+		_exit(1);
+	}
+
+	waitpid(pid, &status, 0);
+
+	return (WIFEXITED(status) && WEXITSTATUS(status) == 0) ? 0 : -1;
+}
+
+static int get_current_stage(void)
+{
+	char cmdline[COMMAND_LINE_SIZE];
+	ssize_t len;
+	int fd;
+
+	fd = open("/proc/cmdline", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len = read(fd, cmdline, sizeof(cmdline) - 1);
+	close(fd);
+
+	if (len < 0)
+		return -1;
+
+	cmdline[len] = 0;
+
+	return strstr(cmdline, "luo_stage=2") ? 2 : 1;
+}
+
+int main(int argc, char *argv[])
+{
+	int current_stage;
+	int err;
+
+	if (mount_filesystems())
+		goto err_reboot;
+
+	current_stage = get_current_stage();
+	if (current_stage < 0) {
+		fprintf(stderr, "INIT: Failed to read cmdline");
+		goto err_reboot;
+	}
+
+	printf("INIT: Starting Stage %d\n", current_stage);
+
+	if (current_stage == 1 && kexec_load()) {
+		fprintf(stderr, "INIT: Failed to load kexec kernel\n");
+		goto err_reboot;
+	}
+
+	if (run_test(current_stage)) {
+		fprintf(stderr, "INIT: Test binary returned failure\n");
+		goto err_reboot;
+	}
+
+	printf("INIT: Stage %d completed successfully.\n", current_stage);
+	reboot(current_stage == 1 ? RB_KEXEC : RB_AUTOBOOT);
+
+	return 0;
+
+err_reboot:
+	reboot(RB_AUTOBOOT);
+
+	return -1;
+}
diff --git a/tools/testing/selftests/liveupdate/luo_test.sh b/tools/testing/selftests/liveupdate/luo_test.sh
new file mode 100755
index 000000000000..90ecb16e87bb
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_test.sh
@@ -0,0 +1,303 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -ue
+
+CROSS_COMPILE="${CROSS_COMPILE:-""}"
+
+test_dir=$(realpath "$(dirname "$0")")
+kernel_dir=$(realpath "$test_dir/../../../..")
+
+workspace_dir=""
+headers_dir=""
+initrd=""
+KEEP_WORKSPACE=0
+
+source "$test_dir/../kselftest/ktap_helpers.sh"
+
+function get_arch_conf() {
+	local arch=$1
+	if [[ "$arch" == "arm64" ]]; then
+		QEMU_CMD="qemu-system-aarch64 -M virt -cpu max"
+		KERNEL_IMAGE="Image"
+		KERNEL_CMDLINE="console=ttyAMA0"
+	elif [[ "$arch" == "x86" ]]; then
+		QEMU_CMD="qemu-system-x86_64"
+		KERNEL_IMAGE="bzImage"
+		KERNEL_CMDLINE="console=ttyS0"
+	else
+		echo "Unsupported architecture: $arch"
+		exit 1
+	fi
+}
+
+function usage() {
+	cat <<EOF
+$0 [-d build_dir] [-j jobs] [-t target_arch] [-T test_name] [-w workspace_dir] [-k] [-h]
+Options:
+	-d)	path to the kernel build directory (default: .luo_test_build.<arch>)
+	-j)	number of jobs for compilation
+	-t)	run test for target_arch (aarch64, x86_64)
+	-T)	test name to run (default: luo_kexec_simple)
+	-w)	custom workspace directory (default: creates temp dir)
+	-k)	keep workspace directory after successful test
+	-h)	display this help
+EOF
+}
+
+function cleanup() {
+	local exit_code=$?
+
+	if [ -z "$workspace_dir" ]; then
+		ktap_finished
+		return
+	fi
+
+	if [ $exit_code -ne 0 ]; then
+		echo "# Test failed (exit code $exit_code)."
+		echo "# Workspace preserved at: $workspace_dir"
+	elif [ "$KEEP_WORKSPACE" -eq 1 ]; then
+		echo "# Workspace preserved (user request) at: $workspace_dir"
+	else
+		rm -fr "$workspace_dir"
+	fi
+	ktap_print_totals
+
+	exit $exit_code
+}
+trap cleanup EXIT
+
+function skip() {
+	local msg=${1:-""}
+	ktap_test_skip "$msg"
+	exit "$KSFT_SKIP"
+}
+
+function fail() {
+	local msg=${1:-""}
+	ktap_test_fail "$msg"
+	exit "$KSFT_FAIL"
+}
+
+function detect_cross_compile() {
+	local target=$1
+	local host=$(uname -m)
+
+	if [ -n "$CROSS_COMPILE" ]; then
+		return
+	fi
+
+	[[ "$host" == "arm64" ]] && host="aarch64"
+	[[ "$target" == "arm64" ]] && target="aarch64"
+
+	if [[ "$host" == "$target" ]]; then
+		CROSS_COMPILE=""
+		return
+	fi
+
+	local candidate=""
+	case "$target" in
+		aarch64) candidate="aarch64-linux-gnu-" ;;
+		x86_64)  candidate="x86_64-linux-gnu-" ;;
+		*)       skip "Auto-detection for target '$target' not supported. Please set CROSS_COMPILE manually." ;;
+	esac
+
+	if command -v "${candidate}gcc" &> /dev/null; then
+		CROSS_COMPILE="$candidate"
+	else
+		skip "Compiler '${candidate}gcc' not found. Please install it (e.g., 'apt install gcc-aarch64-linux-gnu') or set CROSS_COMPILE."
+	fi
+}
+
+function build_kernel() {
+	local build_dir=$1
+	local make_cmd=$2
+	local kimage=$3
+	local target_arch=$4
+
+	local kconfig="$build_dir/.config"
+	local common_conf="$test_dir/config"
+	local arch_conf="$test_dir/config.$target_arch"
+
+	echo "# Building kernel in: $build_dir"
+
+	local fragments=()
+
+	if [[ -f "$common_conf" ]]; then
+		fragments+=("$common_conf")
+	fi
+
+	if [[ -f "$arch_conf" ]]; then
+		fragments+=("$arch_conf")
+	fi
+
+	if [[ ${#fragments[@]} > 1 ]]; then
+		echo $fragments
+		"$kernel_dir/scripts/kconfig/merge_config.sh" \
+			-Q -m -O "$build_dir" "${fragments[@]}" >> /dev/null
+	else
+		cp ${fragments[0]} $kconfig
+	fi
+	cat $kconfig
+
+	$make_cmd olddefconfig
+	$make_cmd "$kimage"
+	$make_cmd headers_install INSTALL_HDR_PATH="$headers_dir"
+}
+
+function mkinitrd() {
+	local build_dir=$1
+	local kernel_path=$2
+	local test_name=$3
+
+	# Compile the test binary and the init process
+	"$CROSS_COMPILE"gcc -static -O2 -nostdinc -nostdlib \
+		-I "$headers_dir/include" \
+		-I "$kernel_dir/tools/include/nolibc" \
+		-I "$test_dir" \
+		-o "$workspace_dir/test_binary" \
+		"$test_dir/$test_name.c" "$test_dir/luo_test_utils.c"
+
+	"$CROSS_COMPILE"gcc -s -static -Os -nostdinc -nostdlib		\
+			-fno-asynchronous-unwind-tables -fno-ident	\
+			-fno-stack-protector				\
+			-I "$headers_dir/include"			\
+			-I "$kernel_dir/tools/include/nolibc"		\
+			-o "$workspace_dir/init" "$test_dir/init.c"
+
+	cat > "$workspace_dir/cpio_list_inner" <<EOF
+dir /dev 0755 0 0
+dir /proc 0755 0 0
+dir /debugfs 0755 0 0
+nod /dev/console 0600 0 0 c 5 1
+file /init $workspace_dir/init 0755 0 0
+file /test_binary $workspace_dir/test_binary 0755 0 0
+EOF
+
+	# Generate inner_initrd.cpio
+	"$build_dir/usr/gen_init_cpio" "$workspace_dir/cpio_list_inner" > "$workspace_dir/inner_initrd.cpio"
+
+	cat > "$workspace_dir/cpio_list" <<EOF
+dir /dev 0755 0 0
+dir /proc 0755 0 0
+dir /debugfs 0755 0 0
+nod /dev/console 0600 0 0 c 5 1
+file /init $workspace_dir/init 0755 0 0
+file /kernel $kernel_path 0644 0 0
+file /test_binary $workspace_dir/test_binary 0755 0 0
+file /initrd.img $workspace_dir/inner_initrd.cpio 0644 0 0
+EOF
+
+	# Generate the final initrd
+	"$build_dir/usr/gen_init_cpio" "$workspace_dir/cpio_list" > "$initrd"
+	local size=$(du -h "$initrd" | cut -f1)
+}
+
+function run_qemu() {
+	local qemu_cmd=$1
+	local cmdline=$2
+	local kernel_path=$3
+	local serial="$workspace_dir/qemu.serial"
+
+	local accel="-accel tcg"
+	local host_machine=$(uname -m)
+
+	[[ "$host_machine" == "arm64" ]] && host_machine="aarch64"
+	[[ "$host_machine" == "x86_64" ]] && host_machine="x86_64"
+
+	if [[ "$qemu_cmd" == *"$host_machine"* ]]; then
+		if [ -w /dev/kvm ]; then
+			accel="-accel kvm"
+		fi
+	fi
+
+	cmdline="$cmdline liveupdate=on panic=-1"
+
+	echo "# Serial Log: $serial"
+	timeout 30s $qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults	\
+		  $accel							\
+		  -serial file:"$serial"					\
+		  -append "$cmdline"						\
+		  -kernel "$kernel_path"					\
+		  -initrd "$initrd"
+
+	local ret=$?
+
+	if [ $ret -eq 124 ]; then
+		fail "QEMU timed out"
+	fi
+
+	grep "TEST PASSED" "$serial" &> /dev/null || fail "Liveupdate failed. Check $serial for details."
+}
+
+function target_to_arch() {
+	local target=$1
+	case $target in
+	     aarch64) echo "arm64" ;;
+	     x86_64) echo "x86" ;;
+	     *) skip "architecture $target is not supported"
+	esac
+}
+
+function main() {
+	local build_dir=""
+	local jobs=$(nproc)
+	local target="$(uname -m)"
+	local test_name="luo_kexec_simple"
+	local workspace_arg=""
+
+	set -o errtrace
+	trap fail ERR
+
+	while getopts 'hd:j:t:T:w:k' opt; do
+		case $opt in
+		d) build_dir="$OPTARG" ;;
+		j) jobs="$OPTARG" ;;
+		t) target="$OPTARG" ;;
+		T) test_name="$OPTARG" ;;
+		w) workspace_arg="$OPTARG" ;;
+		k) KEEP_WORKSPACE=1 ;;
+		h) usage; exit 0 ;;
+		*) echo "Unknown argument $opt"; usage; exit 1 ;;
+		esac
+	done
+
+	ktap_print_header
+	ktap_set_plan 1
+
+	if [ -n "$workspace_arg" ]; then
+		workspace_dir="$(realpath -m "$workspace_arg")"
+		mkdir -p "$workspace_dir"
+	else
+		workspace_dir=$(mktemp -d /tmp/luo-test.XXXXXXXX)
+	fi
+
+	echo "# Workspace created at: $workspace_dir"
+	headers_dir="$workspace_dir/usr"
+	initrd="$workspace_dir/initrd.cpio"
+
+	detect_cross_compile "$target"
+
+	local arch=$(target_to_arch "$target")
+
+	if [ -z "$build_dir" ]; then
+		build_dir="$kernel_dir/.luo_test_build.$arch"
+	fi
+
+	mkdir -p "$build_dir"
+	build_dir=$(realpath "$build_dir")
+	get_arch_conf "$arch"
+
+	local make_cmd="make -s ARCH=$arch CROSS_COMPILE=$CROSS_COMPILE -j$jobs"
+	local make_cmd_build="$make_cmd -C $kernel_dir O=$build_dir"
+
+	build_kernel "$build_dir" "$make_cmd_build" "$KERNEL_IMAGE" "$target"
+
+	local final_kernel="$build_dir/arch/$arch/boot/$KERNEL_IMAGE"
+	mkinitrd "$build_dir" "$final_kernel" "$test_name"
+
+	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE" "$final_kernel"
+	ktap_test_pass "$test_name succeeded"
+}
+
+main "$@"
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..7ee80b6ed4cb 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -13,6 +13,7 @@
 #include <getopt.h>
 #include <fcntl.h>
 #include <unistd.h>
+#include <sys.h>
 #include <sys/ioctl.h>
 #include <sys/syscall.h>
 #include <sys/mman.h>
@@ -21,8 +22,20 @@
 #include <errno.h>
 #include <stdarg.h>

+#include <linux/unistd.h>
+
 #include "luo_test_utils.h"

+int sys_ftruncate(int fd, off_t length)
+{
+	return my_syscall2(__NR_ftruncate, fd, length);
+}
+
+int ftruncate(int fd, off_t length)
+{
+	return __sysret(sys_ftruncate(fd, length));
+}
+
 int luo_open_device(void)
 {
 	return open(LUO_DEVICE, O_RDWR);
@@ -32,8 +45,8 @@ int luo_create_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };

-	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
-		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
+	strncpy((char *)arg.name, name, LIVEUPDATE_SESSION_NAME_LENGTH);
+	arg.name[LIVEUPDATE_SESSION_NAME_LENGTH - 1] = '\0';

 	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_CREATE_SESSION, &arg) < 0)
 		return -errno;
@@ -45,8 +58,8 @@ int luo_retrieve_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_retrieve_session arg = { .size = sizeof(arg) };

-	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
-		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
+	strncpy((char *)arg.name, name, LIVEUPDATE_SESSION_NAME_LENGTH);
+	arg.name[LIVEUPDATE_SESSION_NAME_LENGTH - 1] = '\0';

 	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_RETRIEVE_SESSION, &arg) < 0)
 		return -errno;
@@ -57,7 +70,7 @@ int luo_retrieve_session(int luo_fd, const char *name)
 int create_and_preserve_memfd(int session_fd, int token, const char *data)
 {
 	struct liveupdate_session_preserve_fd arg = { .size = sizeof(arg) };
-	long page_size = sysconf(_SC_PAGE_SIZE);
+	long page_size = getpagesize();
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;

@@ -93,7 +106,7 @@ int restore_and_verify_memfd(int session_fd, int token,
 			     const char *expected_data)
 {
 	struct liveupdate_session_retrieve_fd arg = { .size = sizeof(arg) };
-	long page_size = sysconf(_SC_PAGE_SIZE);
+	long page_size = getpagesize();
 	void *map = MAP_FAILED;
 	int mfd = -1, ret = -1;

@@ -204,16 +217,11 @@ void daemonize_and_wait(void)

 static int parse_stage_args(int argc, char *argv[])
 {
-	static struct option long_options[] = {
-		{"stage", required_argument, 0, 's'},
-		{0, 0, 0, 0}
-	};
-	int option_index = 0;
 	int stage = 1;
 	int opt;

 	optind = 1;
-	while ((opt = getopt_long(argc, argv, "s:", long_options, &option_index)) != -1) {
+	while ((opt = getopt(argc, argv, "s:")) != -1) {
 		switch (opt) {
 		case 's':
 			stage = atoi(optarg);
@@ -224,6 +232,7 @@ static int parse_stage_args(int argc, char *argv[])
 			fail_exit("Unknown argument");
 		}
 	}
+
 	return stage;
 }

@@ -251,7 +260,7 @@ int luo_test(int argc, char *argv[],
 		fail_exit("Failed to check for state session");

 	if (target_stage != detected_stage) {
-		ksft_exit_fail_msg("Stage mismatch Requested --stage %d, but system is in stage %d.\n"
+		ksft_exit_fail_msg("Stage mismatch Requested stage %d, but system is in stage %d.\n"
 				   "(State session %s: %s)\n",
 				   target_stage, detected_stage, state_session_name,
 				   (detected_stage == 2) ? "EXISTS" : "MISSING");
diff --git a/tools/testing/selftests/liveupdate/run.sh b/tools/testing/selftests/liveupdate/run.sh
new file mode 100755
index 000000000000..3f6b29a26648
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/run.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+OUTPUT_DIR="results_$(date +%Y%m%d_%H%M%S)"
+SCRIPT_DIR=$(dirname "$(realpath "$0")")
+TEST_RUNNER="$SCRIPT_DIR/luo_test.sh"
+
+TARGETS=("x86_64" "aarch64")
+
+GREEN='\033[0;32m'
+RED='\033[0;31m'
+YELLOW='\033[1;33m'
+NC='\033[0m'
+
+PASSED=()
+FAILED=()
+SKIPPED=()
+
+mkdir -p "$OUTPUT_DIR"
+
+TEST_NAMES=()
+while IFS= read -r file; do
+    TEST_NAMES+=("$(basename "$file" .c)")
+done < <(find "$SCRIPT_DIR" -maxdepth 1 -name "luo_*.c" ! -name "luo_test_utils.c")
+
+if [ ${#TEST_NAMES[@]} -eq 0 ]; then
+    echo "No tests found in $SCRIPT_DIR"
+    exit 1
+fi
+
+for arch in "${TARGETS[@]}"; do
+    for test_name in "${TEST_NAMES[@]}"; do
+        log_file="$OUTPUT_DIR/${arch}_${test_name}.log"
+        echo -n "  -> $arch $test_name ... "
+
+        if "$TEST_RUNNER" -t "$arch" -T "$test_name" > "$log_file" 2>&1; then
+            echo -e "${GREEN}PASS${NC}"
+            PASSED+=("${arch}:${test_name}")
+        else
+            exit_code=$?
+            if [ $exit_code -eq 4 ]; then
+                echo -e "${YELLOW}SKIP${NC}"
+                SKIPPED+=("${arch}:${test_name}")
+            else
+                echo -e "${RED}FAIL${NC}"
+                FAILED+=("${arch}:${test_name}")
+            fi
+        fi
+    done
+    echo ""
+done
+
+echo "========================================="
+echo "             TEST SUMMARY                "
+echo "========================================="
+echo -e "PASSED: ${GREEN}${#PASSED[@]}${NC}"
+echo -e "FAILED: ${RED}${#FAILED[@]}${NC}"
+for fail in "${FAILED[@]}"; do
+    echo -e "  - $fail"
+done
+echo -e "SKIPPED: ${YELLOW}${#SKIPPED[@]}${NC}"
+echo "Logs: $OUTPUT_DIR"
+
+if [ ${#FAILED[@]} -eq 0 ]; then
+    exit 0
+else
+    exit 1
+fi

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
--
2.52.0.457.g6b5491de43-goog
