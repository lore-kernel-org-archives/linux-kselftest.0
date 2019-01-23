From: gregkh@linuxfoundation.org (Greg KH)
Date: Wed, 23 Jan 2019 12:00:52 +0100
Subject: [PATCH v3] selftests: add binderfs selftests
In-Reply-To: <20190123105457.k7oobylgq6rwka55@brauner.io>
References: <20190117114854.15132-1-christian@brauner.io>
 <20190123105457.k7oobylgq6rwka55@brauner.io>
Message-ID: <20190123110052.GB22520@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190123110052.xh4gtOdINNO5i0IFSINZ3K918W0I-UmRYxQM0QpY64c@z>

On Wed, Jan 23, 2019@11:54:58AM +0100, Christian Brauner wrote:
> On Thu, Jan 17, 2019@12:48:54PM +0100, Christian Brauner wrote:
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
> Hey Shuah,
> 
> If you're ok with the patch in its current form, can you please make
> sure that this still lands in 5.0? If at all possible I'd like to have
> all ducks in a row and release binderfs with selftests and everything.
> :)

I can take it in my tree with the other binderfs patches if I can get an
ack from Shuah.

thanks,

greg k-h
