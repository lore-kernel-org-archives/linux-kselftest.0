From: tycho@tycho.ws (Tycho Andersen)
Date: Fri, 12 Apr 2019 08:51:09 -0600
Subject: [PATCH RFC 2/2] Add selftests for pidfd polling
In-Reply-To: <20190411175043.31207-2-joel@joelfernandes.org>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190411175043.31207-2-joel@joelfernandes.org>
Message-ID: <20190412145109.GA25793@cisco>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412145109.GIDuND6GkOMPMr4jAlbtynvuPMSQ_-ctW1Q09u1QTYk@z>

On Thu, Apr 11, 2019@01:50:43PM -0400, Joel Fernandes (Google) wrote:
> Other than verifying pidfd based polling, the tests make sure that
> wait semantics are preserved with the pidfd poll. Notably the 2 cases:
> 1. If a thread group leader exits while threads still there, then no
>    pidfd poll notifcation should happen.
> 2. If a non-thread group leader does an execve, then the thread group
>    leader is signaled to exit and is replaced with the execing thread
>    as the new leader, however the parent is not notified in this case.
> 
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
>  tools/testing/selftests/pidfd/Makefile     |   2 +-
>  tools/testing/selftests/pidfd/pidfd_test.c | 216 ++++++++++++++++++++-
>  2 files changed, 208 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/pidfd/Makefile b/tools/testing/selftests/pidfd/Makefile
> index deaf8073bc06..4b31c14f273c 100644
> --- a/tools/testing/selftests/pidfd/Makefile
> +++ b/tools/testing/selftests/pidfd/Makefile
> @@ -1,4 +1,4 @@
> -CFLAGS += -g -I../../../../usr/include/
> +CFLAGS += -g -I../../../../usr/include/ -lpthread
>  
>  TEST_GEN_PROGS := pidfd_test
>  
> diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
> index d59378a93782..4d5206280091 100644
> --- a/tools/testing/selftests/pidfd/pidfd_test.c
> +++ b/tools/testing/selftests/pidfd/pidfd_test.c
> @@ -4,18 +4,26 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <linux/types.h>
> +#include <pthread.h>
>  #include <sched.h>
>  #include <signal.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <syscall.h>
> +#include <sys/epoll.h>
> +#include <sys/mman.h>
>  #include <sys/mount.h>
>  #include <sys/wait.h>
> +#include <time.h>
>  #include <unistd.h>
>  
>  #include "../kselftest.h"
>  
> +#define CHILD_THREAD_MIN_WAIT 3 /* seconds */
> +#define MAX_EVENTS 5
> +#define __NR_pidfd_send_signal 424
> +
>  static inline int sys_pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
>  					unsigned int flags)
>  {
> @@ -30,6 +38,22 @@ static void set_signal_received_on_sigusr1(int sig)
>  		signal_received = 1;
>  }
>  
> +static int open_pidfd(const char *test_name, pid_t pid)
> +{
> +	char buf[256];
> +	int pidfd;
> +
> +	snprintf(buf, sizeof(buf), "/proc/%d", pid);
> +	pidfd = open(buf, O_DIRECTORY | O_CLOEXEC);
> +
> +	if (pidfd < 0)
> +		ksft_exit_fail_msg(
> +			"%s test: Failed to open process file descriptor\n",
> +			test_name);
> +
> +	return pidfd;
> +}
> +
>  /*
>   * Straightforward test to see whether pidfd_send_signal() works is to send
>   * a signal to ourself.
> @@ -87,7 +111,6 @@ static int wait_for_pid(pid_t pid)
>  static int test_pidfd_send_signal_exited_fail(void)
>  {
>  	int pidfd, ret, saved_errno;
> -	char buf[256];
>  	pid_t pid;
>  	const char *test_name = "pidfd_send_signal signal exited process";
>  
> @@ -99,17 +122,10 @@ static int test_pidfd_send_signal_exited_fail(void)
>  	if (pid == 0)
>  		_exit(EXIT_SUCCESS);
>  
> -	snprintf(buf, sizeof(buf), "/proc/%d", pid);
> -
> -	pidfd = open(buf, O_DIRECTORY | O_CLOEXEC);
> +	pidfd = open_pidfd(test_name, pid);
>  
>  	(void)wait_for_pid(pid);
>  
> -	if (pidfd < 0)
> -		ksft_exit_fail_msg(
> -			"%s test: Failed to open process file descriptor\n",
> -			test_name);
> -
>  	ret = sys_pidfd_send_signal(pidfd, 0, NULL, 0);
>  	saved_errno = errno;
>  	close(pidfd);
> @@ -368,10 +384,192 @@ static int test_pidfd_send_signal_syscall_support(void)
>  	return 0;
>  }
>  
> +void *test_pidfd_poll_exec_thread(void *priv)

I think you can do static here?

> +{
> +	char waittime[256];
> +
> +	ksft_print_msg("Child Thread: starting. pid %d tid %d ; and sleeping\n",
> +			getpid(), syscall(SYS_gettid));
> +	ksft_print_msg("Child Thread: doing exec of sleep\n");
> +
> +	sprintf(waittime, "%d", CHILD_THREAD_MIN_WAIT);
> +	execl("/bin/sleep", "sleep", waittime, (char *)NULL);
> +
> +	ksft_print_msg("Child Thread: DONE. pid %d tid %d\n",
> +			getpid(), syscall(SYS_gettid));

You execl(), but then print stuff after that? Might also be worth
switching to execlp().

> +	return NULL;
> +}
> +
> +static int poll_pidfd(const char *test_name, int pidfd)
> +{
> +	int c;
> +	int epoll_fd = epoll_create1(0);

A style point, but I find it's best not to do resource allocation in
variable declarations like this. It breaks up the usual pattern of:

ret = -ENOMEM;
resource = allocate();
if (allocation_failed(resource))
    goto err;

...

out:
    free(resource);
err:
    return ret;

You're not closing this fd on every path (they all exit [for now :D]
so it's probably ok), but it might be nice to make this match a more
regular pattern.

> +	struct epoll_event event, events[MAX_EVENTS];
> +
> +	if (epoll_fd == -1)
> +		ksft_exit_fail_msg("%s test: Failed to create epoll file descriptor\n",
> +				   test_name);
> +
> +	event.events = EPOLLIN;
> +	event.data.fd = pidfd;
> +
> +	if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, pidfd, &event)) {
> +		ksft_print_msg("%s test: Failed to add epoll file descriptor: Skipping\n",
> +			       test_name);

Might be worth checking errno == EPERM here too (which according to
the man page is the error for "epoll not supported", which is weird
:).

> +		_exit(PIDFD_SKIP);
> +	}
> +
> +	c = epoll_wait(epoll_fd, events, MAX_EVENTS, 5000);
> +	if (c != 1 || !(events[0].events & EPOLLIN))
> +		ksft_exit_fail_msg("%s test: Unexpected epoll_wait result (c=%d, events=%x)\n",
> +				   test_name, c, events[0].events);
> +
> +	close(epoll_fd);
> +	return events[0].events;
> +
> +}
> +
> +int test_pidfd_poll_exec(int use_waitpid)

I think this can be static too.

> +{
> +	int pid, pidfd;
> +	int status, ret;
> +	pthread_t t1;
> +	time_t prog_start = time(NULL);
> +	const char *test_name = "pidfd_poll check for premature notification on child thread exec";
> +
> +	ksft_print_msg("Parent: pid: %d\n", getpid());
> +	pid = fork();
> +	if (pid == 0) {
> +		ksft_print_msg("Child: starting. pid %d tid %d\n", getpid(),
> +				syscall(SYS_gettid));
> +		pthread_create(&t1, NULL, test_pidfd_poll_exec_thread, NULL);
> +		/*
> +		 * Exec in the non-leader thread will destroy the leader immediately.
> +		 * If the wait in the parent returns too soon, the test fails.
> +		 */
> +		while (1)
> +			;
> +	}
> +
> +	ksft_print_msg("Parent: Waiting for Child (%d) to complete.\n", pid);
> +
> +	if (use_waitpid) {
> +		ret = waitpid(pid, &status, 0);
> +		if (ret == -1)
> +			ksft_print_msg("Parent: error\n");
> +
> +		if (ret == pid)
> +			ksft_print_msg("Parent: Child process waited for.\n");
> +	} else {
> +		pidfd = open_pidfd(test_name, pid);
> +		if (poll_pidfd(test_name, pidfd) & EPOLLERR)
> +			ksft_exit_fail_msg("%s test: Unexpected epoll error\n", test_name);
> +	}
> +
> +	time_t prog_time = time(NULL) - prog_start;
> +
> +	ksft_print_msg("Time waited for child: %lu\n", prog_time);
> +
> +	/* Check to make sure poll_pidfd returns error after reaping */
> +	if (!use_waitpid &&
> +	    (waitpid(pid, &status, 0) != pid || !(poll_pidfd(test_name, pidfd) & EPOLLERR))) {
> +		ksft_exit_fail_msg("%s test: poll_pidfd EPOLLERR check failed\n", test_name);
> +	}
> +	close(pidfd);
> +
> +	if (prog_time < CHILD_THREAD_MIN_WAIT || prog_time > CHILD_THREAD_MIN_WAIT + 2)
> +		ksft_exit_fail_msg("%s test: Failed\n", test_name);
> +	else
> +		ksft_test_result_pass("%s test: Passed\n", test_name);
> +}
> +
> +void *test_pidfd_poll_leader_exit_thread(void *priv)

Another static I think?

Tycho
