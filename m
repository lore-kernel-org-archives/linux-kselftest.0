Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C53AAF69
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792261546; cv=none; b=eRtYkKOm2/+gC8Pmfd/KBFKXdlBmMzj1nblPgKzy4g//wBXOe4mHlsDcPbzXaVSqcA9ne0YSYdaqbbnyKTCRfWrOGqyFEFIYXizuoqOIuZiZmmB9yJfFFuz+ZoHUIwoJADYNRClk4VxUFzbkZ84yFpZ3WUX6jBDpKHbV3HAfOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792261546; c=relaxed/simple;
	bh=t94hsbrtkFucbaGDylnmE2KXa81VKRPfOEo7S50teV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKdiTcDdMxiAqYfi3yM4uEOplF6OWxcu2EIGifXUeeyR2DSITQLdpnD+gDP7O8F8HUaDOkTF9GNhxQ6glvN1fl8klI75wcWRjHxiy7Q/7PfTjBAv2NiJoFsN0ScwmR/c0OyGhkNaxpd4u3YARYKew6gH6f9HCYa3cv5GhxUl0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2W/TEFa; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2W/TEFa"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so333823a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261544; x=1792866344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=A2W/TEFaDcNkNh6Agn+ggZ7P6GW/BOrVBsy1zxMpzoo+feDiFgk9TjBtVTATUfRcv3
         R449u5723gkIKazJU7JsAiKoVeCQdROWimUy2RUWwj78n+cnbSnN4re8EhBPEca16sGp
         o6IE1WgmOqFxMAIMc0p8R1sA8UUPA0KXEeqdu8mgu5o8JtPxo/5yDBp0ICaBQ80RZpOy
         m2rKz0ur1NpZ+0/KKQ6cfqWalaExY6q4AGFifgHKlYB2JFJ+Ei1X44HNjQ1dV+UTlSoc
         OCJmRx9FkZFJwzvXjLVK9VTHBnIRPgdbO5Gyxcho25SAv1CFw3JdQp79AgyOVHGOMa+P
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261544; x=1792866344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e9nJ9wUb+VNUHZnaOg0k/Urr8dN7s/5sJvd32soOTw=;
        b=YpyyBVjGI+udhdAEQjdDwlLNTKuyeE6G+1eZVCGl9yAj4zEVg+kLZwh6lq5ar+YBmD
         9RA+EpB40YZbUi7Uwmd1K+3n4RP8/jDeQj4TeCsp+66hkjAT5n6kqXaNMcD2w0aQmXxo
         Ht6IJvR2E9JfyqUJoGxVxVqpcmasoPy2LQQuXopYh+FIXnb7AGzIRfQOAu41EX6jAi+p
         y9QoVilbh1uXNK5uhBGJ32nXvEGGmYAv6k93SMONEchBrVntEr4FQG1f5yDygW8m15Jp
         jGWsJy0TUgvPBk4Q7VWZ9byu0YsLgiSc4UsYQETE08zbIdyEJv3kSt85JE+KUvYRSWfa
         2z6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7eUlFPAqkI8DS5RVaFV0QLAvRu59Eq22NVrwCF1MGBYWwSbJEJe2npZHDNPPCx1LkGObn1eQUCsumD4h7Cx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdhoJNDMVjaaqijb8BuMMYyhELGKwQEPtHuCE8r0KILYN0ntqy
	w/nfx/BZD9/qnjLOHnFFP8UMHxwHak1D8x6CfBFNUCUBOdN6DZv9trsl
X-Gm-Gg: AYBFou17gTp2lpjEasRnaQycCN6zpy6IsGd9KJAwtdAEgGCD8BvdXWWd0Q40McP//Xj
	8fOZiKrcO24aTV/BfpIcyiIrbDzhUv8CwAgNjbKyuK0pkGB405JK+SyWtVMrSU4UCu0UpTeB+am
	LF0vf6sEnwQ/A+Uiz/ekrBiqQ1iry2v/f8JhjiNuq5MZN0HUB8Oly+FcbpJPftBvFY/ARpBpgh4
	nEX2sS5TRKTmpdAlMjn1u8a0x1pK6bPSQrlXo8oJriWCYWn6vvbLzMGws72wQ5kvg2rLo8QY89R
	0eH1SP/ifYlyfevs1ZnnmqaEgqSBHtGy3i4oe+M1xfnGqzw9Mp7XsIKhtBHsGLT56UJlZWnCyOw
	Jo0xF10M4B1rxWDeR7rGbgWL/HolOc4WSnTaxsvvSXTkgnzLj49//M7ZpVmiktxBCe9wx9lqRKv
	/qvKkWgz/5gNWygBF6UI1x9JpQvQ0UnJJX4rYeVSn8HyN5NBnGD1OiyfQ+8LyjwndfGFZ3KFPNA
	joH1M/RCucR9MzyQltSw7UpaM9q76ec9QH8HGIkGvNuwBwK4BUs0qe8CgIcf+yawGTYwt44JXl9
	6g==
X-Received: by 2002:a17:90b:17d1:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3acef5ea843mr3055404a91.63.1792261543994;
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:56a:78dc:9300:8846:761:63e4:6d67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ecd32sm9241586a91.3.2026.10.17.11.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:43 -0700 (PDT)
From: Abdalla Eldoumani <aamsdoumani@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: [PATCH 1/2] kselftest/arm64: Report test failures in vec-syscfg's exit status
Date: Sat, 17 Oct 2026 12:24:53 -0600
Message-ID: <20261017182455.1884-2-aamsdoumani@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>

vec-syscfg ends with ksft_exit_pass() whatever its tests reported, so it
exits 0 even when tests fail. The kselftest runner decides whether a
program passed from its exit status, so failures in vec-syscfg are only
visible in its TAP output and the run as a whole is reported as passing.

Use ksft_finished() so the exit status reflects the results. Unsupported
vector types are reported as skips, which ksft_finished() treats as
passing, so systems without SVE or SME are unaffected.

Fixes: 95cf3f23877b ("kselftest/arm64: Add tests for SVE vector configuration")
Assisted-by: LLM
Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
---
 tools/testing/selftests/arm64/fp/vec-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/vec-syscfg.c b/tools/testing/selftests/arm64/fp/vec-syscfg.c
index 8dd932f..2c8ccbe 100644
--- a/tools/testing/selftests/arm64/fp/vec-syscfg.c
+++ b/tools/testing/selftests/arm64/fp/vec-syscfg.c
@@ -792,5 +792,5 @@ int main(void)
 			ksft_test_result_skip("%s\n", all_types_tests[i].name);
 	}
 
-	ksft_exit_pass();
+	ksft_finished();
 }
-- 
2.49.0.windows.1

