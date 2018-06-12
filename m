From: anders.roxell@linaro.org (Anders Roxell)
Date: Tue, 12 Jun 2018 13:05:10 +0200
Subject: [PATCH] selftests: bpf: config: add config fragments
Message-ID: <20180612110510.11731-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180612110510.1GI1aiEzNDMmV3X2fa93kRr7guu6UvC4XK4k3S3HLfg@z>

Tests test_tunnel.sh fails due to config fragments ins't enabled.

Fixes: 933a741e3b82 ("selftests/bpf: bpf tunnel test.")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---

All tests passes except ip6gretap that still fails. I'm unsure why.
Ideas?

Cheers,
Anders

 tools/testing/selftests/bpf/config | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 1eefe211a4a8..7eb613ffef55 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -7,3 +7,13 @@ CONFIG_CGROUP_BPF=y
 CONFIG_NETDEVSIM=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_SCH_INGRESS=y
+CONFIG_NET_IPIP=y
+CONFIG_IPV6=y
+CONFIG_NET_IPGRE_DEMUX=y
+CONFIG_NET_IPGRE=y
+CONFIG_IPV6_GRE=y
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_HMAC=m
+CONFIG_CRYPTO_SHA256=m
+CONFIG_VXLAN=y
+CONFIG_GENEVE=y
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
