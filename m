Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDD471CE4
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066439; cv=none; b=b+j9Tgljn/1AzqAiEMLYXrAxZR0lX8xcWYbZEOSPhq1MuYykghtQ+Vo0QqKu9nrzKmhCzCsRaorYHI6HJAkPBoPpXJsh5RAGhkWTg2r7TaLS7hn/hGNx2EKZtUF9hjKIFaWhFdtl7qqTGp5vyLSb2tWAO07f7ByushPYRcomQ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066439; c=relaxed/simple;
	bh=6dAacv04h6+fbKsAtNuH1TZu5kOgCxlFp0QG+NiXDjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwhYsDuOGVgfGCDupBx1PM+mAM/GegdjI2+yzIzuCvbEildQ/0VsCkG3fVdVPB0hhLkvpJsF9RSfBdbF1D2fXP/KJ11OAV0QI9HVi0nVxSGt2pYo9wnPsp+kUwX6tc6smS/Aj3Vm8T0o8I5M989iXbG7AKy/x98MsR9e3GmrTCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p12/inqK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p12/inqK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e592da74so648773966b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 08:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066436; x=1787671236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06fwIs7Il0udcSLvnfSZmsAN+uvE4gcV1+TENh0/uk0=;
        b=p12/inqKw7vAnCiaXAPnFW7AF+hL98CmPnRqhT7PjAisREFK8l4QmqJw2mjltobb9s
         jD866ZMyenag4gsmWs2qVu7EfAD5IbDNpSlNQbDN1bW2lz1pIh9K0B7WM1zuK1tqvzV4
         Sgp3Gmdn/w3Qz8AnjjpmpnkYMES1HoPUaItIAirG7f0HuH+YZxkqMgH1SZwefv4L+CeX
         kbFMmKcYOANo0I5CnWGk9QNUE3NtsRaMg9Nu0DtAvCKbnVv7koImMOaTHxYphp33yVzo
         czLE6nLH0a83GBxMvBoge2tbRnVoMEzXLWW63kkzml0h9ikV6nVXJIPZYnbp92G9NFcg
         nBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066436; x=1787671236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06fwIs7Il0udcSLvnfSZmsAN+uvE4gcV1+TENh0/uk0=;
        b=BHqijQJatqUrdcDuhSbrxdAg/bXLbfXFJyJ4i8GW+n73HrfIxtdg9ZBUlUjI0tNt6B
         4ksNPZGKX2mvJLLxIm6pI+OVxO2mr8nw+1M25QKcFU5kuwMF/7sJ1adPyco3CI7bAS3F
         BOPxc+gM+05nzb5Zotji6IJ/Ov9b7XhXnXGYdMb8zJ1Oqp/A0aAQ5mNEOH7HRJRqt33u
         A7EkrTHt7ccSMhV2KXqzKhX/gUwoK8ZK1HpSxPaC1YMNnDmHgHM9r5TqA3voBIDLjRYB
         4L7KJX20nQqfFoHcrKSqEk/D/vs3cu5er5apmDJQ0x15WbCI4CS643N/HYmi09c5/cvj
         VK9A==
X-Gm-Message-State: AOJu0Yzc/T7RMov0h2d9CP8u6YqdwOpPoufIV17b+RwvEIj6lllX+/g+
	1OKK4HFanNSvGuLr9/G4brla+VIBiZYVV3QL/cr16rQeOp9LOlads2AH
X-Gm-Gg: AR+sD10F/gVmhKIyrDZ27dCbqGbZgHhMYURn5BCQQa8rxryPoEOToDvaWNWkrZx0O+Z
	1YsDm/dx7Dx6exOohjlKCQr+9XL780bVEGOH4HiHfwBzz+7Oir2akugZCSKSepCmE5xCzB9bY9/
	+v4XT3oEuVgfStfOY1ksvTIIPIi1S2h2rFieVw3SehWmKemGVZYtU+RJ2lK2pNftgSKKLk+Zvu2
	WWgGn5RN/MCMnONWAihkAqWotxUE23TYTXo1ug7z7HwloOcdI5k0ZRrzBefMdGnwhU4VsgWqKqv
	8FaC7W99+kh3OaGVJnFIj8Cr9vhB9RlT6Rnp/z+027ZucaAC8158/bxftsRS7K4bxOuODbhdQHj
	FZdqEziE4kesss96y/6TUNY03T5CNXkXOhtvNlKaflMY82MqaCrsQ7K3WMRysQV9zHyno/ygCWL
	BXbs0HvkiHd77ghh6G9qAyoaJ7qE1xGb1r6w4htRzip37Db2UQgkHqyxm6mLpJgcPLnrc0qGe6U
	tjykDH0J2bYbX8hASlZ68tz
X-Received: by 2002:a17:907:f495:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c216bba944fmr957126766b.10.1787066435233;
        Tue, 18 Aug 2026 08:20:35 -0700 (PDT)
Received: from [127.0.0.2] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm213893266b.21.2026.08.18.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:20:34 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 18 Aug 2026 17:20:22 +0200
Subject: [PATCH 2/2] rust: kunit: add config to fail kunit if TAINT_WARN is
 set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-lockdep-kunit-v1-2-66ceb1a272e3@gmail.com>
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
In-Reply-To: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787066429; l=2506;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=6dAacv04h6+fbKsAtNuH1TZu5kOgCxlFp0QG+NiXDjM=;
 b=ahmFApyQ7Dw7FD/RQQuqEAn7g4Be0BUT/tBSNiJh0WjMb7WWzGAEfFksYvNuB0rAxm8slz8Lq
 wUa/pfQAaRWAK08/nIz373DF2ng1rriUZ6cBZRok1wFIZfcQVFglTCw
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

Triggering a `BUG: sleeping function called from invalid context` does
not mark the unit test as failed. Add a CONFIG_RUST_TAINT_WARN_CHECK to
enable the assertion of TAINT_WARN being set during a unit test.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 lib/kunit/Kconfig    | 11 +++++++++++
 rust/macros/kunit.rs | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 30bac00c42ce1..4025b5b305549 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -154,5 +154,16 @@ config RUST_LOCKDEP_KUNIT_DEBUG_LOCKS
 	  this makes it so the KUnit test does not succeed if the test assertions are
 	  true, but a lockdep warning is triggered.
 
+	  If unsure, say N.
+
+config RUST_KUNIT_TAINT_WARN_CHECK
+	bool "Enable extra taint assertion in KUnit tests"
+	depends on RUST
+	default n
+	help
+	  Adds an extra assertion to each Rust kunit test case that asserts
+	  that the kernel is not tainted. If the kernel becomes tainted with a TAINT_WARN,
+	  Enabling this config marks the test as failed.
+
 	  If unsure, say N.
 endif # KUNIT
diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index d1cd0349f86f0..90264ef54a3a8 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -146,6 +146,10 @@ macro_rules! assert_eq {
                 {
                     #[cfg(CONFIG_RUST_LOCKDEP_KUNIT_DEBUG_LOCKS)]
                     let __debug_locks_snapshot = ::kernel::bindings::debug_locks;
+                    #[cfg(CONFIG_RUST_KUNIT_TAINT_WARN_CHECK)]
+                    let __is_tainted_snapshot =
+                        ::kernel::bindings::test_taint(::kernel::bindings::TAINT_WARN);
+
 
                     (*_test).status = ::kernel::bindings::kunit_status_KUNIT_SUCCESS;
                     use ::kernel::kunit::is_test_result_ok;
@@ -157,6 +161,13 @@ macro_rules! assert_eq {
                             ::kernel::bindings::debug_locks == __debug_locks_snapshot;
                         assert!(__debug_locks_ok);
                     }
+                    #[cfg(CONFIG_RUST_KUNIT_TAINT_WARN_CHECK)]
+                    {
+                        let __is_tainted =
+                            ::kernel::bindings::test_taint(::kernel::bindings::TAINT_WARN)
+                            == __is_tainted_snapshot;
+                        assert!(__is_tainted);
+                    }
                 }
             }
         });

-- 
2.51.2

