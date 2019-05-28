From: fklassen at appneta.com (Fred Klassen)
Date: Tue, 28 May 2019 11:47:05 -0700
Subject: [PATCH net-next v2 0/3] UDP GSO audit tests
Message-ID: <20190528184708.16516-1-fklassen@appneta.com>

Updates to UDP GSO selftests ot optionally stress test CMSG
subsytem, and report the reliability and performance of both
TX Timestamping and ZEROCOPY messages.

Fred Klassen (3):
  net/udpgso_bench_tx: options to exercise TX CMSG
  net/udpgso_bench.sh add UDP GSO audit tests
  net/udpgso_bench.sh test fails on error

 tools/testing/selftests/net/udpgso_bench.sh   |  51 +++-
 tools/testing/selftests/net/udpgso_bench_tx.c | 324 ++++++++++++++++++++++++--
 2 files changed, 357 insertions(+), 18 deletions(-)

-- 
2.11.0
