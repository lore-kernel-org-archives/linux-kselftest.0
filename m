Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD0367B99
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140598; cv=none; b=luU0S4B9TIx7sX0Oled9c4kMkLRzf7slyl7O7rAgepY/mwK1vMqIscKhiAv95t6A+/Ard4ZNjIPnYWVDac1CrsiN2GmMT2t2st3Ff3Db42826JEwwg2W/ZDp5oaNhXEKv1d5YOytb7VJnPnu/ym0YY2mokFmQKD54bhaYnlDloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140598; c=relaxed/simple;
	bh=UcqvRMX4ClQZN0TPP3OykRW3KVwHC9bLdn/rP0jH8+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jcv85xeJTqTm/BAt3ZfNdGov9wCFx7bUeg/SVJy7BbbF7KZfZwVZWSzuF+N7bA4fNKdKalxZIjGOqgcdB71OElnFPHCtxpp3dqwYlmaWg+svg71/IBZ/VCDksq7lYV8ae4Wr/B88bvcP8E1DyMCpxhw5u9vcfVNsQQdiu7B3ffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhZKugad; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhZKugad"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84867f07d63so23364b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140596; x=1786745396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9Bei40zc5v/rBys6hRWt3NShw4r+i0ulzXGe0MjsfY=;
        b=NhZKugadxgr5DTbflrwvXSQjO1msw0fGGXXSSaXNSmQj5Y9Sal5oKyn3mP/OmZ6Dce
         3g176a49hkWiTYMizgeL+zxpL3f8v5Utl3EBM487AujVx5ySE/+FB8wxNZBXsgJ6FlA8
         YH8ioiRx0U/03RCxuiJq7jJHcUV5pBpE9VZiL1H+iivXCx88D1rW9c3a5VT4WpUIL6p9
         KUCKcjWKImULKapASCs2bIk+r86DRkDXP+J9ZGbMLTnPLUc0smBByaAzMAlKJr3cwea7
         rIiSUW3esNTE4DiR8Driv5OpK1WIBGYPu0sUlmXRImUOf0MsFnRR/evWj9E0h+4XaJZq
         yYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140596; x=1786745396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9Bei40zc5v/rBys6hRWt3NShw4r+i0ulzXGe0MjsfY=;
        b=NSE692KlMzs5f7MpmKhoQzviYAb9hFV1I5C7z0PqV/eMsSyW718F6hoEiKefowjgRn
         cYUD+83he545glrhPvLlLRnGg849dhOsO6v760ozc5T0tP348E9vhCmYUH03/bVJTmwC
         TpY1O2IF0NiNEyWLXjbPH4OQvmgjlFP4ZgnhY6pHM9ONeJcWbIHX++exXJQfN2fEFC/0
         Y54U+WBc++e3Id0edVxi7+r6rIM1gRuJeX2wYGyel9+xnmOaFAMEGZrRJ09lUbXT6fTB
         +KrJaEl/AOiY4w11+b2n1HT04OwUP8+qHELLBYVpwnWgA/mpTFw8xrA7hQ7WK8ulbW/Z
         dQig==
X-Forwarded-Encrypted: i=1; AHgh+Rq3sdEVY8YeLTxs9s1qgcARHvOJeOInRI+dHOa+LQZM2WjBLCm/tAUB2p7Z10CX9gL7TdGDOWq3mzzV2r1kpX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY9IkyjGrB4QoKvrEyVpcD92CqJE1cgY8Hi7D8gYN48wckHc1H
	B/Y46RgsWUQCTfCRGxQWiyCD2NkorlTovSJwzMC0EuGbTiyYgtd4OQwEFGNWZmKw
X-Gm-Gg: AR+sD1213VawF/wW5M5bsw37PetYknBD4Ki9lEeAU/qCq291HX21h/2Frt6nVntwxTF
	sHFCQCB2B2UFpkxdhPdTIO/jN81TMs9b6aqS9TIkbGPkxB5SS+5tV377oWW82YdlC/fcETVxwgU
	Ou/5qZUr1OfS0XwNIMApdSJ8G1wjOTVQXeAQMHCCF9cVehKALlGN8Ioz3FnplEEO4HdR5JjYEmA
	c7c0YqVMxOsvxRlYmwnMHsgxJixVtVeMkyZ8Bxwg5RvF1KZ0voq9zLd90G0Ued1atcBXFY2Fw1O
	5rK4FsFGy94u+vm81dvGp5dmPcFmzvzxHMlRcKNB+vLkjMA3MR+sPfXKb/StrIQrJ/H5eai7Eet
	TtAPU04TA2vNh9ifeai1+dKEyuRl0+JWDJw2waAkSgKCJcsgiJirUYTw7kftgbsPZ344Rn5LKb1
	0jmQh39eMUX3YLKfq7ZijzVPELe4hL+OGobqUuRd67F5y/mg3zEN7ZOLFvsot08K4LgrkNgeFEx
	LOG8g==
X-Received: by 2002:a05:6a21:391:b0:3c3:8044:8b0d with SMTP id adf61e73a8af0-3cb85e2b60cmr32859059637.12.1786140596348;
        Fri, 07 Aug 2026 15:09:56 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:09:55 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v3 0/5] net: selftests: adjustments to ipv6_flowlabel_mgr
Date: Fri,  7 Aug 2026 19:09:37 -0300
Message-ID: <20260807220942.421382-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipv6_flowlabel_mgr test file was lacking coverage for the
IPV6_FL_A_RENEW action, and the IPV6_FL_F_REMOTE and IPV6_FL_F_REFLECT
flags. The first two patches from this set aim to add a proper test
case for RENEW and REMOTE.

The third patch was added to insert network namespace creation inside
the test suite, instead of relying on external wrapper scripts. This
change conforms to other net test implementations, such as
tools/testing/selftests/net/icmp_rfc4884.c, and it is important for
the fourth and fifth patches.

The fourth patch adds the IPV6_FL_F_REFLECT test.

The fifth patch proposes the adoption of "kselftest_harness.h" helpers,
improving code readability and conforming to the implementation of the most
recent selftests.

---
v3:
- Remove unused FL_MAX_LINGER variable
- Set flr_share explicitly for renew tests
- Add corner case for expect_fail_errno macro where test succeeds when
  it should've failed
- Add a new intermediate patch, between remote test patch and reflect test
  patch, placing the netns setup inside the test file
- Add missing skip for setuid fail, addressing stale code from harness
  migration
- Delimit EXPECT and ASSERT usage (use former when test can continue)
- Minor commit message rewording
- Apply more missing scripts/checkpath.pl fixes
v2:
- Apply missing scripts/checkpath.pl fixes and other formatting
  enhancements
- Add new basic IPV6_FL_A_RENEW tests
- Put label after IPV6_FL_F_REMOTE test, freeing the value for a
  subsequent test
- Delegate flowlabel_consistency configuration to wrapper sh script
  instead of doing it on the main test code
- Skip IPV6_FL_F_REFLECT tests if flowlabel_consistency is set,
  instead of failing the test or attempting to change it
- Compare resulting error for failure assertions
- https://lore.kernel.org/all/20260804025910.50145-1-marcelomspessoto@gmail.com/
v1:
- https://lore.kernel.org/all/20260727043516.93101-1-marcelospe@proton.me/

Marcelo Mendes Spessoto Junior (5):
  selftests: net: test IPV6_FL_A_RENEW
  selftests: net: test IPV6_FL_F_REMOTE
  selftests: net: create own netns in ipv6_flowlabel_mgr
  selftests: net: test IPV6_FL_F_REFLECT
  selftests: net: adopt harness for flow label mgr

 tools/testing/selftests/net/ipv6_flowlabel.sh |   2 +-
 .../selftests/net/ipv6_flowlabel_mgr.c        | 584 ++++++++++++++----
 2 files changed, 466 insertions(+), 120 deletions(-)

-- 
2.55.0

