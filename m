From: fklassen@appneta.com (Fred Klassen)
Date: Sun, 26 May 2019 08:33:56 -0700
Subject: [PATCH net v2 0/1] Allow TX timestamp with UDP GSO
Message-ID: <20190526153357.82293-1-fklassen@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190526153356.GmN_ivyO9STEwnGyiTAHy1OvNxQ2Ig021vrJ4JcIht8@z>

Fixes an issue where TX Timestamps are not arriving on the error queue
when UDP_SEGMENT CMSG type is combined with CMSG type SO_TIMESTAMPING.

This is version 2 which moves the tests to net-next.

Fred Klassen (1):
  net/udp_gso: Allow TX timestamp with UDP GSO

 net/ipv4/udp_offload.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.11.0
