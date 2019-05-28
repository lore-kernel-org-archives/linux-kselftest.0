From: fklassen@appneta.com (Fred Klassen)
Date: Tue, 28 May 2019 11:44:14 -0700
Subject: [PATCH net-next v3 0/1] Allow TX timestamp with UDP GSO
Message-ID: <20190528184415.16020-1-fklassen@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528184414.-wInJQSik8rWFGcJomDm4Q2WYnhL4QYAuL61yuMJRs4@z>

Fixes an issue where TX Timestamps are not arriving on the error queue
when UDP_SEGMENT CMSG type is combined with CMSG type SO_TIMESTAMPING.

Fred Klassen (1):
  net/udp_gso: Allow TX timestamp with UDP GSO

 net/ipv4/udp_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.11.0
