From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri, 19 Oct 2018 16:24:36 +0200
Subject: [PATCH] selftests/bpf: add missing executables to .gitignore
Message-ID: <20181019142436.2955-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181019142436.NxxFItPnFk3BnbzN8trnMOblGZdwPLWq3_IjyiWmqNs@z>

Fixes: 371e4fcc9d96 ("selftests/bpf: cgroup local storage-based network counters")
Fixes: 370920c47b26 ("selftests/bpf: Test libbpf_{prog,attach}_type_by_name")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/bpf/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 8a60c9b9892d..1b799e30c06d 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -25,3 +25,5 @@ test_cgroup_storage
 test_select_reuseport
 test_flow_dissector
 flow_dissector_load
+test_netcnt
+test_section_names
-- 
2.19.1
