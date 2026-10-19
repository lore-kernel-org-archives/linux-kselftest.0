Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA27339397
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375104; cv=none; b=Ultg5dDUbRBaqbPiPN35wWL57wMhWnrbF5oBcQAt3witNbbG458xVHJCx2zhyeXzozFyzwRJiwKXbptpm1EcAvKBo4AFMZSekTCud9xxfSYLQqw4Hk8bb0XBXS5T+jX41EFy1DUBkPKY11u+AYCkAfDTiqbRF8UnTaPkXq2iQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375104; c=relaxed/simple;
	bh=IvgpY5vdVqEpCEAsZKzoB7BbMpzUVF8+3uNWD1OUHNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iCZ8o8u8uNk3HTbg2SY84n2h++ieMWyl6Yj28RlSZLWgn1HV9x0RCy8EcGScluBG9zsaSG1WpIqSN2PKetFGNUSHVGQpetGOmk8ZisrIfZNc5HuGx6izhYtP7+vORGy4qr7pzlVUJKfOfgaiVVAqqp6t3b6S9b7cMpNWd06vayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cndT/ivD; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cndT/ivD"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1830735c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375101; x=1792979901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=cndT/ivDicq5kDK3cPUhETpzYzGDIDiSeFFuKde5Q97EeoxUYr2TTWIRJ1cRzieW7o
         tO5tatlKgakdZrxY4q7zVjPH5LYdTyH2tefyLiQWQXRC3xW9ZuauFq+goFKdQa7HwxoQ
         J+lqPjAEbtSfaS6ofD9Cnok7iY2/yhvmeYCDteshy0zrv7347A0yMmO/5gzWT4AHFB2a
         uNZxX3EOI3aSjnTNSqK9bHxMbw4PsnLG7qfntKUxZJO2I6fDCLr/vCY+jlLAgb+cgihh
         4baB9B9uithiQUZqHU366ycEoW90URbZfhoGoleIZYKNmMV9a+KssQeTHISo9VVZAq/o
         f1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375101; x=1792979901;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DIsHUtJOv8JTVFKl2AI7iFPSk57QktOjQTbDJ2/Phac=;
        b=rX72BXPItovhHpRCpiyCJTPM8OclswmjdeRrCdDufzzJ5VToSwhmb5vNXku97yg1VD
         eiQkpLg3gW5itaC8A8QNXV2qJKb0pJhWEYgH88AcRxHFICJ9rFgMsCGjhQ5d+6wSkiCr
         3tmVzMGemqjcjYQSHDBPK2aVgtgiVy/SGDdaLnQ6Ux38urDvwsL7raTsrg90fSoFkbxm
         1C9Tvpb/Hqlg4O02WjgfFyhuy3dTAhhPmyM4nmPBdYXzcjGARx9t3K8Cemg59H0w02ii
         R8rv3gGxtIx4ycBAS6TdcrRTejAxVZ/E/st1WbxvT5WpfpsQH9+8Ksp97feuKQX0YLNv
         6tPw==
X-Forwarded-Encrypted: i=1; AKwUvBxmmc5LIvFSweYtQrjjoboUGvxs5i4l4QGmNzW7BgNLDVLFMZjjfarPhyZgtpAm4cxs+h1nAyC0iIQCbOVZ//g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzcoro92ZpOjMx2z/C0nlUDW1Jd/akhyuj15XhNX0uvxjsQo3E
	qWsfZj1AmZNR9NCzJKa7NrxQu14x5mDgMfW0ohbPZy17xg0Ie2N9x6Rl
X-Gm-Gg: AYBFou248KfB44+lXsEWajB0ty56WEzjYGLNFrM45oyZRrnVSWDo86i4ZBKLAeO0YlL
	j+q1J+/38b7eTGNgujh1eKXVNMGizdFkECahRFxJJOpwgaWlk5IVpjmo0NCr11WahbFF1ZRWvjM
	/BxRaP1Y0+iGz97WcIqPhyY/5Ox0oq5ipJ6zJnf00tM8k03960Xw0yq+HTicauthUvO8WkUZiME
	iHoxkBVE6iwmTiadXsTxG5Cv0gElUT2qMpKcgDjL1RywVJtZFB80IBa5TD4oka6AvvpLFM3r5aL
	eM+efnYK1kZPV62LGrCTSPEAzwhI1l6Y4CY93YkaglptPl9aGR4T05bgwsjmIygI0NcM+fByAaB
	Rc4rJdQAOtDLSJ3HF5KQjmwLUXBDSP/2KaLCbVDfgvUFVowjdNjWUh4Oy54EBdLd+okQsAElj+Q
	DSrOkRbegLf2LoaMO6THq7BSPEEX0ULPi5m0WHtA5bqT9Y3j1/AvAhMmBlsVs6WcIrRes=
X-Received: by 2002:a05:7022:150e:b0:141:b2c3:d84e with SMTP id a92af1059eb24-185120a8bb4mr10990864c88.11.1792375100720;
        Sun, 18 Oct 2026 18:58:20 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm24177311c88.17.2026.10.18.18.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:58:19 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] word-at-a-time: let KASAN see load_unaligned_zeropad()
Date: Mon, 19 Oct 2026 09:58:08 +0800
Message-Id: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADB51WoC/x3NwQqDMAyA4VeRnBdoiwT0VcYOmY0aZK2kTsfEd
 1/Z8bv8/wlFTKVA35xgsmvRnCr8rYFh5jQJaqyG4AJ55zt8vic8skXkDRk3fQl+xfLKERcunJD
 H0JJriUQIamY1GfXzX9wf1/UDDOF2FXIAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

This is independent of the strscpy() fix, which makes sized_strscpy()
copy byte by byte under software KASAN so that every byte it reads is
checked. Either can be applied without the other.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  7 +++++++
 arch/arm64/include/asm/word-at-a-time.h            |  7 +++++++
 arch/powerpc/include/asm/word-at-a-time.h          |  6 ++++++
 arch/riscv/include/asm/word-at-a-time.h            |  6 ++++++
 arch/s390/include/asm/word-at-a-time.h             |  6 ++++++
 arch/x86/include/asm/word-at-a-time.h              |  6 ++++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/kasan-checks.h        |  3 +++
 .../powerpc/primitives/linux/kcsan-checks.h        |  3 +++
 9 files changed, 68 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

