Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F95328B5E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440156; cv=none; b=TCMrE06VOmQgbpeZPacITm/Q3IL+a7qmlkpVX7HRLXNzz+WNszV2nW3Ailq9Tnr82EjqwpAzGB/N871EMiKWaYvAhyOwvdqbOHypK4SR3+OWYXiptPVYef9+OSLZloL6F4EBCLXKRFZyvUYZlcHJjzRJgLrgM+DZz6me6c2sTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440156; c=relaxed/simple;
	bh=rBRKXwPprM37HUegKVwfVcNsabxW+lLVWS1raaRWpgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B67fV7IxBhZBJ7XBmnnXodP5qx52M/rxvUA0ahxbAtgRUZ25q4PWtFRjvs0MQQGMjneET6mdTY4LVLcQGRQGf2brBZuM7d5Cv3V86yhCt0DlbyUAtD5mOCNFQGb3RHUPjfuj+8RyDTrWkzASzHBGT1Z53YNADH+ojeKIQf6g5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN4LYzaE; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN4LYzaE"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad9fabd08so3445587d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773440154; x=1774044954; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXzMG7YyZwcIs9g8M/AdNb6aJuadGUAGleE1leZ+rzM=;
        b=JN4LYzaE2FORMA3UEmj/YKCmhZmxtr+W5epGwRa2siA4j1kJiwOBeR5fyaxkGjRUjJ
         q1qw6BpdiBtFbRGZ718WHS0y27TipQk+WwR6q6j7CV0Dtus9QawMfweMVWThxt5RDbG0
         8NzNFNvKWwBLEDGW/y7pMl67DUwH45cya3gLwnHSfKnyOilTNqS3TpTxWenCwPaD0otH
         nqjAIEgH8UMaG9zyqpGJSMk5LCD5mPzQDklZjFMI+wbAiTXo92OES94r96NEDRvqxtfZ
         rH82+LENQIlMZHEQH9v5ZlRb/7RSw67UiJQ9jLaFFKMTOi/2HuFkAez1x2NMAp2It+Qt
         xKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773440154; x=1774044954;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXzMG7YyZwcIs9g8M/AdNb6aJuadGUAGleE1leZ+rzM=;
        b=AKWSyNy/dt6KRBsm+gP7w2CSr6UPJkkLvl9IOmVbuOH85xwwgxh+5L5shkE5nzkqWX
         xGueAe9KFMmpxM2EjIAfRFGHFzkUw8OLecG3RFBXJdGXvH4ZCd1fdcLv6xm6sbIY5qGe
         bZjPOawrAdvEyXqK+XKCUq7FhuZo3Mgd8ttSWZ8wcj1twnAVe0DGhC2eBn8nkHFjO2zr
         6QvkWbd4mJ00cyEaUoHXDJvYUL0VYFlMiZHKIobCJ281ArBR12Fw2PITlgdEnLTq28w/
         SGOErq+UmJmymzScogCny9zGY8bfih/h9Jb3X4uzmgrnFlHuLjlp8SzxYKNmELyMTCkF
         Y06w==
X-Forwarded-Encrypted: i=1; AJvYcCWq6ts7XH4MxKAR7EevczNjF39qm/IOwWPLFBtaJ6NMAMg1s59/HA7oYaBNYS7xCT+IOHdyrYXs0nJF9a6bZ9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjSg3p+yCrWBfOLJw1c/xpuUTL19+9CPKqxR7MSaQglTMFS5/7
	ll6R1I6hOAHQgNNzUiFgZbuk+1mu+D2MtqtvMe2YlFlxS2EwyTLV3PvA
X-Gm-Gg: ATEYQzzg9uxyzLwz/wVXmy4plvzJHCxWEJezfSIvylD+e94Sr3PO4NPi4qgDjqnBdbV
	mnw+xmzDFE2DbvgEx2z7JltdmVMJn6Nq7/Qod+vvvUGSbwCqk0Sm+8i+9lq0gfnPDZ7AFPlM7He
	SAMv7JIkiq8NSmheaxdhCy6pVgJBOk6LS/lwbQDKSYK8GXfskoHgign0hJhu9eBtBoQgLMXDv6x
	GkV8VFSbffv8aqdWrb4gE9YCw1GwnIiSMY5/OwG2MBxloxYJyZ61Qpb/db7M4FppawCAkk3PC4p
	xVQz1RA8IHhDUCXjSX+kmDHBqlna1C3uRIGeRnChIGYTBCbT0L935V/1fBrhp7ZBVMsx08FDWm2
	gfRF/79dl6vGZYjgTk9GTMmiaXnPc9iiAkl4V8lOheiuivBVpEan1URq0V97oDcYmEW17SA2sI5
	YG6DbpgTcWYWMyUXX9T1vo+A==
X-Received: by 2002:a05:690e:446:b0:64d:6658:3445 with SMTP id 956f58d0204a3-64e6304494bmr3950749d50.48.1773440153963;
        Fri, 13 Mar 2026 15:15:53 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:50::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39917sm1796322d50.13.2026.03.13.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 15:15:53 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 13 Mar 2026 15:15:47 -0700
Subject: [PATCH net-next] selftests/vsock: auto-detect kernel for guest VMs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-vsock-vmtest-autodetect-kernel-v1-1-705c35bdc7fe@meta.com>
X-B4-Tracking: v=1; b=H4sIAJOMtGkC/x3NUQoCIRAG4KvIPO+ArrSRV4keRP9q2NLQSRaWv
 XvQd4Fvp44m6BTMTg1DutRCwbjJUHrG8gBLpmBotvNivfM8ek0rj7eiK8ev1gxFUl7RCl6c83I
 5Ift4dpYmQ5+Gu2z/4EoFygWb0u04fprCRWJ6AAAA
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

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index 86e338886b33..7247ac99cf33 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -441,6 +441,12 @@ vm_start() {
 
 	if [[ "${BUILD}" -eq 1 ]]; then
 		kernel_opt="${KERNEL_CHECKOUT}"
+	elif vng --run --dry-run &>/dev/null; then
+		kernel_opt=""
+	elif vng --run "${KERNEL_CHECKOUT}" --dry-run &>/dev/null; then
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

