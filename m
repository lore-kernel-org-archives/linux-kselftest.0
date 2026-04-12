Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99D365A1B
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775992264; cv=none; b=jWxPkl533TBMR7RWQscBNTHnp/O16wRRXrIw3lFBWhh25o2QOYlnGC1FNqt4Zm+q0Y6tWBEPew1AQma119UkoKBFgcsapQeuvZ810KBAdmR1O2oswQsgB0K4SwpIHolCieE1DQvcGETRj8jIie9fewhrNVgojRX3Xln3iZHcxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775992264; c=relaxed/simple;
	bh=DN1YYPSHImU/U5TMNDB5Ec47OLtn6flhiZP9gVoHmi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sN3No484sfiVfvRoxP447+LnVzV78eoEFMQLZfomJf6h7RtlNbSM7zSjmApsXBh5vMKqH2Ot5EzavBhwTX+6IH6M4ac2rp6dNxJAbmsED7j/aLKy0lGDSQN9P99Wk8uHhhs6oqpYqVkWB0rJOKPj9ezTi58TqvWFBDf1umG9IvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWQjcj8V; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWQjcj8V"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76b0cda2aeso1432805a12.2
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775992261; x=1776597061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akueeEYc2Me3zisgTMBqzXUfPeZV9sXVNUmdWR6Vztk=;
        b=jWQjcj8VVeylOlGBTrPtSkigwqQ7U+0srmsoFsPkuBP8KUVgxPOaA94CCXlr3qQ9Q0
         3yFAu/HHQZcBF5LuZNqRZ3EykrW8R8rhA6u7IlB4GnEKAUWl2syz4qYsfu7IDSenDqwA
         YhoJgu1aph2Hvnc0QGExzn6fnehjgxfXYmT1+yukvKrW9k8ISMihgZ5+e049+iLFB8YG
         gmXdpfZxaD9f5qDy9o7nJxYcWBQJeulqKIwDyQsyAh06bMfsdlMZCRgPIjjb8fW9GhV6
         3OS4mywTGOx0w9blvXdGRFgzALE35TPxTHQ703uMOlJHzCyhPzQVVjgVoDWHrLgGaJ+9
         0cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775992261; x=1776597061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akueeEYc2Me3zisgTMBqzXUfPeZV9sXVNUmdWR6Vztk=;
        b=dTagDdHC8qP94WlViLf5N25GNXBXBiAc6J1whZU/JceR439ZNzzfd9Q3n1mnQfXLlw
         064wLpvFrrSqM0q6Bpotuel+sAyY3SZHcDZVIQrgEnCyGGeWdViAmKjnTs/qOQ+a1eeU
         FPREo0MoTh8wqC/JkZqNCh4hOBAegH3Ry5WyxYx+NGzHf0rTe/KD/4F5njfRsELRhhDe
         mMjDJ7wXe2DHhQwCIgMb5tHac2dsYKgHuBySQlIa8YPeEdywYug+xz5nVlg3ViAuEMhJ
         RCwDNbx+tPv7PgcGHLlaDzD8fereJCqxKIgG63OBosFMi84EjMekzF0wK6BN9nTpoXj9
         Blfw==
X-Forwarded-Encrypted: i=1; AJvYcCUs7L/q01ubnzwYtnGjCFwakDJUojfabUkgxs+mSZq4/y2W9zkfXLL0571mjtvLCLQjVqlCHs4/QxuRn4PadjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlVANJ/B1ZiDC8UiC9918Tpu0hr5DQlzIkSHo/X0lveE2hSq1
	Cgaf+CP7/bkOcCK3y1L0AIwn9b+lQYcCN4qw8Z9Kbz+l3M6Nke3+TUpr
X-Gm-Gg: AeBDiet8QAA06ndl2V/u872lasYyEM5O3ig+g8jWuP1MRRKA4kK0hs7LBadzSNPbcIv
	4e77joIOVKSqSwrHsGaUHv062ATh5Cq/+BQiNCIVIBlmYrhagheOdZPx1FJQ4wxM4AnrHViORtV
	g1htlcqDKM3PbdKhRhwaRCxYQOqGSuVUIxNKoEUiBUG1fbgqOFIzD4oCVx0l39SKQPmxYA4LerG
	1HeTYtPfgRX2S5UkoXtOzaYdYZKz111+2U0cDakC80yzYkl7RzahRQxhZoQjlZXSjseUn0tHhJQ
	V6hKUvyZ2c4ZEH8g7xrdqcYukBnI3B2WJ3Fua3D0EEr6upeGVnqkkofWifvjaPlqEU4QV9yG/kd
	MWlBeYBqj/U6KvMg2AT/sENmZVdZWq3B7lN34aLfVDxveBOQkqOz/Yzr4KS/UbBvA7C6xw+Chn7
	GPIGgDyOtdlWYHBQOi0qh0wiWHM6qU07RQs+vwgt2V
X-Received: by 2002:a05:6a21:338f:b0:398:787c:d2e4 with SMTP id adf61e73a8af0-39fe3d0e8e0mr10815770637.17.1775992261411;
        Sun, 12 Apr 2026 04:11:01 -0700 (PDT)
Received: from DESKTOP-82PPU4A.localdomain ([202.8.116.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7934c9ef38sm2522981a12.12.2026.04.12.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 04:11:00 -0700 (PDT)
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
Subject: [PATCH net-next v4 0/5] net: bridge: mcast: support exponential field encoding
Date: Sun, 12 Apr 2026 11:10:42 +0000
Message-ID: <20260412111047.1326-1-royujjal@gmail.com>
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
Giving results only from vlmc_query_intvl_test and vlmc_query_response_intvl_test
of the script bridge_vlan_mcast.sh.
Without patchset, here is the result.
    - TEST: Vlan multicast snooping enable                                [ OK ]
    - TEST: Vlan mcast_query_interval global option default value         [ OK ]
    - INFO: Vlan 10 mcast_query_interval (QQIC) test cases:
    - TEST: Number of tagged IGMPv2 general query                         [ OK ]
    - TEST: IGMPv3 QQIC linear value 60                                   [ OK ]
    - TEST: MLDv2 QQIC linear value 60                                    [ OK ]
    - TEST: IGMPv3 QQIC non linear value 160                              [FAIL]
    -         Wrong QQIC in generated IGMPv3 general queries
    - TEST: MLDv2 QQIC non linear value 160                               [FAIL]
    -         Wrong QQIC in generated MLDv2 general queries
    - TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
    - INFO: Vlan 10 mcast_query_response_interval (MRC) test cases:
    - TEST: IGMPv3 MRC linear value 60                                    [ OK ]
    - TEST: IGMPv3 MRC non linear value 160                               [FAIL]
    -         Wrong MRC in generated IGMPv3 general queries
    - TEST: MLDv2 MRC linear value 30000                                  [ OK ]
    - TEST: MLDv2 MRC non linear value 60000                              [FAIL]
    -         Wrong MRC in generated MLDv2 general queries
With these patchset, here is the result.
    * TEST: Vlan multicast snooping enable                                [ OK ]
    * TEST: Vlan mcast_query_interval global option default value         [ OK ]
    * INFO: Vlan 10 mcast_query_interval (QQIC) test cases:
    * TEST: Number of tagged IGMPv2 general query                         [ OK ]
    * TEST: IGMPv3 QQIC linear value 60                                   [ OK ]
    * TEST: MLDv2 QQIC linear value 60                                    [ OK ]
    * TEST: IGMPv3 QQIC non linear value 160                              [ OK ]
    * TEST: MLDv2 QQIC non linear value 160                               [ OK ]
    * TEST: Vlan mcast_query_response_interval global option default value   [ OK ]
    * INFO: Vlan 10 mcast_query_response_interval (MRC) test cases:
    * TEST: IGMPv3 MRC linear value 60                                    [ OK ]
    * TEST: IGMPv3 MRC non linear value 160                               [ OK ]
    * TEST: MLDv2 MRC linear value 30000                                  [ OK ]
    * TEST: MLDv2 MRC non linear value 60000                              [ OK ]

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
 include/net/mld.h                             | 183 +++++++++++++++++-
 net/bridge/br_multicast.c                     |  22 +--
 net/ipv4/igmp.c                               |   6 +-
 net/ipv6/mcast.c                              |  19 +-
 .../net/forwarding/bridge_vlan_mcast.sh       | 150 +++++++++++++-
 6 files changed, 491 insertions(+), 56 deletions(-)


base-commit: 3f3a2aefbc661b837c8e344f944982d61c2ae037
-- 
2.43.0

