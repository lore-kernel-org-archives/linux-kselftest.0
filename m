Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548132;
	b=BWFhu66yw/igX5KSdLEDA2hEsB25k/kS2SOQ3K8Gcgsid+FUQa8Dk21JBV/MdCBSvGQC
	 ElBTLi0xENncbaZVnefo/F308m7qNNX8gCZCrGanMelzmLB6094YPf999pb2u3IIdi5aL
	 Sc/4Ln19EZwEIxtLmUWifqf/0LUUcmsnI2UC/tBm3OjfqNwS63CaMw6v0HtVwS+CP5uue
	 3glQ9+X94VC6O3B0nNR9RdfhjN1GaHaH83hNyEkI4u2W2k5kpnD88pMkmlR5Tx3yDBQe0
	 je+5C1VK0LW7BOPjprBev9hsgxmP6cKJ89VTomNLhkFxHifAAAiekxQ8aTG70ljdO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
	b=XjTEHOzm9Nu85eNhqjIo7qDByYGhRYw00dwy0u2Rba4y8C6svNgPZh8hGWrIPbTPN1Hh
	 z2SwuBAVp/xkVcQnC4/obKSRCVFLS8gwYwRZgYDM2UL7KyJNgr7y1RodQo0zS8d9Kb+AR
	 XJlQSpyh0DZ8cZ9ZMq6rDL229t5ddbjZVQkX+Ssj2NANAMwgVlt/4+DBbPzn4nwMl+pK3
	 q9k9NTFlMpK5jpM6/KEFdysq33sn50YV+awX7RT6aNUC7rt+YUA15M/SGB5xlGNE3YKoF
	 e4tQQmSpW+w4i5HJ0+vGcxC4LE6Moy0rTjXmSI6xBjpdtxCWiOSrS8R6CgdxVHvv/YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bh50RA56;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E260606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 19:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E260606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bh50RA56
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c336eab8so1181387eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795548131; x=1796152931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
        b=Bh50RA56mPo+nTw0xcu6Jaylf7Itkvzq10WEajJrHOjNZTXiIhRGjKRa0xcz0MFUvz
         hETpIrnyYv1BDtMRHzBaWvui4mRJ+FMjiIak2T/IC2OrWVdD50/IfQVswBJM5mIw5OhN
         BXVGEkuDN4f4IIwVyQ28/xXpI+uA7989WqnBpeLOsNsHi3sKPkC/92jnB5dP9H318L3j
         pBX4OXwb/IZig+YtOeAHT5sRO+tmgNJYXiYneeZ/bhZC+W3bfXTZUddQPZVB06bkuFy+
         gawz2V6v6Gq5s5RUx0/cpHNLhoxGLcaM63mzPwdVL7Uogy9/7A4n3QKkOLUENbqfQlMo
         j1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548131; x=1796152931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
        b=1xYVFKc3HlBC2EmO5tnwLLcj7OAjBXDZDbqJmORXHMctctc2IsSrGXowZnWGd9fqr1
         /qWZcxuAsVivF1rtEuemG4gO7MMqnGFFmDhOHRyMatMKSfkIimMS3k5Tpi1c0yQzZ0Ua
         3XqqBueQcFl7aG+jkacO/Nm8+MT5AlVCS9YA/CdHe4pRoQKOUKG7/Cfv+LePv5DEIGcC
         VdoAnrKuLXcE4qTBjFkvpUAMKqPZw6kwepCg+kDPh+H3XVdulI54r7DUneqLj77u3bab
         i87HbQmAgnLByfVzyIg+XA1/mHrlc3/CI3iA5VmzRZ7dM811p5RWR/U6EKOTk5IWt+9y
         CPOQ==
X-Forwarded-Encrypted: i=1; AL+hErFmXvBDAt7xfaylmLKE/gsfKCeIFavvOrORnElyrDsa4YU+MxgTxZY9PNsZf8A1qvym10CfMkNxEuz0nraJf7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z++WLtQsc2oUgWCBtuAIBV3Ylwi39bO6NRUIBBRV8kcrM7df0+Z
	G8w6NTPU4L3mmm2c76yKEFJ2h6g33uY8uX6QCbcvVEQG+Y+09DfwhWLu
X-Gm-Gg: AZFdTZejkABSuAn/IPLaqGTBt4AFT1rEf7AOkgSLe4vVeuwKAmR9fwX0dbDNVjmEY/K
	dRZEmSA7VxU0kmrLsfzsNxqES+YorHb57jcdx1E3QU95v1mRHkQ67ZQK+YuPyl7m6o1F2ZrZ9fY
	h67U9OmqijHQ1hAjJFXkVTiOMBIQkHOMFlI2n+rYMnbotB/PAGeDOLv03xuFLRD0HyWcHp6X3FS
	usnH//6fTkqduwhQB/zBRKtkjqrmzHaDUzNLc+oMnok5+QewxyxXS7fWabpM87TP8mXNpHL3uKp
	dOvdcOoU5+yV6af6W9l8JuYwlcptBliLbVTBBR8U6bmz+49Gxqaqamo84X8u5tsKYP52wbbub4e
	ot18XUgT7dkOo+b9dDCRzPXOPZAnvYHq3pqqzMc1bGmgxo03DJ07cpK0xV7GNdTHds0ehPdyW9a
	B0Okl+/afddtH8CKwa5OvsHDqBxlwC4eINOhl7K0QSmLL6RhkaY/vYDVuScfkdRh7qOrxBXzFix
	qQ/ETRgdz9MaRhf7QHA8qLJ40feuJV4rLa9O3Cl17bWKxX00bNAydLy+tlOxXmvu7dZUxd9Z13Q
	zjBMhKQnfc+5iS23lGDxm5k46GTpq7PX2+nRyna1GQ==
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr15198374c88.15.1795548131144;
        Tue, 24 Nov 2026 11:22:11 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm43034793c88.7.2026.11.24.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:22:10 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] selftests/seccomp: set no_new_privs after unsharing a user namespace
Date: Tue, 24 Nov 2026 19:22:08 +0000
Message-ID: <20261124192208.1234120-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Installing a seccomp filter requires CAP_SYS_ADMIN in the caller's user
namespace unless no_new_privs is set.  Two user notification tests
create a user namespace and then install a filter with
SECCOMP_FILTER_FLAG_NEW_LISTENER without setting no_new_privs.
Creating a user namespace gives the caller a full capability set in the
new namespace, so the capability check succeeds on a stock kernel.  But
on a system where an LSM policy denies capabilities in unprivileged user
namespaces, the check fails and the tests report:

  user_notification_child_pid_ns: Expected listener (-1) >= 0 (0)
  user_notification_fault_recv: Expected listener (-1) >= 0 (0)

Set no_new_privs in both tests, as the other notification tests do.
Both tests exercise the notification path rather than the capability
check.  user_notification_child_pid_ns is the only test that covers
pid translation for a notification from a child pid namespace of the
listener's, and user_notification_fault_recv is the only test that
passes a NULL buffer to SECCOMP_IOCTL_NOTIF_RECV.

This gives up unprivileged coverage of the success path of the
CAP_SYS_ADMIN check in a non-initial user namespace, which these two
tests provided only incidentally.  mode_filter_without_nnp still covers
the check itself in the initial user namespace.

Verified on an arm64 guest running a 7.0 distribution kernel with
Ubuntu's apparmor_restrict_unprivileged_userns=1: seccomp_bpf goes from
pass:110 fail:17 skip:15 to pass:112 fail:15 skip:15 out of the same 142
tests.  The remaining failures occur with and without this patch: the
notification_restart variants that ask for
SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV, and
user_notification_addfd_opath, which need kernel features this 7.0
kernel does not have.  Not tested as root in the initial user
namespace, where the capability is present regardless of no_new_privs.

The code and changelog were written with Hermes Agent, an LLM
assistant; the author reviewed and tested the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66bb53bad93b..584fdd1a4787 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3711,6 +3711,7 @@ TEST(user_notification_child_pid_ns)
 {
 	pid_t pid;
 	int status, listener;
+	long ret;
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
@@ -3719,6 +3720,18 @@ TEST(user_notification_child_pid_ns)
 			SKIP(return, "kernel missing CLONE_NEWUSER support");
 	};
 
+	/*
+	 * Installing a filter requires CAP_SYS_ADMIN in the caller's user
+	 * namespace unless no_new_privs is set.  This task has that
+	 * capability in the user namespace created above, but an LSM
+	 * policy can still deny the check, so ask for no_new_privs first,
+	 * as the other notification tests do.
+	 */
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_notif_syscall(__NR_getppid,
 				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
@@ -3829,6 +3842,7 @@ TEST(user_notification_fault_recv)
 {
 	pid_t pid;
 	int status, listener;
+	long ret;
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
@@ -3837,6 +3851,17 @@ TEST(user_notification_fault_recv)
 			SKIP(return, "kernel missing CLONE_NEWUSER support");
 	}
 
+	/*
+	 * As in user_notification_child_pid_ns, ask for no_new_privs
+	 * before installing the filter: the capability check can be
+	 * denied by an LSM policy even though the task holds
+	 * CAP_SYS_ADMIN in the user namespace created above.
+	 */
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_notif_syscall(__NR_getppid,
 				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

