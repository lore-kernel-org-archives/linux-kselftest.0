From: christian@brauner.io (Christian Brauner)
Date: Thu, 17 Jan 2019 12:41:38 +0100
Subject: [PATCH v2] selftests: add binderfs selftests
In-Reply-To: <20190117105549.GA28882@kroah.com>
References: <20190117102821.10950-1-christian@brauner.io>
 <20190117105549.GA28882@kroah.com>
Message-ID: <20190117114136.dzji6kds2ejpgq7l@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117114138.E0mOo9nYRHjuvahWBY8FhY4X3dicP47bT1igAkLieX4@z>

On Thu, Jan 17, 2019@11:55:49AM +0100, Greg KH wrote:
> On Thu, Jan 17, 2019@11:28:21AM +0100, Christian Brauner wrote:
> > This adds the promised selftest for binderfs. It will verify the following
> > things:
> > - binderfs mounting works
> > - binder device allocation works
> > - performing a binder ioctl() request through a binderfs device works
> > - binder device removal works
> > - binder-control removal fails
> > - binderfs unmounting works
> > 
> > The tests are performed both privileged and unprivileged. The latter
> > verifies that binderfs behaves correctly in user namespaces.
> > 
> > Cc: Todd Kjos <tkjos at google.com>
> > Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>
> 
> Now I am just nit-picking:

I would've been surprised if someone wouldn't have. :)

> 
> > +static void write_to_file(const char *filename, const void *buf, size_t count,
> > +			  int allowed_errno)
> > +{
> > +	int fd, saved_errno;
> > +	ssize_t ret;
> > +
> > +	fd = open(filename, O_WRONLY | O_CLOEXEC);
> > +	if (fd < 0)
> > +		ksft_exit_fail_msg("%s - Failed to open file %s\n",
> > +				   strerror(errno), filename);
> > +
> > +	ret = write_nointr(fd, buf, count);
> > +	if (ret < 0) {
> > +		if (allowed_errno && (errno == allowed_errno)) {
> > +			close(fd);
> > +			return;
> > +		}
> > +
> > +		goto on_error;
> > +	}
> > +
> > +	if ((size_t)ret != count)
> > +		goto on_error;
> 
> if ret < count, you are supposed to try again with the remaining data,
> right?  A write() implementation can just take one byte at a time.
> 
> Yes, for your example here that isn't going to happen as the kernel
> should be handling a larger buffer than that, but note that if you use
> this code elsewhere, it's not really correct because:

Yeah, I know you should retry but for the test I'm not really willing to
keep track of where I was in the buffer and so on. If the test fails
because of that I'd say to count it as failed and move on.

> 
> > +
> > +	close(fd);
> > +	return;
> > +
> > +on_error:
> > +	saved_errno = errno;
> 
> If you do a short write, there is no error, so who knows what errno you
> end up with here.
> 
> Anyway, just one other minor question that might be relevant:
> 
> > +	printf("Allocated new binder device with major %d, minor %d, and name %s\n",
> > +	       device.major, device.minor, device.name);
> 
> Aren't tests supposed to print their output in some sort of normal
> format?  I thought you were supposed to use ksft_print_msg() so that
> tools can properly parse the output.

I can switch the printf()s over to ksft_print_msg().

Thanks!
Christian
