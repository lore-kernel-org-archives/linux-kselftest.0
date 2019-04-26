From: joel at joelfernandes.org (Joel Fernandes)
Date: Fri, 26 Apr 2019 09:47:19 -0400
Subject: [PATCH v1 2/2] Add selftests for pidfd polling
In-Reply-To: <20190425200035.GC30500@cisco>
References: <20190425190010.46489-1-joel@joelfernandes.org>
 <20190425190010.46489-2-joel@joelfernandes.org>
 <20190425200035.GC30500@cisco>
Message-ID: <20190426134719.GB261279@google.com>

On Thu, Apr 25, 2019 at 02:00:35PM -0600, Tycho Andersen wrote:
> On Thu, Apr 25, 2019 at 03:00:10PM -0400, Joel Fernandes (Google) wrote:
> >
> > +void *test_pidfd_poll_exec_thread(void *priv)
> 
> I think everything in this file can be static, there's this one and
> 3-4 below.
> 
> > +int test_pidfd_poll_exec(int use_waitpid)
> > +{
> > +	int pid, pidfd = 0;
> > +	int status, ret;
> > +	pthread_t t1;
> > +	time_t prog_start = time(NULL);
> > +	const char *test_name = "pidfd_poll check for premature notification on child thread exec";
> > +
> > +	ksft_print_msg("Parent: pid: %d\n", getpid());
> > +	pid = pidfd_clone(CLONE_PIDFD, &pidfd, child_poll_exec_test);
> 
> If pidfd_clone() fails here, I think things will go haywire below.
> 
> > +	ksft_print_msg("Parent: Waiting for Child (%d) to complete.\n", pid);
> > +
> > +	if (use_waitpid) {
> > +		ret = waitpid(pid, &status, 0);
> > +		if (ret == -1)
> > +			ksft_print_msg("Parent: error\n");
> > +
> > +		if (ret == pid)
> > +			ksft_print_msg("Parent: Child process waited for.\n");
> > +	} else {
> > +		poll_pidfd(test_name, pidfd);
> > +	}
> > +
> > +	time_t prog_time = time(NULL) - prog_start;
> > +
> > +	ksft_print_msg("Time waited for child: %lu\n", prog_time);
> > +
> > +	close(pidfd);
> > +
> > +	if (prog_time < CHILD_THREAD_MIN_WAIT || prog_time > CHILD_THREAD_MIN_WAIT + 2)
> > +		ksft_exit_fail_msg("%s test: Failed\n", test_name);
> > +	else
> > +		ksft_test_result_pass("%s test: Passed\n", test_name);
> > +}
> > +
> > +void *test_pidfd_poll_leader_exit_thread(void *priv)
> > +{
> > +	char waittime[256];
> > +
> > +	ksft_print_msg("Child Thread: starting. pid %d tid %d ; and sleeping\n",
> > +			getpid(), syscall(SYS_gettid));
> > +	sleep(CHILD_THREAD_MIN_WAIT);
> > +	ksft_print_msg("Child Thread: DONE. pid %d tid %d\n", getpid(), syscall(SYS_gettid));
> > +	return NULL;
> > +}
> > +
> > +static time_t *child_exit_secs;
> > +static int child_poll_leader_exit_test(void *args)
> > +{
> > +	pthread_t t1, t2;
> > +
> > +	ksft_print_msg("Child: starting. pid %d tid %d\n", getpid(), syscall(SYS_gettid));
> > +	pthread_create(&t1, NULL, test_pidfd_poll_leader_exit_thread, NULL);
> > +	pthread_create(&t2, NULL, test_pidfd_poll_leader_exit_thread, NULL);
> > +
> > +	/*
> > +	 * glibc exit calls exit_group syscall, so explicity call exit only
> > +	 * so that only the group leader exits, leaving the threads alone.
> > +	 */
> > +	*child_exit_secs = time(NULL);
> > +	syscall(SYS_exit, 0);
> > +}
> > +
> > +int test_pidfd_poll_leader_exit(int use_waitpid)
> > +{
> > +	int pid, pidfd = 0;
> > +	int status, ret;
> > +	time_t prog_start = time(NULL);
> > +	const char *test_name = "pidfd_poll check for premature notification on non-empty"
> > +				"group leader exit";
> > +
> > +	child_exit_secs = mmap(NULL, sizeof *child_exit_secs, PROT_READ | PROT_WRITE,
> > +			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> > +
> > +	ksft_print_msg("Parent: pid: %d\n", getpid());
> > +	pid = pidfd_clone(CLONE_PIDFD, &pidfd, child_poll_leader_exit_test);
> 
> Same problem here, I think.


All comments address and fixed in the next revision, thanks!

 - Joel
