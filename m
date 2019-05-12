From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Sun, 12 May 2019 01:29:18 -0600
Subject: [PATCH v2] selftests: bpf: Add files generated after build to
 .gitignore
Message-ID: <20190512072918.10736-1-skunberg.kelsey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190512072918.fI_43_TUZ241pPdPYfc7kA-2mkPD-AfVG8YIFs8XO4U@z>

The following files are generated after building /selftests/bpf/ and
should be added to .gitignore:

	- libbpf.pc
	- libbpf.so.*

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
Change since v1:
        - Add libbpf.so.* in replace of libbpf.so.0 and
          libbpf.so.0.0.3
        - Update commit log to reflect file change

 tools/testing/selftests/bpf/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
index 41e8a689aa77..a877803e4ba8 100644
--- a/tools/testing/selftests/bpf/.gitignore
+++ b/tools/testing/selftests/bpf/.gitignore
@@ -32,3 +32,5 @@ test_tcpnotify_user
 test_libbpf
 test_tcp_check_syncookie_user
 alu32
+libbpf.pc
+libbpf.so.*
--
2.20.1
