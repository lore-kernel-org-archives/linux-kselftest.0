Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FFB19E992
	for <linux-kselftest@vger.kernel.org>; Sat,  2 May 2026 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727961; cv=none; b=O9uQSlgT0Gtd2Tj+is7WcvQRmTm619CsvKHRtu1XMTyHCHl8BaVHvH/eYQJ8Ao4v9OpqQXRzHy80EWMpB2NzVj/p9oMnE/zJ55f4IdZibd0Qi3ozI59rzyq8XzOa6RP1rCUutPArSFLhSyvfG//m3Xxj/rHaUp+iSwehmR8323c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727961; c=relaxed/simple;
	bh=HyVORvmUzvwB1Nl5p7wOIBo6yAmsVN9A+bqB5xudpLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0Fh2AC6+IQM7ZDAewb4di9KH84lmsZdbQiOrwMvdVHJYq09KczBJZe4Fyb59JgqZAUgQOIowPHL5AduaA+J7hw7rqhJWZqSLRo3Tsl84fQ5IlaGGYXD3FJmByngCl+sJtU6A77locyLlo891/lPUUNT8OLPO9HviZJxl0jp8GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLJ91kIh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLJ91kIh"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f943870baso1227497b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 02 May 2026 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777727960; x=1778332760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwzP1nrwPQwraOurWhbU6oQqB1NFo74SdXflMLy9biw=;
        b=FLJ91kIh5HwHulG9KfG2l4axMbkJksF4RFmmYmuRgXzsdX9BRPGIDm8K6NRbtiBptl
         RUCx/bew3P9G+J7nmgGyUnq7dsHe2/XYZCuJ1pBC7NMJA+ZG9GFrVfYv+fawOCGm02R4
         CIQDgnQ1zPmOgb6I00lofW6oIrG40IgJGOEaMPRd9/4Pv30iNxIK48DzMA0NIZC6If2i
         qRCMi38e0yihp+Zfv8LJ9ZrhGzJzNnU841sgVeUAsl9Nnyjo40aQm+hdte5GRajZUYYL
         w/vqXHyXzLKLMyDH/41ycdbbxevDEG2uIZVc6hJ2X/KHlTcH8fK1x3L8kcM6P9oSI2nb
         g+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777727960; x=1778332760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwzP1nrwPQwraOurWhbU6oQqB1NFo74SdXflMLy9biw=;
        b=JISfcYqnDFhGzXYg4Toqk9GAa3DQuhz6PArs7FLX1wCwvUZnmOmP3T+R3uOttFMRx7
         GahTvfRzlZmmho0Tgu5MOeMAQoOJZio5+lxk02pNUiHm/A3XNdC0a488TznR5ktzWo1g
         bkmAl2ofwOdD7T1xbLLdTAwLVobXLL7EsqtUoWpwgbDoQC71UkWzzrTssH87zgJo4eEx
         8t+QVQj8IFE/VKI2nf0P4sDx1/zg53mYdAg8+Ql9I0F8Tw/m9Ale8nb6u/T2gYJazWO1
         sk66y51tBJPCXBE+NGjbxZ0D9Z11UGgfF8SpEUcwkSUDjjL81wjiTrjJVsA5UE4iLggX
         llBw==
X-Forwarded-Encrypted: i=1; AFNElJ+BbHjL+DepdZYRwkjC1nzOiqocRiz+fGdUaHbHMgpd5peHSP8ret5qa8d3uc8HwQB/6yhUepVFIFBRl3+ZdQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Xy4xA7KXfTIs/nVOhKMW8OkRzEhS+JrZD+aOHGj7N5Dr/qA6
	7bbs4LMiZqm1mqSnKRk4Nto+yxs3NzOyt5xMvv7Dm/BVAd4IhPkKmcLJ
X-Gm-Gg: AeBDies7P+HK+0D3UBtU4MJmydvMJP00NKxuIptvfmpuCbUkiOJhplANYJSB9dY8Eua
	AxBmhkq1qtRzSfDl89pt1hdRFmL5S7/Vz8qtRpJ/EI+mPiQ4uBpSOraWXz1GyUlqJHyWBLUfAeZ
	1YogAhGajgvVUX8O1WUvdOWpqPpIuQlnX+gC3VxIFxHrDsYzrGcfqvNdtvuLHEFaUbahy9aVl1U
	4RcwJpUeM2NhKLl7/qSykN7Vy6HQIQWojrmWiRQIDdF1Du8rAZlag8EtIBS9JcWsG7Sf6Bc4x6p
	S6zayT4z9WyVu5kC4288n51I7WnCm37Q6MdM/w3kzVqH82xCLazYNjMt/4b6L8nafUCUk+RuLqv
	24WBMBUfOlEr4pKEHflzeQZ01qVkqensxtQu64wKOIeqaYK8glDjhecHHyjYyHTRx+GzgE/ec4p
	V3+npDMJFwZqmSSL4Yc0X82RCPDyKq5JS5LYCtXNi9e9cWn/rpag==
X-Received: by 2002:a05:6a00:4188:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-8352d29abeamr2977873b3a.33.1777727959490;
        Sat, 02 May 2026 06:19:19 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0176sm5553791b3a.39.2026.05.02.06.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 06:19:18 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/5] net: bridge: mcast: support exponential field encoding
Date: Sat,  2 May 2026 13:19:01 +0000
Message-ID: <20260502131907.987-1-royujjal@gmail.com>
X-Mailer: git-send-email 2.43.0
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

* selftests: net: bridge: add MRC and QQIC field encoding tests
  Updates bridge selftests to validate both linear and non-linear
  (exponential) encoding for MRC and QQIC fields, ensuring
  protocol compliance across IGMPv3 and MLDv2.

Impact:
These changes ensure that multicast queriers and listeners
stay synchronized on timing intervals, preventing protocol
timeouts or premature group membership expiration caused
by incorrectly formatted packet headers.

Test results:
Giving results only from modified API vlmc_query_intvl_test() and
vlmc_query_response_intvl_test() of the script bridge_vlan_mcast.sh.

Using old Linux code, here is the result:
    - TEST: Vlan multicast snooping enable                                [ OK ]
    - TEST: Vlan mcast_query_interval global option default value         [ OK ]
    - TEST: Number of tagged IGMPv2 general query                         [ OK ]
    - TEST: IGMPv3 QQIC linear value 60(s)                                [ OK ]
    - TEST: MLDv2 QQIC linear value 60(s)                                 [ OK ]
    - TEST: IGMPv3 QQIC non linear value 160(s)                           [FAIL]
    -         Wrong QQIC in generated IGMPv3 general queries
    - TEST: MLDv2 QQIC non linear value 160(s)                            [FAIL]
    -         Wrong QQIC in generated MLDv2 general queries
    - TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
    - TEST: IGMPv3 MRC linear value of 60(x0.1s)                          [ OK ]
    - TEST: MLDv2 MRC linear value of 24000(ms)                           [ OK ]
    - TEST: IGMPv3 MRC non linear value of 240(x0.1s)                     [FAIL]
    -         Wrong MRC in generated IGMPv3 general queries
    - TEST: MLDv2 MRC non linear value of 48000(ms)                       [FAIL]
    -         Wrong MRC in generated MLDv2 general queries

Linux code with this patchset, here is the result:
    * TEST: Vlan multicast snooping enable                                [ OK ]
    * TEST: Vlan mcast_query_interval global option default value         [ OK ]
    * TEST: Number of tagged IGMPv2 general query                         [ OK ]
    * TEST: IGMPv3 QQIC linear value 60(s)                                [ OK ]
    * TEST: MLDv2 QQIC linear value 60(s)                                 [ OK ]
    * TEST: IGMPv3 QQIC non linear value 160(s)                           [ OK ]
    * TEST: MLDv2 QQIC non linear value 160(s)                            [ OK ]
    * TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
    * TEST: IGMPv3 MRC linear value of 60(x0.1s)                          [ OK ]
    * TEST: MLDv2 MRC linear value of 24000(ms)                           [ OK ]
    * TEST: IGMPv3 MRC non linear value of 240(x0.1s)                     [ OK ]
    * TEST: MLDv2 MRC non linear value of 48000(ms)                       [ OK ]

v6:
- Added Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
- Previous thread can be found here:
  https://lore.kernel.org/all/20260501173130.3486-1-royujjal@gmail.com/

v5:
- Added 'Reviewed-by:' as requested
- Modified script to fix AND logic in classifiers and updated comments
- Passed expected value as argument rather than hard coding in script
- Added minor comments for macros

v4:
- Removed binary application and related codes for selftests
- Decided hard coded match based on extra arguments for selftests
- Ran shellcheck on modified selftests code and fixed
- Updated comments on patch[1,2,3,4] as per review
- Added 'Reviewed-by:' as requested on patch4

v3:
- Updated the series title for better clarity; old one is here
  https://lore.kernel.org/all/20260326150742.50289-1-royujjal@gmail.com/
- Added key changes section for new selftests patch
- Updated netdev style comments and addressed review comments
- Fixed MLDv2 MRC conversion logic during query generation
- Mentioned intervals in units wherever applicable
- Dropped type casting and fixed indentations

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
  selftests: net: bridge: add MRC and QQIC field encoding tests

 include/linux/igmp.h                          | 167 +++++++++++++++-
 include/net/mld.h                             | 185 +++++++++++++++++-
 net/bridge/br_multicast.c                     |  22 +--
 net/ipv4/igmp.c                               |   6 +-
 net/ipv6/mcast.c                              |  19 +-
 .../net/forwarding/bridge_vlan_mcast.sh       | 140 ++++++++++++-
 6 files changed, 483 insertions(+), 56 deletions(-)


base-commit: 0f19519fdd22bc0f5429377da3a52327c5eee166
-- 
2.43.0

