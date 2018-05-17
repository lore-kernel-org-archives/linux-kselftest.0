From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Fri, 18 May 2018 01:02:53 +0530
Subject: selftests: pmtu: Need pre-required configs ?
Message-ID:
 <CA+G9fYu5+fjqLOFuznP3vuJvG8_dQAPfKnQ-6q2nxDChrJtcSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180517193253.PnturMGK-lZ4k07FJKOKCwHWFAIUSTh0MEoFsiAkUmA@z>

kselftest net pmtu.sh skipped due to missing dependencies ?
This is an open issues on all devices running linux-mainline and linux-next.

[  105.064609] test_bpf: test_skb_segment: success in skb_segment!
[  105.648758] IPv6: ADDRCONF(NETDEV_UP): veth_a: link is not ready
[  105.692738] IPv6: ADDRCONF(NETDEV_UP): veth_b: link is not ready
[  105.698774] IPv6: ADDRCONF(NETDEV_CHANGE): veth_b: link becomes ready
[  105.705256] IPv6: ADDRCONF(NETDEV_CHANGE): veth_a: link becomes ready
RTNETLINK answers: Operation not supported
  vti6 not supported
TEST: vti6: PMTU exceptions                                         [SKIP]
[  106.248522] IPv6: ADDRCONF(NETDEV_UP): veth_a: link is not ready
[  106.296914] IPv6: ADDRCONF(NETDEV_CHANGE): veth_a: link becomes ready
RTNETLINK answers: Operation not supported
  vti4 not supported
TEST: vti4: PMTU exceptions                                         [SKIP]
[  106.812715] IPv6: ADDRCONF(NETDEV_UP): veth_a: link is not ready
[  106.890709] IPv6: ADDRCONF(NETDEV_CHANGE): veth_a: link becomes ready
RTNETLINK answers: Operation not supported
  vti4 not supported
TEST: vti4: default MTU assignment                                  [SKIP]
[  107.393724] IPv6: ADDRCONF(NETDEV_UP): veth_a: link is not ready
[  107.453358] IPv6: ADDRCONF(NETDEV_UP): veth_b: link is not ready
[  107.459380] IPv6: ADDRCONF(NETDEV_CHANGE): veth_b: link becomes ready
[  107.465852] IPv6: ADDRCONF(NETDEV_CHANGE): veth_a: link becomes ready
RTNETLINK answers: Operation not supported
  vti6 not supported
TEST: vti6: default MTU assignment                                  [SKIP]
RTNETLINK answers: Operation not supported
TEST: vti4: MTU setting on link creation                            [SKIP]
  vti not supported
RTNETLINK answers: Operation not supported
TEST: vti6: MTU setting on link creation                            [SKIP]
  vti6 not supported
RTNETLINK answers: Operation not supported
TEST: vti6: MTU changes on link changes                             [SKIP]
  dummy not supported
selftests: pmtu.sh [PASS]

The current config is,
http://snapshots.linaro.org/openembedded/lkft/morty/intel-core2-32/rpb/\
linux-mainline/852/config

For more details please refer this log,
https://lkft.validation.linaro.org/scheduler/job/212320#L3395

Best regards
Naresh Kamboju
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
