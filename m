Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404612;
	b=HiO+KS3BRA0mlIz45dS0l2SvJoP3dJk8c6IAVeGyIK3lmFXLYzWNs7bLA2Fk84+i6hIn
	 Fb+vwcCvsHWf5A8Xfn2Y7YYpCbzkOJMwGACIPKdtyeAQ/2L92R8cXK3uD69963RZe64gn
	 Bb2ks+rPJazZ9czTrlpJFNyoxwlPgX2jZOngeVhO+h6+yzV/VBWQTIda/OuM7SfW43m+y
	 +tARTLmorQ4RBULzuT3VDdflqWnEyh6oE+nt6SKL1BD44k/tOnpPL302SosYP5hzphTrP
	 CreL9YIBf2iTsxnJJfwSs9tQ6suZrsb6SVxuxO1PV4HcR/AnwYa1+G7w3Ysqn49kYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404612;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u8UcEUnD4ZkepVPvGFradAdo5whi9SPNtsg7TDqLogw=;
	b=KRd6LEkXN/bMMW5rt98Qak56G+6YD3R5tgeyRoLg2Ah6lFO3d94EQRPlR7xggIyHpQDS
	 xgWKbOUWRTUoqf+6sdc1TqCn8bMkT1QtljpT6P1zI+WicNG9swVNUNdvod0Ww9sF/os3p
	 vzukZtNAt2WEhP7irL6aM5xCYY+WuZDGn1iFaTcevyNx4jMlyyfiO5v0H1YwYy4D7jpKo
	 DgLfWPAPKrC6L7c31ut2sSxsXH1QDcoBnTqo9igVf+jwCLX83/Uf2ceMpTxAa2UqSXagq
	 euYRgK4HYOHyFdQLIXV9qxVNM96m8srUkZsgHOpQnIJrXp+ZVOkgOt0vpXPuNU54b2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Qi5pINXY;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087C606A885
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B087C606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Qi5pINXY
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aOnuzk5qEpfGzDUci65GekDmwlE0KiH7hOuBjXbDrSA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794404610; v=1; x=1795009410;
 b=Qi5pINXYcNAfiL8Aid/oIiXn3mNzuqZQWTcJuAxT8p6g82+v+W0FEYgUPVSxD1jXTXca03Qx
 Eqclf9EBJ39AYhPaFPfWNoX/tqlk5etCzobNZ/gJQ++KpYfoTKpB4cjboeK4TtY7Nw5ji060DgE
 yDiGzXw69ZYv8v6ifWZelOmc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f3d5408e5f408ef1;
	Wed, 11 Nov 2026 13:43:29 +0000
X-Mizu-Trace-ID: f3d5408e5f408ef1
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	ridong.chen@linux.dev
Cc: cgroups@vger.kernel.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH v4 2/2] selftests/cgroup: Add tests for top sched domain housekeeping checks
Date: Wed, 11 Nov 2026 21:42:50 +0800
Message-ID: <20261111134250.16852-3-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134250.16852-1-guopeng.zhang@linux.dev>
References: <20261111134250.16852-1-guopeng.zhang@linux.dev>
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

A partition update or CPU hotplug must leave at least one active boot
domain housekeeping CPU in the top cpuset scheduling domain.

Add tests to test_cpuset_prs.sh for local and remote partition updates,
recovery and CPU hotplug. Run the new matrix when boot domain isolation
leaves CPUs 0-9 for housekeeping. Include hotplug cases that keep unrelated
partitions valid.

Also add CPU replacement tests to TEST_MATRIX for the top cpuset and
populated local parents.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 .../selftests/cgroup/test_cpuset_prs.sh       | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index bdca6c471f87..c35d4fd50eeb 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -168,6 +168,13 @@ TEST_ISOLCPUS=
 		skip_test "Current isolated CPUs ($CURRENT_ISOLCPUS) don't match boot isolated CPUs!"
 }
 
+# These tests require boot domain housekeeping CPUs to be exactly 0-9.
+# Match the boot mask for isolcpus= with or without explicit domain flags.
+DOMAIN_ISOLCPUS="10-$LAST_PRESENT_CPU"
+[[ "$LAST_PRESENT_CPU" == 10 ]] && DOMAIN_ISOLCPUS=10
+RUN_ISOLCPUS_DOMAIN_TESTS=
+[[ "$BOOT_ISOLCPUS" == "$DOMAIN_ISOLCPUS" ]] && RUN_ISOLCPUS_DOMAIN_TESTS=1
+
 #
 # This test assumes that all the relevant CPUs being tested are online.
 # If some of them are offline, some of the tests may fail. So we are going to
@@ -547,6 +554,12 @@ TEST_MATRIX=(
 	" C2-6:X2-5:P1 CX3-6:P2 \
 	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
 
+	# A populated local parent must also count CPUs returned by its child.
+	" C2-7:P1 C4-7:P2 . . T C2-5 . . 0 A1:6-7|A2:2-5 A1:P1|A2:P2 2-5"
+
+	# A CPU replacement must account for CPUs returned to the top cpuset.
+	" C2-${CPULIST#0-}:P2 . . . C0-4 . . . 0 A1:0-4 A1:P2 0-4"
+
 	#
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
@@ -602,6 +615,63 @@ ISOLCPUS_TEST_MATRIX=(
 	" CX1-2,I:X1,I:P1 . .      .     X1,2,I  .      .      .     0 A1:1-2,I|XA1:1-2,I A1:P-1 ."
 )
 
+# Test matrix for isolcpus=domain,10-<last> or isolcpus=10-<last> boots.
+# The top cpuset must retain an active boot domain housekeeping CPU.
+ISOLCPUS_DOMAIN_TEST_MATRIX=(
+	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
+	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
+	# Neither a root nor an isolated partition may take all boot HK CPUs.
+	" C0-9      .      .      .     P1      .      .      .     0 A1:0-9 A1:P-1 ."
+	" C0-9      .      .      .     P2      .      .      .     0 A1:0-9 A1:P-2 ."
+
+	# Growing cpuset.cpus must not take the last top-level HK CPU.
+	" C0-8:P1   .      .      .    C0-9     .      .      .     0 A1:0-9 A1:P-1 ."
+
+	# CPUs returned by the same update can keep the top sched domain alive.
+	" C2-9:P2   .      .      .    C0-4     .      .      .     0 A1:0-4 A1:P2 0-4"
+
+	# Root and isolated partitions together must leave a top-level HK CPU.
+	" C0-4:P1   .      .     C5-9    .      .      .     P2    0 A1:0-4|B1:5-9 A1:P1|B1:P-2 ."
+
+	# Remote partition creation must enforce the same constraint.
+	" X0-9    CX0-9    .      .      .     P1      .      .     0 A2:0-9 A2:P-1 ."
+
+	# Expanding a remote partition must leave a top-level HK CPU.
+	" X0-9 C0-9:X0-8:P1 .     .      .    X0-9     .      .     0 A2:0-9 A2:P-1 ."
+
+	# Remote CPU replacements must account for the CPUs being returned.
+	" X0-9 C0-9:X2-9:P2 .     .      .    X0-4     .      .     0 A2:0-4 A2:P2 0-4"
+
+	# Local exclusive CPU updates must not consume the last top-level HK CPU.
+	# Keep the initial partition valid with nohz_full enabled.
+	" C0-9:X2-9:P2 .   .      .    X0-9     .      .      .     0 A1:0-9 A1:P-2 ."
+
+	# Ancestor updates must not grow a remote partition over the last HK CPU.
+	" X0-8 CX0-9:P1    .      .    X0-9     .      .      .     0 A2:0-9 A2:P-1 ."
+
+	# An invalid partition can recover once it leaves a top-level HK CPU.
+	" C0-9:P1   .      .      .    C0-6,8-9 .      .      .     0 A1:0-6,8-9 A1:P1 7|"
+
+	# Offlining the last top-level HK CPU invalidates a local root and its child.
+	" C0,2-9:P1 C5-9:P1 . . O1=0 . . . 0 A1:0,2-9|A2:5-9 A1:P-1|A2:P-1 1|"
+
+	# A remote root must return CPUs when the top domain loses its last HK CPU.
+	" X0,2-9 CX0,2-9:P1 . . O1=0 . . . 0 A2:0,2-9 A2:P-1 1|"
+)
+
+# Keep an online boot-isolated CPU at the top so hotplug does not
+# clear subpartitions_cpus before checking the individual partitions.
+if [[ "$ONLINE_LAST" -gt 10 ]]; then
+	ISOLCPUS_DOMAIN_TEST_MATRIX+=(
+		# An offline HK CPU cannot restore the top domain. Keep this local
+		# partition valid while its sibling returns active HK CPUs.
+		" O2=0:C2,10:P2 . . C0,3-9:P1 O1=0 . . . 0 A1:10|B1:0,3-9 A1:P2|B1:P-1 1-2|2"
+
+		# Check the same active-CPU rule for a remote partition.
+		" O2=0:X2,10 CX2,10:P2 . C0,3-9:P1 O1=0 . . . 0 A2:10|B1:0,3-9 A2:P2|B1:P-1 1-2|2"
+	)
+fi
+
 # Test matrix to be run when boot time nohz_full CPUs cover all CPUs except CPUs 0-7
 # This also means that CPU 8 is available and is a nohz_full CPU.
 NOHZ_FULL_TEST_MATRIX=(
@@ -1472,6 +1542,7 @@ test_inotify()
 run_state_test TEST_MATRIX
 run_remote_state_test REMOTE_TEST_MATRIX
 TEST_ISOLCPUS=1 run_state_test ISOLCPUS_TEST_MATRIX
+[[ -n "$RUN_ISOLCPUS_DOMAIN_TESTS" ]] && run_state_test ISOLCPUS_DOMAIN_TEST_MATRIX
 [[ -n "$RUN_NOHZ_FULL_TESTS" ]] && run_state_test NOHZ_FULL_TEST_MATRIX
 test_isolated
 test_boot_isolated
-- 
2.43.0

