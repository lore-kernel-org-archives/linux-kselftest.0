Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20C2ED872;
	Mon, 18 May 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116928; cv=none; b=NkuaHuqVpQXzRGK8iYQOcpXY6ZR1QZlMnt5mwelbfjXRrB9+gl13OBN/akxeSb+togV2j+gAxHBr/jOK4KFwNwB44AoPh1pgt07NGeSH9eeFTod6ZoDmUcVR7jxrz+jzzHjVFnT5TDHbdqvchlOszqHOSXlvWg0n3n6833gDOKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116928; c=relaxed/simple;
	bh=lpEVRmpOrYB1LJ4ZseWrDJHT2FJlwfH7Y7gl+Sz7VhA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t1pZH1jkLcbpdYwzhUPgznWpbpeISPiTXLozCvhxY8cJe3ZQqF18IASIfMk6M5tB8LI0gnc+oABo1eC04nuk/DPauMmWOxwc1en4M0JWNUO7kOUcqwTjlLv403AKHB4wZYny4OpIrQfuJK8MOvmIsM9S9TS6WtO7emOfCekSOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkpXDO77; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkpXDO77"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A41C2BCC7;
	Mon, 18 May 2026 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116928;
	bh=lpEVRmpOrYB1LJ4ZseWrDJHT2FJlwfH7Y7gl+Sz7VhA=;
	h=From:Subject:Date:To:Cc:From;
	b=VkpXDO77/1GfQR5Rc3xvtNKFJh5UiQ58NFUzSFTx/rV8CpMEH3d1548IlPcDsDeNu
	 AtKim2gneMYfzeaWvLseFIMk9qAJsiOChOZF3cDc73P3xengOF/vupfQQShT5nWD5P
	 unNK0GQnOBo6ZxYpnZxGfFWR4FZ47WJqX9dE3Nxf4ibioZUKVmLijq456hNnt8TstN
	 ohDOTYgPwkQwzcjka8wqCXKheYpBnYRYzFHNUvKceMFvfI6YGwxQRG8GJyfPVWg7Cj
	 NQ8kQJWrf7L3emi/v7Kt1vG0aNGm+RamVJIxMc15fkTi3Ex6egBLPlJ8AoU+whfqbH
	 854DTA/Rm3w2Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] arm64: Implement support for 2025 dpISA extensions
Date: Mon, 18 May 2026 16:07:28 +0100
Message-Id: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADArC2oC/2WNzQ6CMBCEX4Xs2TVtgQU9+R6GQ4UF1h8gLRIN4
 d0tcPT4TWa+mcGzE/ZwjmZwPImXvgtgDhGUre0aRqkCg1GGlFaE1r0owWoQbzGEKVZEWWyZbMk
 MYTY4ruWzKa/Fzv59u3M5rp610Yofe/fdPie99nZ9rMy/ftKoUOVpylmdaMpPlwe7jp/H3jVQL
 MvyAy4InkHDAAAA
X-Change-ID: 20260106-arm64-dpisa-2025-d6673ae6acee
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lpEVRmpOrYB1LJ4ZseWrDJHT2FJlwfH7Y7gl+Sz7VhA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqCyt8r0nJOa8Gee6eyUkKLwh7s/bXnJEA0I966
 6UcGq7LXMyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagsrfAAKCRAk1otyXVSH
 0DtFB/9L0p0xB7VOh8o6h5hGCJ752qEHcnQk7O8ic5P8j2mkFGuTX0jeT7fILuHLLPPHamCq2aR
 DueAGvoXqsFU53km8UErMH5JkG8KLBKWPrivUPBh+0lwtFV/QUg66URVV6b26+CEjZALv8hCylO
 mU7JEwcwbUgo8XXM4EqxH0nDOUN/j0rytYMFcg83PbbrxX8YMaTwt87GxLPDXoYYYiDQ3A5pzJe
 UIsr59ND7C/IDsNgrBY2coXg3KHq403qr1Iv/npPUq7yCBdDNtZSTtyY04rMxXNsoIzZ/XjMtaS
 +paUGOZmTuzlmm+L2n9jLpfbQzDnzdKAoZF2xQ9YfKSdVEgm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 dpISA extensions introduce a number of architecture features
all of which are fairly straightforward from a kernel point of view
since they only introduce new instructions, not any architecture state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rename HWCAP3_LUT6 to HWCAP3_SVE_LUT6 and make it depend on SVE.
- Rebase onto v7.1-rc3.
- Link to v1: https://patch.msgid.link/20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org

---
Mark Brown (2):
      arm64/cpufeature: Define hwcaps for 2025 dpISA features
      kselftest/arm64: Add 2025 dpISA coverage to hwcaps

 Documentation/arch/arm64/elf_hwcaps.rst   |  24 +++++++
 arch/arm64/include/uapi/asm/hwcap.h       |   8 +++
 arch/arm64/kernel/cpufeature.c            |  11 +++
 arch/arm64/kernel/cpuinfo.c               |   8 +++
 tools/testing/selftests/arm64/abi/hwcap.c | 116 ++++++++++++++++++++++++++++++
 5 files changed, 167 insertions(+)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260106-arm64-dpisa-2025-d6673ae6acee

Best regards,
--  
Mark Brown <broonie@kernel.org>

