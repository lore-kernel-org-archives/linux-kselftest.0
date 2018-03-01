From: dsahern@gmail.com (David Ahern)
Date: Thu,  1 Mar 2018 11:09:42 -0800
Subject: [PATCH net-next 0/5] selftests: forwarding: misc bug fixes and
 enhancements
Message-ID: <20180301190947.7299-1-dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180301190942.wOnj1oXqSSrvfljywFGEjcQoPS26mebF7qfFV9AgrV4@z>

Bug fixes and an enhancement for the recent forwarding tests:
- only check tc version on tc tests
- only check for mz for tests that will use it
- handle multipath tests failing with 0 packet count
- fix ping command for IPv6 on Debian jessie
- improve summary of multipath tests

BTW: who is the cruel person that made whitespace 7 spaces in these files?

David Ahern (5):
  selftests: forwarding: Only check tc version for tc tests
  selftests: forwarding: Only check for mz when it is needed
  selftests: forwarding: Handle 0 for packet difference in multipath
    tests
  selftests: forwarding: Use PING6 instead of ping for ipv6 multipath
    test
  selftests: forwarding: Add description to the multipath tests

 tools/testing/selftests/net/forwarding/lib.sh      | 37 ++++++++++-------
 .../selftests/net/forwarding/router_multipath.sh   | 47 +++++++++++++---------
 .../testing/selftests/net/forwarding/tc_actions.sh |  2 +-
 .../testing/selftests/net/forwarding/tc_chains.sh  |  2 +-
 .../testing/selftests/net/forwarding/tc_common.sh  |  3 ++
 .../testing/selftests/net/forwarding/tc_flower.sh  |  2 +-
 .../selftests/net/forwarding/tc_shblocks.sh        |  2 +-
 7 files changed, 59 insertions(+), 36 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
