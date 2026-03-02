Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67B30C602;
	Mon,  2 Mar 2026 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492385; cv=none; b=OULB5ya91DMs/tTRV1GohCvHvzeWHN/wJGHj49sFh/Rz8DLgObSR8gvUlj+QnfvScTVQLUUmKHlHws2oWv/c+1xKbXxkGAgEj8erLGO759WKPRIBWP45jJnlmfJ/XhB8xxmHWBhU5ytu1AIrMPMmPaX0Q3tln+NEhuyHOiqQzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492385; c=relaxed/simple;
	bh=gOV19KPEmG6qQjPLN5UxzzlwQ7VoUg11/tTDEq/4rOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKGklD0V1arZzCwXCVqYsHthtre6QjnVfufAT6NS6nxiyWD8GfUG1jEuTGUYnRsaKd0flC0WzQAHxwG81mELx+07lRZTdbmtB/hLOCC1pG7Jveddaq7KjSxBL/xgltEyYTErg9uxSvDAJCSMZZtIPzvtcvSJZBj7gVnlmmK7moU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKSdAYZ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKSdAYZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B89C19423;
	Mon,  2 Mar 2026 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492385;
	bh=gOV19KPEmG6qQjPLN5UxzzlwQ7VoUg11/tTDEq/4rOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XKSdAYZ6nP2hHf6ghUqepYMXUEKxLNCG8XH2xFzmt6MEVgrOb122213v2kZKfY+DH
	 sWDf/ChUsjMgcKifFS1bLIQalKB4cXe/4THWbOvo1c48qncpbiTpL3q8BmVssU+yty
	 BahPs/KkxMOKRuw04wZS7WY2wYZ665Rxsjg8twnK5zapPl/aOILFVJxyVC1FL9X+OP
	 qCS1MByaE8C7wmDVcsWOGPryAhfBsw4g4VP5T7I6/cQBkRLqTEhOVbIjNkVZYPib7o
	 x7QDjsAaPvoagn05jyRLDmGDQL5A7Wk02sxrsqXLx9k3FExL8FmILYxL6Zhg3366yK
	 JYoDYy4CXrlYA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:20 +0000
Subject: [PATCH 5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to
 DDI0601 2025-12
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-5-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gOV19KPEmG6qQjPLN5UxzzlwQ7VoUg11/tTDEq/4rOs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZSiXUQ68jk0LvIbAWxVLEe80A/d0CuDUHsp
 uAP2Qs1K8qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUgAKCRAk1otyXVSH
 0HFSB/4qJmd27YIhHKwPZXYNA6Gld6nKMyla+tcVWxPLysOcB/tfjs5YE5mjQj6o2Yh1nQ1zBgZ
 Ht7To8zg4LDFn1X+BeL5YdZsoL65oiytQlvmEAdbr2VX6PLxhnCwINEoDObEajjRgwbatWDidFe
 W2JlwyAnhQKoT9H/VTODSL5VDk+YPNu18969M8rWllEyCicB9YUSAQHQ4wVaF48ZjcUZOvoTLj0
 qY4HHfNnhwJ/cUU/ZOdHofM059BnI7at+TZCNw2jANNixlH5AxDsYtMiyi6vtkDOgezFjk4VrbZ
 hX+xsxEJLOGIMIfEnf7RtJ5VLkb1PFYuCFv4Al5TUmX92pTa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 extensions add FEAT_SVE2P3 and FEAT_SVE_B16MM.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 451ad312dc78..75b8644c4753 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1496,6 +1496,7 @@ UnsignedEnum	27:24	B16B16
 	0b0000	NI
 	0b0001	IMP
 	0b0010	BFSCALE
+	0b0011	B16MM
 EndEnum
 UnsignedEnum	23:20	BF16
 	0b0000	NI
@@ -1522,6 +1523,7 @@ UnsignedEnum	3:0	SVEver
 	0b0001	SVE2
 	0b0010	SVE2p1
 	0b0011	SVE2p2
+	0b0100	SVE2p3
 EndEnum
 EndSysreg
 

-- 
2.47.3

