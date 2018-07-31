From: petrm@mellanox.com (Petr Machata)
Date: Tue, 31 Jul 2018 11:55:57 +0200
Subject: [PATCH net-next 0/7] ipv4: Control SKB reprioritization after
 forwarding
Message-ID: <cover.1533030830.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180731095557.mvUUHWlumkf_DUddXbLHrHE13U7rEb96PpMA-bdB8-4@z>

After IPv4 packets are forwarded, the priority of the corresponding SKB
is updated according to the TOS field of IPv4 header. This overrides any
prioritization done earlier by e.g. an skbedit action or ingress-qos-map
defined at a vlan device.

Such overriding may not always be desirable. Even if the packet ends up
being routed, which implies this is an L3 network node, an administrator
may wish to preserve whatever prioritization was done earlier on in the
pipeline.

Therefore this patch set introduces a sysctl that controls this
behavior, net.ipv4.ip_forward_update_priority. It's value is 1 by
default to preserve the current behavior.

All of the above is implemented in patch #1.

Value changes prompt a new NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE
notification, so that the drivers can hook up whatever logic may depend
on this value. That is implemented in patch #2.

In patches #3 and #4, mlxsw is adapted to recognize the sysctl. On
initialization, the RGCR register that handles router configuration is
set in accordance with the sysctl. The new notification is listened to
and RGCR is reconfigured as necessary.

In patches #5 to #7, a selftest is added to verify that mlxsw reflects
the sysctl value as necessary. The test is expressed in terms of the
recently-introduced ieee_setapp support, and works by observing how DSCP
value gets rewritten depending on packet priority. For this reason, the
test is added to the subdirectory drivers/net/mlxsw. Even though it's
not particularly specific to mlxsw, it's not suitable for running on
soft devices (which don't support the ieee_setapp et.al.).

Changes from RFC to v1:

- Fix wrong sysctl name in ip-sysctl.txt
- Add notifications
- Add mlxsw support
- Add self test

Petr Machata (7):
  net: ipv4: Control SKB reprioritization after forwarding
  net: ipv4: Notify about changes to ip_forward_update_priority
  mlxsw: spectrum: Extract work-scheduling into a new function
  mlxsw: spectrum_router: Handle sysctl_ip_fwd_update_priority
  selftests: forwarding: Move lldpad waiting to lib.sh
  selftests: forwarding: Move DSCP capture to lib.sh
  selftests: mlxsw: Add test for ip_forward_update_priority

 Documentation/networking/ip-sysctl.txt             |   9 +
 .../net/ethernet/mellanox/mlxsw/spectrum_router.c  |  56 +++--
 include/net/netevent.h                             |   1 +
 include/net/netns/ipv4.h                           |   1 +
 net/ipv4/af_inet.c                                 |   1 +
 net/ipv4/ip_forward.c                              |   3 +-
 net/ipv4/sysctl_net_ipv4.c                         |  26 +++
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh |  65 +-----
 .../selftests/drivers/net/mlxsw/qos_dscp_router.sh | 233 +++++++++++++++++++++
 tools/testing/selftests/net/forwarding/lib.sh      |  63 ++++++
 10 files changed, 379 insertions(+), 79 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/net/mlxsw/qos_dscp_router.sh

-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
