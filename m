From: shannon.nelson@oracle.com (Shannon Nelson)
Date: Mon, 25 Jun 2018 16:41:32 -0700
Subject: [PATCH v2 net-next 0/4] Updates for ipsec selftests
Message-ID: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625234132.ByIavJoEfSSHo-nAbZSchyhtHNe_0RnplE_17jSJGC0@z>

Fix up the existing ipsec selftest and add tests for
the ipsec offload driver API.

v2: addressed formatting nits in netdevsim from Jakub Kicinski

Shannon Nelson (4):
  selftests: rtnetlink: clear the return code at start of ipsec test
  selftests: rtnetlink: use dummydev as a test device
  netdevsim: add ipsec offload testing
  selftests: rtnetlink: add ipsec offload API test

 drivers/net/netdevsim/Makefile           |   4 +
 drivers/net/netdevsim/ipsec.c            | 345 +++++++++++++++++++++++++++++++
 drivers/net/netdevsim/netdev.c           |   7 +
 drivers/net/netdevsim/netdevsim.h        |  37 ++++
 tools/testing/selftests/net/rtnetlink.sh | 132 +++++++++++-
 5 files changed, 518 insertions(+), 7 deletions(-)
 create mode 100644 drivers/net/netdevsim/ipsec.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
