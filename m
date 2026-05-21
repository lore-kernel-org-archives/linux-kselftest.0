Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A241937EFF6;
	Thu, 21 May 2026 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356578; cv=none; b=usndN2+dosgG5lLV5KFVI7aCYel0mCPp9cNmljLf9ma+58yGVPP5aI6eLBXFfD/2VRCawt0UfEj5yCrRJlBOYuMBkojVhOuIv5fAnCJmHhhUKv4yzBxKWm3mJmLD3UJRGM3rfv+0Y5n18CLHtwDRiK/J5xUeMVSpXNaAfoFbHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356578; c=relaxed/simple;
	bh=yTM0+DachRaCQ3ebv/mHdvMi2slEK32jyYhH6IjaJYo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TdxckLnGakd8w7WCdWuK/7GmiYyJyJ2x+BXvOEA/pBWQz8+rQQt445IPkmDI2fLwqvMkzs4pNLYyTBFhP0WyyH38Q0H/pwj1Gg76YYiaV9l9+aBtIlQyzzIPy07HFmQJNoqSzGEKAPwkLY0uPk51eI7eXyqoDXydyCHRRHDnu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NLzjKvd5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NLzjKvd5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9308D35FA;
	Thu, 21 May 2026 02:42:50 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78CE53F7B4;
	Thu, 21 May 2026 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356575; bh=yTM0+DachRaCQ3ebv/mHdvMi2slEK32jyYhH6IjaJYo=;
	h=From:Subject:Date:To:Cc:From;
	b=NLzjKvd5a2IAhkUSgTaH7C2PWB4xTFB3K70YzIecWX7WHwed5bSwwNUYElaDPsLDy
	 /IxicyTg2W1F0j5y5i9rFEfuTCQq6CmuqC46GsCVWRGJaKW5ocQV5Bzwktpuekfsee
	 wQPMPo9+F9oIN6/0LVvsYxCQ75oTsiRpdmRvACHk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH 0/2] Add test for atomic uaccess with permission overlay
Date: Thu, 21 May 2026 10:42:29 +0100
Message-Id: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXTDmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3YL81Pi00pLUCt3U5CSLZCMjczMLSxMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loA1xxvRW0AAAA=
X-Change-ID: 20260520-poe_futex-ecb8c2276894
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779356574; l=2109;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=yTM0+DachRaCQ3ebv/mHdvMi2slEK32jyYhH6IjaJYo=;
 b=Begn8OO91VuooXMu1nVZlMnRiQRZqn5y/imnFZ+PLGkJm9SjzAqYH3XvSDP9g2EIQeQait2F1
 WpdFPES8KxEDraFgHWpF5gelz6Snm0TDrx5tDbzoPXHs7Me+xiDiut2
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Permission overlays are not currently applied for memory types
configured in PIR_EL1, meaning that even if POE were enabled at EL1,
memory accesses would not be subject to POE restrictions.

A patch [1] in my series adding page table protection using
pkeys/POE [2] enabled overlays for all memory types in PIR_EL1. It
turns out this is wrong, as reported by Sashiko [3]. User memory
types must not have overlays applied in PIR_EL1, otherwise direct
accesses to user memory with privileged loads/stores (and PAN
disabled) will mistakenly be checked against POR_EL1, instead of the
intended POR_EL0.

To avoid any accident in the future, this series adds a comment
above the PIR_EL1 configuration block, and a kselftest to ensure
that atomic futex uaccess (which uses privileged loads/stores unless
FEAT_LSUI is available) does work on memory mapped with a
non-default pkey. 

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

[1] https://lore.kernel.org/all/20260505-kpkeys-v7-3-20c0bdd97197@arm.com/
[2] https://lore.kernel.org/all/20260505-kpkeys-v7-0-20c0bdd97197@arm.com/
[3] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3

---
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Kevin Brodsky (2):
      arm64: mm: Add note about overlays in PIE_EL1
      kselftest/arm64: Add test for atomic futex uaccess with POE

 arch/arm64/include/asm/pgtable-prot.h         |  7 +++
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260520-poe_futex-ecb8c2276894

