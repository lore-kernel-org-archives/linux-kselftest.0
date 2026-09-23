Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0153E33FE33
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 01:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127266; cv=none; b=ti/ZwOfComjLHjTyn2qx8+ulvT3l1CKrq/eGjfzWOFeMCrQkQ8m7XUaKEKZnA2ZbDAGguCHpJqhm+i5WWonFYFbAb/jRpyqG+pM4MOKUsn9rGWZo6dKPwFx52svNMfJ4LcWRi2jSa8AJj7W9R2e6badJddGvoqXpR+pahtULAFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127266; c=relaxed/simple;
	bh=ugmAhbs6oMjp3OviN9LQ5OBH686SEbQva6aoybI6BDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9mCSwKBJJBb1oD7iP/kGHfu0Kle7slXrU9KrbrnXpJ9Z/1DVbYErnN0tNH9E02E6KMwA2pPFscM+eID5yRo3ewD+goDLnPsoXZ06usgttDFEiGX0OjpLpxR0ds33ukRfBMlAtO3GWOmbmXM4bQ2YpDtohkPUqVkOqia18W+37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tkclhhw6; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tkclhhw6"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32ba4885063so267625eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127263; x=1790732063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwrcShD/rz6glD7xEGDzsItFm3WX/CRluaOkSrFZHL4=;
        b=Tkclhhw6xoGXqzMrn3hl0q7FKz77qy8PxC8jbmrczAeDTUAGji2rxjCMLM/3ettbA5
         SNp4xHil7eNksffCh5yrTa0kCHPyInOrcpidL2dcpk5I436lsu2C+HUWcYjMJBGL7yth
         lu1sp0H20riWoYINWtJUGIoBgwhQ60LmJUoiB84srd+CH++rKUBWZKIX4cKJBH759PFu
         RGokvQKEoQrFLcYIEjPndiMpNfKnJqEDMpsX1q45nR2qT7AXHsUXLe7/6D7RgkAG/PCI
         3A9xUFNvX27aLWAQ0oEYe7Wo5x6NRCAYggRA4G0NHNiY/aTfDjAKJhRbWhEvrLYOCOFl
         X4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127263; x=1790732063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwrcShD/rz6glD7xEGDzsItFm3WX/CRluaOkSrFZHL4=;
        b=VA2PsLV576A075eTG2YNfiBAGYu/kx7EkMWWcEv7zFLzmy3waJXcdfG5rPQz/7Xzh/
         Bynm9YmLbeadZwiE+8+txH0yP6tlzZWXrn7ugOQLPZcwScluYAaY8B61rObh0q5gPoEp
         s5fSvGfrpD9I8JkAsHswpHf+/A9GkZzvsu1/9rmAEiH0GdJWZBzRXAINMHnxb0rUjWQ9
         4SbMIXO6Ce8qwFY2t/HhyMGPntsgoqQh8+tb9L21U3v/7WDU7DtkeJYt6HXr7mAAw3p9
         JwTCsAjMXATnw+5IybKXMk3NQqAjiturBrdPukugLFGtvSUZkpZte5/3/QBCivTvQ5hx
         ml9A==
X-Forwarded-Encrypted: i=1; AKwUvBx5NpzNzJtemlIm/XDrSm111tTIj1ULSiyCXv2Hz82MR6KVsoiT/b4MWMB5d3E0x4CE1b307yV37t2ceEO01YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lcCwbwp06n5LOI1MX96jCXA8T4OmgAcxvzTf+yxbGZmhhRlwkL
	A9qEkXrsuOGa6ABmNmLgb2Qz48sb8ttjCwABk3ibo070NuMfs1qKEq0X
X-Gm-Gg: AYBFou2I11A3FSZvEck9cCRYYMYTtziFISwbd1FwFeSh6jbv0ZJ4QzTmPvcPVekolxi
	zyJ3ZSyWNWLE0uymawCHGBGFDRuoQQR+rGSQo0Iu4sMfPlCgOZrFOhqlLDB0VRdTAhuv9CNW5N2
	o4bSD8qyFJszO4WMETB6DnTJsIB0P9e1lAX3VMW4SD1Ies9oVcFDnC19kzC371jCFvOjKVFDuf4
	IHtO9a8ZXta5jeXjhXFXxk0iQfhSqbUKRw2kKpKf+vAqE/IKjm9wHAf5+C8HjUtFWN3sU/rrj1h
	slgYi6NCdXCeNDpabqSKpLAfdnZrbTuY5XEH4GetnBZyPTp9e/Sv5Ijv1WAQKcT8bUPYeNRESA4
	lVunbqMy6fytjZvm2j4nNfLg+AcvptREHMfDMdF9pAFndssA1mq0hj/83x86S/uUd3fd4mKRi7T
	WP33ia3FkIKxuyqrR/EsSohf9LX7PPfpArqA4bnWEwYVrRG11GsPxOZAT51MCVclHKeFCdud9QK
	13HfWIqzb/95uTx+6S562Et1GD9Th68n8NSrV2qgASiWSSkFz41vwWGPBPnUWXtV8lxFtoCHOX0
	I0UDd/RTvpvud86ItuNftQ==
X-Received: by 2002:a05:7300:4712:b0:328:3cce:4b3b with SMTP id 5a478bee46e88-33e8ba86f85mr929139eec.4.1790127262679;
        Tue, 22 Sep 2026 18:34:22 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm2013520eec.28.2026.09.22.18.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:34:22 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Wed, 23 Sep 2026 01:34:17 +0000
Message-ID: <cover.1790127207.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neighbor Advertisements for existing NUD_FAILED entries are currently
ignored. This can leave a first-hop router with an unusable neighbor after
the host becomes reachable and announces itself, particularly when
forwarding is offloaded away from the kernel and traffic destined to the
FAILED neighbor is unable to trigger the kernel's normal neighbor
resolution process.

Allowing neighbor entries to be updated from NAs already received by the
kernel is preferable since it creates less work compared to periodically
probing FAILED neighbors (e.g. using NTF_EXT_MANAGED).

Extend accept_untracked_na to treat FAILED entries like absent entries.
Require a target link-layer address, IPv6 forwarding, and acceptance by the
sysctl, including its source-prefix check in mode 2. Recover the entry only
to STALE, including for solicited NAs, to maintain parity with handling of
non-existent neighbor cache entries.

Patch #1 implements the behavior and updates RFC 9131-related comments and
accept_untracked_na documentation.

Patch #2 extends ndisc_unsolicited_na_test.sh to cover FAILED-entry
recovery and each acceptance gate, including in-prefix and out-of-prefix
mode 2.

Thanks to Ido Schimmel for feedback on the original RFC.

---
v4:
- Add Ido Schimmel's Reviewed-by tag to patch #1.
- Add a Fixes tag and document the selftest return-code fix in patch #2.

v3:
- Cite RFC 4861 section 7.3.3 when describing FAILED entries.
- Simplify the FAILED-entry path as suggested by Ido Schimmel.
- Drop the NDISC callback and 6LoWPAN changes. The existing 6LoWPAN
  override-only behavior also applies to INCOMPLETE entries and is left
  unchanged.
- Restore the existing rt6_clean_tohost() source-address behavior. The
  source-versus-target behavior applies to all neighbor states and is left
  unchanged.
- Verify the link-layer address learned during recovery in selftests.
- Keep the NA source, target, and neighbor key fixed while varying the
  router prefix in the mode 2 selftest cases.
- Arm packet capture in selftest before starting host DAD and wait for
  capture readiness and receive completion.
https://lore.kernel.org/r/cover.1789734885.git.lfqlee314@gmail.com

v2:
- Full implementation of logic to update FAILED entries to STALE.
- Update the RFC 9131-related comments and sysctl documentation.
- Add selftests to verify state changes only when the accept_untracked_na
  setting is enabled.
https://lore.kernel.org/r/cover.1789448374.git.lfqlee314@gmail.com

v1 (RFC):
https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

Testing:
- x86_64 allyesconfig build with W=1
- Sparse on net/ipv6/ndisc.c
- tools/testing/selftests/net/ndisc_unsolicited_na_test.sh: 14 passed
- Local NIPA checks: all 45 checks passed
- Sashiko local review completed

Lawrence Lee (2):
  ipv6: update NUD_FAILED neighbors from NA messages
  selftests: net: test untracked NA recovery of FAILED neighbors

 Documentation/networking/ip-sysctl.rst        |  28 +--
 net/ipv6/ndisc.c                              |  47 +++--
 .../net/ndisc_unsolicited_na_test.sh          | 195 ++++++++++++++----
 3 files changed, 201 insertions(+), 69 deletions(-)


base-commit: ee05ecfe2cea997d4c8cb1c3af01406104a15a80
-- 
2.43.0
