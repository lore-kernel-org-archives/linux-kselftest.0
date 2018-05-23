From: petrm@mellanox.com (Petr Machata)
Date: Wed, 23 May 2018 18:34:49 +0200
Subject: [PATCH net-next 0/3] selftests: forwarding: Additions to
 mirror-to-gretap tests
Message-ID: <cover.1527093017.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180523163449.r7Y6qdyDY6yWeQujUA-pC8XNh8Gpqg-QnCa354hF8EY@z>

This patchset is for a handful of edge cases in mirror-to-gretap
scenarios: removal of mirrored-to netdevice (#1), removal of underlay
route for tunnel remote endpoint (#2) and cessation of mirroring upon
removal of flower mirroring rule (#3).

Petr Machata (3):
  selftests: forwarding: Test mirroring to deleted device
  selftests: forwarding: Test removal of underlay route
  selftests: forwarding: Test removal of mirroring

 .../selftests/net/forwarding/mirror_gre_changes.sh | 68 ++++++++++++++++++++++
 .../selftests/net/forwarding/mirror_gre_flower.sh  |  8 +++
 2 files changed, 76 insertions(+)

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
