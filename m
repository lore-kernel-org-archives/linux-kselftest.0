Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0914846F
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781971852; cv=none; b=LOoUXy6HK81daWQSNFflf7FU+9kGesgP/caGB+IHe3aYMd0dljoTGGnd6pCTMRIUMuTk7HXgdpbag8UtWr8/Fp/ThubtOasnIB4tldsTINp2crq3CnOsaAYphpgSrPAI9nYA8EGhlz/psRwQQTJwjkBpKrLlCpthxZVtZA2HiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781971852; c=relaxed/simple;
	bh=k2HnsxgzDiy42+iRPRXOsIdSJOOhHadHBluwc520DhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BhuZwU8CgH2Q33UNfiPyI7kSsEoOttSJhnhkbmywXpwB1yX0DcQpoCfqdi/hUfzuzj5n1n48TQA/4b0DODXQP5glsnhp5KCsWfm4BaqwFmT5nF0aQ+bE76jTVMiaVMU8KQapzBD6cwlbRfTJxzyUV/IjQ0BIbp3/chqGb0Qwjo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVpV40LC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVpV40LC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37c5dabff14so649416a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781971850; x=1782576650; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llHAAm5lQDgD4TpHH7oWCsN+3rgebubOi8LhvcJ8g+g=;
        b=SVpV40LCGnFMUntufmlMx3w8WytSZ56nDmjbZRe1RQKAnZ5MePBzj+FbMQzUax6EnW
         EOq2Jog6XObBqydgrYB0llMw+M0aOX6VVejdENd6lzgvfbRrzD7R68VtghRk/yfz2DvN
         whhu4QyxgtcSNAogstGnEjxhppGmzkLIsVn5/bj8JMA0jKDvqlkjREPlpS28bfnRlDoO
         MBVDfStWR0FvhZQnE50OR7xTRQnS7rxNgk4rHEzNqEcrd2qGHvT8iw4Ddcv/N5DaTYJ8
         mDObqAYb8wYxPAE1ltE+3+QCmXqDq/kWupeQtTLMgylA5EYhuMzc0SG0TxLkle7Eme/e
         SPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781971850; x=1782576650;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llHAAm5lQDgD4TpHH7oWCsN+3rgebubOi8LhvcJ8g+g=;
        b=WCLp/JIzHlThkTDOG0sp/3rnzlbVUZnRd12W0tYZd9H+p2XeUgztk2ud3GBOqDCtG7
         gCIwoCLPSnogoQJIbGMNatcM4MO9ImnsnZ/Bs4R83sWsfVjcHr69LBSmiBWW8VBDoVXT
         UUPjgugtKpmQ7pDC8rVU8vUOQ8N6SfFvvC66pympU2ma4i14lvFsLG+dqjhd/vOydDD9
         6d7sYNR5dpkPuh0ao/sJwzOAiWk87g6dxsJ1mmNFGOM+jPe5s2OccgdHf1s7mlpu1ALU
         CXnyCSdrInHgD7mfonUOAmv3XZDr90wMkysCnJPOr8B3KpyPlCMyZeZWgeDYhCGyfsgW
         DYXA==
X-Forwarded-Encrypted: i=1; AFNElJ+2g4TbKSxcNW3TjjazdgVrZhOQvFaJB980VJ6PbZ6XMDIvfODQaeTUrUDkrODMSlYirnG6A8ya0RY6E8Ewgpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIQkzUo/sTGT8E9dU5bq8cw06J0t00gHDRUm/VWz8mReP4fLE
	F7lxJJJ8pu4m1ZQDy2jY0fwafqe+TaANOTV8BbZbJpOmYwVC/5xW+721
X-Gm-Gg: AfdE7cmXm3CP16de2/VI/CNfMAWzEAcNgBaq4pFlXZpGZCIZcFs4Pm3/+kT25U9A5wy
	INLRS5mXbJZ9lpp+g0iXj9RqI+1zcuU2mBTisP4/OayrwSAl1E/C94GAYkf35fb4mTVaKz3Jkm9
	uVFNd6upqKjaaiRoSHkt8jgX5NeJVHvMtBVf5iDqm0fgvSK4WKaUgoGPoSyeakCnfXI/+ENfqB0
	uJuQQZk2jHxynB8DzICg7g05rm9jES1+wq45pClZlDKzuSH7UcaRk1svIlfW9Ys0eSKpsarG/zF
	zmgPJnecTzhKrBAdvysovijmaV1jhKmUwkn4MWeIYYyBIRm4Pleg3FXtxCBW1lyLQrTnG3xK/XU
	uvLIY5qDH6MFahrqh4gQPPsrJY8fj3rse3fIVBC+eiT9Eo1P5cWKhLIgOyfnAVodpMTpfqXlw/F
	4mbiJGqr/QKPS5MUgociRk
X-Received: by 2002:a17:90b:4c88:b0:366:1075:b9 with SMTP id 98e67ed59e1d1-37d1514c3b3mr5342267a91.0.1781971850135;
        Sat, 20 Jun 2026 09:10:50 -0700 (PDT)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de501asm5766254a91.11.2026.06.20.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 09:10:49 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 21 Jun 2026 01:10:43 +0900
Subject: [PATCH] selftests: filelock: add .gitignore for ofdlocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-selftests-filelock-gitignore-v1-1-119da1a4ee27@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpCIRAF0F95zLoBdaHRr0SLsDs2JBqORPB4/
 560PJuzk2EojC7bTgMfNe1twZ82ys97K2B9LFNwIboYPBuqTNg0Fq2oPb+46NTS+gBLOsNHJyl
 lT6t4D4h+//31dhw/Y3orrG4AAAA=
X-Change-ID: 20260621-selftests-filelock-gitignore-f78e160f77c1
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.3

Building the filelock selftest produces the ofdlocks binary in the
source directory, which then shows up as an untracked file in git
status.  Add a .gitignore so the generated program is ignored, as is
already done for other selftests.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 tools/testing/selftests/filelock/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/filelock/.gitignore b/tools/testing/selftests/filelock/.gitignore
new file mode 100644
index 000000000000..665b62bfa2b2
--- /dev/null
+++ b/tools/testing/selftests/filelock/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+ofdlocks

---
base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
change-id: 20260621-selftests-filelock-gitignore-f78e160f77c1

Best regards,
-- 
Masaharu Noguchi <nogunix@gmail.com>

