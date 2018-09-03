From: mauricio.vasquez@polito.it (Mauricio Vasquez B)
Date: Mon,  3 Sep 2018 18:05:27 +0200
Subject: [PATCH bpf] selftests/bpf: add missing executables to .gitignore
Message-ID: <1535990727-2778-1-git-send-email-mauricio.vasquez@polito.it>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180903160527.txb9gnYZuyGV6vnvuShJyDolc0GW2abp_hqS2zUnTgw@z>

Signed-off-by: Mauricio Vasquez B <mauricio.vasquez at polito.it>
---
 tools/testing/selftests/bpf/.gitignore | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 49938d72cf63..4d789c1e5167 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -19,3 +19,7 @@ test_btf
 test_sockmap
 test_lirc_mode2_user
 get_cgroup_id_user
+test_skb_cgroup_id_user
+test_socket_cookie
+test_cgroup_storage
+test_select_reuseport
-- 
2.7.4
