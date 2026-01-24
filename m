Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420524290D
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769257970; cv=none; b=QYPRkq6XIu7jfhw3NhLPfSRVcYUTwgjx9+FcITonRYQmP3oNxfeJBZnyAPvIyKPYP8a/azohJwYWwhbbxReoxMv/mYN5KKGqnI24I9jOdxVlmLGR6OfMezy8yh21q7iJehUzaO/0fMbxhMllQskS2gkzMezD+6vJ8512Wj3Ymbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769257970; c=relaxed/simple;
	bh=EDOMUnShuWyRdBbytjBlLoX5GMQiwlhBv1s8A7ZO+fY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=al/E3Adfyskf+MOPNbsFARl/EXYt2AIDU2c1mGRuXT0psh80hbCpefQvooahDzf5HUiZAFzJIW93wjzok486/rHIkkkZvdmjCxy7ranrmkaOS7Sf8wEjsWBL8yB6vXRaSZhMDMskkWyI52agTm/myWF8Kg2YRIEo4MjKL2XESOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgCfuup9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgCfuup9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a78e381fc1so13916515ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 04:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769257969; x=1769862769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd2Zed3zKZmPmdTTOWk/dlMTWvo4vN0lvMRs9ZwBpHc=;
        b=FgCfuup9jQKvOfJUro2Gyh77Inf6HqeGUY6n977jp/Qdy9kwOXZ0TItavWAKsOAiJy
         o4PlUOcpycBA4zJU7N+QW2rctDdiQpfnPXTZUi7702yhUfcxvXbsT4hiZ0xOvqR+r/Py
         /qqtu/7f60qt07NubIcT61ojXaVB+hXdtuMgSE1Tr7M8zMuqRwXyuGu3YeMcBIN+qYml
         xh2iRzm9TFXSBdmf5hlunOcdJpsa7Ag4JhPQaOb2k1POF38bHjhpKmX4k7f7H8VjRbiP
         wCY3sNVvD7Tbd3mFztskHrC5C/g7LXwdCJbyRMSrSgOpO6ZdvdKQ2NBIfYKaWGTJRbHT
         qiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769257969; x=1769862769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd2Zed3zKZmPmdTTOWk/dlMTWvo4vN0lvMRs9ZwBpHc=;
        b=aKHDw6xj0bTqbBOJLcWdp5vVoyvzQy7eOWLJHVezPVC4lIYj5Uo2awkSAMIsP7xaF2
         eEIRuaDrfsfq07bWmsRvQo++N6hEGn3paatImiKSUftPs9yiXf7OrtsQWLf43MEYVNQw
         c7J7tYSwOmQMlaxvakXN6LZ309hcQUKcimPdDoPEX13cA4c1nOXlPixtre1VhQqnN9I6
         0ar9646KF6Iucb2r6qusizt7gaOcB6EblM6yHwQ/zyZEGG9AX46My+0QqrASelauGFKD
         q0eiSKWbajAeMk3jC5vS+0atSaDU83gc8wqJOvyXA2JUHswHiqrrXcfCvbHHogZqDTB5
         XLqw==
X-Forwarded-Encrypted: i=1; AJvYcCWRBfnUsx+gOk39Gp4EQ88OiUDsg63AJ5uXv8e//ktaAo/phdbvByFzAy6M1+WksHCL4031zbhzFvjEutF6erk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzujncRGJ1I5nTBsabgYuZ1aELyXEBaVXHUWobnB6Xhrq8c9Y/w
	RGPVhe4dIHyn5wpXsiHJjyepoMRIc2ETNbHXVMfvBrpEWNp1fHMmMQ4u
X-Gm-Gg: AZuq6aKLkfV8l+e3WR56sR+qUXfO2d0hbJ2yy9Pp5YCb26BuDD6MbXt/MuemPdpYadv
	V2cIBuKD/HL//Grk/vfAfES3l1Pf+JOEQOtFi+V4qoZkxrLM9rOUPGoFD60OWkteq0YitnEciwW
	omxs3f0SLqXg5o+Nje081kVhkIhpy43EYVNbouCsnD/gGzz45sauAR2kaGr2SLExfHxw/GWv39D
	NeqUgkFjdIMaC4Ff8oHaSMQ8Iq7WQoaKr4pc6Tkp0N0g1dphtg4oNx6KAIIW16hbdvE/VhwLkae
	6oWQn6sxBjJePL4lR3rMvLILYKuihiyDJqMcUE7c2/ZoxlPncLKJl/f0RUt0cGLrWHiadrfeVZw
	fr3+kt/Z9nCqh5+BN5RQC85giRNoEzjOlk7Sk6XxUV1yVr+onQBZE3tGOdyvSEVUJCepzDHHs12
	O0CHjK7PUiCToUMX+gfFP7OvU2MeNmQMklXZkp
X-Received: by 2002:a17:903:360c:b0:29b:e512:752e with SMTP id d9443c01a7336-2a80ec683famr40477875ad.47.1769257968605;
        Sat, 24 Jan 2026 04:32:48 -0800 (PST)
Received: from MWDK4CY14F.nvidia.com ([128.77.79.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354cdcc7sm7366542a91.16.2026.01.24.04.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Jan 2026 04:32:48 -0800 (PST)
From: I-Hsin Cheng <richard120310@gmail.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	I-Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] kselftest/arm64: Add missing file in .gitignore
Date: Sat, 24 Jan 2026 20:32:41 +0800
Message-Id: <20260124123241.3257-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary generated by check_hugetlb_options is missing in .gitignore
under the directory. Add it into the file so it won't be logged into
version control.

Signed-off-by: I-Hsin Cheng <richard120310@gmail.com>
---
 tools/testing/selftests/arm64/mte/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/mte/.gitignore b/tools/testing/selftests/arm64/mte/.gitignore
index 052d0f9f92b3..f6937f890039 100644
--- a/tools/testing/selftests/arm64/mte/.gitignore
+++ b/tools/testing/selftests/arm64/mte/.gitignore
@@ -6,3 +6,4 @@ check_mmap_options
 check_prctl
 check_ksm_options
 check_user_mem
+check_hugetlb_options
-- 
2.39.5 (Apple Git-154)

