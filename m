Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561042836A6
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066434; cv=none; b=qqtWhfp5WXpkn+jNP0BV+eFZvr0wbBpmhpJp4XojsgRT4bNFBvXh46l7gYWLlPSOGZ18s5+dOnU/iIuySvYgd8LGflNvE9y+OuQ/WMZ1mh2V3pin+fw2GuZ9Z3ywNz0dz7dCWCO1hxwbeWe4L6MD9QdUGwad0QEdC7oTBZi+5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066434; c=relaxed/simple;
	bh=/J5NsC9HXB9sVlaQvY4ZrGG/HvNODJXACbbshKQdfzI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J+/prx5YTyXN6dqSBWUyoCUQkGNWHUMFMnSgnNhJJQ+i0fHEqKjve2d7Yes9yQ0ZYRsO/Qa5ZKfmhW2Rfzc+iuBA0lbczpqlfACqLVLOLduL6OTm/rHSHrXKVOzSrF2f5RnGIdI/ltoruBUoPdOZcJCxH6mRohCP5i3LT7kuah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=swg/cDj/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="swg/cDj/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197e7e4e94so813919966b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066431; x=1787671231; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9KM8t8bC061fLb+PbV5Os9mUZaMLxlCrSV1jD3Uk+0o=;
        b=swg/cDj/vvDIcrYOdrIDMyKfljF4UXws7X/68te4RPzz8Vsn3YU9svpUxMXXJB25jE
         xv22GtwPawqEMLHBgp2Y02ATidjag7fPQW99qwV/a01bulKSUEvOUVWY9+xnP4JVx0jd
         0Ld6GoYEqA2mt9xGDMcsJns+lCz06ba3O+ey+WvbWOn5X+aS5Ysy9LWAHwMLOPGOu8Er
         Fk6p/weSt+6D3gMQceVtfR8eDpNEGtFVPQKYTW+f9EhTr/lP0nBst1HMN2ndqgcLe0JR
         n/9IMEdxLVf884kuM2DjIRSIOCV4lSoCijg49K74UKsW54e0giQPdGP7lFPK+S7ob3Q3
         Y54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066431; x=1787671231;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KM8t8bC061fLb+PbV5Os9mUZaMLxlCrSV1jD3Uk+0o=;
        b=bz7ViZ+KdymzipGyBYNaJ0XzdM6oiUUdGD6pw76MzDx/xU64s0BBt2lvQ+dRDTgrLg
         7yDvfYzOpggh72Q1FoKTKPKDxaaXJj6fFtrW9yaCTMSUyNlEQD3pzsPkzPy516gS66q/
         LW/PrhN1MATEizDnYNqHgw8lijRV9oqOGqaclMxfU4RGdZpH2YTh2KBaqmyXQtBLhTxq
         TY/BiKtSi8W17D1C2EeERLCcZRPOem3YoL9dSpajcZQrcxzIouSCm5j/y2aRD0fyxWGm
         kDAFw54PrMuzaccnC5pHPbTNB+T75etfT0/K9H2Sxf4D6VKL91BgG9CgcNy0iB8Th9b9
         10ww==
X-Gm-Message-State: AOJu0Ywqbqrpu29oTxl/PT9TrYrueOOKx2h9FT5wpNI9+chlSDXMwabO
	eGN/dGSY4ZxFpMHPBfQZXQ0OH0ztIRNPeHp1CqG9q2NFIZNq47/Sdmce
X-Gm-Gg: AR+sD12CLbHfsmHE5qXgky0mflHpZ3CYDGWflPTRkHXRUnM1q924Szpw94o0NqiFiJC
	ThJ7xd0JaE0zWuxP21R9pYVc3USb/3ccrb2z/3b37Nb/5Cu6TZ7WCO3lHT7P/7fXAsLmhEYbTfu
	Sn+UBN/aseUTRm04g44DqYkga2sVUfU09HB/uh2CEzByyoTYxYENLrESSBNuroSwevE3ynUgPcT
	kzc9/9bfT89IaaGZ3NnxkWjV9s1TNt35aRlm5jlYEXkYCc2vjIUdPlqYb0iZhdQSsK9NBT1SDgW
	3Yv+s1j96HWf23stbRy65AVDQb2KOeDMGVLrdqopj8dBhhLfg0YEJ8fUGS3MPmTOSkAvhh3LcW7
	RRh678Ny1J5OscRWd9UPmPts+h/uACzqWqDRrppzc5sCmC0je+a1VanFKGN4+Yq1LU29aF32Yhe
	RbTCw3aB+JTjTSY3mvRSve5prXaW8rI8Jj88J8nxA9ZW1fRlJ2ZneH2U0oG+99p3xHVxtsizhlg
	4S65Gmi1QBJsQpWZ4j61wMb
X-Received: by 2002:a17:907:1c1b:b0:c12:6d25:2c7a with SMTP id a640c23a62f3a-c212a2ab2edmr1569238066b.17.1787066431294;
        Tue, 18 Aug 2026 08:20:31 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm213893266b.21.2026.08.18.08.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:20:30 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Subject: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
Date: Tue, 18 Aug 2026 17:20:20 +0200
Message-Id: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADV4hGoC/yXMQQqAIBBA0avErBNMIrKrRIvSsSbDQi2C6O5ZL
 d/i/wsCesIATXaBx4MCrS6hyDNQU+9GZKSTQXBR8boQbFmV1bgxuzuKTFaiNuWgei05pGbzaOj
 8fm33O+zDjCq+E7jvB/COjORxAAAA
X-Change-ID: 20260812-lockdep-kunit-9628f4bcad90
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066429; l=731;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=/J5NsC9HXB9sVlaQvY4ZrGG/HvNODJXACbbshKQdfzI=;
 b=oer8aPeWmFwIx+APE8r2x8FbO7IFOz1Zzo4XvroWDn9Xo9slWJni6vPJh1LcMCBXvIPyujXY6
 6HbMBdCofeVAL7R6K4t70uT/JcpHZdCJ/dA4LCzqbMdL0dUFNOVur4z
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Add configs that enable extra assertions to be emitted to KUnit test
cases. This makes a subset of concurrency related warnings fail unit test
cases, and not stay as silent warnings.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
Malte Wechter (2):
      rust: kunit: add config to fail kunit tests if a lockdep warning is triggered
      rust: kunit: add config to fail kunit if TAINT_WARN is set

 lib/kunit/Kconfig    | 24 ++++++++++++++++++++++++
 rust/macros/kunit.rs | 21 +++++++++++++++++++++
 2 files changed, 45 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260812-lockdep-kunit-9628f4bcad90

Best regards,
--  
Malte Wechter <maltewechter@gmail.com>

