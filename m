Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065831;
	b=jA5ZW8M+KElSNXBafuUtF6ls4v+FL9n79Kwhux/PT6ENZ+7Hzg20iVNc6mBj2hOYwaEx
	 yes2Md8rXotbAIj/vZHPT+4n8RRuDOySiafHyzh4EXu4ggUSbOXhkyDTclL4S+Z3iCwyC
	 AXGIygTxCes/fjRicDLnM/Kvm0zLsLPMHvmnJLnkdIqCaXg+wfgW1MSf3Uo/B+oExoWQO
	 d3qBspN+u5YnkLqRu0NmUtKOr/eu+Ge4ghuMthVodkR60AuN5iVM2kFfJT7MRRdYVh/Cn
	 RECgXfrN/ed0FkEL7gLVW5fzlUZE8Vjo7UHbHWseJU7RSCP+O+ggcOGscBysoo14wAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
	b=TBxtAHc1DraAx9ealM/HNQtBKXxMuVpwRBd3L8+OYV9LkFhFdjyhP/dQtjWW07fNdZWj
	 S4QKddbfgthhuvBvyOGdMWy1gWUDMwNwB4Oh1/w1vW7ea+Pk1+7MuhwNhWxYUBbPmav7d
	 xPsu4c2+lU1KHH0DIbhXvQoSdE9pdBWlJHpJS0+pB+IHDKJD6ObwzgpTR0V96qLjy44fF
	 wf/+3eBrYpoRzCZoWUB6P3u/wEn2+Hl4g4R0x/mKD9R+XeINk+rCRc8P+6vtY6/qcs+mA
	 MW1H0iC9vV1jw9XjvlQEcTMaQgQMCHBy/z5M7cyNkxxJ1/MsEgWrFZ+NpwbrR7swwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dumCt+Fx;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED621606A333
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED621606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dumCt+Fx
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c42f98f3571so225804766b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 07:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065829; x=1794670629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=dumCt+Fxwej4aM6MPpjS4V80JFGKHnQ3nP848Wy7kKs1TUyno4p0aOVDgMufQFllCm
         OLemr9dYBJ3Va7JGCGUEUU0DXVHGNutdDrUVvEPT1SxxOWzN9Cpx53DIbo+iQrE1nZ+Z
         CVZRwLbUGzmBdP2Fsl6XFM2EyPGYB6M9OPFA6W0+OKCBABIfcqbK55c+okx9cpj34zja
         CN14aWAvFnKTe1+QEkevnN96snDQ4D5zCvIlgy8lMkasEw/ZZXgRbntAu6rse2FU7heh
         VAA3sg6hjUBtf5isVtXRtAFgugZDg6QvrFVWFbMKCwfah1FB4BJA4l2YTecq1SV2W1P8
         WYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065829; x=1794670629;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJbzZ1rJU+QBfldfCtIUj3qILBrc3I/5agYUjCN+MFM=;
        b=G6c79g6pj8Vnkw+iwu2BXSuWtn5YBLZKX6kpqqu+MMkas3krMkwmuxR6IzTQI2kjDj
         MD/M5GJ8Q3ItQcf5+LLDkXVEhoQPaqcAtHXfhvTHCTUrWJfk8KjgHl+6SczXxieCvI2M
         Qu9zFaR72mwD1tqh8Ij42j7b3+3b2hpm8SWbIfV5LZKJ9/kCznC4UV95nacg3t/KCCQY
         so3eaAtDn9GaYbjZbglSS1w4xGYDnaq2zwTVqGay9GhpIzyXlBwAWVQjlNHlmxDC7EbO
         BLv5X0toXEJo1bP0kVHc54ynZPGc2pOx7Dh41Xu1k1hN0E1IqnxEjm7A5a5py6fiZjk0
         a9kQ==
X-Forwarded-Encrypted: i=1; AL+hErEuuAPpxkl/XMwqBOi1WCQ/bE2j0+aGsEKkrXaL66XBi8SHiVDgHEpqkuJwHHnv0Smqo25ztzbo0SlcRw7laQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gatqybz+HrEBexjWxirZqAFGNAp2zRMVS/rZPjq02yuFSVQmR
	2WTkfi15M0raZ7Z6pHa+wT/DaGkK5UuXCugNGuzRtJBZYPsgEfYgc9GtH4dBKZCjXKgAayywCCX
	v9g==
X-Received: from ejpc8.prod.google.com ([2002:a17:906:54c8:b0:c3f:c35a:7704])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0a:b0:c33:dbe8:291c
 with SMTP id a640c23a62f3a-c4d35448ab9mr515861766b.20.1794065829385; Sat, 07
 Nov 2026 07:37:09 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:08 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-2-d84ea5f30f94@google.com>
Subject: [PATCH 02/24] kselftest/arm64: Test lazy PSTATE.TCO handling
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Reproduce a bug introduced by commit 38ddf7dafaea ("arm64: mte: avoid
clearing PSTATE.TCO on entry unless necessary") where TCO wasn't cleared
when it should have, by detecting that the kernel misses MTE faults when
accessing (tagged) memory of a process running sync MTE.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 tools/testing/selftests/arm64/mte/.gitignore       |   1 +
 tools/testing/selftests/arm64/mte/check_lazy_tco.c | 152 +++++++++++++++++=
++++
 2 files changed, 153 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/.gitignore b/tools/testing/s=
elftests/arm64/mte/.gitignore
index f6937f890039..70ebc3883a26 100644
--- a/tools/testing/selftests/arm64/mte/.gitignore
+++ b/tools/testing/selftests/arm64/mte/.gitignore
@@ -4,6 +4,7 @@ check_tags_inclusion
 check_child_memory
 check_mmap_options
 check_prctl
+check_lazy_tco
 check_ksm_options
 check_user_mem
 check_hugetlb_options
diff --git a/tools/testing/selftests/arm64/mte/check_lazy_tco.c b/tools/tes=
ting/selftests/arm64/mte/check_lazy_tco.c
new file mode 100644
index 000000000000..28174495056a
--- /dev/null
+++ b/tools/testing/selftests/arm64/mte/check_lazy_tco.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Google LLC
+/*
+ * Validate that the kernel does not leave PSTATE.TCO set on kernel entry =
and/or
+ * thread switching, when it should be clear i.e. when kernel accesses (su=
ch as
+ * uaccess) are expected to be tag checked.
+ */
+
+#include <sys/wait.h>
+
+#include "kselftest.h"
+#include "mte_common_util.h"
+#include "mte_def.h"
+
+#define BUG_EXIT_CODE	99
+#define MAX_TRIALS	32
+
+static void handle_signal(int sig);
+
+/*
+ * We validate that uaccesses are tag checked by tricking the kernel into
+ * triggering a tag check fault while accessing user (tagged) memory. If t=
he
+ * kernel does not report an error, we assume that PSTATE.TCO was set, sil=
encing
+ * the hardware exception.
+ *
+ * To achieve this with robust userspace-kernel synchronization, we alloca=
te a
+ * signal handler stack in PROT_MTE memory, tagged with 0x0 so that our si=
gnal
+ * handler can safely run without triggering tag check violations from SP
+ * (untagged) accesses. We only re-tag (with a non-zero value) the uppermo=
st
+ * granule of the stack, where the kernel must write user->next_frame.
+ *
+ * When the parent process sends SIGUSR1 to its child, the following happe=
ns:
+ * - TCO should be cleared before the uaccess
+ * - the kernel writes user->next_frame to the tagged stack granule
+ * - (if MTE is properly enabled, a synchronous tag fault is raised)
+ * - if the fault was detected and handled, SIGSEGV should be delivered
+ * - if it was not detected or raised, the initial SIGUSR1 is received
+ */
+static void setup_sigaltstack_tripwire(int sig)
+{
+	size_t sz =3D MT_ALIGN_UP((size_t)MINSIGSTKSZ + 2 * (size_t)getpagesize()=
);
+	void *altstack, *top_granule;
+	struct sigaction sa =3D {};
+	stack_t ss =3D {};
+
+	/* Enable non-zero IRG, needed for tagging the sigaltstack. */
+	if (mte_switch_mode(MTE_NONE_ERR, MTE_ALLOW_NON_ZERO_TAG, false) !=3D 0)
+		ksft_exit_fail_msg("Failed to enable MTE tag generation\n");
+
+	altstack =3D mte_allocate_memory(sz, USE_MMAP, 0, false);
+	if (check_allocated_memory(altstack, sz, USE_MMAP, false) !=3D KSFT_PASS)
+		ksft_exit_fail_msg("Failed to allocate MTE sigaltstack\n");
+
+	top_granule =3D (char *)altstack + sz - MT_GRANULE_SIZE;
+	if (!mte_insert_tags(top_granule, MT_GRANULE_SIZE))
+		ksft_exit_fail_msg("Failed to tag sigaltstack top granule\n");
+
+	ss.ss_sp =3D altstack;
+	ss.ss_size =3D sz;
+	if (sigaltstack(&ss, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaltstack()");
+
+	sa.sa_handler =3D handle_signal;
+	sa.sa_flags =3D SA_ONSTACK;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(sig, &sa, NULL) !=3D 0)
+		ksft_exit_fail_perror("sigaction()");
+}
+
+static __noreturn void stress_test_lazy_tco(void)
+{
+	const unsigned long sync_ctrl =3D
+		PR_TAGGED_ADDR_ENABLE | PR_MTE_TCF_SYNC |
+		(MTE_ALLOW_NON_ZERO_TAG << PR_MTE_TAG_SHIFT);
+
+	if (prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0) !=3D 0)
+		_exit(KSFT_FAIL);
+
+	for (;;) {
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, sync_ctrl, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+		if (prctl(PR_SET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) !=3D 0)
+			_exit(KSFT_FAIL);
+	}
+}
+
+static void handle_signal(int sig __always_unused)
+{
+	if (prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0) & PR_MTE_TCF_SYNC)
+		_exit(BUG_EXIT_CODE);
+}
+
+static int spam_signal_until_child_exit(pid_t pid, int sig)
+{
+	int status =3D 0;
+	pid_t ret;
+
+	do {
+		if (kill(pid, sig) !=3D 0)
+			ksft_exit_fail_perror("kill()");
+		mte_wait_after_trig();
+		ret =3D waitpid(pid, &status, WNOHANG);
+	} while (ret =3D=3D 0);
+	if (ret !=3D pid)
+		ksft_exit_fail_perror("waitpid()");
+
+	if (WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGSEGV)
+		return KSFT_PASS;
+
+	if (WIFEXITED(status) && WEXITSTATUS(status) =3D=3D BUG_EXIT_CODE)
+		return KSFT_FAIL;
+
+	ksft_exit_fail_msg("Unexpected child wait status %#x\n", status);
+}
+
+static int check_lazy_tco(void)
+{
+	for (int trial =3D 0; trial < MAX_TRIALS; trial++) {
+		pid_t child =3D fork();
+
+		if (child < 0)
+			ksft_exit_fail_perror("fork()");
+
+		if (!child)
+			stress_test_lazy_tco();
+
+		if (spam_signal_until_child_exit(child, SIGUSR1) =3D=3D KSFT_PASS)
+			continue;
+
+		ksft_print_msg("Detected invalid TCO state\n");
+		return KSFT_FAIL;
+	}
+
+	return KSFT_PASS;
+}
+
+int main(void)
+{
+	int err;
+
+	ksft_print_header();
+
+	err =3D mte_default_setup();
+	if (err)
+		return err;
+
+	ksft_set_plan(1);
+	setup_sigaltstack_tripwire(SIGUSR1);
+	ksft_test_result_report(check_lazy_tco(), "Check lazy TCO clearing\n");
+	mte_restore_setup();
+	ksft_finished();
+}

--=20
2.56.0.455.g6c5a503b38-goog

