From: fklassen at appneta.com (Fred Klassen)
Date: Thu, 23 May 2019 14:06:47 -0700
Subject: [PATCH net 0/4] Allow TX timestamp with UDP GSO
Message-ID: <20190523210651.80902-1-fklassen@appneta.com>

Fixes an issue where TX Timestamps are not arriving on the error queue
when UDP_SEGMENT CMSG type is combined with CMSG type SO_TIMESTAMPING.

Also this updates the UDP GSO selftests to optionally stress test
this condition, and report the reliability and performance of both
TX Timestamping and ZEROCOPY messages.

Fred Klassen (4):
  net/udp_gso: Allow TX timestamp with UDP GSO
  net/udpgso_bench_tx: options to exercise TX CMSG
  net/udpgso_bench_tx: fix sendmmsg on unconnected socket
  net/udpgso_bench_tx: audit error queue

 net/ipv4/udp_offload.c                        |   4 +
 tools/testing/selftests/net/udpgso_bench_tx.c | 376 ++++++++++++++++++++++++--
 2 files changed, 358 insertions(+), 22 deletions(-)

-- 
2.11.0
