Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3003EEAC8
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065212; cv=none; b=Pzl+nZqhy1eLOqLMSg0DDz4fXamwoWRj4AmxugbkNy+sqr/cw1aonYd4pjK8LcmE+zT7HBj1Gd9Sff6e+MtDGDv9q9lJHKBK8u/B2UQ0OYE3AUcoyfaMGbtpuWiX3hzFWRJycJDbCMe8laCDEAOZ406sVtmSH/VpJFl9Ve01k/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065212; c=relaxed/simple;
	bh=Jmp7wduW2KLHTotBR1L1UP/Mdx2/OLxHMhhvQJdY/7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dN6qJ/xRW302YglM1DAXCdYcC0vibr3WFYfnliVbrOjb+XuZjNVK3Xd/Pbz5WJb0rdtyIXVYZ0ybh0aeJRiXWvK6B5VX9xAqJ1fUigka+P6Z4KnyQ+0+c7H915ww0uxdZFXIkcZzN5/D3YSih5V7KUJvCphS+YxYzb05I9eRt6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DafaDXjj; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DafaDXjj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780065209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vyAIkWzZgGB6LrCF6zuZOLFTfkZ2Yg44+ju3GGAi4XQ=;
	b=DafaDXjjSeXGtjcjH2mCT9Xli+n/rYnZ0YEXjHK9TESaf44ilrrY9qDK2pVPBNOUC6X2W8
	r5hjtFAUjrfNCw94N3YpQ0/74WSpfZLeHgojtLEPfX3phj3XxYiJg061ipNs57HTx5U1YJ
	+aJMEBCCPHZRhAQq1vkm8Fe0d7cADrw=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Alexander Graf <graf@amazon.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v2 4/4] selftests/kho: handle QEMU not exiting after kexec on LoongArch
Date: Fri, 29 May 2026 22:32:38 +0800
Message-Id: <20260529143238.169169-5-dongtai.guo@linux.dev>
In-Reply-To: <20260529143238.169169-1-dongtai.guo@linux.dev>
References: <20260529143238.169169-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

On LoongArch, QEMU provides only a minimal EFI stub with no runtime
services and no ACPI tables, so machine_restart() falls through to
its infinite idle loop and QEMU never exits after kexec.  The test
result is already printed to the serial console and vmtest.sh reports
success, but the user must press Ctrl+C to get the prompt back.

Add QEMU_NEEDS_KILL=1 to loongarch.conf so the test completes
unattended.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/kho/loongarch.conf |  3 ++
 tools/testing/selftests/kho/vmtest.sh      | 32 ++++++++++++++++++----
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kho/loongarch.conf b/tools/testing/selftests/kho/loongarch.conf
index 0145cb49e5b2..02a6add633f1 100644
--- a/tools/testing/selftests/kho/loongarch.conf
+++ b/tools/testing/selftests/kho/loongarch.conf
@@ -8,3 +8,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 "
 KERNEL_IMAGE="vmlinux.efi"
 KERNEL_CMDLINE="console=ttyS0 earlycon"
+# QEMU never exits after kexec on LoongArch (no EFI runtime services),
+# so vmtest.sh must kill it once the test verdict appears.
+QEMU_NEEDS_KILL=1
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index a6ae9ac09595..821e13fa69a5 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -107,12 +107,32 @@ function run_qemu() {
 
 	cmdline="$cmdline kho=on panic=-1"
 
-	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
-		  -accel kvm -accel hvf -accel tcg  \
-		  -serial file:"$serial" \
-		  -append "$cmdline" \
-		  -kernel "$kernel" \
-		  -initrd "$initrd"
+	local qemu_args=(
+		-m 1G -smp 2 -no-reboot -nographic -nodefaults
+		-accel kvm -accel hvf -accel tcg
+		-serial file:"$serial"
+		-append "$cmdline"
+		-kernel "$kernel"
+		-initrd "$initrd"
+	)
+
+	# If the target does not exit QEMU after kexec (e.g. no EFI runtime
+	# services), the conf file sets QEMU_NEEDS_KILL=1.  Run QEMU in the
+	# background, poll for the test verdict, then kill it.
+	if [[ "${QEMU_NEEDS_KILL:-0}" == "1" ]]; then
+		$qemu_cmd "${qemu_args[@]}" &
+		local qemu_pid=$!
+		local remaining=100
+		while ((remaining-- > 0)); do
+			grep -q "KHO restore succeeded\|KHO restore failed" \
+				"$serial" 2>/dev/null && break
+			sleep 1
+		done
+		kill "$qemu_pid" 2>/dev/null
+		wait "$qemu_pid" 2>/dev/null || true
+	else
+		$qemu_cmd "${qemu_args[@]}"
+	fi
 
 	grep "KHO restore succeeded" "$serial" &> /dev/null || fail "KHO failed"
 }
-- 
2.25.1

