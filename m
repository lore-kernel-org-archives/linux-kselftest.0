From: nick.desaulniers@gmail.com (Nick Desaulniers)
Date: Thu, 28 Dec 2017 22:01:10 -0500
Subject: [Linux-kselftest-mirror] [PATCH] posix-timers: prevent UB from
	shifting negative signed value
In-Reply-To: <alpine.DEB.2.20.1712281645540.1899@nanos>
References: <alpine.DEB.2.20.1712281645540.1899@nanos>
Message-ID: <1514516474-15811-1-git-send-email-nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171229030110.3o7SqqKS3KZRNxkYNFhQthkb8K707mCtqb7jCM67Nh8@z>

Shifting a negative signed number is undefined behavior. Looking at the
macros MAKE_PROCESS_CPUCLOCK and FD_TO_CLOCKID, it seems that the
subexpression:

(~(clockid_t) (pid) << 3)

where clockid_t resolves to a signed int, which once negated, is
undefined behavior to shift the value of if the results thus far are
negative.

It was further suggested to make these macros into inline functions.

Suggested-by: Thomas Gleixner <tglx at linutronix.de>
Signed-off-by: Nick Desaulniers <nick.desaulniers at gmail.com>
---
 include/linux/posix-timers.h          | 25 +++++++++++++++++++------
 kernel/time/posix-clock.c             |  2 +-
 kernel/time/posix-cpu-timers.c        |  4 ++--
 tools/testing/selftests/ptp/testptp.c |  4 +---
 4 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 672c4f3..b3d87c0 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -42,13 +42,26 @@ struct cpu_timer_list {
 #define CLOCKFD			CPUCLOCK_MAX
 #define CLOCKFD_MASK		(CPUCLOCK_PERTHREAD_MASK|CPUCLOCK_CLOCK_MASK)
 
-#define MAKE_PROCESS_CPUCLOCK(pid, clock) \
-	((~(clockid_t) (pid) << 3) | (clockid_t) (clock))
-#define MAKE_THREAD_CPUCLOCK(tid, clock) \
-	MAKE_PROCESS_CPUCLOCK((tid), (clock) | CPUCLOCK_PERTHREAD_MASK)
+static inline clockid_t make_process_cpuclock(const unsigned int pid,
+		const clockid_t clock)
+{
+	return ((~pid) << 3) | clock;
+}
+static inline clockid_t make_thread_cpuclock(const unsigned int tid,
+		const clockid_t clock)
+{
+	return make_process_cpuclock(tid, clock | CPUCLOCK_PERTHREAD_MASK);
+}
 
-#define FD_TO_CLOCKID(fd)	((~(clockid_t) (fd) << 3) | CLOCKFD)
-#define CLOCKID_TO_FD(clk)	((unsigned int) ~((clk) >> 3))
+inline int fd_to_clockid(const int fd)
+{
+	return (int) make_process_cpuclock((unsigned int) fd, CLOCKFD);
+}
+
+inline int clockid_to_fd(const clockid_t clk)
+{
+	return ~(clk >> 3);
+}
 
 #define REQUEUE_PENDING 1
 
diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index 17cdc55..cc91d90 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -216,7 +216,7 @@ struct posix_clock_desc {
 
 static int get_clock_desc(const clockid_t id, struct posix_clock_desc *cd)
 {
-	struct file *fp = fget(CLOCKID_TO_FD(id));
+	struct file *fp = fget(clockid_to_fd(id));
 	int err = -EINVAL;
 
 	if (!fp)
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index 1f27887a..cef79ca 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1363,8 +1363,8 @@ static long posix_cpu_nsleep_restart(struct restart_block *restart_block)
 	return do_cpu_nanosleep(which_clock, TIMER_ABSTIME, &t);
 }
 
-#define PROCESS_CLOCK	MAKE_PROCESS_CPUCLOCK(0, CPUCLOCK_SCHED)
-#define THREAD_CLOCK	MAKE_THREAD_CPUCLOCK(0, CPUCLOCK_SCHED)
+#define PROCESS_CLOCK	make_process_cpuclock(0, CPUCLOCK_SCHED)
+#define THREAD_CLOCK	make_thread_cpuclock(0, CPUCLOCK_SCHED)
 
 static int process_cpu_clock_getres(const clockid_t which_clock,
 				    struct timespec64 *tp)
diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index 5d2eae1..a5d8f0a 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -60,9 +60,7 @@ static int clock_adjtime(clockid_t id, struct timex *tx)
 static clockid_t get_clockid(int fd)
 {
 #define CLOCKFD 3
-#define FD_TO_CLOCKID(fd)	((~(clockid_t) (fd) << 3) | CLOCKFD)
-
-	return FD_TO_CLOCKID(fd);
+	return (((unsigned int) ~fd) << 3) | CLOCKFD;
 }
 
 static void handle_alarm(int s)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
