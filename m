Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFDE265621
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048757; cv=none; b=rj44Ws3/vUtSHbYdl5zCBEdeWbGncfdfbdIgijT3LwiuKW5hX0MqZnuderNPbeAB+yUrgQIrevue+Sm0mhNqX0X1cB33wetsW+Dge92O1VVjUbj5tuOXr52m6R8KYB3duP+mfkazd49Km0JUZmH2EilXga5WTGryV9LDZ4O/d1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048757; c=relaxed/simple;
	bh=foRzQxT8CkgOXWqmcR/feMK9MJqjzyf7PRMHFJtRYSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmT43fUnBYFZgielxA560vnqLQdh51rHjdukmYMVYth/cT6FU7/ud8B6XuBWFi+ulI/erxvD6y77OBWudimnBy1tnfzxDVPuBW34FNGMs0ACf0dD6HQ7jDLn07fveeFFUy/IMnicHxl5rPKKRxQsuUbh7xdr8zSfd4g8wyXYNss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBFb6Cis; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBFb6Cis"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a87098868so45645e0c.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772048755; x=1772653555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFGINhiINX8MAdKqo1ZviH2yexjx3PwIBTKhQwKzVYw=;
        b=TBFb6Cis5L0AHOTcvxrW/esgvqp3FGgBWiFmv+GIt59uOhpDFFZd8Aivf7MeSMl4s8
         +W2Xw4WNKqPiJHVVlJT8WM1VkZAAjaX2JmAv7iiVo63Tw8E14Y7YrPlIJrixcg6bWHM6
         Gou6eqkgP+AKoB6sfhpZnR7i5m36KvrXqUXE7JpPpMrLvVBkgICPGcwcSmJYM1sRktJw
         FGtKCjZXICgrpAk5gkRGAflSNPfk7K/wekfP3yHmHfusvUeHT3RWTe+7lLjfBZbV48k9
         xHBW6jhpFQPyjODZVppt7suRYx5A3Q17b2iLwgHOGdO1zB9Mgx+nG0XgR7VczcZWoOQ3
         DmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048755; x=1772653555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFGINhiINX8MAdKqo1ZviH2yexjx3PwIBTKhQwKzVYw=;
        b=YQiatLeJppEhSZK1WY38YiqGg0dF8/Sy9CECtzO0XXPDzinc730akbhPyPE8g0UpEp
         KU0SIgPmD7CDN0SImISYtRWJ6p4h+w3PNjwn5JN7aaqhQFclCn3duxcJ9sqVgSXFg9mJ
         clmtLzmA7ZQWNE8m7xwLArD3tNR2n0F1oaL2tykIHtlYHpR6Lgg25sTMnxlH4MOdSvYW
         hVRJcaQ1aHpkrGNAHfY9Miln6eFWblVeq9AdXUljd99WJXy1hF4w7NT63wUkhtwqM9b9
         zRTmfo0d+0IxzpWsNRfaVM+d1Qye5+jCPNSEluWpbOnrDyl9s3hTkhmahx5NWi1yMn+n
         tY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAF875gZPEP1d8xbJX11oqKY97zpw4Ds9QHH8VIPC6CHKh7YUs/6F+mSkIst+ZxK9H7IvE56baH6lfG4ILCzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3VF6MwCcJg1N6u7kA4XeQu22hJeB0+IjtJnXj/Uy5HhlbJmS
	4uX+WgLgISTpvDwyIXYzE3WKIq6vSang4kpZ3tzBCgzGA6e6QoUDLvmP
X-Gm-Gg: ATEYQzzKmz+iVRbjYOGvh4GOtmfycil4aKy/4dl05fNvhvmOH+y7cCcRjm7201cPIVq
	9xBOgg0qUAcEUzsLlstVtxUBtOmofyCUj/gYsvQPWXbNiO9Iq93zjpa93hNah/bDBsQ89EHpJ0G
	TfdRYEo50yd/ox+hhTTuWlREcSNtNPaMAjCodLcunF9JIe6T6DDx0xOrP9td2c8hbu5mXU30soh
	6+ZHS72uwi0Pu8mD6ZI7fi+alDmrCfY2iCNMGGAGidWVOwx9wcUDgY/ABY8c2tH2fDcpuWfeFYr
	GwqjXYcJ1VeJGd0LAJSYME2FGf8YtMVmcOoZim3AbhhjdUg0RCBdFlGSrpL8N2ZNXYSJV29Q3Rd
	jZQzC4Ys6f6LsObrAYbEghc+qbLHXDx+PU1Xbyr7Cf3QkDDSE54g5UWUL5a85YviYqcoo+vm+Rg
	UeD39yWUorXl8UC80EyluhcBXwbD4PEF/mspg77D2IxFrc+MzXkPEf7jbqw8J76/zAmAf7Jl8=
X-Received: by 2002:a05:6122:e448:b0:567:4aec:a27c with SMTP id 71dfb90a1353d-568e48f3255mr7001990e0c.17.1772048755348;
        Wed, 25 Feb 2026 11:45:55 -0800 (PST)
Received: from fedora ([190.142.206.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e591c266sm18023919e0c.15.2026.02.25.11.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:45:54 -0800 (PST)
From: Elsanti <santiagojoseleal27@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	ojeda@kernel.org
Cc: raemoar63@gmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elsanti <santiagojoseleal27@gmail.com>
Subject: [PATCH] rust: kunit: implement test attr filtering without extract_if
Date: Wed, 25 Feb 2026 15:45:43 -0400
Message-ID: <20260225194543.1542668-1-santiagojoseleal27@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the TODO-only removal of #[test] attributes with a
retain_mut-based filter that works with the current MSRV.
This preserves test detection without depending on
Vec::extract_if and keeps the generated KUnit wrappers correct.

Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
---
 rust/macros/kunit.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..e064419bfc10 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,15 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
-        let before_len = f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() == before_len {
+        let mut had_test_attr = false;
+        f.attrs.retain_mut(|attr| {
+            let is_test = attr.path().is_ident("test");
+            if is_test {
+                had_test_attr = true;
+            }
+            !is_test
+        });
+        if !had_test_attr {
             processed_items.push(Item::Fn(f));
             continue;
         }
-- 
2.53.0

