From: shannon.nelson@oracle.com (Shannon Nelson)
Date: Fri, 22 Jun 2018 17:31:34 -0700
Subject: [PATCH net-next 0/4] Updates for ipsec selftests
Message-ID: <1529713898-9200-1-git-send-email-shannon.nelson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180623003134.VuDD8GYHbZQARjT2z49q_CELZuf6nCOmKSe5kkxaZdM@z>

Fix up the existing ipsec selftest and add tests for
the ipsec offload driver API.

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
