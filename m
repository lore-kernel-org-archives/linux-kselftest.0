From: bhole_prashant_q7@lab.ntt.co.jp (Prashant Bhole)
Date: Mon, 28 May 2018 13:37:58 +0900
Subject: [PATCH bpf v2 0/5] fix test_sockmap
Message-ID: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180528043758.vqQl82EXOSvKJQzpImTCSho0-C5FSk7ZCWgzxHzpscE@z>

This series fixes error handling, timeout and data verification in
test_sockmap. Previously it was not able to detect failure/timeout in
RX/TX thread because error was not notified to the main thread.

Also slightly improved test output by printing parameter values (cork,
apply, start, end) so that parameters for all tests are displayed.

Prashant Bhole (5):
  selftests/bpf: test_sockmap, check test failure
  selftests/bpf: test_sockmap, join cgroup in selftest mode
  selftests/bpf: test_sockmap, fix test timeout
  selftests/bpf: test_sockmap, fix data verification
  selftests/bpf: test_sockmap, print additional test options

 tools/testing/selftests/bpf/test_sockmap.c | 76 +++++++++++++++++-----
 1 file changed, 58 insertions(+), 18 deletions(-)

-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
