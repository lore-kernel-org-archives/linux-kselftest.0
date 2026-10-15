Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B03F0744
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085526; cv=none; b=S/O/yupt0D25p85nNbyk9AMv/5sC5SvV6StK8FTu0lRxPz88J62uiTx9FX20kvTf69rk2DWGAfhmNEV+xixWYsGBqNQ7aa1C64fiOEZNYe4iHHSWwZNpZxFVXXZ8mSrFeCvRBgNyxXKC7BRoPwB/JEp73nc1IMFZIJcrSNeDv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085526; c=relaxed/simple;
	bh=dI1WStqlpIXOwEbl0Tq1nJF8npf3hJwV5o6BMMo97jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2vzQuaSjWOtYSjbkHd72QJdAfbicxGqf9caCgoNsptApAWXjHBqoOo3scKecsqG2g+x56eyRw1hprwj8QVN63g7QEMLB12De5AVLbqMMnULPw9AJL2COElCQCc+iMrlokPY1sEPWdEG0LrsbwmvIG15sHIA8JmWYt9LAj33eK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBIxUgvU; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBIxUgvU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-141395927feso10668885c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085512; x=1792690312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gR2GS+zLKe5N4zqWPOfXWRNDOn0SGujJKSCC0wtMo+M=;
        b=qBIxUgvUO96D84ejDfDAD5aS2cqMdudqKnoI2iph9jTolWVs0Nh8gMFQH+/A8wkwR7
         vgZLpgkUTNuhzKXohA3/zreCZzVpWH8Rk4m2Jo4SVbUdVR9jEhoZrJBflMunavT3pOfq
         kaS/h+jywkDPqrh69Q/jz/jACPd6v/Tq/4FvVTjTpDpkgP+rDikijPxh6cI6UPsWB/yB
         XmzNDmoMbanYu9KZKDbEbXYgrpk//b/l3yPJcMbFXjEU9aS8M99nVkxwSnKqArGV2C14
         IWPrbdcaUJTzZB+aOwE+NzbU52T3jIm687B861yPcMjoiGjxLrytMAb1RWJvfIVq5ZxI
         hirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085512; x=1792690312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gR2GS+zLKe5N4zqWPOfXWRNDOn0SGujJKSCC0wtMo+M=;
        b=jUDxg5CUwZAVy6CM1FrwmDDkdGxUQn5oVL9ystH5GVRVDIXr+8RCZ/qyAChwa0ueEW
         jD3qn1wJACqX8W29vhh5FR0pBZ7PalFYBv7kkHEZeFoY0Co3KWVhyM4Zr6dy+98ahCTK
         Pc+qidUFLmEVmOOhEiGxLuCvPgElEO66NGS8V+7+rANgN7BJvAFxvxQC5gKpYa5T7nql
         4MptbAaF6xlUMsawNht/DLoOinEvWnQBwg/G1Fv1LXQkXmwDeZ2U6mzNX4Y2bNaaT5e0
         xf7ouvyxONg0mDPn7S2qARJxBeoo9nf5dl2WbiQtbdP2FWVWgHtz+/zfpJzyygQWCHlP
         RKVw==
X-Forwarded-Encrypted: i=1; AKwUvBzUFviddjfUki6EU9jjBnDUPz31UcBL4cGq1Luz2PiSVrR5ttgNt534A9Jv9npEC83wdDZMS6Zg3wNTm+eJTDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI16x1jepqouOD4qhvky/XDxyYTiABE3h5aVSyiMJp0aGI8ff8p
	Q3dNq/Vf/w9YIfoKQZ4id+YgADlllM7iuE+pGdc/63PqewOS3bMbThJ5
X-Gm-Gg: AYBFou1qIDE2o2pM5yYWfomLJH2sVp1XmSgpl2aMtXIUmnt3FSHDMMaJJpIvFzTD4TN
	oKJSVQod46g/5q//u3p91znbGXU/q1MbHFMRJD5rxuy2CtG1RjvuU2zggEE0DrH0X0RoBGjsn1T
	6WPgfIDwpfWmwTcAeLK3mC4uQ2yl0FxTn/sXHE2SpSKTHe0au6Pk4LXTQJbnpQpPj943/JGLjez
	eBQtuCIacPkR7mO3PDtzNv1ZWgIjAmOtqgL9WiyfainLzrV/WncpFiDKjt35GAvyWlecTEE/CUN
	2Q0Zn6I1mtrqY3Ura7cWGJOnglwxaT+V87xeA7jS3rU7htImW3uX4uKTX542xJCrOwUWEDjRLU5
	cwUqlFwqKF82BXonbKMoUWuUvdPKKwyVOlde+val1RzbaEQqa2jEIaCEyuDt4KM/Nzun579Yqm+
	3NrPUfV5DMJ4he9GT+GraHX0g51Agahg/EhIVr9s9qIvE0Z1H4Bsm6xw34BThcqOTwcRv/X+xR7
	Q==
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr26202339c88.10.1792085511888;
        Thu, 15 Oct 2026 10:31:51 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a5a305absm363860c88.7.2026.10.15.10.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:31:50 -0700 (PDT)
From: pdsj2807@gmail.com
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] selftests/bpf: remove unused duration variable
Date: Thu, 15 Oct 2026 23:01:39 +0530
Message-ID: <20261015173142.1361483-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The duration variable in cgroup_attach_override.c is not referenced
anywhere in the file.

Remove the unused variable.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
index 9421a5b7f4e1..28a946e2a736 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_attach_override.c
@@ -26,7 +26,6 @@ static int prog_load(int verdict)
 void serial_test_cgroup_attach_override(void)
 {
 	int drop_prog = -1, allow_prog = -1, foo = -1, bar = -1;
-	__u32 duration = 0;
 
 	allow_prog = prog_load(1);
 	if (CHECK(allow_prog < 0, "prog_load_allow",
-- 
2.43.0

