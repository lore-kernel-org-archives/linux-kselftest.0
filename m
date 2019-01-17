From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 17 Jan 2019 11:55:49 +0100
Subject: [PATCH v2] selftests: add binderfs selftests
In-Reply-To: <20190117102821.10950-1-christian@brauner.io>
References: <20190117102821.10950-1-christian@brauner.io>
Message-ID: <20190117105549.GA28882@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117105549.rMnU8rUtY9qe1AYWfUHunEjabGiTecJa_HyIXDN64CE@z>

On Thu, Jan 17, 2019@11:28:21AM +0100, Christian Brauner wrote:
> This adds the promised selftest for binderfs. It will verify the following
> things:
> - binderfs mounting works
> - binder device allocation works
> - performing a binder ioctl() request through a binderfs device works
> - binder device removal works
> - binder-control removal fails
> - binderfs unmounting works
> 
> The tests are performed both privileged and unprivileged. The latter
> verifies that binderfs behaves correctly in user namespaces.
> 
> Cc: Todd Kjos <tkjos at google.com>
> Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>

Now I am just nit-picking:

> +static void write_to_file(const char *filename, const void *buf, size_t count,
> +			  int allowed_errno)
> +{
> +	int fd, saved_errno;
> +	ssize_t ret;
> +
> +	fd = open(filename, O_WRONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		ksft_exit_fail_msg("%s - Failed to open file %s\n",
> +				   strerror(errno), filename);
> +
> +	ret = write_nointr(fd, buf, count);
> +	if (ret < 0) {
> +		if (allowed_errno && (errno == allowed_errno)) {
> +			close(fd);
> +			return;
> +		}
> +
> +		goto on_error;
> +	}
> +
> +	if ((size_t)ret != count)
> +		goto on_error;

if ret < count, you are supposed to try again with the remaining data,
right?  A write() implementation can just take one byte at a time.

Yes, for your example here that isn't going to happen as the kernel
should be handling a larger buffer than that, but note that if you use
this code elsewhere, it's not really correct because:

> +
> +	close(fd);
> +	return;
> +
> +on_error:
> +	saved_errno = errno;

If you do a short write, there is no error, so who knows what errno you
end up with here.

Anyway, just one other minor question that might be relevant:

> +	printf("Allocated new binder device with major %d, minor %d, and name %s\n",
> +	       device.major, device.minor, device.name);

Aren't tests supposed to print their output in some sort of normal
format?  I thought you were supposed to use ksft_print_msg() so that
tools can properly parse the output.


thanks,

greg k-h
