Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321F509F09
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961129; cv=none; b=EQuaowoUSr5Afa8enlEj29LiEbvylJMKRAzjTZPuv1ljWDNnTivKyD/4rISFh4AwSw8AkJ8sdnIUogM3YF1WlOQ9shhMSuJwRF2xQYgB0l/fq3DXy1sJUjeuvKR5UGTi0Ua1BNjdf3clHRzdha4r7jJKlS2spRxX5MMw/it1N7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961129; c=relaxed/simple;
	bh=DSy90Vi1pYW2azdUTwrc0TT6kW6QsQGO8Rlo/8MHFWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+Rhv+cTxmEOzKZAbvtNMDztblJh3T0JotLZbXBMCfRnQ8OxquMXxW/X26oM4aZRj06lx6JjjjvAKd6R0x8OxW51Nkh8+PeXL96RgMKh1SJJus0FqSSXe0A8OVGbUnMa7IzRNCF51Wk+dLWqgeudKaemZON6yf9rwqOB+e1sg1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0t2PPF2; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0t2PPF2"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so118292a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961118; x=1791565918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4yfFb6320kdlQ6cch251gfqYxfn4Y6pwvS8rFGl1n0=;
        b=O0t2PPF2FE7EvdxKkZqB/mE4moJ0mkddf9b+J0zYRcsRh3u8oGV4BJHxw2H+96fxJZ
         meG4z0Y6SaWKEbBvpAQR+OuJ6sUlksJaB5XwEGdnO+NzKO0dE/MAfQ1lMdUUg9qOK64r
         bxHFemm3XR+QWV2XQn+vJM8IM0cWb4hMn8Mxzieti0jnZs1LN3tOBMYw4im6tVK89/EG
         ChKgFqQU31ziRSDlUS6YQ8eNQJaIqLYFi+vRMKGqsl8CF5Ipqh0wvCpDMM+9LqP7/sAb
         bhOQPqlHpsK/ERNaPgqq27d5SyXZ5BKmIagtPiWbqemicdRtAK+qyq8tjPSIibOiHb2v
         WHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961118; x=1791565918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4yfFb6320kdlQ6cch251gfqYxfn4Y6pwvS8rFGl1n0=;
        b=YqbJ7qXG9EglUe7Tx1/W1KjXVVUzgnW8J2FIvJGNU4vnTXZG7ubFF73O6ARNZK22O2
         kkqNTEcFm7TeZ6mnmH/f+nJmyQ7dEf1AFaLFNY08yVUTMP772gzmcb2/KLfEpW1DuoMp
         k+90QLa7bR83YXRNdMa6wOijpZcAFguEbS8/oRxozDke9psnBIrYyztD6itIawQ0s+uz
         WUYT7Tscf+Z294cbmAnpN+KFViuK6zjep08TDGSwj5rqDylcqyOgKPaSSWX+92A+a5Ud
         CeNYKbf9a/J2qmWFK2IoDIQ//iQ8P/AM68p7DrtQbNyrhuaIfmZGhCbBPWcZRj5PGWv3
         B5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBx2TJTbx0dPCOZxQ2cHq35bAx8A4H9xaiePEMBhLWfuPiX8lNPVIgtnDHosaRVhuL8AwH3P8R16veoBAEVz7mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs49cryt3UIuSKHNn8H7v5MElU7ut4w+V5UnOkMPfTduRx8UVo
	DjYj9GUiGtMrs0div9/cdkx7bpOW2MhAWu+QZBoS+Tzs93f3dIIKn3nX
X-Gm-Gg: AYBFou3+8upCemW+Rd7Y1d7Kq4ELjBmA5/Hy+ZbmgWlQTeTy2LHl2hT1sJ0A3YXIrp6
	DT4RXPPTs80D5zFJy/ytyY3n7Fj50YxvkaHNSgr3E/+xdmhQeJutCfUGXOJpMG2sPhuTGcKtQVT
	pBzyPCeGRkHu4zRzkGFfPZJAPt1vJaFBk3nad4zc2f5soD2lQWSZo+a4McWm5Mh9SDLbRCtACaG
	3fHcOG81kXd/IOfRWz6zEY1IGrFaToRPRDs4HSa/o1pCGXNudLxL0GyL+kIMrBwAEX6Wa/9cmcY
	ovu2lEOweWOMKn4Oc4oc4/sl9AqGRK9cIhuh74mZ+NYUiaVk/HVuEIk5HreU9AMw6K503VWyEvF
	8wx5ofbCdU9vwXYCyOmiJaP6DQqz82W/elBAUxebvHFq8p1zNXUegmqN9e0vy4LkXPAXkc7TPlY
	b4uUKeIgyYU8W0PFD1mQFCkdfMLv1SjXo9wTrHOkxXmM+IY5A5d60Kis8j+ZNdL+qtgY2OhEnjc
	Y8n6RfIaUkGZERQ6g==
X-Received: by 2002:a17:90b:586e:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3a6ce3a97bemr2829709a91.8.1790961117352;
        Fri, 02 Oct 2026 10:11:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:56 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 15/15] selftests/rcutorture: add hazptr torture test script
Date: Sat,  3 Oct 2026 01:08:47 +0800
Message-ID: <20261002170847.3653663-16-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hazptr.sh as a one-command regression test for the hazptr
torture configs.

Run NOPREEMPT, PREEMPT, READERS0, and READERS4, followed by
LOCKDEP with wq_churn and SLOWPATH with CONFIG_PROVE_LOCKING=y.
The latter two also check the console for lockdep warnings.

With --allcpus, repeat the PREEMPT test at CPU counts 8, 16, 32,
and so on up to 256.

Follow the pattern of the existing srcu_lockdep.sh script.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/bin/hazptr.sh        | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100755 tools/testing/selftests/rcutorture/bin/hazptr.sh

diff --git a/tools/testing/selftests/rcutorture/bin/hazptr.sh b/tools/testing/selftests/rcutorture/bin/hazptr.sh
new file mode 100755
index 000000000000..ef636e519a55
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/bin/hazptr.sh
@@ -0,0 +1,146 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Run hazptr torture tests and report any that fail.
+#
+# Usage: hazptr.sh [ --cpus N ] [ --allcpus ] [ --datestamp string ]
+#
+# Copyright (C) 2026 Kunwu Chan
+#
+# Authors: Kunwu Chan <kunwu.chan@gmail.com>
+
+usage () {
+	echo "Usage: $scriptname optional arguments:"
+	echo "       --cpus N       override CPU count (default: auto-detect)"
+	echo "       --allcpus      test at CPU counts 8,16,32,...,256"
+	echo "       --datestamp string"
+	exit 1
+}
+
+ds=`date +%Y.%m.%d-%H.%M.%S`-hazptr
+scriptname="$0"
+
+RCUTORTURE="`pwd`/tools/testing/selftests/rcutorture"; export RCUTORTURE
+PATH=${RCUTORTURE}/bin:$PATH; export PATH
+. functions.sh
+
+cpus=""		# empty = let kvm.sh auto-detect
+allcpus=0
+
+while test $# -gt 0
+do
+	case "$1" in
+	--datestamp)
+		checkarg --datestamp "(relative pathname)" "$#" "$2" '^[a-zA-Z0-9._/-]*$' '^--'
+		ds=$2
+		shift
+		;;
+	--cpus)
+		checkarg --cpus "(number)" "$#" "$2" '^[0-9]\+$' '^--'
+		cpus="$2"
+		shift
+		;;
+	--allcpus)
+		allcpus=1
+		;;
+	*)
+		echo Unknown argument $1
+		usage
+		;;
+	esac
+	shift
+done
+
+nerrs=0
+
+run_kvm () {
+	local ds_suffix="$1"
+	local configs="$2"
+	local cpu_arg="$3"
+	local kconfig="$4"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+
+	mkdir -p "$resdir"
+
+	tools/testing/selftests/rcutorture/bin/kvm.sh \
+		--torture hazptr \
+		--duration 5s \
+		--configs "$configs" \
+		${cpu_arg:+--cpus "$cpu_arg"} \
+		${kconfig:+--kconfig "$kconfig"} \
+		--trust-make \
+		--datestamp "$ds/$ds_suffix" > "$resdir/kvm.sh.out" 2>&1
+	return $?
+}
+
+check_lockdep () {
+	local ds_suffix="$1" config_dir="$2" label="$3"
+	local resdir="$RCUTORTURE/res/$ds/$ds_suffix"
+	local console="$resdir/$config_dir/console.log"
+
+	if ! test -f "$console"
+	then
+		echo "Missing console.log for $label ($ds_suffix)" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	if grep -qE "WARNING: possible (recursive locking|circular locking dependency)" "$console"
+	then
+		echo "Lockdep warning in $label" > "$resdir/kvm.sh.err"
+		return 1
+	fi
+	return 0
+}
+
+# Basic torture: all hazptr configs, CPU count auto-detected
+
+echo "--- hazptr basic torture${cpus:+ ($cpus CPUs)} ---"
+run_kvm basic "NOPREEMPT PREEMPT READERS0 READERS4" "$cpus" || nerrs=$((nerrs+1))
+
+# LOCKDEP: verify no lockdep splats with PROVE_LOCKING + wq_churn
+
+echo "--- hazptr lockdep + wq_churn ---"
+if run_kvm lockdep-wq LOCKDEP "$cpus"
+then
+	check_lockdep lockdep-wq LOCKDEP "LOCKDEP wq_churn" ||
+		nerrs=$((nerrs+1))
+else
+	nerrs=$((nerrs+1))
+fi
+
+# SLOWPATH + PROVE_LOCKING: verify forced-slowpath does not deadlock
+
+echo "--- hazptr SLOWPATH + lockdep ---"
+if run_kvm slowpath-lockdep SLOWPATH "$cpus" \
+	"CONFIG_PROVE_LOCKING=y"
+then
+	check_lockdep slowpath-lockdep SLOWPATH \
+		"SLOWPATH+PROVE_LOCKING" ||
+		nerrs=$((nerrs+1))
+else
+	nerrs=$((nerrs+1))
+fi
+
+# CPU scaling: optionally test at multiple CPU counts
+
+if test "$allcpus" -ne 0
+then
+	max_cpus=`grep '^processor' /proc/cpuinfo 2>/dev/null | wc -l`
+	for n in 8 16 32 64 128 256
+	do
+		if test "$n" -le "$max_cpus"
+		then
+		echo "--- hazptr CPU=$n ---"
+		run_kvm "cpu$n" "PREEMPT" "$n" "CONFIG_NR_CPUS=$n" || nerrs=$((nerrs+1))
+		fi
+	done
+fi
+
+# Report
+
+if test "$nerrs" -ne 0
+then
+	echo "hazptr.sh: $nerrs test(s) failed"
+	exit 1
+fi
+echo "hazptr.sh: all tests passed"
+exit 0
-- 
2.43.0

