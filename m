Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C235F5FB
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375893; cv=none; b=FS3x5sgLz3pI8w5P26BkHvW8Te4t7KLiurb3tuQENKWxATn2QdrugT3JMki5ubmb8Y5wEzrD0wCe9FFULTIRql5sGT2xy/gxU0JrLBzRd4vcXTQpsGZ+vt87n12QEYy6m17Dee6wQQC1GBhED36++CAW4pf/Duln8dzHcbP3uBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375893; c=relaxed/simple;
	bh=pwyWuRiWJ0XbQLyrnTziguc/5+rNlEmAfK7XQkPICrg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrcHoEqj7iO/q+WSSqokb/i9AIIulGuavoCWSbUfH6pUOp+J6jNXr2rFn0n6NGcOcAZyUKL48EWKcOYHyE4xZAtN8OKXfIb7QION8YO9cc4rFMuSSA0tsi6ycmcEr81rogsN7JIqEfi1570XpaD+G8+zcCNcGLNcKHu6RN8j7bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hafb1hdJ; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hafb1hdJ"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eaca1db797so74070e0c.2
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792375889; x=1792980689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UmeYwpV1WXgURkKRUEhvLrRNpkq1JL/wE/xlQQFWMQk=;
        b=hafb1hdJtXxE3TAENCumLDHX1IhPujvOYGudQRldwd8CG9D9LAy9TgHEr4NTIUi3z5
         hoUiOOVHbCyWoYW2r0h2GnZfJUc4J1lZySSy7Ata8PbNzr0dux5B6pVfLuAat8YeU3o6
         EM9o0kklhJBYUa8MDZFFB7O8sA4QEz2bZ6Tyz8NSLkDgch3lbRCcfQsUFHFS61Z6yVmN
         zUxRljJ2RHNTSJfI575bVhDyegDnwOB2xcn5opCBUDSvgJrry3KRxI/wsZt2n/hUgumP
         n4t2Ld6aR/qIRImMJUqBhYtXdSdzZvTBmg122bpLE/8bNRA0aE43SA6WszjVDvi23IM/
         X/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375889; x=1792980689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UmeYwpV1WXgURkKRUEhvLrRNpkq1JL/wE/xlQQFWMQk=;
        b=P8LAI4ti8h9LJN5sDE+Ysok4CVvR/WgOei4HeA/+egVCdesyFBxb2ML++YYvJG7non
         J21izdqOaXrUbwQNpjwWwamIOU+3sVBlSBHJTvaVGIUq9Q4zs38bjBiN3bCsDs8ph6qw
         tOW2ZGwVoykaz1Ck9zjfdjdacHzXqyV+Y8fzwzR1hqXkmFwyyfeSRynAhsvhr808Guvo
         Y6Ixlnl6v8ohmhisxy0au7WhXH73RUevbB2W+pRnWH6MbrgPEAe+JJv+ahIs2/yX6E33
         cQ68XilJvEqxnxa9+4nhPy/LFc68Cx4ygWlGBx2lkKCS5OtU4gIxePvuJSXCKpl36UBq
         y3hA==
X-Gm-Message-State: AFq9FYLLqZt+zz1ymJMZKUk8qAje1Z/H7MaC4Y4cUn+g5e9/dPo/4qK0
	Q1YKeF+OnpeAQpQ9u/UmPWyU+QtLC1W2a5+Qbb/rWnwtRzvTG7SXcxTEY2iRDQdl7WW+74S4pan
	zfiGW
X-Gm-Gg: AYBFou2OdCXvwDMN1Of9x86xPsJ43JNprVRl9ZZzktS4C0HMP+8hoEfpEENqLh0VnCB
	mn9AcwqncD6ZjQEAGWiBB+PzjKJ7fT4qqd3GG1Bjg2V4RTK0ZqBwpVTaNkQNCdF6u55V7X/kw1C
	WsnT12ft83qnm1+kNlqUvy3hY5HgG5OOrA1IH9Rcuy9WHyzP4/u8S1VY5K6WWY4HHyUxZl8PpeF
	RfLvXVmWXtu9D7sM25QiSrWaqEDxmVADzTj4Ip8ep4V5yUxr4ZOpK8lP23sbPM+HvEld1NEpz+9
	bOj5jXFq3SzHPG3+8aSIu+izu6A0vVn4pEsmMWgO0tcEdqJ6rVgIBxQDcxKIsti5DVSVhm79KV9
	XdgpEsywtgz4Fo9w2/VApAQjBaYag5QLtZSvt2KpTQF+We14kDgYCCTcSirfYtP5MlBuSfPYqje
	2zsN5MOXzTeq6EVFGDEwDsm9YF9aUFs/xyh8G21AR7YSMg28wfvU4X/Oztj6E5JwzhorSyD6RaY
	BEnn/M6ADV01l9VJndsePKAaWD+c0I+ZSA7JAvjlZjfbxh+jG2Mcfe8LgOqE3o6j/KnrY9RzwbQ
	nuaz5ukAHS9cO/lx85PCZ0BwBZ6ZOA==
X-Received: by 2002:a05:6122:8616:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5eaaa414a8bmr2432423e0c.11.1792375889472;
        Sun, 18 Oct 2026 19:11:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm4271383e0c.2.2026.10.18.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:11:29 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v1 8/8] selftests: kho: add read-only KHO test to vmtest.sh
Date: Sun, 18 Oct 2026 22:11:11 -0400
Message-ID: <20261019021111.990394-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend tools/testing/selftests/kho/vmtest.sh and init.c to run a second
QEMU test verifying read-only KHO ('kho_ro=<fdt_phys>') after the
standard KHO test on both x86_64 and aarch64:

- Build a second kernel configured with CONFIG_KEXEC_HANDOVER_READONLY=y
  (and CONFIG_KEXEC_HANDOVER=n).
- Pass KHO_RO_CMDLINE ('nokaslr kho_bootmem=64M,64M,64M' on x86_64,
  'cma=116M@0x40c00000' on aarch64) to the first kernel in the read-only
  test run so KHO allocations are placed in predictable physical ranges.
- When booted with 'kho_ro_test', read /debugfs/kho/out/fdt_phys in
  init.c and kexec into the read-only kernel with 'kho_ro=<fdt_phys>'
  and architecture-specific memory parameters
  ('memmap=792M$16M memmap=24M$1000M' on x86_64,
  'mem=128M cma=12M@0x40000000' on aarch64) so the preserved pages are
  excluded from the boot memory map and mapped via kho_ro_map_folio().
- Verify 'KHO restore succeeded' from test_kho in read-only mode.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/kho/arm64.conf |   3 +
 tools/testing/selftests/kho/init.c     |  38 ++++++++-
 tools/testing/selftests/kho/vmtest.sh  | 103 +++++++++++++++++--------
 tools/testing/selftests/kho/x86.conf   |   1 +
 4 files changed, 112 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kho/arm64.conf b/tools/testing/selftests/kho/arm64.conf
index ee696807cd35..36dd8c46060c 100644
--- a/tools/testing/selftests/kho/arm64.conf
+++ b/tools/testing/selftests/kho/arm64.conf
@@ -4,6 +4,9 @@ CONFIG_SERIAL_AMBA_PL010=y
 CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_CMA=y
+CONFIG_DMA_CMA=y
 "
 KERNEL_IMAGE="Image"
 KERNEL_CMDLINE="console=ttyAMA0"
+KHO_RO_CMDLINE="cma=116M@0x40c00000"
diff --git a/tools/testing/selftests/kho/init.c b/tools/testing/selftests/kho/init.c
index 88a41b6eba95..272338f186be 100644
--- a/tools/testing/selftests/kho/init.c
+++ b/tools/testing/selftests/kho/init.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <sys/syscall.h>
@@ -12,6 +13,15 @@
 #define COMMAND_LINE_SIZE	2048
 
 #define KERNEL_IMAGE "/kernel"
+#define FDT_PHYS_PATH "/debugfs/kho/out/fdt_phys"
+
+#if defined(__x86_64__)
+#define KHO_RO_MEM_PARAM "memmap=792M$16M memmap=24M$1000M"
+#elif defined(__aarch64__)
+#define KHO_RO_MEM_PARAM "mem=128M cma=12M@0x40000000"
+#else
+#define KHO_RO_MEM_PARAM ""
+#endif
 
 static int mount_filesystems(void)
 {
@@ -32,7 +42,8 @@ static long kexec_file_load(int kernel_fd, int initrd_fd,
 static int kexec_load(void)
 {
 	char cmdline[COMMAND_LINE_SIZE];
-	ssize_t len;
+	ssize_t len, fdt_len;
+	char fdt_phys[64];
 	int fd, err;
 
 	fd = open("/proc/cmdline", O_RDONLY);
@@ -41,11 +52,34 @@ static int kexec_load(void)
 
 	len = read(fd, cmdline, sizeof(cmdline));
 	close(fd);
-	if (len < 0)
+	if (len <= 0)
 		return -1;
 
 	/* replace \n with \0 */
 	cmdline[len - 1] = 0;
+
+	if (strstr(cmdline, "kho_ro_test")) {
+		fd = open(FDT_PHYS_PATH, O_RDONLY);
+		if (fd < 0)
+			return -1;
+
+		fdt_len = read(fd, fdt_phys, sizeof(fdt_phys) - 1);
+		close(fd);
+		if (fdt_len <= 0)
+			return -1;
+
+		if (fdt_phys[fdt_len - 1] == '\n')
+			fdt_len--;
+		fdt_phys[fdt_len] = 0;
+
+		len = (len - 1) + snprintf(cmdline + len - 1,
+					   sizeof(cmdline) - (len - 1),
+					   " kho_ro=%s " KHO_RO_MEM_PARAM,
+					   fdt_phys) + 1;
+		if (len <= 0 || (size_t)len > sizeof(cmdline))
+			return -1;
+	}
+
 	fd = open(KERNEL_IMAGE, O_RDONLY);
 	if (fd < 0)
 		return -1;
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 0014bd76e88d..b3659e4fd1c9 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -35,32 +35,25 @@ trap cleanup EXIT
 function skip() {
 	local msg=${1:-""}
 
-	ktap_test_skip "$msg"
+	while [[ "$KTAP_TESTNO" -le "$KSFT_NUM_TESTS" ]]; do
+		ktap_test_skip "$msg"
+	done
 	exit "$KSFT_SKIP"
 }
 
-function fail() {
-	local msg=${1:-""}
-
-	ktap_test_fail "$msg"
-	exit "$KSFT_FAIL"
-}
-
 function build_kernel() {
 	local build_dir=$1
 	local make_cmd=$2
 	local arch_kconfig=$3
 	local kimage=$4
+	local kho_mode=${5:-"rw"}
 
 	local kho_config="$tmp_dir/kho.config"
 	local kconfig="$build_dir/.config"
 
 	# enable initrd, KHO and KHO test in kernel configuration
-	tee "$kconfig" > "$kho_config" <<EOF
+	cat > "$kho_config" <<EOF
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_KEXEC_HANDOVER=y
-CONFIG_KEXEC_HANDOVER_DEBUG=y
-CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_TEST_KEXEC_HANDOVER=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_VM=y
@@ -70,20 +63,50 @@ CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
 $arch_kconfig
 EOF
 
+	if [[ "$kho_mode" == "ro" ]]; then
+		cat >> "$kho_config" <<EOF
+# CONFIG_KEXEC_HANDOVER is not set
+CONFIG_KEXEC_HANDOVER_READONLY=y
+EOF
+	else
+		cat >> "$kho_config" <<EOF
+CONFIG_KEXEC_HANDOVER=y
+CONFIG_KEXEC_HANDOVER_DEBUG=y
+CONFIG_KEXEC_HANDOVER_DEBUGFS=y
+EOF
+	fi
+
 	make_cmd="$make_cmd -C $kernel_dir O=$build_dir"
-	$make_cmd olddefconfig
+	local need_config=0
+	if [[ ! -f "$kconfig" ]]; then
+		need_config=1
+	else
+		while read -r opt ; do
+			[[ -z "$opt" ]] && continue
+			grep -q "^$opt$" "$kconfig" || need_config=1
+		done < "$kho_config"
+	fi
+
+	if [[ "$need_config" -eq 1 ]]; then
+		cp "$kho_config" "$kconfig"
+		$make_cmd olddefconfig
+	fi
 
 	# verify that kernel confiration has all necessary options
 	while read -r opt ; do
-		grep "$opt" "$kconfig" &>/dev/null || skip "$opt is missing"
+		[[ -z "$opt" ]] && continue
+		grep -q "^$opt$" "$kconfig" || skip "$opt is missing"
 	done < "$kho_config"
 
 	$make_cmd "$kimage"
-	$make_cmd headers_install INSTALL_HDR_PATH="$headers_dir"
+	if [[ "$kho_mode" != "ro" ]]; then
+		$make_cmd headers_install INSTALL_HDR_PATH="$headers_dir"
+	fi
 }
 
 function mkinitrd() {
 	local kernel=$1
+	local out_initrd=$2
 
 	"$CROSS_COMPILE"gcc -s -static -Os -nostdinc -nostdlib \
 			-fno-asynchronous-unwind-tables -fno-ident \
@@ -100,25 +123,31 @@ file /init $tmp_dir/init 0755 0 0
 file /kernel $kernel 0644 0 0
 EOF
 
-	"$build_dir/usr/gen_init_cpio" "$tmp_dir/cpio_list" > "$initrd"
+	"$build_dir/usr/gen_init_cpio" "$tmp_dir/cpio_list" > "$out_initrd"
 }
 
 function run_qemu() {
 	local qemu_cmd=$1
 	local cmdline=$2
 	local kernel=$3
+	local initrd_path=$4
+	local test_name=$5
 	local serial="$tmp_dir/qemu.serial"
 
 	cmdline="$cmdline kho=on panic=-1"
 
-	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
-		  -accel kvm -accel hvf -accel tcg  \
-		  -serial file:"$serial" \
-		  -append "$cmdline" \
-		  -kernel "$kernel" \
-		  -initrd "$initrd"
-
-	grep "KHO restore succeeded" "$serial" &> /dev/null || fail "KHO failed"
+	rm -f "$serial"
+	if $qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
+		     -accel kvm -accel hvf -accel tcg  \
+		     -serial file:"$serial" \
+		     -append "$cmdline" \
+		     -kernel "$kernel" \
+		     -initrd "$initrd_path" && \
+	   grep "KHO restore succeeded" "$serial" &> /dev/null; then
+		ktap_test_pass "$test_name succeeded"
+	else
+		ktap_test_fail "$test_name failed"
+	fi
 }
 
 function target_to_arch() {
@@ -164,7 +193,7 @@ function main() {
 	done
 
 	ktap_print_header
-	ktap_set_plan 1
+	ktap_set_plan 2
 
 	if [[ "$target" != "$(uname -m)" ]] && [[ -z "$CROSS_COMPILE" ]]; then
 		skip "Cross-platform testing needs to specify CROSS_COMPILE"
@@ -174,17 +203,29 @@ function main() {
 	local arch=$(target_to_arch "$target")
 	source "$test_dir/$arch.conf"
 
-	# build the kernel and create initrd
+	# build the kernels and create initrds
 	# initrd includes the kernel image that will be kexec'ed
 	local make_cmd="make ARCH=$arch CROSS_COMPILE=$CROSS_COMPILE -j$jobs"
-	build_kernel "$build_dir" "$make_cmd" "$QEMU_KCONFIG" "$KERNEL_IMAGE"
+	build_kernel "$build_dir" "$make_cmd" "$QEMU_KCONFIG" "$KERNEL_IMAGE" "rw"
 
-	local kernel="$build_dir/arch/$arch/boot/$KERNEL_IMAGE"
-	mkinitrd "$kernel"
+	local kernel="$tmp_dir/$KERNEL_IMAGE"
+	cp "$build_dir/arch/$arch/boot/$KERNEL_IMAGE" "$kernel"
+	mkinitrd "$kernel" "$initrd"
+
+	local build_dir_ro="${build_dir}-ro"
+	if [[ ! -d "$build_dir_ro" ]]; then
+		cp -a "$build_dir" "$build_dir_ro"
+	fi
+	build_kernel "$build_dir_ro" "$make_cmd" "$QEMU_KCONFIG" "$KERNEL_IMAGE" "ro"
+	local kernel_ro="$build_dir_ro/arch/$arch/boot/$KERNEL_IMAGE"
+	local initrd_ro="$tmp_dir/initrd-ro.cpio"
+	mkinitrd "$kernel_ro" "$initrd_ro"
 
-	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE" "$kernel"
+	trap - ERR
 
-	ktap_test_pass "KHO succeeded"
+	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE" "$kernel" "$initrd" "KHO"
+	run_qemu "$QEMU_CMD" "$KERNEL_CMDLINE $KHO_RO_CMDLINE kho_ro_test" \
+		 "$kernel" "$initrd_ro" "KHO read-only"
 }
 
 main "$@"
diff --git a/tools/testing/selftests/kho/x86.conf b/tools/testing/selftests/kho/x86.conf
index b419e610ca22..2c097c5bd6c6 100644
--- a/tools/testing/selftests/kho/x86.conf
+++ b/tools/testing/selftests/kho/x86.conf
@@ -5,3 +5,4 @@ CONFIG_SERIAL_8250_CONSOLE=y
 "
 KERNEL_IMAGE="bzImage"
 KERNEL_CMDLINE="console=ttyS0"
+KHO_RO_CMDLINE="nokaslr kho_bootmem=64M,64M,64M"
-- 
2.56.0.176.g3575e65682-goog

