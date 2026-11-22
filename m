Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362515;
	b=qiK3MUPGyEchIwPxKw+qVLLZCuh17XZ6D10paXUQwJ7uKONGls4ctxwle29qqJe0K0Rb
	 WehHv5LAmGyrS6YvFJ9Zf66aindh1eQxoMScw+2kzKUmepj+qQggyzeDZgN7kEOhtClko
	 nzYW3KxQMoaBeB/ERZeeBvoevhOibl66z68qgyD6JMsFtTv/xEDEWkR7FBWn4/V15uOTg
	 F7n8KKXn/Xe4DCvTIyIiIu1NvDPFRoCpOibRw7j4p9iotj4alW0jRbpcKtCItdPhje41U
	 XOo3xM1Jnkhyw68UvKtE80r4SFTW0LugbHwu3Ko1MVr+9d6LQnD+VqcdY3V15oKOAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362515;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=tpi/k1b3USKHOwp9PPTXHQukTIfxQUIEB/5FP/mhyf0=;
	b=Z5aQzsJC2HqLKJx42wy4tt7Qnt0kSrDScnCPvQPaK4o+mI955gHpNddge33HBV5ZfeWz
	 Dr6x9zOaqZFUu3tQfzXnkyFnyznnNmbYUEeYFqT4KBSu83btKMvlJEPRT/mQWPdTLN9r9
	 3++gd2cyeEGFiLkf0aKgwVg/XDfHMgcyoUhi6voYDJfczxJvAUoRoUpoKWhQIPyV9fU9C
	 emWFKrLWqK22FTgkpovJOpzaaRntaQtMTk7/QL/dxB0qsGFjgPB2CC6GF9Al5UVbXnWL3
	 119DuioJwg29USYiKqTMzE9LQgQVMyflWSZT0UYMDYYo4MYaynR8qnai3r5ZxiKYcTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=h2QxIDAy;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA854606A320;
	Sun, 22 Nov 2026 15:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA854606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=h2QxIDAy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=h2QxIDAyQ6AjiTtLOAHPYyqgFapkERNPrI5Xg9hH/Vg+Af/dILQpJUSE9X+bMUDjn2Uo2IR62HxYv
	 TwJq+qf842mgYqtfyLJr8yJIoSkcXhv4b2mw+Bd7QKXG9anPVphuMvVaE+YOD67YqIWwRFFg7GcS3v
	 e7MlIwY8bjlMzFnw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b030ec0b17-d4348;
	Sun, 22 Nov 2026 23:48:28 +0800 (CST)
X-RM-TRANSID:2ee86b030ec0b17-d4348
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b030ecb7c2-72e24;
	Sun, 22 Nov 2026 23:48:28 +0800 (CST)
X-RM-TRANSID:2ee16b030ecb7c2-72e24
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	sdf@fomichev.me,
	joe@dama.to
Subject: [PATCH net-next] selftests: net: py: close the wait pipe after reaping a command
Date: Sun, 22 Nov 2026 15:48:27 +0000
Message-ID: <20261122154827.1272059-1-xujingjing@cmss.chinamobile.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commands started with ksft_wait keep the parent write end in ksft_term_fd.
After communicate() reaps the child, that descriptor is still open, so
each completed command leaks a pipe in the Python process.

Close the parent end after successful communication and clear its saved
value, before decoding output or reporting a failed child exit status.
Leave paths where communication has not completed unchanged.

Run this from tools/testing/selftests/net to repeat the supported pipe
handshake. It prints 16 on the original helper and 0 with the fix:

  python3 - <<'PYCODE'
  import os
  from lib.py import bkg
  child = ["python3", "-c",
           "import os; os.write(int(os.environ['KSFT_READY_FD']), b'1');"
           "os.read(int(os.environ['KSFT_WAIT_FD']), 1)"]
  before = len(os.listdir("/proc/self/fd"))
  for _ in range(16):
      with bkg(child, ksft_wait=3): pass
  print(len(os.listdir("/proc/self/fd")) - before)
  PYCODE

Found by AI-assisted inspection. Both this reproducer and a C helper
using the existing ksft_ready()/ksft_wait() functions confirm the fix.
Normal completion, initialization EOF and nonzero child exit each leak
16 descriptors before and none after; ordinary and ready-only controls
remain clean. No kernel instrumentation or fault injection was used.
No hardware suite was run. Timeout cleanup and a child exiting after
readiness but before the parent's notification remain outside this fix.

Fixes: 71477137994f ("selftests: drv-net: add a way to wait for a local process")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/lib/py/utils.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 1727bc418073..72c5af28cc7e 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -105,6 +105,9 @@ class cmd:
         if terminate:
             self.proc.terminate()
         stdout, stderr = self.proc.communicate(timeout=timeout)
+        if self.ksft_term_fd is not None:
+            os.close(self.ksft_term_fd)
+            self.ksft_term_fd = None
         self.stdout = stdout.decode("utf-8")
         self.stderr = stderr.decode("utf-8")
         self.proc.stdout.close()
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



