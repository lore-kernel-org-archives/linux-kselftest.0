From: krzesimir@kinvolk.io (Krzesimir Nowak)
Date: Wed, 15 May 2019 15:47:28 +0200
Subject: [PATCH bpf v1 3/3] selftests/bpf: Avoid a clobbering of errno
In-Reply-To: <20190515134731.12611-1-krzesimir@kinvolk.io>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
Message-ID: <20190515134731.12611-4-krzesimir@kinvolk.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190515134728.hOf8P986RaEFOXxxi1ScQToWqxYpY15di1GHI_3hwt0@z>

Save errno right after bpf_prog_test_run returns, so we later check
the error code actually set by bpf_prog_test_run, not by some libcap
function.

Cc: Jakub Kicinski <jakub.kicinski at netronome.com>
Fixes: 5a8d5209ac022 ("selftests: bpf: add trivial JSET tests")
Signed-off-by: Krzesimir Nowak <krzesimir at kinvolk.io>
---
 tools/testing/selftests/bpf/test_verifier.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
index bf0da03f593b..514e17246396 100644
--- a/tools/testing/selftests/bpf/test_verifier.c
+++ b/tools/testing/selftests/bpf/test_verifier.c
@@ -818,15 +818,17 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
 	__u32 size_tmp = sizeof(tmp);
 	uint32_t retval;
 	int err;
+	int saved_errno;
 
 	if (unpriv)
 		set_admin(true);
 	err = bpf_prog_test_run(fd_prog, 1, data, size_data,
 				tmp, &size_tmp, &retval, NULL);
+	saved_errno = errno;
 	if (unpriv)
 		set_admin(false);
 	if (err) {
-		switch (errno) {
+		switch (saved_errno) {
 		case 524/*ENOTSUPP*/:
 			printf("Did not run the program (not supported) ");
 			return 0;
-- 
2.20.1
