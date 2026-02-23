Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D73783BA;
	Mon, 23 Feb 2026 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878422; cv=none; b=i5ZK03DSO4RX8ak2Z9TwQXKfzIwicd6nVK/yZ4zvOLn36EPItaZP6NWbjU4SjtvXddtZkj8XvmgzkjjuRuC2l2XjHHJERIuNjO3wQrIgglseJ2q2khKSMlkKlZikTm6AENZA6NzbAXZMbAE2WmrpfGhQ7LFtIvRsSR+LFoRTI34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878422; c=relaxed/simple;
	bh=UYklwZVvuM6udDdH9S1yNhNfIpxnMpKzYh+yplrS8VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut0wQti63F637YbByfSilEJkorjPvga+15HFWdS4iaNo/zhVEOz2kGwz+qZuPrnjKKLQBSk5+0MliFHRsHp9ZizU3dcG7LB6RxXniDFf3D1YKtlbaN3aSH+XAIFISeRdyJWORSuNiaL4pQncwN8dOFGkConQEfK4uxAwIlgQUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5y7a3Lj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5y7a3Lj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C099C19423;
	Mon, 23 Feb 2026 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771878421;
	bh=UYklwZVvuM6udDdH9S1yNhNfIpxnMpKzYh+yplrS8VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U5y7a3LjHMYOGwSAs+MEot9FWuGvAJgkkmXgA/zYze1YH9JbpwPJGLYQ3b4JA9Uxg
	 ebnDfRUAFbJNA1PSg+Cmw+ZN/G2YLJvhZ3/D1S3VN+0V4eljprwqkzHjTvezayS7wy
	 JbTQRIEty6MssyjFwsmoeGtMEekxDYRTEVSY4UoNuLCm9hStNqwZyEtoAjTG8D0YGV
	 mTaJW4aogf1jRxTRssgj9AnggYbUlYI1EtuCWShurAj9ucxRy4Imbogzkukflyg0DW
	 0JCAS0GeQgnJL/INhun/GwIvD1GBjZmhJnIbUirEf4YvA7rbHj8DRge0MWixHMNNjM
	 P+u7mR5Gb4RIA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	petrm@nvidia.com,
	gal@nvidia.com,
	leitao@debian.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 3/3] selftests: net: py: add cmd info for ksft_wait failure
Date: Mon, 23 Feb 2026 12:26:33 -0800
Message-ID: <20260223202633.4126087-4-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223202633.4126087-1-kuba@kernel.org>
References: <20260223202633.4126087-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gal recently complained:

  When [ksft_wait failure] happens, the test fails with a cryptic
  message:
    # Exception| Exception: Did not receive ready message

Let's try to include the stdout/stderr of the command we tried
to start. E.g. for cmd("false", ksft_wait=True):

    # Exception| lib.py.utils.CmdInitFailure: Did not receive ready message
    # Exception| CMD: false
    # Exception|   EXIT: 1

We need to factor out _process_terminate() otherwise the exit
path may try to write to already disconnected self.ksft_term_fd.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/lib/py/utils.py | 30 ++++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 52d98ca139ff..09535346c13d 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -9,7 +9,15 @@ import subprocess
 import time
 
 
+class CmdInitFailure(Exception):
+    """ Command failed to start. Only raised by bkg(). """
+    def __init__(self, msg, cmd_obj):
+        super().__init__(msg + "\n" + repr(cmd_obj))
+        self.cmd = cmd_obj
+
+
 class CmdExitFailure(Exception):
+    """ Command failed (returned non-zero exit code). """
     def __init__(self, msg, cmd_obj):
         super().__init__(msg + "\n" + repr(cmd_obj))
         self.cmd = cmd_obj
@@ -76,16 +84,13 @@ import time
                 msg = fd_read_timeout(rfd, ksft_wait)
                 os.close(rfd)
                 if not msg:
-                    raise Exception("Did not receive ready message")
+                    terminate = self.proc.poll() is None
+                    self._process_terminate(terminate=terminate, timeout=1)
+                    raise CmdInitFailure("Did not receive ready message", self)
         if not background:
             self.process(terminate=False, fail=fail, timeout=timeout)
 
-    def process(self, terminate=True, fail=None, timeout=5):
-        if fail is None:
-            fail = not terminate
-
-        if self.ksft_term_fd:
-            os.write(self.ksft_term_fd, b"1")
+    def _process_terminate(self, terminate, timeout):
         if terminate:
             self.proc.terminate()
         stdout, stderr = self.proc.communicate(timeout)
@@ -95,6 +100,17 @@ import time
         self.proc.stderr.close()
         self.ret = self.proc.returncode
 
+        return stdout, stderr
+
+    def process(self, terminate=True, fail=None, timeout=5):
+        if fail is None:
+            fail = not terminate
+
+        if self.ksft_term_fd:
+            os.write(self.ksft_term_fd, b"1")
+
+        stdout, stderr = self._process_terminate(terminate=terminate,
+                                                 timeout=timeout)
         if self.proc.returncode != 0 and fail:
             if len(stderr) > 0 and stderr[-1] == "\n":
                 stderr = stderr[:-1]
-- 
2.53.0

