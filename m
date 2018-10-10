From: anders.roxell@linaro.org (Anders Roxell)
Date: Wed, 10 Oct 2018 11:21:23 +0200
Subject: [PATCH] selftests: bpf: add config fragment LWTUNNEL
Message-ID: <20181010092123.26218-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181010092123.oxRPFrHdn-szu9NUYezbXuJnOupQpP53LBBXq1xVsBA@z>

When test_lwt_seg6local.sh was added commit c99a84eac026
("selftests/bpf: test for seg6local End.BPF action") config fragment
wasn't added, and without CONFIG_LWTUNNEL enabled we see this:
Error: CONFIG_LWTUNNEL is not enabled in this kernel.
selftests: test_lwt_seg6local [FAILED]

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 3655508f95fd..dd49df5e2df4 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -19,3 +19,4 @@ CONFIG_CRYPTO_SHA256=m
 CONFIG_VXLAN=y
 CONFIG_GENEVE=y
 CONFIG_NET_CLS_FLOWER=m
+CONFIG_LWTUNNEL=y
-- 
2.19.1
