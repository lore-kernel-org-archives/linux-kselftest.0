From: dsahern at gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 13:49:29 -0800
Subject: [PATCH v2 net-next 0/4] selftests: forwarding: misc bug fixes and
 enhancements
Message-ID: <20180301214933.20199-1-dsahern@gmail.com>

Bug fixes and an enhancement for the recent forwarding tests:
- only check tc version on tc tests
- handle multipath tests failing with 0 packet count
- fix ping command for IPv6 on Debian jessie
- improve summary of multipath tests

v2
- add CHECK_TC to bridge_vlan_aware.sh (Ido)
- dropped patch 2; always check for mz given its use
- fixed commit message for the last patch (Multipath: was dropped)

David Ahern (4):
  selftests: forwarding: Only check tc version for tc tests
  selftests: forwarding: Handle 0 for packet difference in multipath
    tests
  selftests: forwarding: Use PING6 instead of ping for ipv6 multipath
    test
  selftests: forwarding: Add description to the multipath tests

 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  1 +
 tools/testing/selftests/net/forwarding/lib.sh      | 29 ++++++++------
 .../selftests/net/forwarding/router_multipath.sh   | 46 +++++++++++++---------
 .../testing/selftests/net/forwarding/tc_actions.sh |  2 +-
 .../testing/selftests/net/forwarding/tc_chains.sh  |  2 +-
 .../testing/selftests/net/forwarding/tc_common.sh  |  2 +
 .../testing/selftests/net/forwarding/tc_flower.sh  |  2 +-
 .../selftests/net/forwarding/tc_shblocks.sh        |  2 +-
 8 files changed, 53 insertions(+), 33 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
