From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Thu, 29 Nov 2018 15:01:51 +0530
Subject: [PATCH] selftests/bpf: add config fragment CONFIG_NF_NAT_IPV6
Message-ID: <1543483911-8955-1-git-send-email-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181129093151.NTrQQn0aeezL3oT2AFlbpzxrf1x_OM-u_7Vt6BhOYlE@z>

CONFIG_NF_NAT_IPV6=y is required for bpf test_sockmap test case
Fixes,
ip6tables v1.6.1: can't initialize ip6tables table `nat': Table does
not exist

Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
---
 tools/testing/selftests/bpf/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 37f947ec44ed..d7076cf04a9d 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -23,3 +23,4 @@ CONFIG_LWTUNNEL=y
 CONFIG_BPF_STREAM_PARSER=y
 CONFIG_XDP_SOCKETS=y
 CONFIG_FTRACE_SYSCALLS=y
+CONFIG_NF_NAT_IPV6=y
-- 
2.17.1
