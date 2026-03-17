Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC921257E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 00:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773708994; cv=none; b=bwIWyB6o/yo7jVcVVmrKLXUgS1BfaJOOnZJSWgU62XVoPplTOwWVGS41mDxkbndXpy+utRZ7jHHxu2kI86j48Du83cuHeKhngVYzNrA9SQfVZgStjhfUHJeb/2Id8lBFJibmJHJZ7bE2Ke43bgHkFMvXz9EeoJpAV8kQ+OAYjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773708994; c=relaxed/simple;
	bh=E+Hkdk1Kp8RLA9oT2ob9i9NCZmTcydZQUzHPrJghpSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TC8rWcVGje+PNMfj9pvPWEQmqfuIHH1ZXrDki5aUHSGPLwafZjyq1HfkFV2QXnybXAF2JhgDyBT3PWnOfvGdN1F906Ha2wFdUrXM7ro8Lv1vYbRjCLZsax8dJnJ10riz09WFSejvdFfHnT80NawyiUEsjuIjXwtSzvzmuQPnZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUHyUdss; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUHyUdss"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7947cf097c1so46989617b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 17:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773708992; x=1774313792; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gH1hPDl0XJ4BmlVqeBDzahDvtQK5lSZzA+ixw3hKdOo=;
        b=iUHyUdssOTkyWIq/FbZGRhiA1FtiqvmM0kA7kSB4tUaog5csC3pJp6VbggNyKcmo0L
         u9tKJylVYw8cz6CUQhX0FDvywN3pCKOGOiagtbKBSX3+15MMc8BWfVwbaYgi2qHzbEvl
         zacKKPlFD5yv13pLXYbUjEB2tw+mwKKTl3D11YxlfxX9jgwdZPFOvxt3539ZUGyQugz2
         NqA4TqPi0Wov3SujmVpCFK9WEEZHcfW7dLJnPjxByFGl5y1//eFhshDkFN9W096x6dsi
         H/vKeChON+AvkyhHO1OccfryCGg7cNmDWh7lf3J+QK/q56C2KqgafaT0kzCLAKGZtdN8
         5kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773708992; x=1774313792;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gH1hPDl0XJ4BmlVqeBDzahDvtQK5lSZzA+ixw3hKdOo=;
        b=I5nWRSZ5AqCQcZ9ZreibcsWnshrqD12W+kWikhXQnNumeOmvEY99qZ0WBk4QRxh8xL
         Ah1IkrURUkvOsu3/qGBqvp9LVQuYPEik6m8N0r2T68dqLHZaSTBB0pYn1r0pKsK7lpiZ
         8FmaAm56WE7QWOwPlX0YSKv1O/I3I+V6bGQ8WjOtHMSjNcPiIB+hKHsbF0vXUZy0Lh6Y
         51SPF7ZQhYE9jZtIvGVtD0kZ8JG18fBFcLiJ7Z7EduH+D3CenYEiEsEhCD8ZHMJTp0R/
         da83MFtyNj/iN+POuEwvOQ+0JhEpbKAnxt5SSgTB4c0aIdhtPEsjI2t4tXhQ4i52/2PL
         sRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi4BdM0pWjzuV6v3sr4cuFXYz6oiZlAQLisJP/N51JK5nn9+ynrtSiWKiIYBDu7DhSBMEsyHuT49hJEgkfcgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/lm/Nk5vucnOh9Ll5vXzUdeXGzwb0RrHc8ZRX7L3ufEvs+VT
	RC4g30SPjDivZthk+lKuzOF6KqXT+RPqGg+JYM8kvPNBUiE4Q1GEJ7Uw
X-Gm-Gg: ATEYQzx/+jtpWBNFdbc97lBlbGINFFR53JNQ2V9NeJWerNV2f1Eh+phxHSTIRhwXBOf
	9Wfv5J0e2HCHdKNF6s9J5kHLy8+8LiBl8ts8kCblvBS+CpfvXmZyLiAtnPkiX134lWsP0QSghXg
	cVE7KS75hhx+nMfq31pk0KeO9Xpf1Lacw7tUr79z2gWG6why5X1Gkhepy0HocbDYcmyFkXfyEnj
	LucVM7gjqZIwOxMnhTVzTfUkCj6HgM485DKT0IP1P7o1UBk+HZNWn3Saq0OcwvDoSPrZXj5L3Js
	0A3ibk4i47Yp1gjLoSBwRF4xg7Qf02aPCerAECZvRD1BDhwEY2ewBOfpVHiIXIMpPpJ4+C/S/xm
	WTc2VJnlRGv1v1S6q9VrSwL3h3HyPQqqdrp1eKuvCYQK9QCeNwQvfL4paF9s3hkRRFVfI/NYdN7
	7j8dLpwYq2CHFD2UxRRXJvbw==
X-Received: by 2002:a05:690c:6d83:b0:799:1f23:6e46 with SMTP id 00721157ae682-79a1c1888efmr154062187b3.33.1773708992420;
        Mon, 16 Mar 2026 17:56:32 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:50::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917deb69asm94638557b3.10.2026.03.16.17.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:56:31 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 16 Mar 2026 17:56:15 -0700
Subject: [PATCH net-next v2] selftests/vsock: auto-detect kernel for guest
 VMs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-vsock-vmtest-autodetect-kernel-v2-1-5eec7b4831f8@meta.com>
X-B4-Tracking: v=1; b=H4sIAK+muGkC/43NSwqDMBAA0KuEWTslH1TqqvcoLtJkrMGalGQaL
 OLdC56g67d4OxTKgQoMYodMNZSQIgxCNwLcbOOTMHgYBGipO2mUwVqSW7CuTIXRfjh5YnKMC+V
 IL/S+u7bkje2VhEbAO9MUtjO4QyTGSBvD2AiYQ+GUv+dc1en/JlWhwl62zrQP7/qJbiuxvbi0w
 ngcxw9OGLB41QAAAA==
X-Change-ID: 20260313-vsock-vmtest-autodetect-kernel-dd695ed3a710
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

When running vmtest.sh inside a nested VM the running kernel may not be
installed on the filesystem at the standard /boot/ or /usr/lib/modules/
paths.

Previously, this would cause vng to fail with "does not exist" since it
could not find the kernel image. Instead, this patch uses --dry-run to
detect if the kernel is available. If not, then we fall back to the
kernel in the kernel source tree. If that fails, then we die.

This way runners, like NIPA, can use vng --run arch/x86/boot/bzImage to
setup an outer VM, and vmtest.sh will still do the right thing setting
up the inner VM.

Due to job control issues in vng, a workaround is used to prevent 'make
kselftest TARGETS=vsock' from hanging until test timeout. A PR has been
placed upstream to solve the issue in vng:

https://github.com/arighi/virtme-ng/pull/453

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v2:
- add setsid workaround for make kselftest TARGETS=vsock
- Link to v1: https://lore.kernel.org/r/20260313-vsock-vmtest-autodetect-kernel-v1-1-705c35bdc7fe@meta.com
---
 tools/testing/selftests/vsock/vmtest.sh | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 86e338886b33..9eacb753238a 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -415,6 +415,19 @@ terminate_pids() {
 	done
 }
 
+vng_dry_run() {
+	# WORKAROUND: use setsid to work around a virtme-ng bug where vng hangs
+	# when called from a background process group (e.g., under make
+	# kselftest). vng save/restores terminal settings using tcsetattr(),
+	# which is not allowed for background process groups because the
+	# controlling terminal is owned by the foreground process group. vng is
+	# stopped with SIGTTOU and hangs until kselftest's timer expires.
+	# setsid works around this by launching vng in a new session that has
+	# no controlling terminal, so tcsetattr() succeeds.
+
+	setsid -w vng --run "$@" --dry-run &>/dev/null
+}
+
 vm_start() {
 	local pidfile=$1
 	local ns=$2
@@ -441,6 +454,12 @@ vm_start() {
 
 	if [[ "${BUILD}" -eq 1 ]]; then
 		kernel_opt="${KERNEL_CHECKOUT}"
+	elif vng_dry_run; then
+		kernel_opt=""
+	elif vng_dry_run "${KERNEL_CHECKOUT}"; then
+		kernel_opt="${KERNEL_CHECKOUT}"
+	else
+		die "No suitable kernel found"
 	fi
 
 	if [[ "${ns}" != "init_ns" ]]; then

---
base-commit: 8f921f61005450589c0bc1a941a5ddde21d9aed9
change-id: 20260313-vsock-vmtest-autodetect-kernel-dd695ed3a710

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

