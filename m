Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91609396B70
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898188; cv=none; b=kODVeQ/XUdRRUW7GHyXzGcAxCbfQE0sf1LjCsvnGCN0WWRVB2DEnHBUpm/M117Rz+xEJdO8f+rplr+mg7BcxLL0sP9fMdgcAAa0c31NfEgeB1hVT75rz/3KDJmnGp0bTuiHkprVRa1C/026DUFM3PRjb9mVvlkpGiUZag/g3Uf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898188; c=relaxed/simple;
	bh=BOuU4kLSFj0T3OadxVFJ/Pv96MAovOPfw0gN6reRqiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IL5vj5g8UXA5Ran73LPcn+6hI/FfnCmptdgfsMsOerdRA8F8vHoZUepwaoDiYxo1im4zF0x5G09WQ6rwWwBCrn1clw/zWeuZWn1sIluglBGt6/z5sdPXKlzrSdDD8ObjWFN24FLqkKby1FRifssXc4q6QDwjaF/Rthxj2wjyA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atSTXYWV; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atSTXYWV"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35c124d2613so3184918a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774898187; x=1775502987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaNyh4ecr42g5LIJwYY728KlnH3gHzvSwNNrUVP18Jg=;
        b=atSTXYWVQQk2dZMZ1AVoT8BJOP8W2yAyhd4j3dEgUndvJzt/dyPSuMAAsL/UfEv5Ux
         mY82bzhdG5HDr59qUv4xsZ/ISrVMM4iCWTfmEW+eMb1MbFlSQMzJi6DGoF+Fez18EYW4
         38F/qNYdpMQ8C9vMHe9x6t2lTWN5T4AymgJ6olrhX/ZjJl/q+5vKoGpvu1fy0EcC/V5X
         QQo9q2jM+fkj7M6uhRq8DEe9IFl3PFKiyF7AOeK6SXJTcEOh0dtzHePU5ZrVM3kfL7oW
         Yk0JHWUfVyHmRuCyDtAg3t+4WYyz32DU4ss/ZqXD0S20DRng2hwoQsYtdERbzP+QQFYB
         kLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774898187; x=1775502987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PaNyh4ecr42g5LIJwYY728KlnH3gHzvSwNNrUVP18Jg=;
        b=L+bjQ6zoOiQ6lrDE0Xqj/ggieYcUXgdF8agUIwOGgbEB2r+82V0GfTwWi8QeakOCrp
         z6oqOifruA12m03P3rIkokVkVnAE2s+pxCO7mHaAfqW1r3/mx8E9mURVA8n1OuGJAvBh
         JGDmMhU3H5jWODwO4nwBMCkXYpWWozNB0UcJ1L0/KzT2EV0Fx5oEKfTaYpZpfS7l20BR
         6170w5bOupbv4S1bCtA4SUyzbvD1HXY2kS3XfrUQhgdH0yg88arhJSAY62GpI9aYo8SP
         3Z8o0HRI1mZaw89DuuZB3/PzSPDpVk2J7RLm2TTnafFn2AlXIJq/Pp3Bx2H5Y+CumK22
         iuVg==
X-Forwarded-Encrypted: i=1; AJvYcCU7U2D7tqcMCvRAMPweLV/mSHhDQcwaQ48n0W54S1xsK1uPL+4pVCVxzE/ycR9Zs+niG2DUy6Ytc3wbclrSWIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Y75zU6USbi6V/DzrC3wWh4jz9ALHMSCUfbUbgGlb77xGkxFV
	5FNtWHi4/OQc3H3/n0OIwLfD4fQ/HH3swI6SPin+JV/qruordY6vujYA
X-Gm-Gg: ATEYQzyvJrwcTBi+LREowzcOh0tQWtL0m38h4A2/LHuEork+c4D+TGrnrxA8bBJH165
	OwGLMnhPm3Ryq9nBhe5eaqv724Od2DFV4CijivXxyZnLr+UZf+++VW4TdPKCO1g78ztlRfUawG5
	7lLNKaQdvoA8ADOxIYjkCXZPH5Inj2xPLpCmZkPt1c7e0TALp5UFmNVBqHT3rqkdb9ygd9vtbmb
	QnjhbVHh/HvCHDG0jWgg9tZTGJkokoCvYEIbLT97hEJ5UKU3OMluJpK6SH+ES2JACqNAeNsUsbD
	F6/Bf6v//lTzCrUkMUkSah+BRu2ijgSVGjQSclYPiWxX+93lGDRiw2rXKw16XoUUAUYAhOIBChx
	lwOXYMosSwYbs6CHB8KTPxmtB6fB+zpvuJCeoVVGkpTPs7qEo5+Z4f6pfMKxmUN36WHdBQIjgzE
	G4isNWb4S3Ph/IKAfo/iOlkGpbWjzwwUc48Bp2KF0R
X-Received: by 2002:a17:90a:e70d:b0:35b:90e7:c453 with SMTP id 98e67ed59e1d1-35c2ffaf73emr12904875a91.6.1774898186798;
        Mon, 30 Mar 2026 12:16:26 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm9627178a91.17.2026.03.30.12.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:16:26 -0700 (PDT)
From: Ujjal Roy <royujjal@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Yong Wang <yongwang@nvidia.com>,
	Petr Machata <petrm@nvidia.com>
Cc: Ujjal Roy <ujjal@alumnux.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 0/5] net: bridge: mcast: add multicast exponential field encoding
Date: Mon, 30 Mar 2026 19:16:06 +0000
Message-ID: <20260330191611.16929-1-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Description:
This series addresses a mismatch in how multicast query
intervals and response codes are handled across IPv4 (IGMPv3)
and IPv6 (MLDv2). While decoding logic currently exists,
the corresponding encoding logic is missing during query
packet generation. This leads to incorrect intervals being
transmitted when values exceed their linear thresholds.

The patches introduce a unified floating-point encoding
approach based on RFC3376 and RFC3810, ensuring that large
intervals are correctly represented in QQIC and MRC fields
using the exponent-mantissa format.

Key Changes:
* ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
  Removes legacy macros in favor of a cleaner, unified
  calculation for retrieving intervals from encoded fields,
  improving code maintainability.

* ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
  Standardizes MLDv2 terminology by renaming mldv2_mrc()
  to mldv2_mrd() (Maximum Response Delay) and introducing
  a new API mldv2_qqi for QQI calculation, improving code
  readability.

* ipv4: igmp: encode multicast exponential fields
  Introduces the logic to dynamically calculate the exponent
  and mantissa using bit-scan (fls). This ensures QQIC and
  MRC fields (8-bit) are properly encoded when transmitting
  query packets with intervals that exceed their respective
  linear threshold value of 128 (for QQI/MRT).

* ipv6: mld: encode multicast exponential fields
  Applies similar encoding logic for MLDv2. This ensures
  QQIC (8-bit) and MRC (16-bit) fields are properly encoded
  when transmitting query packets with intervals that exceed
  their respective linear thresholds (128 for QQI; 32768
  for MRD).

Impact:
These changes ensure that multicast queriers and listeners
stay synchronized on timing intervals, preventing protocol
timeouts or premature group membership expiration caused
by incorrectly formatted packet headers.

v2:
- Retargeted the series to net-next as suggested
- Fixed a compilation warning in the MLD rename change
- Kept reverse xmas tree order in IGMP exponential encoding change
- Added bridge selftests to validate IGMPv3 Query MRC and QQIC handling

Ujjal Roy (5):
  ipv4: igmp: get rid of IGMPV3_{QQIC,MRC} and simplify calculation
  ipv6: mld: rename mldv2_mrc() and add mldv2_qqi()
  ipv4: igmp: encode multicast exponential fields
  ipv6: mld: encode multicast exponential fields
  selftests: net: bridge: add tests for igmpv3 MRC and QQIC validation

 include/linux/igmp.h                          | 158 +++++++++++++++-
 include/net/mld.h                             | 179 +++++++++++++++++-
 net/bridge/br_multicast.c                     |  22 +--
 net/ipv4/igmp.c                               |   6 +-
 net/ipv6/mcast.c                              |  19 +-
 .../selftests/net/forwarding/.gitignore       |   2 +
 .../testing/selftests/net/forwarding/Makefile |  10 +
 .../selftests/net/forwarding/bridge_igmp.sh   | 109 +++++++++++
 .../selftests/net/forwarding/mc_decode.c      |  38 ++++
 .../selftests/net/forwarding/mc_encode.c      |  40 ++++
 10 files changed, 535 insertions(+), 48 deletions(-)
 create mode 100644 tools/testing/selftests/net/forwarding/mc_decode.c
 create mode 100644 tools/testing/selftests/net/forwarding/mc_encode.c


base-commit: cf0d9080c6f795bc6be08babbffa29b62c06e9b0
-- 
2.43.0

